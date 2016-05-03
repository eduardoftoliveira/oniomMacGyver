import os
from commands import getoutput
from os.path import splitext
from os     import getcwd
from glob import glob

def gen_que(comfile, queue = 'gb', gauversion = 'd', QUE_PATH = False):

    QUE_EXT = '.q'
    text = """#!/bin/bash

### Request number of processors 
SET_PROCS_NUM

### Previleges
SET_GRP_NAME
SET_QUE_NAME

### Home directory where the input files are located
SET_HOME
SET_STDOUT
SET_STDERR

### System variables
echo "This job is running on " $HOSTNAME
#$ -V
#$ -cwd

### Create NODE directory
export NODE_JOB_DIR=/scratch/$JOB_ID
mkdir -p $NODE_JOB_DIR
cd $NODE_JOB_DIR

### JOB NAME
SET_JOBNAME

### Copy the files to the NODE
cp $HOME_JOB_DIR/$JOBNAME $NODE_JOB_DIR
export JOBNAME_out=`basename $JOBNAME .com`.log

### Sets gaussian variables
export GAUSS_SCRDIR=$NODE_JOB_DIR
SET_GSOURCE

### Runs gaussian
g09 <$JOBNAME> $HOME_JOB_DIR/$JOBNAME_out

### Cleans scratch directory
rm  $NODE_JOB_DIR/*.rwf
rm  $NODE_JOB_DIR/*.scr
rm  $NODE_JOB_DIR/*.chk

### Move file from NODE directory to the HOME directory
mv  $NODE_JOB_DIR/* $HOME_JOB_DIR
rm -rf $NODE_JOB_DIR

echo `date '+%d %b %H:%M'` $HOME_JOB_DIR/$JOBNAME >> ~/log.que
"""

    PROC_STR = {
        'gb': "#$ -pe shared_mem 8",
        'b1': "#$ -pe shared_mem 8",
        'b2': "#$ -pe shared_mem 8",
        'ib': "#$ -pe shared_mem 8",
        'sp': "#$ -pe shm_s 12",
        'rp': "#$ -pe shm_r 16"
    }

    GRP_STR = {
        'gb': "#$ -P grupoA",
        'b1': "#$ -P grupoA",
        'b2': "#$ -P grupoA",
        'ib': "#$ -P grupoA",
        'sp': "#$ -P grupoA",
        'rp': "#$ -P grupoA"
    }

    QUE_STR = {
        'gb': "",
        'b1': "#$ -q BIO1",
        'b2': "#$ -q BIO2",
        'ib': "#$ -q INFINIBAND",
        'sp': "#$ -q SPECIAL",
        'rp': "#$ -q RAPTOR"
    }

    GAU_VERSION_PATH = {
        'gb': "source /opt/programs/gaussian/g09/%s/G09.sh",
        'b1': "source /opt/programs/gaussian/g09/%s/G09.sh",
        'b2': "source /opt/programs/gaussian/g09/%s/G09.sh",
        'ib': "source /opt/programs/gaussian/g09/%s/G09.sh",
        'sp': "source /opt/programs/gaussian/g09/%s/G09.sh",
        'rp': "source /opt/programs/gaussian/g09/%s/G09.sh"
    }

    GAU_VERSION = {
        'a': "a_pgi105",
        'c': "c_pgi133",
        'd': "d_pgi133"
    }

    # comfile without preceeding path (if any)
    HOME_JOB_DIR = os.path.dirname(os.path.realpath(comfile))   # full path
    comfile_wd = comfile.split('/')[-1]                         # filename only
    comfile_full = '%s/%s' % (HOME_JOB_DIR, comfile_wd)         # filename full
    if QUE_PATH:
        que_wd = '-'.join((comfile_full).split('/')[3:])
    else:
        que_wd = comfile_wd 
        if que_wd[0].isdigit():
            que_wd = '_' + que_wd
    que_full = '%s/%s' % (HOME_JOB_DIR, que_wd)                 # que full path

    # change .com to .que
    que_full = os.path.splitext(que_full)[0] + QUE_EXT

    # print 'comfile'
    # print comfile_wd
    # print comfile_full
    # print ''
    # print 'que'
    # print que_wd
    # print que_full
    # print ''

    # SET stuff in text with replace 
    text = text.replace('SET_HOME', 'export HOME_JOB_DIR=%s' % HOME_JOB_DIR)
    text = text.replace('SET_STDOUT', '#$ -o %s' % HOME_JOB_DIR)
    text = text.replace('SET_STDERR', '#$ -e %s' % HOME_JOB_DIR)
    text = text.replace('SET_JOBNAME', 'export JOBNAME=%s' % comfile_wd)
    text = text.replace('SET_PROCS_NUM', PROC_STR[queue])
    text = text.replace('SET_GRP_NAME', GRP_STR[queue])
    text = text.replace('SET_QUE_NAME', QUE_STR[queue])
    text = text.replace('SET_GSOURCE', GAU_VERSION_PATH[queue] % (
        GAU_VERSION[gauversion])) 

    # write .que
    with open(que_full, 'w') as f:
        f.write(text)

    return que_full

