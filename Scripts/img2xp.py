#!/usr/bin/python

#
# translate an image file into the REXPaint file format
# or plain ascii
#
# requires: python 3+
# requires: pip install Pillow
#
# source: https://gist.github.com/mtvee/5629a2caa34dbf3ece95
# ---------------------------------------------------------------------------------
import os
import struct
import argparse
from PIL import Image

def fromImage( fname, size=0, txtout = False, overwrite=False ):
    chars = ['@','#','$','=','*','!',';',':','~','-',',','.',' ', ' ']
    im = Image.open( fname )
    # convert whatever to rgb
    rgbim = im.convert('RGB')
    # make a thumbnail if ordered
    if size != 0:
        rgbim.thumbnail((size,size), Image.ANTIALIAS)

    # get the filename
    fname = os.path.basename(fname)
    namepart = os.path.splitext(fname)[0]
    # set the default outputs
    oname = namepart + '.xp'
    wmode = 'wb'
    fp = ''
    # for ascii output
    if txtout:
        oname = namepart + '.txt'
        wmode = 'w'

    # check for overwrite
    if os.path.isfile(oname):
        if overwrite:
            os.unlink(oname)
        else:
            print('file exists, write aborted: ' + oname )
            return

    fp = open(oname, wmode)
    # write the xp header info
    if not txtout:
        fp.write(struct.pack('i', 1))
        fp.write(struct.pack('i', 1))
        fp.write(struct.pack('i', rgbim.size[0]))
        fp.write(struct.pack('i', rgbim.size[1]))

    # bomb thru the pixels
    for x in range(rgbim.size[0]):
        s = ''
        for y in range(rgbim.size[1]):
            r, g, b = rgbim.getpixel((x,y))
            val = max(r, g, b)/255;
            ch = chars[int(val*(len(chars)-1))]
            if txtout:
                s += ch
            else:
                fp.write(struct.pack('i', ord(ch)))
                fp.write(struct.pack('BBBBBB', r,g,b,0,0,0))
        if txtout:
            print( s, file=fp )


if __name__ == '__main__':
    parser = argparse.ArgumentParser('Convert image to REXPaint xp format or ascii')
    parser.add_argument('--force', action='store_true', help='overwrite an existing file')
    parser.add_argument('--text', action='store_true', help='output to ascii')
    parser.add_argument('--size', action='store', type=int, default=0, help='resize to size')
    parser.add_argument('filename')
    args = parser.parse_args()

    fromImage(args.filename, args.size, args.text, args.force)
