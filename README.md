Convert plt (which can be exported from Inkscape) to tektronix vector drawing stuff.

Needs Node.js and LiveScript.

    $ apt-get install nodejs npm
      # (Or similar)

    $ npm install liveScript

Then just pipe to and from your input and output files:

    $ livescript plt2tek.ls < hack42.plt > hack42.tek

The result:

![The Hack42 logo on a Tektronix](https://raw.github.com/Hack42/plt2tek/master/proof.jpg)
