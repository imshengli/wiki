## File System

NodeJS通过`fs`内置模块提供对文件的操作。`fs`模块提供的API基本上可以分为以下三类：

- 文件属性读写：`fs.stat`、`fs.chmod`、`fs.chown`等；
- 文件内容读写：`fs.readFile`、`fs.readdir`、`fs.writeFile`、`fs.mkdir`等；
- 底层文件操作：`fs.open`、`fs.read`、`fs.write`、`fs.close`等；


#### 异步I/O

```javascript
fs.readFile(pathname, function (err, data) {
    // 第一个参数在有错误发生时等于异常对象；
    // 第二个参数始终用于返回API方法执行结果；
    if (err) {
        // Deal with error.
    } else {
        // Deal with data.
    }
});
```

#### 同步I/O

```javascript
try {
    var data = fs.readFileSync(pathname);
    // Deal with data.
} catch (err) {
    // Deal with error.
}
```

#### 示例：文件copy

```javascript
var fs = require('fs');

function copy(src, dst) {
    fs.writeFileSync(dst, fs.readFileSync(src));
}

function main(argv) {
    copy(argv[0], argv[1]);
}

// process是一个全局变量，可通过process.argv获得命令行参数。
// 由于argv[0]固定等于NodeJS执行程序的绝对路径，argv[1]固定等于主模块的绝对路径，
// 因此第一个命令行参数从argv[2]这个位置开始。
main(process.argv.slice(2));
```
