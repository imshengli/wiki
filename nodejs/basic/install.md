## 安装使用

### 安装

NodeJS提供了一些安装程序，都可以在nodejs.org这里下载并安装。

Windows系统下，选择和系统版本匹配的.msi后缀的安装文件。Mac OS X系统下，可以使用`brew`进行安装。

### 使用

终极神器`Hello World`：

```javascript
$ node
> console.log('Hello World');
Hello World
```

官方示例：

```javascript
const http = require('http');

const hostname = '127.0.0.1';
const port = 3000;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Hello World\n');
});

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});
```