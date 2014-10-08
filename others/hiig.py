#!/usr/bin/env python

def symbolizer(value, threshold):
    symbols = '+123456789-*'
    factor =  [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1000, float('+inf')]
    for i in range(12):
        if value <= factor[i] * threshold:
            return symbols[i]

def print_label_index(start, stop):
    TOL = 4 # dont print in ending chars
    ticks = ''
    for i in range(start, stop-TOL):
        ticks += [' ','|'][int(((i+1) % 10) == 0)] 
    ticks += ' ' * TOL
    # tick labels
    int_val = [i for i in range(start, stop-TOL) if ((i+1) % 10) == 0]
    str_val = [str(i+1) for i in int_val]
    len_val = [len(s) for s in str_val]
    vals = [' ' for _ in range(start, stop-TOL)] + [' ' for _ in range(TOL)]
   # offset = (start + 1) % 10
    for (s,l,i) in zip(str_val, len_val, int_val):
        j = i-start
        for k in range(l):
            vals[j+k] = s[k]
    vals = ''.join(vals)
    return ticks + '\n' + vals + '\n'

def symbol_legend(): 
    symbol_keys = '\nsymbols:\n'
    symbol_keys += '    +           <= 1.0 * threshold\n'
    symbol_keys += 'n = 1,2,...,9   <= (2^n) * threshold\n'
    symbol_keys += '    -           <= 1000 * threshold\n'
    symbol_keys += '    *           >  1000 * threshold\n\n'
    return symbol_keys

def print_convergence_symbols(thresholds, data, legend=None,
         maxwidth=80, multiline = False):
    """
        data:       list with N lists of floats
        thresholds: list with N thresholds
        legend:     list with N strings
    """

    if not legend:
        legend = ['' for _ in thresholds]

    if (len(legend) != len(data)) or (len(data) != len(thresholds)):
        raise RuntimeError('input lists must have same length')

    longest_legend = max([len(s) for s in legend])
    max_symbols_width = maxwidth - longest_legend -1

    out = ''
    stop = len(data[0])
    start =  max(0, stop - max_symbols_width)

    if multiline and start > 0:
        n = stop / max_symbols_width + int((stop % max_symbols_width) > 0)
        for i in range(n):
            start_ = i * max_symbols_width
            stop_ = min((i+1)*max_symbols_width, stop)
            out += lowlevel_convergence_symbols(
                data, legend, thresholds, start_, stop_)
    else:
        out += lowlevel_convergence_symbols(
                data, legend, thresholds, start, stop)
    return out



def lowlevel_convergence_symbols(data, legend, thresholds, start, stop):
    symbols = '\n'
    for (vec, leg, thr) in zip(data, legend, thresholds):
        #max_vec_length = min(len(vec), max_symbols_width)
        #vec = vec[-max_vec_length:]
        vec = vec[start:stop]
        for value in vec:
            symbols += symbolizer(value, thr)
        symbols += ' %s' % leg    
        symbols += '\n'
    symbols += print_label_index(start, stop)
    return symbols


def usage():
    print('usage:')
    print('  hiig.py inputname.log')
    print('options:')
    print('     -e scf/oniom/model/low  [default = oniom or scf]')
    #print('     -s scan_step            [default = 0 (last; 1-indexing)]')
    print('     -w max_width            [default = 80]')
    #print('     -m                     multi-line if opt-points > max_width')
    print('     -h                     Help! explain the symbols')

def energytype_convert(gl, energytype):
    if energytype == 'default':
        if gl.bytedict['ONIOM: calculating energy.'] == [[]]:
            return 'SCF_energy'
        else:
            return 'ONIOM_extrapol'
    elif energytype == 'scf':
        return 'SCF_energy'
    elif energytype == 'oniom':
        return 'ONIOM_extrapol'
    elif energytype == 'model':
        return 'ONIOM_model_high'
    elif energytype == 'low':
        return 'ONIOM_lowlayer_low'
    else:
        usage()
        print('Error:')
        print('  -e %s not accepted' % energytype)    
        sys.exit(2)

