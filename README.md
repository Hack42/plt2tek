Convert plt (which can be exported from Inkscape) to tektronix vector drawing stuff.

Needs Node.js and LiveScript.

    $ apt-get install nodejs
      # (Or similar)

    $ npm install LiveScript

Then just pipe to and from your input and output files:

    $ livescript plt2tek.ls < hack42.plt > hack42.tek
