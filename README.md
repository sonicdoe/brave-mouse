# brave-mouse

[![Node.js package](http://img.shields.io/npm/v/brave-mouse.svg)](https://www.npmjs.com/package/brave-mouse)
[![Linux Build Status](http://img.shields.io/travis/SonicHedgehog/brave-mouse/develop.svg)](https://travis-ci.org/SonicHedgehog/brave-mouse)
[![Windows Build Status](http://img.shields.io/appveyor/ci/SonicHedgehog/brave-mouse.svg)](https://ci.appveyor.com/project/SonicHedgehog/brave-mouse)

Validate your code against your EditorConfig.

## Getting started

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