# GAUSSIAN STUFF
def config_gaucom(comfile, queue = 'gb', gauversion = 'd'):

    """ take gaucom object as input, or filename ??? """

    NPROC_STR = {
        'gb': "%nprocshared=8\n",
        'b1': "%nprocshared=8\n",
        'b2': "%nprocshared=8\n",
        'ib': "%nprocshared=8\n",
        'sp': "%nprocshared=12\n",
        'rp': "%nprocshared=16\n"
    }

    MEM_STR = {
        'gb': "%mem=6200MB\n",
        'b1': "%mem=6200MB\n",
        'b2': "%mem=6200MB\n",
        'ib': "%mem=6200MB\n",
        'sp': "%mem=22500MB\n",
        'rp': "%mem=62500MB\n"
    }

    # accepted_queue = ["rp", "sp", "b1", "b2", "gb", "ib"]

    if type(comfile) == str:    # TODO implement for gaucom objects

        with open(comfile) as f:
            text = f.readlines()
         
        # erase nprocshared, mem
        to_del = []
        for i,line in enumerate(text):
            if line.strip().startswith('#'):
                break
            if (
                line.strip().startswith('%mem') or
                line.strip().startswith('%nproc') or
                line.strip().startswith('%Mem') or
                line.strip().startswith('%Nproc')):
                to_del.append(i)
        for i in to_del[::-1]:
            text.pop(i)
        # add nprocshared, mem
        text.insert(0, MEM_STR[queue])
        text.insert(1, NPROC_STR[queue])
            
        # write file
        with open(comfile, 'w') as f:
            for line in text:
                f.write(line)

    else:
        errormessage = 'GaussianJob.config_gaucom() takes FILENAME as input'
        raise RuntimeError(errormessage)

def sge_status(gauname_or_jobid):
    """ input = gau.com, gau.log or 12345"""

    qstat = getoutput('qstat')

    if type(gauname_or_jobid) == int:
        jobid = gauname_or_jobid
    elif type(gauname_or_jobid) == str:
        gauname = gauname_or_jobid
        jobid = None        # default

    if not jobid:
        # find quename.q
        QUE_EXT = '.q'
        quename = splitext(gauname)[0] + QUE_EXT
        if quename[0].isdigit():
            quename = '_' + quename

        # find quename.o12345
        jobsto = glob(quename + '.o*')
        if len(jobsto) == 1:
            jobid = int(jobsto[0].split('%s.o' % QUE_EXT)[-1])

        elif len(jobsto) > 1:
            jobid = max([int(j.split('%s.o' % QUE_EXT)[-1]) for j in jobsto])

        # seek in qstat
        elif len(jobsto) == 0:
            jobids = [int(line[:8]) for line in qstat.split('\n')[2:]]
            for j in jobids:
                job_name = getoutput('qstat -j %d | grep job_name:' % j)
                job_name = job_name.split()[1]
                if job_name == quename:
                    cwd = getoutput('qstat -j %d | grep stdout' % j)
                    cwd = cwd.split('NONE:NONE:')[1]
                    if cwd == getcwd(): # not working with paths yet
                        jobid = j

    # Now that jobid is defined
    status = []
    for line in qstat.split('\n')[2:]:
        if int(line[:8]) == jobid:
            status.append(line[40:45].strip())

    # not found
    if len(status) == 0:
        status.append(False)

    # multiple
    elif len(status) > 1:
        raise RuntimeError('Multiple qstat jobs found!')

    return status[0], jobid


