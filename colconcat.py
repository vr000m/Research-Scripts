# -*- coding: utf-8 -*-
# on shell you can also use: $> paste file1 file2 > output

import sys
import csv
    
def main(argv):
    fs = []
    fn = len(argv)
    '''
    if last param is output file then uncomment the 2 lines below
    and dont read that file.
    '''
    #newname = argv[fn-1]
    #fn =fn-1
    fw = open('output.txt', 'w')
    #to calculate the number of lines in the files, assuming they all have the same number
    # alternative would be to use MAX(file1, file2)
    num_lines = sum(1 for line in open(argv[0]))
    try:
        i =0
        for cli in argv:
            fs.append(open(argv[i], 'rb'))
            i=i+1
        for line in xrange(num_lines):
            for j in xrange(fn):
                fw.write(fs[j].readline().rstrip('\r\n'))
                if (j<fn-1):
                    fw.write(" ")
                else:
                    fw.write("\n")
    finally:
        for f in fs:
            f.close()

if __name__ == "__main__":
    main(sys.argv[1:])