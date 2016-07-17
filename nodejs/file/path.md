## Path

主要用来简化路径相关操作；

#### path.normalize

将传入的路径转换为标准路径，具体讲的话，除了解析路径中的`.`与`..`外，还能去掉多余的斜杠。

```javascript
var cache = {};

function store(key, value) {
    cache[path.normalize(key)] = value;
}

store('foo/bar', 1);
store('foo//baz//../bar', 2);
console.log(cache);  // => { "foo/bar": 2 }
```
>  标准化之后的路径里的斜杠在Windows系统下是`\`，而在*nix系统下是`/`。如果想保证任何系统下都使用`/`作为路径分隔符的话，需要用`.replace(/\\/g, '/')`再替换一下标准路径。

#### path.join

将传入的多个路径拼接为标准路径

```javascript
path.join('foo/', 'baz/', '../bar'); // => "foo/bar"
```

#### path.extname

取得文件的扩展名

```javascript
path.extname('foo/bar.js'); // => ".js"
```