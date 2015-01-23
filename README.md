# brave-mouse

Validate your code against your EditorConfig.

## Getting started

Install brave-mouse using:

```shell
$ npm install brave-mouse --save
```

Use it like this:

```js
var braveMouse = require('brave-mouse')

braveMouse.validate('your-file.js', function(err, result) {
  // `err` will only be set for actual errors, e.g. it will
  // not be set if your file isn’t valid.
  
  if(result === true) {
    // Your file is valid
  } else {
    console.log(result)
    // {
    //   "indent_style": {
    //     "expected": "tab"
    //     "is": "space"
    //   }
    // }
  }
})
```

## Release History

See [CHANGELOG.md](./CHANGELOG.md).

## License

brave-mouse is licensed under the BSD 2-clause license, subject to additional terms. See [LICENSE](./LICENSE) for the full license text.