def main():
    from os.path import splitext
    import getopt, sys
    from gaussian import GaussianLog as GL
    import misc, asciiplot, geom

    try:
        opts, args = getopt.gnu_getopt(sys.argv[1:], 'e:w:h')
    except getopt.GetoptError as err:
        sys.stderr.write(err + '\n')
        usage()
        sys.exit(2)

    # defaults
    scan_pts = 0
    energytype = 'default'
    maxwidth = 80
    multiline = True
    explain_symbols = False

    # provided input
    for o, a in opts:
        if   o == '-s': scan_pts = int(a)
        elif o == '-e': energytype = a.lower()
        elif o == '-w': maxwidth = int(a)
        elif o == '-m': multiline = True
        elif o == '-h': explain_symbols = True

    if len(args) < 1 and explain_symbols:
        print(symbol_legend())
        sys.exit(0)

    if len(args) < 1:
        usage()
        print('missing:')
        print('  inputname.log')
        sys.exit(2)
    elif len(args) > 1:
        usage()
        print('too many args:')
        print('  %s' % (','.join(args)))

    filein = args[0]
    basename, input_extension = splitext(filein)
    if input_extension not in ['.log']:
        print('WARNING:')
        print('  inputname suffix is: %s' % input_extension)


    # read gaussian.log
    gl = GL(filein)

    converged = []
    for byte in gl.bytedict['Converged?'][-1]:
        # labels and thresh are constant for every byte, keep only last iter
        (labels, values, thresh) = gl.read_converged(byte)
        converged.append(values)
    converged = misc.transpose_list_of_lists(converged)

    # print!
    pretty = print_convergence_symbols(thresh, converged, 
        labels, maxwidth, multiline)
    print(pretty)

    # scan info
    scan_info = False
    now_scan_point = len(gl.bytedict['Converged?'])
    total_scan_num_pts = 1 # default for opt
    if gl.modreds: # not None
        for modred in gl.modreds:
            if modred.action == 'S':
                scan_info = ['', '']
                total_scan_num_pts = modred.scan_num_pts + 1
                #measure_func = {'S': geom.distance,
                #                'A': geom.angle,
                #                'D': geom.dihedral
                #                }
                #measure_func = measure_func[modred.coordtype] 
                a = gl.atoms_list[modred.atomids[0]-1].get_coordinates()
                b = gl.atoms_list[modred.atomids[1]-1].get_coordinates()
                if   modred.coordtype == 'B':
                    scan_info[0] = 'distance'
                    start_measure = geom.distance(a, b)
                elif modred.coordtype == 'A':
                    scan_info[0] = 'angle'
                    c = gl.atoms_list[modred.atomids[2]-1].get_coordinates()
                    start_measure = geom.angle(b, a, c) # b in the middle!
                elif modred.coordtype == 'D':
                    scan_info[0] = 'dihedral'
                    c = gl.atoms_list[modred.atomids[2]-1].get_coordinates()
                    d = gl.atoms_list[modred.atomids[3]-1].get_coordinates()
                    start_measure = geom.dihedral(a,b,c,d)
                # x axis for asciiplot
                x_axis = [start_measure + modred.scan_step_sz*i 
                            for i in range(now_scan_point)]
                for atomid in modred.atomids:
                    scan_info[1] += '%d %s, %s\n' % (
                        gl.atoms_list[atomid-1].resinfo.resnum,
                        gl.atoms_list[atomid-1].resinfo.resname,
                        gl.atoms_list[atomid-1].resinfo.name)
                scan_info[1] += '%s %s %s %d %f\n' % (
                    modred.coordtype,
                    ' '.join([str(at) for at in modred.atomids]),
                    modred.action,
                    modred.scan_num_pts,
                    modred.scan_step_sz)
                
    print ('Opt #: %3d out of %3d\n' % (
        now_scan_point, total_scan_num_pts))

    if explain_symbols:
        print(symbol_legend())

    # get key for gl.energies dict
    energykey = energytype_convert(gl, energytype)

    # ENERGIES:     if scan: last opt in each step;     if opt: last scan_pt
    if len(gl.bytedict['Converged?']) > 1:
        energies = [e[-1] for e in gl.energies[energykey]]
        oneopt = False
    else:
        energies = gl.energies[energykey][-1]
        x_axis = [i+1 for i in range(len(energies))]
        oneopt = True

    HARTREE2KCAL = 627.509

    minene = min(energies) 
    y = [HARTREE2KCAL*(i - minene) for i in energies]
    p = asciiplot.AFigure()
    _ = p.plot(x_axis, y, marker='_s')
    p.xlim(min(x_axis), max(x_axis) )
    print(p.draw())
    if oneopt:
        print('Energy along optimization point.')
    else:
        print('Energy for optimized (or not) steps. (this is a scan)')
        if scan_info:
            print('X axis matches %s between:' % scan_info[0])
            print(scan_info[1])
    
if __name__ == '__main__':
    main()
    
    

