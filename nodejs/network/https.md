## HTTPS

https模块与http模块极为类似，区别在于https模块需要额外处理SSL证书。

在服务端模式下，创建一个HTTPS服务器的示例如下。

```javascript
var options = {
    key: fs.readFileSync('./ssl/default.key'),
    cert: fs.readFileSync('./ssl/default.cer')
};

var server = https.createServer(options, function (request, response) {
    // ...
});
```

可以看到，与创建HTTP服务器相比，多了一个`options`对象，通过`key`和`cert`字段指定了HTTPS服务器使用的私钥和公钥。

另外，NodeJS支持`SNI`技术，可以根据HTTPS客户端请求使用的域名动态使用不同的证书，因此同一个HTTPS服务器可以使用多个域名提供服务。接着上例，可以使用以下方法为HTTPS服务器添加多组证书。

```javascript
server.addContext('foo.com', {
    key: fs.readFileSync('./ssl/foo.com.key'),
    cert: fs.readFileSync('./ssl/foo.com.cer')
});

server.addContext('bar.com', {
    key: fs.readFileSync('./ssl/bar.com.key'),
    cert: fs.readFileSync('./ssl/bar.com.cer')
});
```

在客户端模式下，发起一个HTTPS客户端请求与http模块几乎相同，示例如下。

```javascript
var options = {
    hostname: 'www.example.com',
    port: 443,
    path: '/',
    method: 'GET'
};

var request = https.request(options, function (response) {});

request.end();
```

但如果目标服务器使用的SSL证书是自制的，不是从颁发机构购买的，默认情况下https模块会拒绝连接，提示说有证书安全问题。在options里加入`rejectUnauthorized: false`字段可以禁用对证书有效性的检查，从而允许https模块请求开发环境下使用自制证书的HTTPS服务器。
