#!/usr/bin/env python3

class RouteSection():
    def __init__(self, rstext):
        """
            not tested for multiple lines
        """
        self.raw_text = rstext
        self.text = self.cleanup(rstext.lower()) # updated in write function

        ### process keywords 
        KEYWORDS = [Opt]                # list all implemented classes
        self.keywords = {}
        for keyclass in KEYWORDS:
            self.keywords[keyclass.name] = self.parse_keyword(keyclass)

        # update text after keywords being parsed
        "self.update_text()" # this goes in the write() function

        # self.scf = ...
        # self.geom = ... :)

    def parse_keyword(self, keywordclass):
        """
            takes a class as input
            self.text updated on-the-fly
        """
        found_keyword = False
        arglist, text1, text2 = self.get_keyword(
            self.text, keywordclass.name)
        if arglist != None:
            keyobj = keywordclass(arglist)
            self.text = '%s %s %s' % (text1, keyobj.printme(), text2)
            return keyobj       # self.opt = Opt(arglist)
        return None

    def write(self):
        # UPDATE TEXT!!! VERY IMPORTANT
        textout = self.text
        for key in self.keywords:
            _,a,b = self.get_keyword(textout, key)
            textout = '%s %s %s' % (a, self.keywords[key].printme(), b)
        return textout


    def digest_spaces(self, rsline, sign):
        """remove spaces around char specified in input
            example:
                opt = (maxmicro = 50) 
            becomes...
                 opt=(maxmicro=50), for sign="="
        """
        newstr = ''
        fields = rsline.split(sign)
        newfields = []
        for i in range(1, len(fields)-1):
            newfields.append(fields[i].strip())
        if len(fields) > 1:
            newfields.insert(0, fields[0].rstrip())
            newfields.append(fields[-1].lstrip())
        else:
            return rsline
        return sign.join(newfields)
    
    def digest_brackets(self, rsline):
        """
            remove spaces before brackets, using commas instead
            spaces preceeding ( are removed
            example:
                opt ( nha, nhe)
            becomes...
                opt( nha, nhe)
        """
        k = 0
        newline = ''
        spaces_buffer = ''
        for c in rsline:
            if c == ')':
                k -= 1
                if k == 0: # bracketted ready to process and append to newline
                    newline += bracketted
            if k == 0:
                if c == ' ':
                    spaces_buffer += c
                elif c != '(':
                    newline += spaces_buffer + c
                    spaces_buffer = ''
                else:
                    newline += c
                    spaces_buffer = ''
            else:   # k > 0
                bracketted += c
            if k < 0:
                raise RuntimeError('Too many ) brackets in route section')
            if c == '(':
                if k == 0:
                    bracketted = ''
                spaces_buffer = ''
                k += 1
        if k != 0:
            raise RuntimeError('Too many ( brackets in route section')
        return newline
            
    
    def cleanup(self, rsline):
        """execute digest procedure calling digest functions
            this is harmless to readability by gaussian"""
        rsline = self.digest_spaces(rsline, "=")
        rsline = self.digest_brackets(rsline)
        rsline = rsline.replace('\n', '\n ')
        return rsline
    
    def get_keyword(self, rsline, keyword):
        """
            Parse the text associated with a given keyword
                returns None if the keyword is not found
        """
        if not rsline.startswith('# '):
            rsline = rsline.replace('#', '# ') # avoids #opt not being found
        Ns = rsline.count(' %s' % keyword)
        Nc = rsline.count(',%s' % keyword)
        if Ns + Nc > 1:
            raise RuntimeError('Number of %s keywords in route section is %d' %
                (keyword, Ns + Nc) )
        elif Ns + Nc == 0:
            return None, rsline, '' # test this
    
        # do the work
        if Nc:  idx = rsline.index(',%s' % keyword)
        if Ns:  idx = rsline.index(' %s' % keyword)
        idx1 = idx # to print output lines (before and after keyword text)
        idx = idx + len(keyword) + 1
        if rsline[idx] == '=': 
            idx += 1
    
        # MULTI OPTIONS: keyword(option1, option2)
        if rsline[idx] == '(':      # sub-keywords!!!
            bracketted = ''
            for idx in range(idx+1, len(rsline)):
                if rsline[idx] == ')':
                    last_idx = idx+1
                    break
                bracketted += rsline[idx]
            bracketted = self.digest_spaces(bracketted, '=')
            options = self.digest_spaces(bracketted, ',')
            options = options.replace(',', ' ').split()
            options = [option.strip() for option in options]
    
        # SINGLE OPTION:    keyword=option
        else:
            option = ''
            last_idx = len(rsline)
            for idx in range(idx, len(rsline)):
                if rsline[idx] in [' ', ',', '\n']:
                    last_idx = idx
                    break
                option += rsline[idx]
            options = [option]
            if options[0] == '':
                options.pop(0)
    
        # rsline without keyword text
        line_before = rsline[:idx1]
        line_after = rsline[last_idx:]
        return options, line_before.rstrip(), line_after.lstrip()
 

