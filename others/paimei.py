#!/usr/bin/env python

import qtrex
import sys
import time
from subprocess     import call
from os.path        import splitext
from os.path        import getmtime
from os.path        import splitext
from glob           import glob
from commands       import getoutput
from os             import getcwd
from gaussian       import GaussianLog as GL
from gaussian       import GaussianCom as GC
import os
import geom


#comname = sys.argv[1]
opt_queue = ['sp', 'rp', 'b1', 'b2', 'gb', 'ib']
opt_gauvr = ['a', 'c', 'd']

# defaults
queue = 'sp'
gauvers = 'd'
for o in sys.argv[2:]:
    if o in opt_queue:
        queue = o
    elif o in opt_gauvr:
        gauvers = o
    else:
        print('wtf?')
        sys.exit(2)

def gsub(comname, queue, gauvers):
    """submit gaussian job"""
    que = qtrex.gen_que(comname, queue, gauvers)
    qtrex.config_gaucom(comname, queue, gauvers)
    call(["qsub",que])
    #return que

def increment_gaucom_name(gaucom_name):
    """nha_nhe_23.com --> nha_nhe_24.com
       nha.com        --> nha_1.com     """

    name = splitext(gaucom_name)[0]
    if '_' in name:                           #             |
        if name.split('_')[-1].isdigit():     # all but the | digit
            digit = int(name.split('_')[-1])  #             V
            return '%s_%d.com' % ('_'.join(name.split('_')[:-1]), digit + 1)
    return name + '_1.com'

def hours_since_mod(filename):
    secs = time.time() - getmtime(filename)
    return secs / 3600.0

def reportcom(comname, sge_status, sge_jobid, modtime):
    header = "#                   DATE,           NAME,"
    header += " QSTAT, JOBID, modtime,   Term,    ErrID,vers,n_opt,    Action\n"
    date = time.ctime(time.time())
    txt = '%s,%15s,%6s,%6s,%8.1f\n' % \
        (date, comname, sge_status, sge_jobid, modtime)
    with open('paimei.reports', 'a') as f:
        if f.tell() == 0: # file is new
            f.write(header)
        f.write(txt)


def report(logname, sge_status, sge_jobid, modtime, gls, action):
    header = "#                   DATE,           NAME,"
    header += " QSTAT, JOBID, modtime,   Term,    ErrID,vers,n_opt,    Action\n"
    date = time.ctime(time.time())
    txt = '%s,%15s,%6s,%6s,%8.1f,%7s,%9s,%4s,%5d,%10s\n' % \
        (date, logname, sge_status, sge_jobid, modtime, gls.term, gls.errid,
         gls.version, gls.osteps, action)
    with open('paimei.reports', 'a') as f:
        if f.tell() == 0: # file is new
            f.write(header)
        f.write(txt)

def guess_queue(com):
    nproc = 12 # defaults to SPECIAL
    D = {12:'sp', 16:'rp', 8:'gb'}
    for line in open(com):
        if line.startswith('%nproc'):
            nproc = int(line.split('=')[1])
            break
    return D[nproc]

def do_restart(gl, gver = 'd'):
    comname = splitext(gl.name)[0] + '.com'
    gc = GC(comname)
    for atom,xyz in zip(gc.atoms_list, gl.final_geometry):
        atom.set_coordinates(xyz.get_coordinates())
    newcomname = increment_gaucom_name(comname)
    # reduce scan steps accordingly
    steps_done = len(gl.bytedict['orientation:'])-1
    print steps_done
    if steps_done:  
        print steps_done
        for modred in gc.modreds:
            if modred.action == 'S':# this FAILs for multi- scans
                modred.scan_num_pts -= steps_done
    gc.write_to_file(newcomname)
    queue = guess_queue(newcomname) 
    gsub(newcomname, queue, gver)

class glog_status():
    """This only makes sense after running.
         sge_staus in ['r', False]"""

    def __init__(self, globj, user_coords = []):
        self.term = globj.termination.status
        self.errid = globj.termination.errorcode
        self.version = globj.gaussian_version
        self.osteps = len(globj.bytedict['orientation:'][-1])
        self.metrics = self.process_coords(globj, user_coords)

    def process_coords(self, gl, user_coords):
        metrics = []
        for coord in user_coords:
            metric = []
            for b in gl.bytedict['orientation:'][-1]: # last scan point
                xyz = gl.read_coordinates(coord, b)
                metric.append(geom.anymetric(xyz))
            metrics.append(metric)
        return metrics


