Convert plt (which can be exported from Inkscape) to tektronix vector drawing stuff.

Needs Node.js and LiveScript.

    $ apt-get install nodejs
    # (Or similar)

    $ npm install LiveScript

Then just pipe in your input:

    $ echo 'IN;PU0,0;PD0,100;PD100,100;PD100,0;PD0,0;PU;' > test.plt

    $ livescript plt2tek.ls < test.plt > test.tek

Or something.