class Opt():

    name = 'opt'

    def __init__(self, arglist):
        """
            To be initialized with arglist from RouteSection.get_keyword(Opt)
        """
        self.known_args_dict = self._gen_known_args_dict()  # modifiable args
        self.unknown_args = []   # Drop args from .com file (only .com file)
        self.args = self.process_gaucom(arglist)

    def set(self, user_arg):
        self._set_rm(user_arg, 'add')

    def rm(self, user_arg):
        self._set_rm(user_arg, 'rm')

    def process_gaucom(self, arglist):
        """arglist is from gaussian.com file"""
        args = {}
        areknown = [False for _ in arglist]
        for arg in self.known_args_dict:
            args[arg] = self.known_args_dict[arg][0]    # default 
            for i,gaucom_arg in enumerate(arglist):
                subarg = ''
                # take care of subargs like: maxcycles=30
                if '=' in gaucom_arg:
                    gaucom_arg, subarg = gaucom_arg.split('=')
                    gaucom_arg += '='
                gaucom_arg = self.canonical(gaucom_arg)
                # update keywords
                if gaucom_arg in self.known_args_dict[arg]:
                    args[arg] = gaucom_arg + subarg
                    areknown[i] = True

        # append unknown args to self.unknown_args
        for i,isknown in enumerate(areknown):
            if not isknown:
                self.unknown_args.append(arglist[i])

        return args

    def printme(self):
        """
            opt                 # all defaults
            opt(args=subargs)
        """
        to_print = self.unknown_args[:]   # non default args + unknown
        for arg in self.args:
            argument = self.args[arg]
            subarg = ''
            if '=' in argument:
                argument, subarg = argument.split('=')
                argument += '='
            if argument != self.known_args_dict[arg][0]:    # not default
                to_print.append(argument + subarg)
    
        if len(to_print) == 0:
            return 'opt' 
        else:
            return 'opt(' + ', '.join(to_print) + ')'
             

    def _set_rm(self, user_arg, do_what):

        # take care of subargs like: maxcycles=30
        subarg = ''
        if '=' in user_arg:
            user_arg, subarg = user_arg.split('=')
            user_arg += '='
        user_arg = self.canonical(user_arg)

        # find 
        for arg in self.args:
            if user_arg in self.known_args_dict[arg]:
                if do_what == 'add':
                    self.args[arg] = user_arg + subarg
                elif do_what == 'rm':
                    self.args[arg] = self.known_args_dict[arg][0] # set default

    def _gen_known_args_dict(self):
        """ 0 index are default options"""
        return {
            'goal':     ['', 'ts'],
            'modr':     ['', 'modred'],
            'conv':     ['', 'tight', 'loose', 'verytight'],
            'force':    ['', 'calcfc', 'calcall', 'readfc', 'rcfc'],
            'eigen':    ['eigentest', 'noeigentest'],
            'expert':   ['noexpert', 'expert'],
            'quadmac':  ['noquadmacro', 'quadmacro'],
            'micro':    ['micro', 'nomicro'],
            'maxcyc=':  ['', 'maxcycles='],  #  "=" implies sub-argument
            'maxstep=': ['', 'maxstep='],
            'maxmicro=':['', 'maxmicro=']
        }
       
    def canonical(self, argument):
        """ uniformize keywords """
        synonyms = {
            'maxmicroiterations=':  'maxmicro=',
            'maxmicroiter=':        'maxmicro=',
            'maxcyc=':              'maxcycles=',
            'rcfc':                 'readcartesianfc',
            'vtight':               'verytight',
            'addredundant':         'modredundant',
            'modr':                 'modred',
            'modredundant':         'modred',
            'modredund':            'modred',
            'modredun':             'modred',
            'noeigen':              'noeigentest',
            'nomicroiterations':    'nomicro',
            'nomicroiter':          'nomicro',
            'microiterations':      'micro',
            'microiter':            'micro',
            'quadmac':              'quadmacro'
        }
        if argument in synonyms:
            return synonyms[argument]
        else:
            return argument
   
    
### class Manager():
### 
###     def __init__(self, string = ''):
###         pass
###         #self.calcType = 
###         #self.functional = 
###     
###     calcType = ['sp', 'opt', 'freq', 'irc', 'fopt', 'popt', 'scan']
###     functional = ['b3lyp', 'mp2', '']
###     basis = ['6-31g(d)']
###     mm = ['amber', 'uff']

