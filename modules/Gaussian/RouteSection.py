#!/usr/bin/env python3

def synonymless(keyword):
    synonyms = {
        'maxmicro': 'maxmicroiterations',
        'rcfc': 'readcartesianfc',
        'vtight': 'verytight',
        'addredundant': 'modredundant',
        'modr': 'modredundant'
        'noeigen': 'noeigentest'
    }
    if keyword in synonyms:
        return synonyms[keyword]
    else:
        return keyword


class Manager():

    def __init__(self, string = ''):
        self.calcType = 
        self.functional = 

    
    
    calcType = ['sp', 'opt', 'freq', 'irc', 'fopt', 'popt', 'scan']
    functional = ['b3lyp', 'mp2', '']
    basis = ['6-31g(d)']
    mm = ['amber', 'uff']

class Opt():
    
    # list implemented options here
    arg_name = ['opt', 'fopt', 'topt']
    arg_forces = ['calcfc', 'calcall', 'readfc', 'rcfc']
    arg_goal = ['ts']
    arg_modr = ['modredundant']
    arg_eigentest = ['eigentest', 'noeigentest']
    arg_expert = ['noexpert', 'expert']
    arg_quadmac = ['noquadmacro', 'quadmacro']
    arg_micro = ['micro', 'nomicro']
    arg_converge = ['tight', 'loose', 'verytight']
    arg_maxcycles = ['maxcycles']
    arg_maxstep = ['maxstep']
    arg_maxmicro = ['maxmicroiterations']

    # the following args will not be printed by self.writestr()
    defaults = ['', 'noeigentest', 'noexpert', 'noquadmacro', 'tight', 'micro']

    def __init__(self, string = ''):
        """set defaults for all variables, then parse input string"""
        self.name = 'opt'               # fopt, topt 
        self.forces = ''
        self.goal = ''                  # ts otherwise
        self.modr = ''                  # modredundant
        self.eigentest = 'eigentest'
        self.expert = 'noexpert'
        self.quadmac = 'noquadmacro'
        self.micro = 'micro'
        self.converge = 'tight'
        self.maxcycles = ''
        self.maxstep = ''
        self.maxmicro = ''
        self.success = True
        self.failed = []
        # now parse input
        self.readstr(string)

    def readstr(self, string):
        """string is like fopt(modr, ts, maxstep=1, noeigen)"""

        name = string.split('(')[0]
        if name not in arg_name:
            raise RuntimeError('This should never happen.')
        else:
            self.name = name

        string = string.split('(',1)[1].strip(')')

        for keyword in string.split(','):
            fullkeyword = keyword.strip()           # args to args be print
            keyword = keyword.split('=')[0].strip() # args to args not kept
            keyword = synonymless(keyword)
            if keyword in arg_goal:
                self.goal = fullkeyword 
            elif keyword in arg_forces:
                self.forces = fullkeyword 
            elif keyword in arg_modr:
                self.modr = fullkeyword
            elif keyword in arg_eigentest:
                self.eigentest = fullkeyword
            elif keyword in arg_expert:
                self.expert = fullkeyword
            elif keyword in arg_quadmac:
                self.quadmac = fullkeyword
            elif keyword in arg_micro:
                self.micro = fullkeyword
            elif keyword in arg_converge:
                self.converge = fullkeyword
            elif keyword in arg_maxcycles:
                self.maxcycles = fullkeyword
            elif keyword in arg_maxstep:
                self.maxstep = fullkeyword
            elif keyword in arg_maxmicro:
                self.maxmicro = fullkeyword
            else:
                'Bad times, we need more keywords'
                self.success = False
                self.failed.append(fullkeyword)

    def writestr(self):
        """all these ifs need a haircut"""
        string = self.name
        keywords = []
        if self.goal not in defaults:
            keywords.append(self.goal)
        if self.forces not in defaults:
            keywords.append(self.forces)
        if self.modr not in defaults:
            keywords.append(self.modr)
        if self.eigentest not in defaults:
            keywords.append(self.eigentest)
        if self.expert not in defaults:
            keywords.append(self.expert)
        if self.quadmac not in defaults:
            keywords.append(self.quadmac)
        if self.micro not in defaults:
            keywords.append(self.micro)
        if self.converge not in defaults:
            keywords.append(converge)
        if self.maxcycles not in defaults:
            keywords.append(self.maxcycles)
        if self.maxstep not in defaults:
            keywords.append(self.maxstep)
        if self.maxmicro not in defaults:
            keywords.append(self.maxmicro)

        return string
    # defaults to ''
    target = ['ts']

    # defaults to first:
    ['noeigentest', 'eigentest',]
    ['noexpert', 'expert']

    # need args
    opt_general_options = [
        'maxcycles', 'maxstep', 'maxmicroiterations']
class SCF():
    'scf conver=n xqc'
    





