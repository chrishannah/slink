# slink
URL shortener for the command line, using Goo.gl.

## Installation
(This probably isn't the best way, but here it goes)

1. Download the latest version of slink - https://github.com/chrishannah/slink/releases.
2. Open up your terminal app of choice.
3. Navigate to the folder containing the "slink" file.
4. Add the executable permission to the file: `chmod +x slink.`
5. Move the file to the usr/local/bin directory so it can be launched as a command: `mv slink /usr/local/bin.`

## Usage

```
Usage: slink [options] <url>

Options:

    -h, --help              Outputs usage information.
    -s, --shortern <url>    Shortens a given URL.
    -e, --expand <url>      Attempts to expand a given URL.

Example:

    slink -s "http://google.co.uk"

```

## Demo
![](https://github.com/chrishannah/slink/blob/master/2017-03-23%2020_38_29.gif?raw=true)