class xiaojun():

    def __init__(self, timecap = 24, metric_cuts=[]):
        self.timecap = timecap 
        self.states = self.set_states()

    def set_states(self):
        return [
            #sge, term, errid, nowrite, version, osteps==1, action
            ('r', None,  None,   False,  'g09d', False,     None),
            ('r', None,  None,   False,  'g09d', True,      None),
            ('r', None,  None,   False,  'g09a', False,     None),
            ('r', None,  None,   False,  'g09a', True,      None)
        ]

    def action(self, logstatus, sge_status, modtime):
        """insanity flowchart"""
        if sge_status == 'r':
            if modtime < self.timecap:
                action = None
            else:
                action = 'rst-1'

        elif sge_status in ['qt', 't', 'T']:
            action = None

        elif not sge_status:
            if logstatus.term == 'Normal':
                action = 'NORMAL'
            elif not logstatus.term:
                action = 'rst-1'
            elif logstatus.term == 'Error':
                if logstatus.errid == 'micro':
                    if logstatus.version == 'g09a':
                        action = 'Human!'
                    elif logstatus.version != 'g09a':
                        if logstatus.osteps == 1:
                            action = 'rst-1-g09a'
                        else:
                            action = 'rst-1'
                elif logstatus.errid == 'intCoord':
                    if logstatus.version == 'g09d':
                        action = 'Human!'
                    else:
                        action = 'rst-1'
                else:
                    action = 'rst-1'
        return action

        

def read_files():
    gaudict = {}
    gaus = glob('*log')
    gaus += glob('*com')
    badname = False
    for gau in gaus:
        gaubase, ext = splitext(gau) # gaubase = "stem_99"
        if '_' not in gau:
            badname = True
        if gaubase.split('_')[-1].isdigit() and '_' in gaubase:
            id = int(gaubase.split('_')[-1])
            stem = '_'.join(gaubase.split('_')[:-1])
        else:
            badname = True
        if badname:
            sys.stderr.write('All gaussian files must be basename_idx.com/log\n')
            sys.exit(2)
        if stem not in gaudict:
            gaudict[stem] = id
        gaudict[stem] = max(id, gaudict[stem])

    if len(gaudict) > 1:
        sys.stderr.write('Found multiple basenames with ext: .log/.com:\n')
        sys.stderr.write('    %s\n' % (', '.join([k for k in gaudict])))
        sys.exit(2)

    elif len(gaudict) == 0:
        sys.stderr.write('No .log/.com files.\n')
        sys.exit(2)

    stem = gaudict.keys()[0] 
    id = gaudict[stem]

    return stem, id

def main():

    (stem,id) = read_files()
    logname = '%s_%d.log' % (stem, id)

    # get qstat data 
    sge_status, sge_jobid = qtrex.sge_status(logname) # works even if no .log

    if not os.path.exists(logname):     # (stem,id) derived from .com file
        comname = '%s_%d.com' % (stem, id)
        if sge_status in ['t', 'qw']:
            print 'Job is queued!'
        elif not sge_status:
            print "This is hanging: %s  <--submit " % comname
        else:
            print "Something wrong with jobid %d" % sge_jobid
        modtime = hours_since_mod(comname)
        reportcom(comname, sge_status, sge_jobid, modtime)
        sys.exit()

    TIMECAP = 24

    glog = GL(logname)
    modtime = hours_since_mod(logname)

    coords = [] # this is user input for bonds, angles, and dihedrals
    # i.e: coords = [(1,2), (3,4,5)], which is a bond and an angle
    # paimei --bond 1 2 / --bond :123@CA :25@OD1 --com STEM_99.com
    # paimei --scan :281@OW :201@C 1.5 --freeze 1 2
    # paimei --ts 

    gls = glog_status(glog)
    nha = xiaojun(TIMECAP, [])

    action = nha.action(gls, sge_status, modtime)

    report(logname, sge_status, sge_jobid, modtime, gls, action)

    if action == 'rst-1':
        do_restart(glog, 'd')
    elif action == 'rst-1-g09a':
        do_restart(glog, 'a')


# Run
if __name__ == "__main__":
    main()


