## Stream

#### Stream：数据流

- 应用场景：`处理大文件操作`或者`边读取边处理数据`这样更高效时；
- API：`createReadStream` 和 `createWriteStream`；
- 机制：基于事件机制工作，所有Stream的实例都继承自`EventEmitter`；

#### 只读数据流

```javascript
var rs = fs.createReadStream(pathname);

rs.on('data', function (chunk) {
    // 暂停读取，待doSomething处理完成后再继续
    rs.pause();
    doSomething(chunk, function () {
        rs.resume();
    });
});

rs.on('end', function () {
    cleanUp();
});
```

#### 只写数据流

```javascript
var rs = fs.createReadStream(src);
var ws = fs.createWriteStream(dst);

rs.on('data', function (chunk) {
    // 根据.write方法的返回值来判断传入的数据是写入目标了，还是临时放在缓存了
    if (ws.write(chunk)=== false) {
        rs.pause();
    }
});

rs.on('end', function () {
    ws.end();
});

// 根据drain事件来判断什么时候只写数据流已经将缓存中的数据写入目标
ws.on('drain', function () {
    rs.resume();
});
```

#### 示例：大文件拷贝

```javascript
var fs = require('fs');

function copy(src, dst) {
    fs.createReadStream(src).pipe(fs.createWriteStream(dst));
}

function main(argv) {
    copy(argv[0], argv[1]);
}

main(process.argv.slice(2));
```
以上程序使用fs.createReadStream创建了一个源文件的只读数据流，并使用fs.createWriteStream创建了一个目标文件的只写数据流，并且用pipe方法把两个数据流连接了起来。连接起来后发生的事情，说得抽象点的话，水顺着水管从一个桶流到了另一个桶。