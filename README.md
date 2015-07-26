# brave-mouse

[![Node.js package](http://img.shields.io/npm/v/brave-mouse.svg)](https://www.npmjs.com/package/brave-mouse)
[![Linux Build Status](http://img.shields.io/travis/SonicHedgehog/brave-mouse/develop.svg)](https://travis-ci.org/SonicHedgehog/brave-mouse)
[![Windows Build Status](http://img.shields.io/appveyor/ci/SonicHedgehog/brave-mouse.svg)](https://ci.appveyor.com/project/SonicHedgehog/brave-mouse)

Validate your code against your EditorConfig.

## Command line interface

Install brave-mouse using:

```shell
$ npm install brave-mouse -g
```

Validate files like this:

```shell
$ brave-mouse .travis.yml README.md package.json
```

brave-mouse automatically uses the appropiate `.editorconfig`.

### Exit codes

brave-mouse will exit abruptly (i.e. subsequent files won’t be processed) with an exit code of `1` if it encounters an error such as being unable to read a file.

brave-mouse will exit with an exit code of `2` if all files could be processed but not all files are valid according to your `.editorconfig`.

If all files could be processed successfully and are valid, brave-mouse exits with an exit code of `0`.

## Programmatic usage

Install brave-mouse using:

```shell
$ npm install brave-mouse
```

Use it like this:

```js
var braveMouse = require('brave-mouse');

braveMouse.validate('your-file.js', function(err, results) {
  // `err` will only be set for actual errors, e.g. it will
  // not be set if your file isn’t valid.
  if(err) throw err;
  
  if(results === true) {
    // Your file is valid
  } else {
    console.log(results);
    // {
    //   "indent_style": {
    //     "expected": "tab"
    //     "is": "space"
    //   }
    // }
  }
});
```

## Supported EditorConfig properties

See [EditorConfig’s wiki](https://github.com/editorconfig/editorconfig/wiki/EditorConfig-Properties) for a complete list of properties.

brave-mouse currently supports validating the following properties:

- `indent_style`
- `indent_size`
- `end_of_line` (only `lf` and `crlf` are supported)
- `trim_trailing_whitespace`
- `insert_final_newline`
- `max_line_length`

`tab_width` can’t be validated as it only applies to editors.

## Running tests

First, install all dependencies:

```shell
$ npm install -g grunt-cli
$ npm install
```

Then run the tests:

```shell
$ grunt test
```

## Release History

See [CHANGELOG.md](./CHANGELOG.md).

## License

brave-mouse is licensed under the BSD 2-clause license, subject to additional terms. See [LICENSE](./LICENSE) for the full license text.
