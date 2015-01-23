# brave-mouse

[![Node.js package](http://img.shields.io/npm/v/brave-mouse.svg)](https://www.npmjs.com/package/brave-mouse)

Validate your code against your EditorConfig.

## Getting started

Install brave-mouse using:

```shell
$ npm install brave-mouse --save
```

Use it like this:

```js
var braveMouse = require('brave-mouse')

braveMouse.validate('your-file.js', function(err, results) {
  // `err` will only be set for actual errors, e.g. it will
  // not be set if your file isn’t valid.
  
  if(results === true) {
    // Your file is valid
  } else {
    console.log(results)
    // {
    //   "indent_style": {
    //     "expected": "tab"
    //     "is": "space"
    //   }
    // }
  }
})
```

## Supported EditorConfig properties

See [EditorConfig’s wiki](https://github.com/editorconfig/editorconfig/wiki/EditorConfig-Properties) for a complete list of properties.

brave-mouse currently supports validating the following properties:

- `indent_style`

## Release History

See [CHANGELOG.md](./CHANGELOG.md).

## License

brave-mouse is licensed under the BSD 2-clause license, subject to additional terms. See [LICENSE](./LICENSE) for the full license text.
