Convert plt files (which can be exported from Inkscape) to tektronix 40xx vector input.

Runs on [Node.js](http://nodejs.org/) (`apt-get install nodejs` or similar). Install via npm:

<<<<<<< HEAD
    $ apt-get install nodejs npm
      # (Or similar)

    $ npm install liveScript
=======
    $ npm install plt2tek -g
## Preparation
 In a Inkscape drawing, choose Document Properties and set Default units to mm. position your drawing in the bottom left corner of the page and resize it to make is smaller than 29x21 mm. Yes, that is very small indeed. Don't worry, it will plot full screen on the tek. Anything bigger will plot strange things. 
 Technical blabla: the x-y coord. system has a max of 1024x767 on the tek 4002a ans 4014. hp plot files have a way bigger x-y coord. set. Limiting this by resizing eliminates warping in the script.

## Usage
>>>>>>> 43814462bf0a21565204adfe3164b89d1fdb4834

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

[MIT](https://raw.github.com/Hack42/plt2tek/master/LICENSE)
