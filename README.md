Convert plt (which can be exported from Inkscape) to tektronix 40xx vector input.

Runs on [Node.js][http://nodejs.org/] (`apt-get install nodejs` or similar). Install via npm:

    $ npm install plt2tek -g

## Usage

### On the command line

    $ plt2tek [inputfile]

For example:

    $ plt2tek hack42.plt > hack42.tek

![The Hack42 logo on a Tektronix](https://raw.github.com/Hack42/plt2tek/master/assets/proof.jpg)

### As a node.js module

    plt2tek(input);

Takes a string and returns an array of octets. For example:

    var fs = require('fs');
    var Buffer = require('buffer').Buffer;
    var plt2tek = require('plt2tek');

    var input = 'IN;PU0,0;PD0,100;PD100,100;PD100,0;PD0,0;PU;';
    var output = pl2tek(input); // [29, 32, ...]

    fs.writeFile('output.tek', new Buffer(output));

## License

[MIT][https://raw.github.com/Hack42/plt2tek/master/LICENSE]
