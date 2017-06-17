1	0	RainDon	HTTP Header 内容详解	http-header-content	1	1		0	ImShengli	HTTP				<div class="md-section-divider"></div>\
\
<p><div class="toc">\
<ul>\
<li><ul>\
<li><ul>\
<li><a href="#一什么是http-headers">一、什么是HTTP Headers？</a></li>\
<li><a href="#二怎样看到http-headers信息">二、怎样看到HTTP Headers信息？</a></li>\
<li><a href="#三http-request-的构成">三、HTTP Request 的构成</a></li>\
<li><a href="#四请求类型">四、请求类型</a><ul>\
<li><a href="#1get获取一个文档">（1）GET：获取一个文档</a></li>\
<li><a href="#2post发送数据至服务器">（2）POST：发送数据至服务器</a></li>\
<li><a href="#3head接受header信息">（3）HEAD：接受Header信息</a></li>\
</ul>\
</li>\
<li><a href="#五http-response-的构成">五、HTTP Response 的构成</a></li>\
<li><a href="#六http状态码">六、HTTP状态码</a></li>\
<li><a href="#七http-headers-中的http請求">七、HTTP Headers 中的HTTP請求</a><ul>\
<li><a href="#host">Host</a></li>\
<li><a href="#user-agent">User-Agent</a></li>\
<li><a href="#keep-alive">Keep-Alive</a></li>\
</ul>\
</li>\
</ul>\
</li>\
</ul>\
</li>\
</ul>\
</div>\
</p>\
\
<hr>\
\
<div class="md-section-divider"></div>\
\
<h3 id="一什么是http-headers">一、什么是HTTP Headers？</h3>\
\
<p>HTTP是<code>Hypertext Transfer Protocol</code>的缩写，整个WWW都在使用此协议，几乎你在浏览器里看到的大部分內容都是通过HTTP协议来进行传输，比如你当前看的这篇文章。</p>\
\
<p>HTTP Headers是HTTP请求和响应的核心，它承载了用户端浏览器、请求页面和服务器等相关资讯。    </p>\
\
<p><img src="http://static.woerwosi.com/blog/images/2014/7/http-headers-transition.gif?download&amp;e=1405984175&amp;token=xw0tiTxTy4JKOeGzbxty3MI9MahTDwMU_KfCf8Ri:ypTOvoIGy51UnL_6FK_qdO9GVq0" alt="HTTP WORK FLOW" title=""> <br>\
例如，当你在浏览器地址栏里输入一个URL，你的浏览器会发出类似下面的HTTP请求：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="pln">GET </span><span class="pun">/</span><span class="pln">blog</span><span class="pun">/</span><span class="pln"> HTTP</span><span class="pun">/</span><span class="lit">1.1</span><span class="pln"> </span><span class="pun">(</span><span class="typ">Request</span><span class="pln"> line</span><span class="pun">)</span></code></li><li class="L1"><code><span class="typ">Host</span><span class="pun">:</span><span class="pln"> net</span><span class="pun">.</span><span class="pln">tutsplus</span><span class="pun">.</span><span class="pln">com</span></code></li><li class="L2"><code><span class="typ">User</span><span class="pun">-</span><span class="typ">Agent</span><span class="pun">:</span><span class="pln"> </span><span class="typ">Mozilla</span><span class="pun">/</span><span class="lit">5.0</span><span class="pln"> </span><span class="pun">(</span><span class="typ">Windows</span><span class="pun">;</span><span class="pln"> U</span><span class="pun">;</span><span class="pln"> </span><span class="typ">Windows</span><span class="pln"> NT </span><span class="lit">6.1</span><span class="pun">;</span><span class="pln"> en</span><span class="pun">-</span><span class="pln">US</span><span class="pun">;</span><span class="pln"> rv</span><span class="pun">:</span><span class="lit">1.9</span><span class="pun">.</span><span class="lit">1.5</span><span class="pun">)</span><span class="pln"> </span><span class="typ">Gecko</span><span class="pun">/</span><span class="lit">20091102</span><span class="pln"> </span><span class="typ">Firefox</span><span class="pun">/</span><span class="lit">3.5</span><span class="pun">.</span><span class="lit">5</span><span class="pln"> </span><span class="pun">(.</span><span class="pln">NET CLR </span><span class="lit">3.5</span><span class="pun">.</span><span class="lit">30729</span><span class="pun">)</span></code></li><li class="L3"><code><span class="typ">Accept</span><span class="pun">:</span><span class="pln"> text</span><span class="pun">/</span><span class="pln">html</span><span class="pun">,</span><span class="pln">application</span><span class="pun">/</span><span class="pln">xhtml</span><span class="pun">+</span><span class="pln">xml</span><span class="pun">,</span><span class="pln">application</span><span class="pun">/</span><span class="pln">xml</span><span class="pun">;</span><span class="pln">q</span><span class="pun">=</span><span class="lit">0.9</span><span class="pun">,*</span><span class="com">/*;q=0.8</span></code></li><li class="L4"><code><span class="com">Accept-Language: en-us,en;q=0.5</span></code></li><li class="L5"><code><span class="com">Accept-Encoding: gzip,deflate</span></code></li><li class="L6"><code><span class="com">Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7</span></code></li><li class="L7"><code><span class="com">Keep-Alive: 300</span></code></li><li class="L8"><code><span class="com">Connection: keep-alive</span></code></li><li class="L9"><code><span class="com">Cookie: PHPSESSID=r2t5uvjq435r4q7ib3vtdjq120</span></code></li><li class="L0"><code><span class="com">Pragma: no-cache</span></code></li><li class="L1"><code><span class="com">Cache-Control: no-cache</span></code></li></ol></pre>\
\
<p>第一行被称为<code>Request Line</code>, 它描述的是这个请求的基本信息，剩下的就是HTTP Headers了。</p>\
\
<p>请求完成后，你的浏览器可能会收到如下的HTTP响应：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="pln">HTTP</span><span class="pun">/</span><span class="lit">1.x</span><span class="pln"> </span><span class="lit">200</span><span class="pln"> OK </span><span class="pun">(</span><span class="pln">state line</span><span class="pun">)</span></code></li><li class="L1"><code><span class="typ">Transfer</span><span class="pun">-</span><span class="typ">Encoding</span><span class="pun">:</span><span class="pln"> chunked</span></code></li><li class="L2"><code><span class="typ">Date</span><span class="pun">:</span><span class="pln"> </span><span class="typ">Sat</span><span class="pun">,</span><span class="pln"> </span><span class="lit">28</span><span class="pln"> </span><span class="typ">Nov</span><span class="pln"> </span><span class="lit">2013</span><span class="pln"> </span><span class="lit">04</span><span class="pun">:</span><span class="lit">36</span><span class="pun">:</span><span class="lit">25</span><span class="pln"> GMT</span></code></li><li class="L3"><code><span class="typ">Server</span><span class="pun">:</span><span class="pln"> </span><span class="typ">LiteSpeed</span></code></li><li class="L4"><code><span class="typ">Connection</span><span class="pun">:</span><span class="pln"> close</span></code></li><li class="L5"><code><span class="pln">X</span><span class="pun">-</span><span class="typ">Powered</span><span class="pun">-</span><span class="typ">By</span><span class="pun">:</span><span class="pln"> W3 </span><span class="typ">Total</span><span class="pln"> </span><span class="typ">Cache</span><span class="pun">/</span><span class="lit">0.8</span></code></li><li class="L6"><code><span class="typ">Pragma</span><span class="pun">:</span><span class="pln"> </span><span class="kwd">public</span></code></li><li class="L7"><code><span class="typ">Expires</span><span class="pun">:</span><span class="pln"> </span><span class="typ">Sat</span><span class="pun">,</span><span class="pln"> </span><span class="lit">28</span><span class="pln"> </span><span class="typ">Nov</span><span class="pln"> </span><span class="lit">2013</span><span class="pln"> </span><span class="lit">05</span><span class="pun">:</span><span class="lit">36</span><span class="pun">:</span><span class="lit">25</span><span class="pln"> GMT</span></code></li><li class="L8"><code><span class="typ">Etag</span><span class="pun">:</span><span class="pln"> </span><span class="str">"pub1259380237;gz"</span></code></li><li class="L9"><code><span class="typ">Cache</span><span class="pun">-</span><span class="typ">Control</span><span class="pun">:</span><span class="pln"> max</span><span class="pun">-</span><span class="pln">age</span><span class="pun">=</span><span class="lit">3600</span><span class="pun">,</span><span class="pln"> </span><span class="kwd">public</span></code></li><li class="L0"><code><span class="typ">Content</span><span class="pun">-</span><span class="typ">Type</span><span class="pun">:</span><span class="pln"> text</span><span class="pun">/</span><span class="pln">html</span><span class="pun">;</span><span class="pln"> charset</span><span class="pun">=</span><span class="pln">UTF</span><span class="pun">-</span><span class="lit">8</span></code></li><li class="L1"><code><span class="typ">Last</span><span class="pun">-</span><span class="typ">Modified</span><span class="pun">:</span><span class="pln"> </span><span class="typ">Sat</span><span class="pun">,</span><span class="pln"> </span><span class="lit">28</span><span class="pln"> </span><span class="typ">Nov</span><span class="pln"> </span><span class="lit">2013</span><span class="pln"> </span><span class="lit">03</span><span class="pun">:</span><span class="lit">50</span><span class="pun">:</span><span class="lit">37</span><span class="pln"> GMT</span></code></li><li class="L2"><code><span class="pln">X</span><span class="pun">-</span><span class="typ">Pingback</span><span class="pun">:</span><span class="pln"> http</span><span class="pun">:</span><span class="com">//net.tutsplus.com/xmlrpc.php</span></code></li><li class="L3"><code><span class="typ">Content</span><span class="pun">-</span><span class="typ">Encoding</span><span class="pun">:</span><span class="pln"> gzip</span></code></li><li class="L4"><code><span class="typ">Vary</span><span class="pun">:</span><span class="pln"> </span><span class="typ">Accept</span><span class="pun">-</span><span class="typ">Encoding</span><span class="pun">,</span><span class="pln"> </span><span class="typ">Cookie</span><span class="pun">,</span><span class="pln"> </span><span class="typ">User</span><span class="pun">-</span><span class="typ">Agent</span></code></li><li class="L5"><code><span class="pun">&lt;!--</span><span class="pln"> </span><span class="pun">...</span><span class="pln"> rest of the html </span><span class="pun">...</span><span class="pln"> </span><span class="pun">--&gt;</span></code></li></ol></pre>\
\
<p>第一行被称为<code>Status Line</code>，它之后就是HTTP Headers，接着便开始输出內容了（在这个案例中是一些HTML输出）。</p>\
\
<p>但你查看页面源代码却不能看到HTTP Headers，虽然它们连同你能看到的内容一起被传送至浏览器。</p>\
\
<p>这个HTTP请求也发出了一些其他资源的接收请求，例如图片，css文件，js文件等等。</p>\
\
<p>下面我们来看看细节。 <br>\
<br></p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="二怎样看到http-headers信息">二、怎样看到HTTP Headers信息？</h3>\
\
<p>1、Chrome浏览器：</p>\
\
<p>可按F12或者Shift + Ctrl + i 调出Chrome开发者工具，依照下图所示便可查看到HTTP Headers信息，包含Request Headers和Response Headers信息。（注：若Network中内容为空，刷新页面即可；下图为解析后的内容，可通过 view source 查看具体信息）</p>\
\
<p><img src="http://static.woerwosi.com/blog/images/2014/7/chrome-http-headers-watch.png?download&amp;e=1405984175&amp;token=xw0tiTxTy4JKOeGzbxty3MI9MahTDwMU_KfCf8Ri:G4FwxdgVHH6tUU-atcnYRNfMYIY" alt="Chrome HTTP Headers Watch" title=""></p>\
\
<p>2、Firefox</p>\
\
<p>可通过firebug查看，具体使用方法可Google之；</p>\
\
<p>3、<a href="https://addons.mozilla.org/en-US/firefox/addon/live-http-headers/" target="_blank">Live HTTP Headers</a></p>\
\
<p>这是Firefox的扩展程序，可查看所浏览页面的HTTP Headers信息；</p>\
\
<p>4、代码方式</p>\
\
<p>在PHP中，可采用下列方式：</p>\
\
<ul>\
<li><a href="http://php.net/manual/en/function.getallheaders.php" target="_blank">getallheaders()</a> 用来获取请求Headers, 你也可以使用 $_SERVER；</li>\
<li><a href="http://php.net/manual/en/function.headers-list.php" target="_blank">headers_list()</a> 用来获取响应Headers； <br>\
<br></li>\
</ul>\
\
<div class="md-section-divider"></div>\
\
<h3 id="三http-request-的构成">三、HTTP Request 的构成</h3>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="pln">GET </span><span class="pun">/</span><span class="pln">blog</span><span class="pun">/</span><span class="pln"> HTTP</span><span class="pun">/</span><span class="lit">1.1</span></code></li></ol></pre>\
\
<p>此句被称为“Request line”，包含三个部分：</p>\
\
<ul>\
<li>“method” 表明这是何种类型的请求. 最常见的请求类型有 GET, POST 和 HEAD；</li>\
<li>“path” 体现的是Host之后的路径， 例如，当你请求 “<a href="http://woerwosi.com/blog/" target="_blank">http://woerwosi.com/blog/</a>”时 , path就是 “/blog/”；</li>\
<li>“protocol” 包含有协议（HTTP）和版本号（1.1）, 目前浏览器基本使用1.1；</li>\
</ul>\
\
<p>剩下的部分每行都是一个“Name：Value”对，包含了各式各样关于请求和浏览器的信息。</p>\
\
<p>例如：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="typ">Host</span><span class="pun">:</span><span class="pln"> woerwosi</span><span class="pun">.</span><span class="pln">com</span></code></li></ol></pre>\
\
<p>代表的是所访问的HTTP服务器的域名/IP地址和端口号（默认80）；</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="typ">Connection</span><span class="pun">:</span><span class="pln"> keep</span><span class="pun">-</span><span class="pln">alive</span></code></li></ol></pre>\
\
<p>代表的是客户端到服务器端的连接持续有效，当出现对服务器的后继请求时，Keep-Alive功能避免了建立或者重新建立连接。</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="typ">User</span><span class="pun">-</span><span class="typ">Agent</span><span class="pun">:</span><span class="pln"> </span><span class="typ">Mozilla</span><span class="pun">/</span><span class="lit">5.0</span><span class="pln"> </span><span class="pun">(</span><span class="typ">Windows</span><span class="pln"> NT </span><span class="lit">6.1</span><span class="pun">)</span><span class="pln"> </span><span class="typ">AppleWebKit</span><span class="pun">/</span><span class="lit">537.36</span><span class="pln"> </span><span class="pun">(</span><span class="pln">KHTML</span><span class="pun">,</span><span class="pln"> like </span><span class="typ">Gecko</span><span class="pun">)</span><span class="pln"> </span><span class="typ">Chrome</span><span class="pun">/</span><span class="lit">31.0</span><span class="pun">.</span><span class="lit">1650.63</span><span class="pln"> </span><span class="typ">Safari</span><span class="pun">/</span><span class="lit">537.36</span></code></li></ol></pre>\
\
<p>代表的是浏览器的版本和所用的操作系统；</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="typ">Accept</span><span class="pun">-</span><span class="typ">Encoding</span><span class="pun">:</span><span class="pln"> gzip</span><span class="pun">,</span><span class="pln">deflate</span><span class="pun">,</span><span class="pln">sdch</span></code></li></ol></pre>\
\
<p>会告诉服务器，浏览器可以接受类似gzip的压缩输出。</p>\
\
<p>这些headers大部分内容都是可选的。HTTP请求甚至可以被精简为下面这样子，并能从服务器得到有效的响应：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="pln">GET </span><span class="pun">/</span><span class="pln">blog</span><span class="pun">/</span><span class="pln"> HTTP</span><span class="pun">/</span><span class="lit">1.1</span></code></li><li class="L1"><code><span class="typ">Host</span><span class="pun">:</span><span class="pln"> woerwosi</span><span class="pun">.</span><span class="pln">com</span></code></li></ol></pre>\
\
<p><br></p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="四请求类型">四、请求类型</h3>\
\
<p>三种较为常见的类型分别为：GET、POST、HEAD，其中前两者可能大家较为熟悉；</p>\
\
<div class="md-section-divider"></div>\
\
<h4 id="1get获取一个文档">（1）GET：获取一个文档</h4>\
\
<p>大部分被传输到浏览器的文件，例如CSS、JS、HTML等都是通过GET方式获得的，它是获取文档的主要方式。其中较为重要的是表单数据提交时若使用GET方式，可以将“表单输入”通过附加到查询字符串的方式发送到服务器，如下所示：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="pln">GET </span><span class="pun">/</span><span class="kwd">register</span><span class="pun">.</span><span class="pln">php</span><span class="pun">?</span><span class="pln">first_name</span><span class="pun">=</span><span class="typ">Jimg</span><span class="pun">&amp;</span><span class="pln">last_name</span><span class="pun">=</span><span class="typ">Green</span><span class="pun">&amp;</span><span class="pln">action</span><span class="pun">=</span><span class="typ">Submit</span><span class="pln"> HTTP</span><span class="pun">/</span><span class="lit">1.1</span></code></li></ol></pre>\
\
<div class="md-section-divider"></div>\
\
<h4 id="2post发送数据至服务器">（2）POST：发送数据至服务器</h4>\
\
<p>尽管可以通过GET方式发送数据至服务器，但在很多情况下，使用POST更加合适，使用GET有一定的局限性。</p>\
\
<p>上例若使用POST方式发送，大体代码如下：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="pln">POST </span><span class="pun">/</span><span class="kwd">register</span><span class="pun">.</span><span class="pln">php HTTP</span><span class="pun">/</span><span class="lit">1.1</span></code></li><li class="L1"><code><span class="typ">Host</span><span class="pun">:</span><span class="pln"> localhost</span></code></li><li class="L2"><code><span class="typ">User</span><span class="pun">-</span><span class="typ">Agent</span><span class="pun">:</span><span class="pln"> </span><span class="typ">Mozilla</span><span class="pun">/</span><span class="lit">5.0</span><span class="pln"> </span><span class="pun">(</span><span class="typ">Windows</span><span class="pun">;</span><span class="pln"> U</span><span class="pun">;</span><span class="pln"> </span><span class="typ">Windows</span><span class="pln"> NT </span><span class="lit">6.1</span><span class="pun">;</span><span class="pln"> en</span><span class="pun">-</span><span class="pln">US</span><span class="pun">;</span><span class="pln"> rv</span><span class="pun">:</span><span class="lit">1.9</span><span class="pun">.</span><span class="lit">1.5</span><span class="pun">)</span><span class="pln"> </span><span class="typ">Gecko</span><span class="pun">/</span><span class="lit">20131102</span><span class="pln"> </span><span class="typ">Firefox</span><span class="pun">/</span><span class="lit">3.5</span><span class="pun">.</span><span class="lit">5</span><span class="pln"> </span><span class="pun">(.</span><span class="pln">NET CLR </span><span class="lit">3.5</span><span class="pun">.</span><span class="lit">30729</span><span class="pun">)</span></code></li><li class="L3"><code><span class="typ">Accept</span><span class="pun">:</span><span class="pln"> text</span><span class="pun">/</span><span class="pln">html</span><span class="pun">,</span><span class="pln">application</span><span class="pun">/</span><span class="pln">xhtml</span><span class="pun">+</span><span class="pln">xml</span><span class="pun">,</span><span class="pln">application</span><span class="pun">/</span><span class="pln">xml</span><span class="pun">;</span><span class="pln">q</span><span class="pun">=</span><span class="lit">0.9</span><span class="pun">,*</span><span class="com">/*;q=0.8</span></code></li><li class="L4"><code><span class="com">Accept-Language: en-us,en;q=0.5</span></code></li><li class="L5"><code><span class="com">Accept-Encoding: gzip,deflate</span></code></li><li class="L6"><code><span class="com">Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7</span></code></li><li class="L7"><code><span class="com">Keep-Alive: 300</span></code></li><li class="L8"><code><span class="com">Connection: keep-alive</span></code></li><li class="L9"><code><span class="com">Referer: http://localhost/register.php</span></code></li><li class="L0"><code><span class="com">Content-Type: application/x-www-form-urlencoded</span></code></li><li class="L1"><code><span class="com">Content-Length: 43</span></code></li><li class="L2"><code><span class="com">first_name=Jim&amp;last_name=Green&amp;action=Submit</span></code></li></ol></pre>\
\
<p>这里需要注意一下几点：</p>\
\
<ul>\
<li>第一行的路径已经变为简单的/register.php，已经无查询字符串；</li>\
<li>新增了Content-Type和Content-Lenght Header，它提供了发送信息的相关内容；</li>\
<li>所有内容都在headers之后，以查询字符串的形式被发送；</li>\
</ul>\
\
<div class="md-section-divider"></div>\
\
<h4 id="3head接受header信息">（3）HEAD：接受Header信息</h4>\
\
<p>HEAD和GET很相似，只是HEAD不接收HTTP响应的内容部分。当发送了一个HEAD请求，意味着我们只对HTTP Headers感兴趣，而不是文档本身。</p>\
\
<p>这个方法可以让浏览器判断页面是否被修改过，从而控制缓存；也可用来判断文档是否存在。例如，你的网站上有很多链结，可以简单的给他们发送HEAD请求来判断是否存在斯死链，此方式比GET快很多。 <br>\
<br></p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="五http-response-的构成">五、HTTP Response 的构成</h3>\
\
<p>当浏览器发送了HTTP请求之后，服务器会通过HTTP response来响应这个请求，若不关心具体内容，那么这个响应是这样的：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="pln">HTTP</span><span class="pun">/</span><span class="lit">1.1</span><span class="pln"> </span><span class="lit">200</span><span class="pln"> OK</span></code></li><li class="L1"><code><span class="typ">Server</span><span class="pun">:</span><span class="pln"> nginx</span><span class="pun">/</span><span class="lit">1.6</span><span class="pun">.</span><span class="lit">0</span></code></li><li class="L2"><code><span class="typ">Date</span><span class="pun">:</span><span class="pln"> </span><span class="typ">Thu</span><span class="pun">,</span><span class="pln"> </span><span class="lit">24</span><span class="pln"> </span><span class="typ">Jul</span><span class="pln"> </span><span class="lit">2014</span><span class="pln"> </span><span class="lit">15</span><span class="pun">:</span><span class="lit">49</span><span class="pun">:</span><span class="lit">25</span><span class="pln"> GMT</span></code></li><li class="L3"><code><span class="typ">Content</span><span class="pun">-</span><span class="typ">Type</span><span class="pun">:</span><span class="pln"> text</span><span class="pun">/</span><span class="pln">html</span><span class="pun">;</span><span class="pln">charset</span><span class="pun">=</span><span class="pln">utf</span><span class="pun">-</span><span class="lit">8</span></code></li><li class="L4"><code><span class="typ">Transfer</span><span class="pun">-</span><span class="typ">Encoding</span><span class="pun">:</span><span class="pln"> chunked</span></code></li><li class="L5"><code><span class="typ">Connection</span><span class="pun">:</span><span class="pln"> keep</span><span class="pun">-</span><span class="pln">alive</span></code></li><li class="L6"><code><span class="pln">X</span><span class="pun">-</span><span class="typ">Powered</span><span class="pun">-</span><span class="typ">By</span><span class="pun">:</span><span class="pln"> PHP</span><span class="pun">/</span><span class="lit">5.5</span><span class="pun">.</span><span class="lit">13</span></code></li><li class="L7"><code><span class="typ">Content</span><span class="pun">-</span><span class="typ">Encoding</span><span class="pun">:</span><span class="pln"> gzip</span></code></li></ol></pre>\
\
<p>第一个有价值的信息就是协议，目前大多数服务器器使用HTTP/1.1 或者HTTP/1.x；</p>\
\
<p>接下来便是服务器响应的状态码，<code>200 OK</code>代表的是服务器已经接受到我们的请求，并且成功返回我们请求的内容；<code>404</code>是我们经常见到的一种状态码，它代表的是我们所请求的路径或者文件不存在；</p>\
\
<p>剩余的响应内容与HTTP请求Header信息类似，这些内容是关于服务器信息、文档页面何时修改、mime type等信息；同样，这些内容是可选的。 <br>\
<br></p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="六http状态码">六、HTTP状态码</h3>\
\
<ul>\
<li>200，表示请求成功；</li>\
<li>300，表示重定向；</li>\
<li>400，表示请求页面出现问题；</li>\
<li>500，表示服务器出现问题；</li>\
</ul>\
\
<p><br>\
下面详细看一下各个区段可能出现的状态码：</p>\
\
<p>200，OK； <br>\
206，只请求到部分内容（通常见于下载）；</p>\
\
<p>301，永久性转移； <br>\
302，临时性转移； <br>\
关于更多301和302的信息，请查看：<a href="http://www.dewen.org/q/1233" target="_blank">301与302的区别</a></p>\
\
<p>401，未经授权（Unauthorized），受密码保护的页面会返回这个状态； <br>\
403，被禁止（Forbidden）； <br>\
404，未找到（Not Found）；</p>\
\
<p>500，服务器错误；</p>\
\
<p>关于更多状态码请查看：<a href="http://en.wikipedia.org/wiki/List_of_HTTP_status_codes" target="_blank">HTTP状态码完整列表</a> <br>\
...... <br>\
<br></p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="七http-headers-中的http請求">七、HTTP Headers 中的HTTP請求</h3>\
\
<div class="md-section-divider"></div>\
\
<h4 id="host">Host</h4>\
\
<p>一个HTTP请求会发送一个特定的IP地址，而大部分服务器都有在同一个IP地址下托管多个网站的能力，那么服务器必须知道浏览器请求的是哪个页面下的资源；</p>\
\
<p>Host: woerwosi.com，这只是基本的主机名，包含域名和子级域名；</p>\
\
<div class="md-section-divider"></div>\
\
<h4 id="user-agent">User-Agent</h4>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="typ">User</span><span class="pun">-</span><span class="typ">Agent</span><span class="pun">:</span><span class="pln"> </span><span class="typ">Mozilla</span><span class="pun">/</span><span class="lit">5.0</span><span class="pln"> </span><span class="pun">(</span><span class="typ">Windows</span><span class="pln"> NT </span><span class="lit">6.2</span><span class="pun">;</span><span class="pln"> WOW64</span><span class="pun">)</span><span class="pln"> </span><span class="typ">AppleWebKit</span><span class="pun">/</span><span class="lit">537.36</span><span class="pln"> </span><span class="pun">(</span><span class="pln">KHTML</span><span class="pun">,</span><span class="pln"> like </span><span class="typ">Gecko</span><span class="pun">)</span><span class="pln"> </span><span class="typ">Chrome</span><span class="pun">/</span><span class="lit">36.0</span><span class="pun">.</span><span class="lit">1985.125</span><span class="pln"> </span><span class="typ">Safari</span><span class="pun">/</span><span class="lit">537.36</span></code></li></ol></pre>\
\
<p>这个Header通常包含以下信息：</p>\
\
<ul>\
<li>浏览器名和版本号；</li>\
<li>操作系统名和版本号；</li>\
<li>默认语言；</li>\
</ul>\
\
<p>某些网站可以利用此信息收集访客的信息。例如可以判断访客是否在使用手机访问你的网站，然后决定是否将他们引导至一个在低分辨率下表现良好的移动网站。</p>\
\
<div class="md-section-divider"></div>\
\
<h4 id="keep-alive">Keep-Alive</h4>\
\
<p>除此之外：<code>Keep-Alive: timeout=5, max=100</code>：timeout：过期时间5秒（对应httpd.conf里的参数是：KeepAliveTimeout），max是最多一百次请求，强制断掉连接，就是在timeout时间内又有新的连接过来，同时max会自动减1，直到为0，强制断掉。</p>\
\
<p>下图为重复连接和可持续连接的比较示意图： <br>\
<img src="http://static.woerwosi.com/blog/images/2014/7/http-prop-keep-alive.jpg" alt="HTTP Keep-Alive" title=""></p>\
\
<p>其它关于Keep-Alive的说明可参考：</p>\
\
<ol>\
<li><a href="http://www.cnblogs.com/huangfox/archive/2012/03/31/2426341.html" target="_blank">HTTP Keep-Alive详解</a></li>\
<li><a href="http://blog.sina.com.cn/s/blog_502c8cc401011k9v.html" target="_blank">Keep-Alive优化方案</a></li>\
</ol>\
\
<p>To Be Continued...        </p>	HTTP Header 是HTTP请求和响应的核心，它承载了用户通过浏览器，向服务器发送请求并得到服务器响应的相关资讯。详细了解HTTP协议，对于掌握浏览器的工作原理有很大的帮助，而了解Header是了解HTTP的基础。	736	0	2014-07-19 18:24:30	2014-07-19 18:24:30	[TOC]\
\
\
----------\
\
\
### 一、什么是HTTP Headers？\
\
HTTP是`Hypertext Transfer Protocol`的缩写，整个WWW都在使用此协议，几乎你在浏览器里看到的大部分內容都是通过HTTP协议来进行传输，比如你当前看的这篇文章。\
\
HTTP Headers是HTTP请求和响应的核心，它承载了用户端浏览器、请求页面和服务器等相关资讯。    \
\
![HTTP WORK FLOW][1]\
例如，当你在浏览器地址栏里输入一个URL，你的浏览器会发出类似下面的HTTP请求：\
```\
GET /blog/ HTTP/1.1 (Request line)\
Host: net.tutsplus.com\
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.1.5) Gecko/20091102 Firefox/3.5.5 (.NET CLR 3.5.30729)\
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\
Accept-Language: en-us,en;q=0.5\
Accept-Encoding: gzip,deflate\
Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7\
Keep-Alive: 300\
Connection: keep-alive\
Cookie: PHPSESSID=r2t5uvjq435r4q7ib3vtdjq120\
Pragma: no-cache\
Cache-Control: no-cache\
```\
第一行被称为`Request Line`, 它描述的是这个请求的基本信息，剩下的就是HTTP Headers了。\
\
请求完成后，你的浏览器可能会收到如下的HTTP响应：\
```\
HTTP/1.x 200 OK (state line)\
Transfer-Encoding: chunked\
Date: Sat, 28 Nov 2013 04:36:25 GMT\
Server: LiteSpeed\
Connection: close\
X-Powered-By: W3 Total Cache/0.8\
Pragma: public\
Expires: Sat, 28 Nov 2013 05:36:25 GMT\
Etag: "pub1259380237;gz"\
Cache-Control: max-age=3600, public\
Content-Type: text/html; charset=UTF-8\
Last-Modified: Sat, 28 Nov 2013 03:50:37 GMT\
X-Pingback: http://net.tutsplus.com/xmlrpc.php\
Content-Encoding: gzip\
Vary: Accept-Encoding, Cookie, User-Agent\
<!-- ... rest of the html ... -->\
```\
\
第一行被称为`Status Line`，它之后就是HTTP Headers，接着便开始输出內容了（在这个案例中是一些HTML输出）。\
\
但你查看页面源代码却不能看到HTTP Headers，虽然它们连同你能看到的内容一起被传送至浏览器。\
\
这个HTTP请求也发出了一些其他资源的接收请求，例如图片，css文件，js文件等等。\
\
下面我们来看看细节。\
<br>\
### 二、怎样看到HTTP Headers信息？\
\
1、Chrome浏览器：\
\
可按F12或者Shift + Ctrl + i 调出Chrome开发者工具，依照下图所示便可查看到HTTP Headers信息，包含Request Headers和Response Headers信息。（注：若Network中内容为空，刷新页面即可；下图为解析后的内容，可通过 view source 查看具体信息）\
\
![Chrome HTTP Headers Watch][2]\
\
2、Firefox\
\
可通过firebug查看，具体使用方法可Google之；\
\
3、[Live HTTP Headers][3]\
\
这是Firefox的扩展程序，可查看所浏览页面的HTTP Headers信息；\
\
4、代码方式\
\
在PHP中，可采用下列方式：\
\
- [getallheaders()][4] 用来获取请求Headers, 你也可以使用 $_SERVER；\
- [headers_list()][5] 用来获取响应Headers；\
<br>\
### 三、HTTP Request 的构成\
\
```\
GET /blog/ HTTP/1.1\
```\
此句被称为“Request line”，包含三个部分：\
\
- “method” 表明这是何种类型的请求. 最常见的请求类型有 GET, POST 和 HEAD；\
- “path” 体现的是Host之后的路径， 例如，当你请求 “http://woerwosi.com/blog/”时 , path就是 “/blog/”；\
- “protocol” 包含有协议（HTTP）和版本号（1.1）, 目前浏览器基本使用1.1；\
\
剩下的部分每行都是一个“Name：Value”对，包含了各式各样关于请求和浏览器的信息。\
\
例如：\
```\
Host: woerwosi.com\
```\
代表的是所访问的HTTP服务器的域名/IP地址和端口号（默认80）；\
```\
Connection: keep-alive\
```\
代表的是客户端到服务器端的连接持续有效，当出现对服务器的后继请求时，Keep-Alive功能避免了建立或者重新建立连接。\
\
```\
User-Agent: Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36\
```\
代表的是浏览器的版本和所用的操作系统；\
\
```\
Accept-Encoding: gzip,deflate,sdch\
```\
会告诉服务器，浏览器可以接受类似gzip的压缩输出。\
\
这些headers大部分内容都是可选的。HTTP请求甚至可以被精简为下面这样子，并能从服务器得到有效的响应：\
```\
GET /blog/ HTTP/1.1\
Host: woerwosi.com\
```\
<br>\
### 四、请求类型\
\
三种较为常见的类型分别为：GET、POST、HEAD，其中前两者可能大家较为熟悉；\
\
#### （1）GET：获取一个文档\
\
大部分被传输到浏览器的文件，例如CSS、JS、HTML等都是通过GET方式获得的，它是获取文档的主要方式。其中较为重要的是表单数据提交时若使用GET方式，可以将“表单输入”通过附加到查询字符串的方式发送到服务器，如下所示：\
```\
GET /register.php?first_name=Jimg&last_name=Green&action=Submit HTTP/1.1\
```\
\
#### （2）POST：发送数据至服务器\
\
尽管可以通过GET方式发送数据至服务器，但在很多情况下，使用POST更加合适，使用GET有一定的局限性。\
\
上例若使用POST方式发送，大体代码如下：\
```\
POST /register.php HTTP/1.1\
Host: localhost\
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.1.5) Gecko/20131102 Firefox/3.5.5 (.NET CLR 3.5.30729)\
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8\
Accept-Language: en-us,en;q=0.5\
Accept-Encoding: gzip,deflate\
Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7\
Keep-Alive: 300\
Connection: keep-alive\
Referer: http://localhost/register.php\
Content-Type: application/x-www-form-urlencoded\
Content-Length: 43\
first_name=Jim&last_name=Green&action=Submit\
```\
\
这里需要注意一下几点：\
\
- 第一行的路径已经变为简单的/register.php，已经无查询字符串；\
- 新增了Content-Type和Content-Lenght Header，它提供了发送信息的相关内容；\
- 所有内容都在headers之后，以查询字符串的形式被发送；\
\
\
#### （3）HEAD：接受Header信息\
\
HEAD和GET很相似，只是HEAD不接收HTTP响应的内容部分。当发送了一个HEAD请求，意味着我们只对HTTP Headers感兴趣，而不是文档本身。\
\
这个方法可以让浏览器判断页面是否被修改过，从而控制缓存；也可用来判断文档是否存在。例如，你的网站上有很多链结，可以简单的给他们发送HEAD请求来判断是否存在斯死链，此方式比GET快很多。\
<br>\
### 五、HTTP Response 的构成\
\
当浏览器发送了HTTP请求之后，服务器会通过HTTP response来响应这个请求，若不关心具体内容，那么这个响应是这样的：\
```\
HTTP/1.1 200 OK\
Server: nginx/1.6.0\
Date: Thu, 24 Jul 2014 15:49:25 GMT\
Content-Type: text/html;charset=utf-8\
Transfer-Encoding: chunked\
Connection: keep-alive\
X-Powered-By: PHP/5.5.13\
Content-Encoding: gzip\
```\
\
第一个有价值的信息就是协议，目前大多数服务器器使用HTTP/1.1 或者HTTP/1.x；\
\
接下来便是服务器响应的状态码，`200 OK`代表的是服务器已经接受到我们的请求，并且成功返回我们请求的内容；`404`是我们经常见到的一种状态码，它代表的是我们所请求的路径或者文件不存在；\
\
剩余的响应内容与HTTP请求Header信息类似，这些内容是关于服务器信息、文档页面何时修改、mime type等信息；同样，这些内容是可选的。\
<br>\
### 六、HTTP状态码\
\
- 200，表示请求成功；\
- 300，表示重定向；\
- 400，表示请求页面出现问题；\
- 500，表示服务器出现问题；\
\
<br>\
下面详细看一下各个区段可能出现的状态码：\
\
200，OK；\
206，只请求到部分内容（通常见于下载）；\
\
301，永久性转移；\
302，临时性转移；\
关于更多301和302的信息，请查看：[301与302的区别][6]\
\
401，未经授权（Unauthorized），受密码保护的页面会返回这个状态；\
403，被禁止（Forbidden）；\
404，未找到（Not Found）；\
\
500，服务器错误；\
\
关于更多状态码请查看：[HTTP状态码完整列表][7]\
......\
<br>\
### 七、HTTP Headers 中的HTTP請求\
#### Host\
\
一个HTTP请求会发送一个特定的IP地址，而大部分服务器都有在同一个IP地址下托管多个网站的能力，那么服务器必须知道浏览器请求的是哪个页面下的资源；\
\
Host: woerwosi.com，这只是基本的主机名，包含域名和子级域名；\
\
#### User-Agent\
```\
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36\
```\
这个Header通常包含以下信息：\
\
- 浏览器名和版本号；\
- 操作系统名和版本号；\
- 默认语言；\
\
某些网站可以利用此信息收集访客的信息。例如可以判断访客是否在使用手机访问你的网站，然后决定是否将他们引导至一个在低分辨率下表现良好的移动网站。\
\
\
#### Keep-Alive\
\
除此之外：`Keep-Alive: timeout=5, max=100`：timeout：过期时间5秒（对应httpd.conf里的参数是：KeepAliveTimeout），max是最多一百次请求，强制断掉连接，就是在timeout时间内又有新的连接过来，同时max会自动减1，直到为0，强制断掉。\
\
下图为重复连接和可持续连接的比较示意图：\
![HTTP Keep-Alive][8]\
\
其它关于Keep-Alive的说明可参考：\
\
 1. [HTTP Keep-Alive详解][9]\
 2. [Keep-Alive优化方案][10]\
\
To Be Continued...        \
\
\
  [1]: http://static.woerwosi.com/blog/images/2014/7/http-headers-transition.gif?download&e=1405984175&token=xw0tiTxTy4JKOeGzbxty3MI9MahTDwMU_KfCf8Ri:ypTOvoIGy51UnL_6FK_qdO9GVq0\
  [2]: http://static.woerwosi.com/blog/images/2014/7/chrome-http-headers-watch.png?download&e=1405984175&token=xw0tiTxTy4JKOeGzbxty3MI9MahTDwMU_KfCf8Ri:G4FwxdgVHH6tUU-atcnYRNfMYIY\
  [3]: https://addons.mozilla.org/en-US/firefox/addon/live-http-headers/\
  [4]: http://php.net/manual/en/function.getallheaders.php\
  [5]: http://php.net/manual/en/function.headers-list.php\
  [6]: http://www.dewen.org/q/1233\
  [7]: http://en.wikipedia.org/wiki/List_of_HTTP_status_codes\
  [8]: http://static.woerwosi.com/blog/images/2014/7/http-prop-keep-alive.jpg\
  [9]: http://www.cnblogs.com/huangfox/archive/2012/03/31/2426341.html\
  [10]: http://blog.sina.com.cn/s/blog_502c8cc401011k9v.html
2	0	RainDon	CPU Cache 科普示例	gallery-of-processor-cache-effects	3	1		0	ImShengli	CPU				<div class="md-section-divider"></div>\
\
<p><div class="toc">\
<ul>\
<li><ul>\
<li><ul>\
<li><a href="#一内存访问和运行">一、内存访问和运行</a></li>\
<li><a href="#二缓存行的影响">二、缓存行的影响</a></li>\
<li><a href="#三l1和l2缓存大小">三、L1和L2缓存大小</a></li>\
<li><a href="#四指令级别并发">四、指令级别并发</a></li>\
<li><a href="#五缓存关联性">五、缓存关联性</a><ul>\
<li><a href="#直接映射direct-mapped-cache">直接映射(Direct mapped cache)</a></li>\
<li><a href="#n路组关联n-way-set-associative-cache">N路组关联(N-way set associative cache)</a></li>\
<li><a href="#完全关联fully-associative-cache">完全关联(Fully associative cache)</a></li>\
</ul>\
</li>\
<li><a href="#六缓存行的伪共享false-sharing">六、缓存行的伪共享(false-sharing)</a></li>\
<li><a href="#七硬件复杂性">七、硬件复杂性</a></li>\
<li><a href="#八个人感悟-局部性原理和流水线并发">八、个人感悟 —— 局部性原理和流水线并发</a></li>\
<li><a href="#九参考资料">九、参考资料</a></li>\
</ul>\
</li>\
</ul>\
</li>\
</ul>\
</div>\
</p>\
\
<p>大多数读者都知道Cache是一种快速小型的内存，用以存储最近访问内存位置。这种描述合理而准确，但是更多地了解一些处理器缓存工作中的“烦人”细节对于理解程序运行性能有很大帮助。</p>\
\
<p>在这篇博客中，我（这里指作者：Igor Ostrovsky，下同）将运用代码示例来详解cache工作的方方面面，以及对现实世界中程序运行产生的影响。</p>\
\
<p>下面的例子都是用C#写的，但语言的选择同程序运行状况以及得出的结论几乎没什么影响。</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="一内存访问和运行">一、内存访问和运行</h3>\
\
<p>Q： 你认为相较于循环1，循环2会运行多快？</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-C#"><span class="kwd">int</span><span class="pun">[]</span><span class="pln"> arr </span><span class="pun">=</span><span class="pln"> </span><span class="kwd">new</span><span class="pln"> </span><span class="kwd">int</span><span class="pun">[</span><span class="lit">64</span><span class="pln"> </span><span class="pun">*</span><span class="pln"> </span><span class="lit">1024</span><span class="pln"> </span><span class="pun">*</span><span class="pln"> </span><span class="lit">1024</span><span class="pun">];</span><span class="pln">  </span></code></li><li class="L1"><code class="language-C#"></code></li><li class="L2"><code class="language-C#"><span class="com">// Loop 1  </span></code></li><li class="L3"><code class="language-C#"><span class="kwd">for</span><span class="pln"> </span><span class="pun">(</span><span class="kwd">int</span><span class="pln"> i </span><span class="pun">=</span><span class="pln"> </span><span class="lit">0</span><span class="pun">;</span><span class="pln"> i </span><span class="pun">&lt;</span><span class="pln"> arr</span><span class="pun">.</span><span class="typ">Length</span><span class="pun">;</span><span class="pln"> i</span><span class="pun">++)</span><span class="pln"> arr</span><span class="pun">[</span><span class="pln">i</span><span class="pun">]</span><span class="pln"> </span><span class="pun">*=</span><span class="pln"> </span><span class="lit">3</span><span class="pun">;</span><span class="pln">  </span></code></li><li class="L4"><code class="language-C#"></code></li><li class="L5"><code class="language-C#"><span class="com">// Loop 2  </span></code></li><li class="L6"><code class="language-C#"><span class="kwd">for</span><span class="pln"> </span><span class="pun">(</span><span class="kwd">int</span><span class="pln"> i </span><span class="pun">=</span><span class="pln"> </span><span class="lit">0</span><span class="pun">;</span><span class="pln"> i </span><span class="pun">&lt;</span><span class="pln"> arr</span><span class="pun">.</span><span class="typ">Length</span><span class="pun">;</span><span class="pln"> i </span><span class="pun">+=</span><span class="pln"> </span><span class="lit">16</span><span class="pun">)</span><span class="pln"> arr</span><span class="pun">[</span><span class="pln">i</span><span class="pun">]</span><span class="pln"> </span><span class="pun">*=</span><span class="pln"> </span><span class="lit">3</span><span class="pun">;</span><span class="pln">  </span></code></li></ol></pre>\
\
<p>第一个循环将数组的每个值乘3，第二个循环将每16个值乘3，第二个循环只做了第一个约6%的工作，但在现代机器上，两者几乎运行相同时间：在我机器上分别是80毫秒和78毫秒。</p>\
\
<p>两个循环花费相同时间的原因跟内存有关。循环执行时间长短由数组的内存访问次数决定的，而非整型数的乘法运算次数。经过下面对第二个示例的解释，你会发现硬件对这两个循环的主存访问次数是相同的。 <br>\
<br></p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="二缓存行的影响">二、缓存行的影响</h3>\
\
<p>让我们进一步探索这个例子，我们将尝试不同的循环步长，而不仅仅是1和16。</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-C#"><span class="kwd">for</span><span class="pln"> </span><span class="pun">(</span><span class="kwd">int</span><span class="pln"> i </span><span class="pun">=</span><span class="pln"> </span><span class="lit">0</span><span class="pun">;</span><span class="pln"> i </span><span class="pun">&lt;</span><span class="pln"> arr</span><span class="pun">.</span><span class="typ">Length</span><span class="pun">;</span><span class="pln"> i </span><span class="pun">+=</span><span class="pln"> K</span><span class="pun">)</span><span class="pln"> arr</span><span class="pun">[</span><span class="pln">i</span><span class="pun">]</span><span class="pln"> </span><span class="pun">*=</span><span class="pln"> </span><span class="lit">3</span><span class="pun">;</span><span class="pln">  </span></code></li></ol></pre>\
\
<p>下图为该循环在不同步长(K)下的运行时间：</p>\
\
<p><img src="https://dn-woerwosi.qbox.me/blog/images/2014/7/update-every-k-th-int.png" alt="Update Every K-th Int" title=""></p>\
\
<p>注意当步长在1到16范围内，循环运行时间几乎不变。但从16开始，每次步长加倍，运行时间减半。</p>\
\
<p>背后的原因是今天的CPU不再是按字节访问内存，而是以64字节为单位的块(chunk)拿取，称为一个缓存行(cache line)。当你读一个特定的内存地址，整个缓存行将从主存换入缓存，并且访问同一个缓存行内的其它值的开销是很小的。</p>\
\
<p>由于16个整型数占用64字节(一个缓存行)，for循环步长在1到16之间必定接触到相同数目的缓存行：即数组中所有的缓存行。当步长为32，我们只有大约每两个缓存行接触一次，当步长为64，只有每四个接触一次。</p>\
\
<p>理解缓存行对某些类型的程序优化而言可能很重要。比如，数据字节对齐可能决定一次操作接触1个还是2个缓存行。那上面的例子来说，很显然操作不对齐的数据将损失一半性能。 <br>\
<br></p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="三l1和l2缓存大小">三、L1和L2缓存大小</h3>\
\
<p>今天的计算机具有两级或三级缓存，通常叫做L1、L2以及可能的L3(译者注：如果你不明白什么叫二级缓存，可以参考这篇<a href="http://coolshell.cn/articles/3236.html" target="_blank">精悍的博文</a>)。如果你想知道不同缓存的大小，你可以使用系统内部工具<a href="http://technet.microsoft.com/en-us/sysinternals/cc835722.aspx" target="_blank">CoreInfo</a>，或者Windows API调用<a href="http://msdn.microsoft.com/en-us/library/ms683194%28VS.85%29.aspx" target="_blank">GetLogicalProcessorInfo</a>。两者都将告诉你缓存行以及缓存本身的大小。</p>\
\
<p>在我的机器上，CoreInfo现实我有一个32KB的L1数据缓存，一个32KB的L1指令缓存，还有一个4MB大小L2数据缓存。L1缓存是处理器独享的，L2缓存是成对处理器共享的。</p>\
\
<p>Logical Processor to Cache Map:</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="pun">*—</span><span class="pln"> </span><span class="typ">Data</span><span class="pln"> </span><span class="typ">Cache</span><span class="pln"> </span><span class="lit">0</span><span class="pun">,</span><span class="pln"> </span><span class="typ">Level</span><span class="pln"> </span><span class="lit">1</span><span class="pun">,</span><span class="pln"> </span><span class="lit">32</span><span class="pln"> KB</span><span class="pun">,</span><span class="pln"> </span><span class="typ">Assoc</span><span class="pln"> </span><span class="lit">8</span><span class="pun">,</span><span class="pln"> </span><span class="typ">LineSize</span><span class="pln"> </span><span class="lit">64</span></code></li><li class="L1"><code></code></li><li class="L2"><code><span class="pun">*—</span><span class="pln"> </span><span class="typ">Instruction</span><span class="pln"> </span><span class="typ">Cache</span><span class="pln"> </span><span class="lit">0</span><span class="pun">,</span><span class="pln"> </span><span class="typ">Level</span><span class="pln"> </span><span class="lit">1</span><span class="pun">,</span><span class="pln"> </span><span class="lit">32</span><span class="pln"> KB</span><span class="pun">,</span><span class="pln"> </span><span class="typ">Assoc</span><span class="pln"> </span><span class="lit">8</span><span class="pun">,</span><span class="pln"> </span><span class="typ">LineSize</span><span class="pln"> </span><span class="lit">64</span></code></li><li class="L3"><code></code></li><li class="L4"><code><span class="pun">-*-</span><span class="pln"> </span><span class="typ">Data</span><span class="pln"> </span><span class="typ">Cache</span><span class="pln"> </span><span class="lit">1</span><span class="pun">,</span><span class="pln"> </span><span class="typ">Level</span><span class="pln"> </span><span class="lit">1</span><span class="pun">,</span><span class="pln"> </span><span class="lit">32</span><span class="pln"> KB</span><span class="pun">,</span><span class="pln"> </span><span class="typ">Assoc</span><span class="pln"> </span><span class="lit">8</span><span class="pun">,</span><span class="pln"> </span><span class="typ">LineSize</span><span class="pln"> </span><span class="lit">64</span></code></li><li class="L5"><code></code></li><li class="L6"><code><span class="pun">-*-</span><span class="pln"> </span><span class="typ">Instruction</span><span class="pln"> </span><span class="typ">Cache</span><span class="pln"> </span><span class="lit">1</span><span class="pun">,</span><span class="pln"> </span><span class="typ">Level</span><span class="pln"> </span><span class="lit">1</span><span class="pun">,</span><span class="pln"> </span><span class="lit">32</span><span class="pln"> KB</span><span class="pun">,</span><span class="pln"> </span><span class="typ">Assoc</span><span class="pln"> </span><span class="lit">8</span><span class="pun">,</span><span class="pln"> </span><span class="typ">LineSize</span><span class="pln"> </span><span class="lit">64</span></code></li><li class="L7"><code></code></li><li class="L8"><code><span class="pun">**-</span><span class="pln"> </span><span class="typ">Unified</span><span class="pln"> </span><span class="typ">Cache</span><span class="pln"> </span><span class="lit">0</span><span class="pun">,</span><span class="pln"> </span><span class="typ">Level</span><span class="pln"> </span><span class="lit">2</span><span class="pun">,</span><span class="pln"> </span><span class="lit">4</span><span class="pln"> MB</span><span class="pun">,</span><span class="pln"> </span><span class="typ">Assoc</span><span class="pln"> </span><span class="lit">16</span><span class="pun">,</span><span class="pln"> </span><span class="typ">LineSize</span><span class="pln"> </span><span class="lit">64</span></code></li><li class="L9"><code></code></li><li class="L0"><code><span class="pun">-*-</span><span class="pln"> </span><span class="typ">Data</span><span class="pln"> </span><span class="typ">Cache</span><span class="pln"> </span><span class="lit">2</span><span class="pun">,</span><span class="pln"> </span><span class="typ">Level</span><span class="pln"> </span><span class="lit">1</span><span class="pun">,</span><span class="pln"> </span><span class="lit">32</span><span class="pln"> KB</span><span class="pun">,</span><span class="pln"> </span><span class="typ">Assoc</span><span class="pln"> </span><span class="lit">8</span><span class="pun">,</span><span class="pln"> </span><span class="typ">LineSize</span><span class="pln"> </span><span class="lit">64</span></code></li><li class="L1"><code></code></li><li class="L2"><code><span class="pun">-*-</span><span class="pln"> </span><span class="typ">Instruction</span><span class="pln"> </span><span class="typ">Cache</span><span class="pln"> </span><span class="lit">2</span><span class="pun">,</span><span class="pln"> </span><span class="typ">Level</span><span class="pln"> </span><span class="lit">1</span><span class="pun">,</span><span class="pln"> </span><span class="lit">32</span><span class="pln"> KB</span><span class="pun">,</span><span class="pln"> </span><span class="typ">Assoc</span><span class="pln"> </span><span class="lit">8</span><span class="pun">,</span><span class="pln"> </span><span class="typ">LineSize</span><span class="pln"> </span><span class="lit">64</span></code></li><li class="L3"><code></code></li><li class="L4"><code><span class="pun">—*</span><span class="pln"> </span><span class="typ">Data</span><span class="pln"> </span><span class="typ">Cache</span><span class="pln"> </span><span class="lit">3</span><span class="pun">,</span><span class="pln"> </span><span class="typ">Level</span><span class="pln"> </span><span class="lit">1</span><span class="pun">,</span><span class="pln"> </span><span class="lit">32</span><span class="pln"> KB</span><span class="pun">,</span><span class="pln"> </span><span class="typ">Assoc</span><span class="pln"> </span><span class="lit">8</span><span class="pun">,</span><span class="pln"> </span><span class="typ">LineSize</span><span class="pln"> </span><span class="lit">64</span></code></li><li class="L5"><code></code></li><li class="L6"><code><span class="pun">—*</span><span class="pln"> </span><span class="typ">Instruction</span><span class="pln"> </span><span class="typ">Cache</span><span class="pln"> </span><span class="lit">3</span><span class="pun">,</span><span class="pln"> </span><span class="typ">Level</span><span class="pln"> </span><span class="lit">1</span><span class="pun">,</span><span class="pln"> </span><span class="lit">32</span><span class="pln"> KB</span><span class="pun">,</span><span class="pln"> </span><span class="typ">Assoc</span><span class="pln"> </span><span class="lit">8</span><span class="pun">,</span><span class="pln"> </span><span class="typ">LineSize</span><span class="pln"> </span><span class="lit">64</span></code></li><li class="L7"><code></code></li><li class="L8"><code><span class="pun">-**</span><span class="pln"> </span><span class="typ">Unified</span><span class="pln"> </span><span class="typ">Cache</span><span class="pln"> </span><span class="lit">1</span><span class="pun">,</span><span class="pln"> </span><span class="typ">Level</span><span class="pln"> </span><span class="lit">2</span><span class="pun">,</span><span class="pln"> </span><span class="lit">4</span><span class="pln"> MB</span><span class="pun">,</span><span class="pln"> </span><span class="typ">Assoc</span><span class="pln"> </span><span class="lit">16</span><span class="pun">,</span><span class="pln"> </span><span class="typ">LineSize</span><span class="pln"> </span><span class="lit">64</span></code></li></ol></pre>\
\
<p>(译者注：作者平台是四核机，所以L1编号为0~3，数据/指令各一个，L2只有数据缓存，两个处理器共享一个，编号0~1。关联性字段在后面例子说明。)</p>\
\
<p>让我们通过一个实验来验证这些数字。遍历一个整型数组，每16个值自增1——一种节约地方式改变每个缓存行。当遍历到最后一个值，就重头开始。我们将使用不同的数组大小，可以看到当数组溢出一级缓存大小，程序运行的性能将急剧滑落。</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-C#"><span class="kwd">int</span><span class="pln"> steps </span><span class="pun">=</span><span class="pln"> </span><span class="lit">64</span><span class="pln"> </span><span class="pun">*</span><span class="pln"> </span><span class="lit">1024</span><span class="pln"> </span><span class="pun">*</span><span class="pln"> </span><span class="lit">1024</span><span class="pun">;</span></code></li><li class="L1"><code class="language-C#"><span class="com">// Arbitrary number of steps</span></code></li><li class="L2"><code class="language-C#"><span class="kwd">int</span><span class="pln"> lengthMod </span><span class="pun">=</span><span class="pln"> arr</span><span class="pun">.</span><span class="typ">Length</span><span class="pln"> </span><span class="pun">-</span><span class="pln"> </span><span class="lit">1</span><span class="pun">;</span></code></li><li class="L3"><code class="language-C#"><span class="kwd">for</span><span class="pln"> </span><span class="pun">(</span><span class="kwd">int</span><span class="pln"> i </span><span class="pun">=</span><span class="pln"> </span><span class="lit">0</span><span class="pun">;</span><span class="pln"> i </span><span class="pun">&lt;</span><span class="pln"> steps</span><span class="pun">;</span><span class="pln"> i</span><span class="pun">++)</span></code></li><li class="L4"><code class="language-C#"><span class="pun">{</span></code></li><li class="L5"><code class="language-C#"><span class="pln">    arr</span><span class="pun">[(</span><span class="pln">i </span><span class="pun">*</span><span class="pln"> </span><span class="lit">16</span><span class="pun">)</span><span class="pln"> </span><span class="pun">&amp;</span><span class="pln"> lengthMod</span><span class="pun">]++;</span><span class="pln"> </span><span class="com">// (x &amp; lengthMod) is equal to (x % arr.Length)</span></code></li><li class="L6"><code class="language-C#"><span class="pun">}</span></code></li></ol></pre>\
\
<p>下图是运行时间图表：</p>\
\
<p><img src="https://dn-woerwosi.qbox.me/blog/images/2014/7/l1-l2-cache.png" alt="Run-Time" title=""></p>\
\
<p>你可以看到在32KB和4MB之后性能明显滑落——正好是我机器上L1和L2缓存大小。 <br>\
<br></p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="四指令级别并发">四、指令级别并发</h3>\
\
<p>现在让我们看一看不同的东西。下面两个循环中你以为哪个较快？</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-C#"><span class="kwd">int</span><span class="pln"> steps </span><span class="pun">=</span><span class="pln"> </span><span class="lit">256</span><span class="pln"> </span><span class="pun">*</span><span class="pln"> </span><span class="lit">1024</span><span class="pln"> </span><span class="pun">*</span><span class="pln"> </span><span class="lit">1024</span><span class="pun">;</span></code></li><li class="L1"><code class="language-C#"><span class="kwd">int</span><span class="pun">[]</span><span class="pln"> a </span><span class="pun">=</span><span class="pln"> </span><span class="kwd">new</span><span class="pln"> </span><span class="kwd">int</span><span class="pun">[</span><span class="lit">2</span><span class="pun">];</span></code></li><li class="L2"><code class="language-C#"></code></li><li class="L3"><code class="language-C#"><span class="com">// Loop 1</span></code></li><li class="L4"><code class="language-C#"><span class="kwd">for</span><span class="pln"> </span><span class="pun">(</span><span class="kwd">int</span><span class="pln"> i</span><span class="pun">=</span><span class="lit">0</span><span class="pun">;</span><span class="pln"> i</span><span class="pun">&lt;</span><span class="pln">steps</span><span class="pun">;</span><span class="pln"> i</span><span class="pun">++)</span><span class="pln"> </span><span class="pun">{</span><span class="pln"> a</span><span class="pun">[</span><span class="lit">0</span><span class="pun">]++;</span><span class="pln"> a</span><span class="pun">[</span><span class="lit">0</span><span class="pun">]++;</span><span class="pln"> </span><span class="pun">}</span></code></li><li class="L5"><code class="language-C#"></code></li><li class="L6"><code class="language-C#"><span class="com">// Loop 2</span></code></li><li class="L7"><code class="language-C#"><span class="kwd">for</span><span class="pln"> </span><span class="pun">(</span><span class="kwd">int</span><span class="pln"> i</span><span class="pun">=</span><span class="lit">0</span><span class="pun">;</span><span class="pln"> i</span><span class="pun">&lt;</span><span class="pln">steps</span><span class="pun">;</span><span class="pln"> i</span><span class="pun">++)</span><span class="pln"> </span><span class="pun">{</span><span class="pln"> a</span><span class="pun">[</span><span class="lit">0</span><span class="pun">]++;</span><span class="pln"> a</span><span class="pun">[</span><span class="lit">1</span><span class="pun">]++;</span><span class="pln"> </span><span class="pun">}</span></code></li></ol></pre>\
\
<p>结果是第二个循环约比第一个快一倍，至少在我测试的机器上。为什么呢？这跟两个循环体内的操作指令依赖性有关。</p>\
\
<p>第一个循环体内，操作数是相互依赖的(译者注：下一次依赖于前一次)：</p>\
\
<p><img src="https://dn-woerwosi.qbox.me/blog/images/2014/7/loop-dependency-first.png" alt="Loop-Dependency-first" title=""></p>\
\
<p>在第二个例子中，依赖性就不同了：</p>\
\
<p><img src="https://dn-woerwosi.qbox.me/blog/images/2014/7/loop-dependency-second.png" alt="Loop-Dependency-second" title=""></p>\
\
<p>现代处理器中对不同部分指令拥有一点并发性(译者注：跟流水线有关，比如Pentium处理器就有U/V两条流水线，后面说明)。这使得CPU在同一时刻访问L1两处内存位置，或者执行两次简单算术操作。在第一个循环中，处理器无法发掘这种指令级别的并发性，但第二个循环中就可以。</p>\
\
<p>[原文更新]：许多人在reddit上询问有关编译器优化的问题，像 { a[0]++; a[0]++; } 能否优化为 { a[0]+=2; } 。实际上，C#编译器和CLR JIT没有做优化——在数组访问方面。我用release模式编译了所有测试(使用优化选项)，但我查询了JIT汇编语言证实优化并未影响结果。 <br>\
<br></p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="五缓存关联性">五、缓存关联性</h3>\
\
<p>缓存设计的一个关键决定是确保每个主存块(chunk)能够存储在任何一个缓存槽里，或者只是其中一些(译者注：此处一个槽位就是一个缓存行)。</p>\
\
<p>有三种方式将缓存槽映射到主存块中： <br>\
<br></p>\
\
<div class="md-section-divider"></div>\
\
<h4 id="直接映射direct-mapped-cache">直接映射(Direct mapped cache)</h4>\
\
<p><br>\
每个内存块只能映射到一个特定的缓存槽。一个简单的方案是通过块索引chunk_index映射到对应的槽位(chunk_index % cache_slots)。被映射到同一内存槽上的两个内存块是不能同时换入缓存的。(译者注：chunk_index可以通过物理地址/缓存行字节计算得到)； <br>\
<br></p>\
\
<div class="md-section-divider"></div>\
\
<h4 id="n路组关联n-way-set-associative-cache">N路组关联(N-way set associative cache)</h4>\
\
<p><br>\
每个内存块能够被映射到N路特定缓存槽中的任意一路。比如一个16路缓存，每个内存块能够被映射到16路不同的缓存槽。一般地，具有一定相同低bit位地址的内存块将共享16路缓存槽。(译者注：相同低位地址表明相距一定单元大小的连续内存) <br>\
<br></p>\
\
<div class="md-section-divider"></div>\
\
<h4 id="完全关联fully-associative-cache">完全关联(Fully associative cache)</h4>\
\
<p><br>\
每个内存块能够被映射到任意一个缓存槽。操作效果上相当于一个散列表。 <br>\
<br>\
直接映射缓存会引发冲突 —— 当多个值竞争同一个缓存槽，它们将相互驱逐对方，导致命中率暴跌。另一方面，完全关联缓存过于复杂，并且硬件实现上昂贵。N路组关联是处理器缓存的典型方案，它在电路实现简化和高命中率之间取得了良好的折中。</p>\
\
<p><img src="https://dn-woerwosi.qbox.me/blog/images/2014/7/cache-fill.png" alt="Cache-fill" title=""> <br>\
（此图由译者给出，直接映射和完全关联可以看做N路组关联的两个极端，从图中可知当N=1时，即直接映射；当N取最大值时，即完全关联。读者可以自行想象直接映射图例，具体表述见参考资料。）</p>\
\
<p>举个例子，4MB大小的L2缓存在我机器上是16路关联。所有64字节内存块将分割为不同组，映射到同一组的内存块将竞争L2缓存里的16路槽位。</p>\
\
<p>L2缓存有65,536个缓存行(译者注：4MB/64)，每个组需要16路缓存行，我们将获得4096个集。这样一来，块属于哪个组取决于块索引的低12位bit(2^12=4096)。因此缓存行对应的物理地址凡是以262,144字节(4096*64)的倍数区分的，将竞争同一个缓存槽。我机器上最多维持16个这样的缓存槽。(译者注：请结合上图中的2路关联延伸理解，一个块索引对应64字节，chunk0对应组0中的任意一路槽位，chunk1对应组1中的任意一路槽位，以此类推chunk4095对应组4095中的任意一路槽位，chunk0和chunk4096地址的低12bit是相同的，所以chunk4096、chunk8192将同chunk0竞争组0中的槽位，它们之间的地址相差262,144字节的倍数，而最多可以进行16次竞争，否则就要驱逐一个chunk)。</p>\
\
<p>为了使得缓存关联效果更加明了，我需要重复地访问同一组中的16个以上的元素，通过如下方法证明：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-C"><span class="kwd">public</span><span class="pln"> </span><span class="kwd">static</span><span class="pln"> </span><span class="kwd">long</span><span class="pln"> </span><span class="typ">UpdateEveryKthByte</span><span class="pun">(</span><span class="kwd">byte</span><span class="pun">[]</span><span class="pln"> arr</span><span class="pun">,</span><span class="pln"> </span><span class="kwd">int</span><span class="pln"> K</span><span class="pun">)</span></code></li><li class="L1"><code class="language-C"><span class="pun">{</span></code></li><li class="L2"><code class="language-C"><span class="pln">    </span><span class="typ">Stopwatch</span><span class="pln"> sw </span><span class="pun">=</span><span class="pln"> </span><span class="typ">Stopwatch</span><span class="pun">.</span><span class="typ">StartNew</span><span class="pun">();</span></code></li><li class="L3"><code class="language-C"><span class="pln">    </span><span class="kwd">const</span><span class="pln"> </span><span class="kwd">int</span><span class="pln"> rep </span><span class="pun">=</span><span class="pln"> </span><span class="lit">1024</span><span class="pun">*</span><span class="lit">1024</span><span class="pun">;</span><span class="pln"> </span><span class="com">// Number of iterations - arbitrary</span></code></li><li class="L4"><code class="language-C"><span class="pln">    </span><span class="kwd">int</span><span class="pln"> p </span><span class="pun">=</span><span class="pln"> </span><span class="lit">0</span><span class="pun">;</span></code></li><li class="L5"><code class="language-C"><span class="pln">    </span><span class="kwd">for</span><span class="pln"> </span><span class="pun">(</span><span class="kwd">int</span><span class="pln"> i </span><span class="pun">=</span><span class="pln"> </span><span class="lit">0</span><span class="pun">;</span><span class="pln"> i </span><span class="pun">&lt;</span><span class="pln"> rep</span><span class="pun">;</span><span class="pln"> i</span><span class="pun">++)</span></code></li><li class="L6"><code class="language-C"><span class="pln">    </span><span class="pun">{</span></code></li><li class="L7"><code class="language-C"><span class="pln">        arr</span><span class="pun">[</span><span class="pln">p</span><span class="pun">]++;</span></code></li><li class="L8"><code class="language-C"><span class="pln">        p </span><span class="pun">+=</span><span class="pln"> K</span><span class="pun">;</span></code></li><li class="L9"><code class="language-C"><span class="pln">        </span><span class="kwd">if</span><span class="pln"> </span><span class="pun">(</span><span class="pln">p </span><span class="pun">&gt;=</span><span class="pln"> arr</span><span class="pun">.</span><span class="typ">Length</span><span class="pun">)</span><span class="pln"> p </span><span class="pun">=</span><span class="pln"> </span><span class="lit">0</span><span class="pun">;</span></code></li><li class="L0"><code class="language-C"><span class="pln">    </span><span class="pun">}</span></code></li><li class="L1"><code class="language-C"><span class="pln">    sw</span><span class="pun">.</span><span class="typ">Stop</span><span class="pun">();</span></code></li><li class="L2"><code class="language-C"><span class="pln">    </span><span class="kwd">return</span><span class="pln"> sw</span><span class="pun">.</span><span class="typ">ElapsedMilliseconds</span><span class="pun">;</span></code></li><li class="L3"><code class="language-C"><span class="pun">}</span></code></li></ol></pre>\
\
<p>该方法每次在数组中迭代K个值，当到达末尾时从头开始。循环在运行足够长（2^20次）之后停止。</p>\
\
<p>我使用不同的数组大小（每次增加1MB）和不同的步长传入UpdateEveryKthByte()。以下是绘制的图表，蓝色代表运行较长时间，白色代表较短时间：</p>\
\
<p><img src="https://dn-woerwosi.qbox.me/blog/images/2014/7/Cache-fill-second.png" alt="Cache-fill" title=""></p>\
\
<p>蓝色区域（较长时间）表明当我们重复数组迭代时，更新的值无法同时放在缓存中。浅蓝色区域对应80毫秒，白色区域对应10毫秒。</p>\
\
<p>让我们来解释一下图表中蓝色部分：</p>\
\
<p><strong>1.为何有垂直线？</strong></p>\
\
<p>垂直线表明步长值过多接触到同一组中内存位置（大于16次）。在这些次数里，我的机器无法同时将接触过的值放到16路关联缓存中。</p>\
\
<p>一些糟糕的步长值为2的幂：256和512。举个例子，考虑512步长遍历8MB数组，存在32个元素以相距262,144字节空间分布，所有32个元素都会在循环遍历中更新到，因为512能够整除262,144（译者注：此处一个步长代表一个字节）。</p>\
\
<p>由于32大于16，这32个元素将一直竞争缓存里的16路槽位。</p>\
\
<p>（译者注：为何512步长的垂直线比256步长颜色更深？在同样足够多的步数下，512比256访问到存在竞争的块索引次数多一倍。比如跨越262,144字节边界512需要512步，而256需要1024步。那么当步数为2^20时，512访问了2048次存在竞争的块而256只有1024次。最差情况下步长为262,144的倍数，因为每次循环都会引发一个缓存行驱逐。）</p>\
\
<p>有些不是2的幂的步长运行时间长仅仅是运气不好，最终访问到的是同一组中不成比例的许多元素，这些步长值同样显示为蓝线。</p>\
\
<p><strong>2.为何垂直线在4MB数组长度的地方停止？</strong></p>\
\
<p>因为对于小于等于4MB的数组，16路关联缓存相当于完全关联缓存。</p>\
\
<p>一个16路关联缓存最多能够维护16个以262,144字节分隔的缓存行，4MB内组17或更多的缓存行都没有对齐在262,144字节边界上，因为16*262,144=4,194,304。</p>\
\
<p><strong>3.为何左上角出现蓝色三角？</strong></p>\
\
<p>在三角区域内，我们无法在缓存中同时存放所有必要的数据，不是出于关联性，而仅仅是因为L2缓存大小所限。</p>\
\
<p>举个例子，考虑步长128遍历16MB数组，数组中每128字节更新一次，这意味着我们一次接触两个64字节内存块。为了存储16MB数组中每两个缓存行，我们需要8MB大小缓存。但我的机器中只有4MB缓存（译者注：这意味着必然存在冲突从而延时）。</p>\
\
<p>即使我机器中4MB缓存是全关联，仍无法同时存放8MB数据。</p>\
\
<p><strong>4.为何三角最左边部分是褪色的？</strong></p>\
\
<p>注意左边0~64字节部分——正好一个缓存行！就像上面示例1和2所说，额外访问相同缓存行的数据几乎没有开销。比如说，步长为16字节，它需要4步到达下一个缓存行，也就是说4次内存访问只有1次开销。</p>\
\
<p>在相同循环次数下的所有测试用例中，采取省力步长的运行时间来得短。</p>\
\
<p>将图表延伸后的模型：</p>\
\
<p><img src="https://dn-woerwosi.qbox.me/blog/images/2014/7/Cache-fill-third.png" alt="Cache-fill" title=""></p>\
\
<p>缓存关联性理解起来有趣而且确能被证实，但对于本文探讨的其它问题比起来，它肯定不会是你编程时所首先需要考虑的问题。 <br>\
<br></p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="六缓存行的伪共享false-sharing">六、缓存行的伪共享(false-sharing)</h3>\
\
<p>在多核机器上，缓存遇到了另一个问题——一致性。不同的处理器拥有完全或部分分离的缓存。在我的机器上，L1缓存是分离的（这很普遍），而我有两对处理器，每一对共享一个L2缓存。这随着具体情况而不同，如果一个现代多核机器上拥有多级缓存，那么快速小型的缓存将被处理器独占。</p>\
\
<p>当一个处理器改变了属于它自己缓存中的一个值，其它处理器就再也无法使用它自己原来的值，因为其对应的内存位置将被刷新(invalidate)到所有缓存。而且由于缓存操作是以缓存行而不是字节为粒度，所有缓存中整个缓存行将被刷新！</p>\
\
<p>为证明这个问题，考虑如下例子：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-C"><span class="kwd">private</span><span class="pln"> </span><span class="kwd">static</span><span class="pln"> </span><span class="kwd">int</span><span class="pun">[]</span><span class="pln"> s_counter </span><span class="pun">=</span><span class="pln"> </span><span class="kwd">new</span><span class="pln"> </span><span class="kwd">int</span><span class="pun">[</span><span class="lit">1024</span><span class="pun">];</span></code></li><li class="L1"><code class="language-C"><span class="kwd">private</span><span class="pln"> </span><span class="kwd">void</span><span class="pln"> </span><span class="typ">UpdateCounter</span><span class="pun">(</span><span class="kwd">int</span><span class="pln"> position</span><span class="pun">)</span></code></li><li class="L2"><code class="language-C"><span class="pun">{</span></code></li><li class="L3"><code class="language-C"><span class="pln">    </span><span class="kwd">for</span><span class="pln"> </span><span class="pun">(</span><span class="kwd">int</span><span class="pln"> j </span><span class="pun">=</span><span class="pln"> </span><span class="lit">0</span><span class="pun">;</span><span class="pln"> j </span><span class="pun">&lt;</span><span class="pln"> </span><span class="lit">100000000</span><span class="pun">;</span><span class="pln"> j</span><span class="pun">++)</span></code></li><li class="L4"><code class="language-C"><span class="pln">    </span><span class="pun">{</span></code></li><li class="L5"><code class="language-C"><span class="pln">        s_counter</span><span class="pun">[</span><span class="pln">position</span><span class="pun">]</span><span class="pln"> </span><span class="pun">=</span><span class="pln"> s_counter</span><span class="pun">[</span><span class="pln">position</span><span class="pun">]</span><span class="pln"> </span><span class="pun">+</span><span class="pln"> </span><span class="lit">3</span><span class="pun">;</span></code></li><li class="L6"><code class="language-C"><span class="pln">    </span><span class="pun">}</span></code></li><li class="L7"><code class="language-C"><span class="pun">}</span></code></li></ol></pre>\
\
<p>在我的四核机上，如果我通过四个线程传入参数0,1,2,3并调用UpdateCounter，所有线程将花费4.3秒。</p>\
\
<p>另一方面，如果我传入16,32,48,64，整个操作进花费0.28秒！</p>\
\
<p>为何会这样？第一个例子中的四个值很可能在同一个缓存行里，每次一个处理器增加计数，这四个计数所在的缓存行将被刷新，而其它处理器在下一次访问它们各自的计数（译者注：注意数组是private属性，每个线程独占）将失去命中(miss)一个缓存。这种多线程行为有效地禁止了缓存功能，削弱了程序性能。 <br>\
<br></p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="七硬件复杂性">七、硬件复杂性</h3>\
\
<p>即使你懂得了缓存的工作基础，有时候硬件行为仍会使你惊讶。不用处理器在工作时有不同的优化、探试和微妙的细节。</p>\
\
<p>有些处理器上，L1缓存能够并发处理两路访问，如果访问是来自不同的存储体，而对同一存储体的访问只能串行处理。而且处理器聪明的优化策略也会使你感到惊讶，比如在伪共享的例子中，以前在一些没有微调的机器上运行表现并不良好，但我家里的机器能够对最简单的例子进行优化来减少缓存刷新。</p>\
\
<p>下面是一个“硬件怪事”的奇怪例子：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-C"><span class="kwd">private</span><span class="pln"> </span><span class="kwd">static</span><span class="pln"> </span><span class="kwd">int</span><span class="pln"> A</span><span class="pun">,</span><span class="pln"> B</span><span class="pun">,</span><span class="pln"> C</span><span class="pun">,</span><span class="pln"> D</span><span class="pun">,</span><span class="pln"> E</span><span class="pun">,</span><span class="pln"> F</span><span class="pun">,</span><span class="pln"> G</span><span class="pun">;</span></code></li><li class="L1"><code class="language-C"><span class="kwd">private</span><span class="pln"> </span><span class="kwd">static</span><span class="pln"> </span><span class="kwd">void</span><span class="pln"> </span><span class="typ">Weirdness</span><span class="pun">()</span></code></li><li class="L2"><code class="language-C"><span class="pun">{</span></code></li><li class="L3"><code class="language-C"><span class="pln">    </span><span class="kwd">for</span><span class="pln"> </span><span class="pun">(</span><span class="kwd">int</span><span class="pln"> i </span><span class="pun">=</span><span class="pln"> </span><span class="lit">0</span><span class="pun">;</span><span class="pln"> i </span><span class="pun">&lt;</span><span class="pln"> </span><span class="lit">200000000</span><span class="pun">;</span><span class="pln"> i</span><span class="pun">++)</span></code></li><li class="L4"><code class="language-C"><span class="pln">    </span><span class="pun">{</span></code></li><li class="L5"><code class="language-C"><span class="pln">        </span><span class="com">// do something...</span></code></li><li class="L6"><code class="language-C"><span class="pln">    </span><span class="pun">}</span></code></li><li class="L7"><code class="language-C"><span class="pun">}</span></code></li></ol></pre>\
\
<p>当我在循环体内进行三种不同操作，我得到如下运行时间：</p>\
\
<table class="table table-striped-white table-bordered">\
<thead>\
<tr>\
 <th style="text-align:center;">操作</th>\
 <th style="text-align:center;">时间</th>\
</tr>\
</thead>\
<tbody><tr>\
 <td style="text-align:center;">A++; B++; C++; D++;</td>\
 <td style="text-align:center;">719 ms</td>\
</tr>\
<tr>\
 <td style="text-align:center;">A++; C++; E++; G++;</td>\
 <td style="text-align:center;">448 ms</td>\
</tr>\
<tr>\
 <td style="text-align:center;">A++; C++;</td>\
 <td style="text-align:center;">518 ms</td>\
</tr>\
</tbody></table>\
\
\
<p>增加A,B,C,D字段比增加A,C,E,G字段花费更长时间，更奇怪的是，增加A,C两个字段比增加A,C,E,G执行更久！</p>\
\
<p>我无法肯定这些数字背后的原因，但我怀疑这跟存储体有关，如果有人能够解释这些数字，我将洗耳恭听。</p>\
\
<p>这个例子的教训是，你很难完全预测硬件的行为。你可以预测很多事情，但最终，衡量及验证你的假设非常重要。</p>\
\
<p>关于本例的一个回帖：</p>\
\
<p>Goz：我询问Intel的工程师最后的例子，得到以下答复：</p>\
\
<p>“很显然这涉及到执行单元里指令是怎样终止的，机器处理存储-命中-加载的速度，以及如何快速且优雅地处理试探性执行的循环展开（比如是否由于内部冲突而多次循环）。但这意味着你需要非常细致的流水线跟踪器和模拟器才能弄明白。在纸上预测流水线里的乱序指令是无比困难的工作，就算是设计芯片的人也一样。对于门外汉来说，没门，抱歉！” <br>\
<br></p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="八个人感悟-局部性原理和流水线并发">八、个人感悟 —— 局部性原理和流水线并发</h3>\
\
<p>程序的运行存在<strong>时间和空间上的局部性</strong>，前者是指只要内存中的值被换入缓存，今后一段时间内会被多次引用，后者是指该内存附近的值也被换入缓存。如果在编程中特别注意运用局部性原理，就会获得性能上的回报。</p>\
\
<p>比如<strong>C语言中应该尽量减少静态变量的引用</strong>，这是因为静态变量存储在全局数据段，在一个被反复调用的函数体内，引用该变量需要对缓存多次换入换出，而如果是分配在堆栈上的局部变量，函数每次调用CPU只要从缓存中就能找到它了，因为堆栈的重复利用率高。</p>\
\
<p>再比如<strong>循环体内的代码要尽量精简</strong>，因为代码是放在指令缓存里的，而指令缓存都是一级缓存，只有几K字节大小，如果对某段代码需要多次读取，而这段代码又跨越一个L1缓存大小，那么缓存优势将荡然无存。</p>\
\
<p>关于<strong>CPU的流水线(pipeline)并发性</strong>，简单说说，Intel Pentium处理器有两条流水线U和V，每条流水线可各自独立地读写缓存，所以可以在一个时钟周期内同时执行两条指令。但这两条流水线不是对等的，U流水线可以处理所有指令集，V流水线只能处理简单指令。</p>\
\
<p>CPU指令通常被分为四类，第一类是常用的简单指令，像mov, nop, push, pop, add, sub, and, or, xor, inc, dec, cmp, lea，可以在任意一条流水线执行，只要相互之间不存在依赖性，完全可以做到指令并发。</p>\
\
<p>第二类指令需要同别的流水线配合，像一些进位和移位操作，这类指令如果在U流水线中，那么别的指令可以在V流水线并发运行，如果在V流水线中，那么U流水线是暂停的。</p>\
\
<p>第三类指令是一些跳转指令，如cmp,call以及条件分支，它们同第二类相反，当工作在V流水线时才能通U流水线协作，否则只能独占CPU。</p>\
\
<p>第四类指令是其它复杂的指令，一般不常用，因为它们都只能独占CPU。</p>\
\
<p>如果是汇编级别编程，<strong>要达到指令级别并发，必须要注重指令之间的配对。</strong>尽量使用第一类指令，避免第四类，还要在顺序上减少上下文依赖。 <br>\
<br></p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="九参考资料">九、参考资料</h3>\
\
<p>wiki上的CPU cache解析（<a href="http://zh.wikipedia.org/zh-cn/CPU%E7%BC%93%E5%AD%98" target="_blank">中文版</a>）（<a href="https://en.wikipedia.org/wiki/CPU_cache" target="_blank">英文版</a>）。</p>\
\
<p>网易数据库大牛@何_登成自制PPT<a href="http://vdisk.weibo.com/s/dBzv2sibdUB8" target="_blank">《CPU Cache and Memory Ordering》</a>！</p>\
\
<p><br>\
文章来源：酷壳网，本文链接：<a href="http://coolshell.cn/articles/10249.html#jtss-tsina" target="_blank">7个示例科普CPU Cache</a></p>	CPU Cache是理解计算机体系架构的重要知识点，也是并发编程设计中的技术难点。微软Igor Ostrovsky发表了一篇博文《Gallery of Processor Cache Effects》，文章不仅仅用7个最简单的源码示例就将CPU cache的原理娓娓道来，还附加图表量化分析做数学上的佐证。值得一读！	356	0	2015-10-18 22:44:51	2014-07-24 08:07:35	[TOC]\
\
大多数读者都知道Cache是一种快速小型的内存，用以存储最近访问内存位置。这种描述合理而准确，但是更多地了解一些处理器缓存工作中的“烦人”细节对于理解程序运行性能有很大帮助。\
\
在这篇博客中，我（这里指作者：Igor Ostrovsky，下同）将运用代码示例来详解cache工作的方方面面，以及对现实世界中程序运行产生的影响。\
\
下面的例子都是用C#写的，但语言的选择同程序运行状况以及得出的结论几乎没什么影响。\
\
### 一、内存访问和运行\
\
Q： 你认为相较于循环1，循环2会运行多快？\
\
```C#\
int[] arr = new int[64 * 1024 * 1024];  \
   \
// Loop 1  \
for (int i = 0; i < arr.Length; i++) arr[i] *= 3;  \
   \
// Loop 2  \
for (int i = 0; i < arr.Length; i += 16) arr[i] *= 3;  \
```\
\
第一个循环将数组的每个值乘3，第二个循环将每16个值乘3，第二个循环只做了第一个约6%的工作，但在现代机器上，两者几乎运行相同时间：在我机器上分别是80毫秒和78毫秒。\
\
两个循环花费相同时间的原因跟内存有关。循环执行时间长短由数组的内存访问次数决定的，而非整型数的乘法运算次数。经过下面对第二个示例的解释，你会发现硬件对这两个循环的主存访问次数是相同的。\
<br>\
### 二、缓存行的影响\
\
让我们进一步探索这个例子，我们将尝试不同的循环步长，而不仅仅是1和16。\
```C#\
for (int i = 0; i < arr.Length; i += K) arr[i] *= 3;  \
```\
下图为该循环在不同步长(K)下的运行时间：\
\
![Update Every K-th Int][1]\
\
注意当步长在1到16范围内，循环运行时间几乎不变。但从16开始，每次步长加倍，运行时间减半。\
\
背后的原因是今天的CPU不再是按字节访问内存，而是以64字节为单位的块(chunk)拿取，称为一个缓存行(cache line)。当你读一个特定的内存地址，整个缓存行将从主存换入缓存，并且访问同一个缓存行内的其它值的开销是很小的。\
\
由于16个整型数占用64字节(一个缓存行)，for循环步长在1到16之间必定接触到相同数目的缓存行：即数组中所有的缓存行。当步长为32，我们只有大约每两个缓存行接触一次，当步长为64，只有每四个接触一次。\
\
理解缓存行对某些类型的程序优化而言可能很重要。比如，数据字节对齐可能决定一次操作接触1个还是2个缓存行。那上面的例子来说，很显然操作不对齐的数据将损失一半性能。\
<br>\
### 三、L1和L2缓存大小\
\
今天的计算机具有两级或三级缓存，通常叫做L1、L2以及可能的L3(译者注：如果你不明白什么叫二级缓存，可以参考这篇[精悍的博文][2])。如果你想知道不同缓存的大小，你可以使用系统内部工具[CoreInfo][3]，或者Windows API调用[GetLogicalProcessorInfo][4]。两者都将告诉你缓存行以及缓存本身的大小。\
\
在我的机器上，CoreInfo现实我有一个32KB的L1数据缓存，一个32KB的L1指令缓存，还有一个4MB大小L2数据缓存。L1缓存是处理器独享的，L2缓存是成对处理器共享的。\
\
Logical Processor to Cache Map:\
```\
*— Data Cache 0, Level 1, 32 KB, Assoc 8, LineSize 64\
\
*— Instruction Cache 0, Level 1, 32 KB, Assoc 8, LineSize 64\
\
-*- Data Cache 1, Level 1, 32 KB, Assoc 8, LineSize 64\
\
-*- Instruction Cache 1, Level 1, 32 KB, Assoc 8, LineSize 64\
\
**- Unified Cache 0, Level 2, 4 MB, Assoc 16, LineSize 64\
\
-*- Data Cache 2, Level 1, 32 KB, Assoc 8, LineSize 64\
\
-*- Instruction Cache 2, Level 1, 32 KB, Assoc 8, LineSize 64\
\
—* Data Cache 3, Level 1, 32 KB, Assoc 8, LineSize 64\
\
—* Instruction Cache 3, Level 1, 32 KB, Assoc 8, LineSize 64\
\
-** Unified Cache 1, Level 2, 4 MB, Assoc 16, LineSize 64\
```\
(译者注：作者平台是四核机，所以L1编号为0~3，数据/指令各一个，L2只有数据缓存，两个处理器共享一个，编号0~1。关联性字段在后面例子说明。)\
\
让我们通过一个实验来验证这些数字。遍历一个整型数组，每16个值自增1——一种节约地方式改变每个缓存行。当遍历到最后一个值，就重头开始。我们将使用不同的数组大小，可以看到当数组溢出一级缓存大小，程序运行的性能将急剧滑落。\
\
```C#\
int steps = 64 * 1024 * 1024;\
// Arbitrary number of steps\
int lengthMod = arr.Length - 1;\
for (int i = 0; i < steps; i++)\
{\
    arr[(i * 16) & lengthMod]++; // (x & lengthMod) is equal to (x % arr.Length)\
}\
```\
\
下图是运行时间图表：\
\
![Run-Time][5]\
\
你可以看到在32KB和4MB之后性能明显滑落——正好是我机器上L1和L2缓存大小。\
<br>\
### 四、指令级别并发\
\
现在让我们看一看不同的东西。下面两个循环中你以为哪个较快？\
\
```C#\
int steps = 256 * 1024 * 1024;\
int[] a = new int[2];\
 \
// Loop 1\
for (int i=0; i<steps; i++) { a[0]++; a[0]++; }\
 \
// Loop 2\
for (int i=0; i<steps; i++) { a[0]++; a[1]++; }\
```\
\
结果是第二个循环约比第一个快一倍，至少在我测试的机器上。为什么呢？这跟两个循环体内的操作指令依赖性有关。\
\
第一个循环体内，操作数是相互依赖的(译者注：下一次依赖于前一次)：\
\
![Loop-Dependency-first][6]\
\
在第二个例子中，依赖性就不同了：\
\
![Loop-Dependency-second][7]\
\
现代处理器中对不同部分指令拥有一点并发性(译者注：跟流水线有关，比如Pentium处理器就有U/V两条流水线，后面说明)。这使得CPU在同一时刻访问L1两处内存位置，或者执行两次简单算术操作。在第一个循环中，处理器无法发掘这种指令级别的并发性，但第二个循环中就可以。\
\
[原文更新]：许多人在reddit上询问有关编译器优化的问题，像 { a[0]++; a[0]++; } 能否优化为 { a[0]+=2; } 。实际上，C#编译器和CLR JIT没有做优化——在数组访问方面。我用release模式编译了所有测试(使用优化选项)，但我查询了JIT汇编语言证实优化并未影响结果。\
<br>\
### 五、缓存关联性\
\
缓存设计的一个关键决定是确保每个主存块(chunk)能够存储在任何一个缓存槽里，或者只是其中一些(译者注：此处一个槽位就是一个缓存行)。\
\
有三种方式将缓存槽映射到主存块中：\
<br>\
#### 直接映射(Direct mapped cache)\
<br>\
每个内存块只能映射到一个特定的缓存槽。一个简单的方案是通过块索引chunk_index映射到对应的槽位(chunk_index % cache_slots)。被映射到同一内存槽上的两个内存块是不能同时换入缓存的。(译者注：chunk_index可以通过物理地址/缓存行字节计算得到)；\
<br>\
#### N路组关联(N-way set associative cache)\
<br>\
每个内存块能够被映射到N路特定缓存槽中的任意一路。比如一个16路缓存，每个内存块能够被映射到16路不同的缓存槽。一般地，具有一定相同低bit位地址的内存块将共享16路缓存槽。(译者注：相同低位地址表明相距一定单元大小的连续内存)\
<br>\
#### 完全关联(Fully associative cache)\
<br>\
每个内存块能够被映射到任意一个缓存槽。操作效果上相当于一个散列表。\
<br>\
直接映射缓存会引发冲突 —— 当多个值竞争同一个缓存槽，它们将相互驱逐对方，导致命中率暴跌。另一方面，完全关联缓存过于复杂，并且硬件实现上昂贵。N路组关联是处理器缓存的典型方案，它在电路实现简化和高命中率之间取得了良好的折中。\
\
![Cache-fill][8]\
（此图由译者给出，直接映射和完全关联可以看做N路组关联的两个极端，从图中可知当N=1时，即直接映射；当N取最大值时，即完全关联。读者可以自行想象直接映射图例，具体表述见参考资料。）\
\
举个例子，4MB大小的L2缓存在我机器上是16路关联。所有64字节内存块将分割为不同组，映射到同一组的内存块将竞争L2缓存里的16路槽位。\
\
L2缓存有65,536个缓存行(译者注：4MB/64)，每个组需要16路缓存行，我们将获得4096个集。这样一来，块属于哪个组取决于块索引的低12位bit(2^12=4096)。因此缓存行对应的物理地址凡是以262,144字节(4096*64)的倍数区分的，将竞争同一个缓存槽。我机器上最多维持16个这样的缓存槽。(译者注：请结合上图中的2路关联延伸理解，一个块索引对应64字节，chunk0对应组0中的任意一路槽位，chunk1对应组1中的任意一路槽位，以此类推chunk4095对应组4095中的任意一路槽位，chunk0和chunk4096地址的低12bit是相同的，所以chunk4096、chunk8192将同chunk0竞争组0中的槽位，它们之间的地址相差262,144字节的倍数，而最多可以进行16次竞争，否则就要驱逐一个chunk)。\
\
为了使得缓存关联效果更加明了，我需要重复地访问同一组中的16个以上的元素，通过如下方法证明：\
\
```C\
public static long UpdateEveryKthByte(byte[] arr, int K)\
{\
    Stopwatch sw = Stopwatch.StartNew();\
    const int rep = 1024*1024; // Number of iterations - arbitrary\
    int p = 0;\
    for (int i = 0; i < rep; i++)\
    {\
        arr[p]++;\
        p += K;\
        if (p >= arr.Length) p = 0;\
    }\
    sw.Stop();\
    return sw.ElapsedMilliseconds;\
}\
```\
\
该方法每次在数组中迭代K个值，当到达末尾时从头开始。循环在运行足够长（2^20次）之后停止。\
\
我使用不同的数组大小（每次增加1MB）和不同的步长传入UpdateEveryKthByte()。以下是绘制的图表，蓝色代表运行较长时间，白色代表较短时间：\
\
![Cache-fill][9]\
\
蓝色区域（较长时间）表明当我们重复数组迭代时，更新的值无法同时放在缓存中。浅蓝色区域对应80毫秒，白色区域对应10毫秒。\
\
让我们来解释一下图表中蓝色部分：\
\
**1.为何有垂直线？**\
\
垂直线表明步长值过多接触到同一组中内存位置（大于16次）。在这些次数里，我的机器无法同时将接触过的值放到16路关联缓存中。\
\
一些糟糕的步长值为2的幂：256和512。举个例子，考虑512步长遍历8MB数组，存在32个元素以相距262,144字节空间分布，所有32个元素都会在循环遍历中更新到，因为512能够整除262,144（译者注：此处一个步长代表一个字节）。\
\
由于32大于16，这32个元素将一直竞争缓存里的16路槽位。\
\
（译者注：为何512步长的垂直线比256步长颜色更深？在同样足够多的步数下，512比256访问到存在竞争的块索引次数多一倍。比如跨越262,144字节边界512需要512步，而256需要1024步。那么当步数为2^20时，512访问了2048次存在竞争的块而256只有1024次。最差情况下步长为262,144的倍数，因为每次循环都会引发一个缓存行驱逐。）\
\
有些不是2的幂的步长运行时间长仅仅是运气不好，最终访问到的是同一组中不成比例的许多元素，这些步长值同样显示为蓝线。\
\
**2.为何垂直线在4MB数组长度的地方停止？**\
\
因为对于小于等于4MB的数组，16路关联缓存相当于完全关联缓存。\
\
一个16路关联缓存最多能够维护16个以262,144字节分隔的缓存行，4MB内组17或更多的缓存行都没有对齐在262,144字节边界上，因为16*262,144=4,194,304。\
\
**3.为何左上角出现蓝色三角？**\
\
在三角区域内，我们无法在缓存中同时存放所有必要的数据，不是出于关联性，而仅仅是因为L2缓存大小所限。\
\
举个例子，考虑步长128遍历16MB数组，数组中每128字节更新一次，这意味着我们一次接触两个64字节内存块。为了存储16MB数组中每两个缓存行，我们需要8MB大小缓存。但我的机器中只有4MB缓存（译者注：这意味着必然存在冲突从而延时）。\
\
即使我机器中4MB缓存是全关联，仍无法同时存放8MB数据。\
\
**4.为何三角最左边部分是褪色的？**\
\
注意左边0~64字节部分——正好一个缓存行！就像上面示例1和2所说，额外访问相同缓存行的数据几乎没有开销。比如说，步长为16字节，它需要4步到达下一个缓存行，也就是说4次内存访问只有1次开销。\
\
在相同循环次数下的所有测试用例中，采取省力步长的运行时间来得短。\
\
将图表延伸后的模型：\
\
![Cache-fill][10]\
\
缓存关联性理解起来有趣而且确能被证实，但对于本文探讨的其它问题比起来，它肯定不会是你编程时所首先需要考虑的问题。\
<br>\
### 六、缓存行的伪共享(false-sharing)\
\
在多核机器上，缓存遇到了另一个问题——一致性。不同的处理器拥有完全或部分分离的缓存。在我的机器上，L1缓存是分离的（这很普遍），而我有两对处理器，每一对共享一个L2缓存。这随着具体情况而不同，如果一个现代多核机器上拥有多级缓存，那么快速小型的缓存将被处理器独占。\
\
当一个处理器改变了属于它自己缓存中的一个值，其它处理器就再也无法使用它自己原来的值，因为其对应的内存位置将被刷新(invalidate)到所有缓存。而且由于缓存操作是以缓存行而不是字节为粒度，所有缓存中整个缓存行将被刷新！\
\
为证明这个问题，考虑如下例子：\
```C\
private static int[] s_counter = new int[1024];\
private void UpdateCounter(int position)\
{\
    for (int j = 0; j < 100000000; j++)\
    {\
        s_counter[position] = s_counter[position] + 3;\
    }\
}\
```\
在我的四核机上，如果我通过四个线程传入参数0,1,2,3并调用UpdateCounter，所有线程将花费4.3秒。\
\
另一方面，如果我传入16,32,48,64，整个操作进花费0.28秒！\
\
为何会这样？第一个例子中的四个值很可能在同一个缓存行里，每次一个处理器增加计数，这四个计数所在的缓存行将被刷新，而其它处理器在下一次访问它们各自的计数（译者注：注意数组是private属性，每个线程独占）将失去命中(miss)一个缓存。这种多线程行为有效地禁止了缓存功能，削弱了程序性能。\
<br>\
### 七、硬件复杂性\
\
即使你懂得了缓存的工作基础，有时候硬件行为仍会使你惊讶。不用处理器在工作时有不同的优化、探试和微妙的细节。\
\
有些处理器上，L1缓存能够并发处理两路访问，如果访问是来自不同的存储体，而对同一存储体的访问只能串行处理。而且处理器聪明的优化策略也会使你感到惊讶，比如在伪共享的例子中，以前在一些没有微调的机器上运行表现并不良好，但我家里的机器能够对最简单的例子进行优化来减少缓存刷新。\
\
下面是一个“硬件怪事”的奇怪例子：\
\
```C\
private static int A, B, C, D, E, F, G;\
private static void Weirdness()\
{\
    for (int i = 0; i < 200000000; i++)\
    {\
        // do something...\
    }\
}\
```\
当我在循环体内进行三种不同操作，我得到如下运行时间：\
\
\
| 操作        | 时间     |\
| :--------:   | :-----:  |\
| A++; B++; C++; D++;      | 719 ms |\
| A++; C++; E++; G++;         |   448 ms   |\
| A++; C++;        |    518 ms    |\
\
增加A,B,C,D字段比增加A,C,E,G字段花费更长时间，更奇怪的是，增加A,C两个字段比增加A,C,E,G执行更久！\
\
我无法肯定这些数字背后的原因，但我怀疑这跟存储体有关，如果有人能够解释这些数字，我将洗耳恭听。\
\
这个例子的教训是，你很难完全预测硬件的行为。你可以预测很多事情，但最终，衡量及验证你的假设非常重要。\
\
关于本例的一个回帖：\
\
Goz：我询问Intel的工程师最后的例子，得到以下答复：\
\
“很显然这涉及到执行单元里指令是怎样终止的，机器处理存储-命中-加载的速度，以及如何快速且优雅地处理试探性执行的循环展开（比如是否由于内部冲突而多次循环）。但这意味着你需要非常细致的流水线跟踪器和模拟器才能弄明白。在纸上预测流水线里的乱序指令是无比困难的工作，就算是设计芯片的人也一样。对于门外汉来说，没门，抱歉！”\
<br>\
### 八、个人感悟 —— 局部性原理和流水线并发\
\
程序的运行存在**时间和空间上的局部性**，前者是指只要内存中的值被换入缓存，今后一段时间内会被多次引用，后者是指该内存附近的值也被换入缓存。如果在编程中特别注意运用局部性原理，就会获得性能上的回报。\
\
比如**C语言中应该尽量减少静态变量的引用**，这是因为静态变量存储在全局数据段，在一个被反复调用的函数体内，引用该变量需要对缓存多次换入换出，而如果是分配在堆栈上的局部变量，函数每次调用CPU只要从缓存中就能找到它了，因为堆栈的重复利用率高。\
\
再比如**循环体内的代码要尽量精简**，因为代码是放在指令缓存里的，而指令缓存都是一级缓存，只有几K字节大小，如果对某段代码需要多次读取，而这段代码又跨越一个L1缓存大小，那么缓存优势将荡然无存。\
\
关于**CPU的流水线(pipeline)并发性**，简单说说，Intel Pentium处理器有两条流水线U和V，每条流水线可各自独立地读写缓存，所以可以在一个时钟周期内同时执行两条指令。但这两条流水线不是对等的，U流水线可以处理所有指令集，V流水线只能处理简单指令。\
\
CPU指令通常被分为四类，第一类是常用的简单指令，像mov, nop, push, pop, add, sub, and, or, xor, inc, dec, cmp, lea，可以在任意一条流水线执行，只要相互之间不存在依赖性，完全可以做到指令并发。\
\
第二类指令需要同别的流水线配合，像一些进位和移位操作，这类指令如果在U流水线中，那么别的指令可以在V流水线并发运行，如果在V流水线中，那么U流水线是暂停的。\
\
第三类指令是一些跳转指令，如cmp,call以及条件分支，它们同第二类相反，当工作在V流水线时才能通U流水线协作，否则只能独占CPU。\
\
第四类指令是其它复杂的指令，一般不常用，因为它们都只能独占CPU。\
\
如果是汇编级别编程，**要达到指令级别并发，必须要注重指令之间的配对。**尽量使用第一类指令，避免第四类，还要在顺序上减少上下文依赖。\
<br>\
### 九、参考资料\
\
wiki上的CPU cache解析（[中文版][11]）（[英文版][12]）。\
\
网易数据库大牛@何_登成自制PPT[《CPU Cache and Memory Ordering》][14]！\
\
<br>\
文章来源：酷壳网，本文链接：[7个示例科普CPU Cache][15]\
    \
\
\
  [1]: https://dn-woerwosi.qbox.me/blog/images/2014/7/update-every-k-th-int.png\
  [2]: http://coolshell.cn/articles/3236.html\
  [3]: http://technet.microsoft.com/en-us/sysinternals/cc835722.aspx\
  [4]: http://msdn.microsoft.com/en-us/library/ms683194%28VS.85%29.aspx\
  [5]: https://dn-woerwosi.qbox.me/blog/images/2014/7/l1-l2-cache.png\
  [6]: https://dn-woerwosi.qbox.me/blog/images/2014/7/loop-dependency-first.png\
  [7]: https://dn-woerwosi.qbox.me/blog/images/2014/7/loop-dependency-second.png\
  [8]: https://dn-woerwosi.qbox.me/blog/images/2014/7/cache-fill.png\
  [9]: https://dn-woerwosi.qbox.me/blog/images/2014/7/Cache-fill-second.png\
  [10]: https://dn-woerwosi.qbox.me/blog/images/2014/7/Cache-fill-third.png\
  [11]: http://zh.wikipedia.org/zh-cn/CPU%E7%BC%93%E5%AD%98\
  [12]: https://en.wikipedia.org/wiki/CPU_cache\
  [13]: http://yoursunny.com/study/EI209/?topic=cache\
  [14]: http://vdisk.weibo.com/s/dBzv2sibdUB8\
  [15]: http://coolshell.cn/articles/10249.html#jtss-tsina        
3	0	RainDon	动态规划（Dynamic Programming）	dynamic-programming	2	1		0	ImShengli	algorithm				<div class="md-section-divider"></div>\
\
<p><div class="toc">\
<ul>\
<li><ul>\
<li><ul>\
<li><a href="#一什么是动态规划我们要如何描述它">一、什么是动态规划，我们要如何描述它?</a></li>\
</ul>\
</li>\
</ul>\
</li>\
</ul>\
</div>\
</p>\
\
<blockquote class="white-blockquote">\
  <p>说明： 本文翻译自TopCoder上的一篇文章： <a href="http://community.topcoder.com/tc?module=Static&amp;d1=tutorials&amp;d2=dynProg" target="_blank">Dynamic Programming: From novice to advanced</a> ，并非严格逐字逐句翻译，加入了自己的一些理解。水平有限，还望指正。</p>\
</blockquote>\
\
<div class="md-section-divider"></div>\
\
<h3 id="一什么是动态规划我们要如何描述它">一、什么是动态规划，我们要如何描述它?</h3>\
\
<p>动态规划算法通常基于一个递推公式及一个或多个初始状态。 当前子问题的解将由上一次子问题的解推出。使用动态规划来解题只需要多项式时间复杂度， 因此它比回溯法、暴力法等要快许多。</p>\
\
<p>现在让我们通过一个例子来了解一下DP的基本原理。</p>\
\
<p>首先，我们要找到某个状态的最优解，然后在它的帮助下，找到下一个状态的最优解。</p>\
\
<p><strong>“状态”代表什么及如何找到它?</strong></p>\
\
<p>“状态"用来描述该问题的子问题的解。原文中有两段作者阐述得不太清楚，跳过直接上例子。</p>\
\
<p>如果我们有面值为1元、3元和5元的硬币若干枚，如何用最少的硬币凑够11元？ (表面上这道题可以用贪心算法，但贪心算法无法保证可以求出解，比如1元换成2元的时候)</p>\
\
<p>首先我们思考一个问题，如何用最少的硬币凑够i元(i&lt;11)？为什么要这么问呢？ 两个原因：1.当我们遇到一个大问题时，总是习惯把问题的规模变小，这样便于分析讨论。 2.这个规模变小后的问题和原来的问题是同质的，除了规模变小，其它的都是一样的， 本质上它还是同一个问题(规模变小后的问题其实是原问题的子问题)。</p>\
\
<p>好了，让我们从最小的i开始吧。当i=0，即我们需要多少个硬币来凑够0元。 由于1，3，5都大于0，即没有比0小的币值，因此凑够0元我们最少需要0个硬币。 (这个分析很傻是不是？别着急，这个思路有利于我们理清动态规划究竟在做些什么。) 这时候我们发现用一个标记来表示这句“凑够0元我们最少需要0个硬币。”会比较方便， 如果一直用纯文字来表述，不出一会儿你就会觉得很绕了。那么， 我们用d(i)=j来表示凑够i元最少需要j个硬币。于是我们已经得到了d(0)=0， 表示凑够0元最小需要0个硬币。当i=1时，只有面值为1元的硬币可用， 因此我们拿起一个面值为1的硬币，接下来只需要凑够0元即可，而这个是已经知道答案的， 即d(0)=0。所以，d(1)=d(1-1)+1=d(0)+1=0+1=1。当i=2时， 仍然只有面值为1的硬币可用，于是我拿起一个面值为1的硬币， 接下来我只需要再凑够2-1=1元即可(记得要用最小的硬币数量)，而这个答案也已经知道了。 所以d(2)=d(2-1)+1=d(1)+1=1+1=2。一直到这里，你都可能会觉得，好无聊， 感觉像做小学生的题目似的。因为我们一直都只能操作面值为1的硬币！耐心点， 让我们看看i=3时的情况。当i=3时，我们能用的硬币就有两种了：1元的和3元的( 5元的仍然没用，因为你需要凑的数目是3元！5元太多了亲)。 既然能用的硬币有两种，我就有两种方案。如果我拿了一个1元的硬币，我的目标就变为了： 凑够3-1=2元需要的最少硬币数量。即d(3)=d(3-1)+1=d(2)+1=2+1=3。 这个方案说的是，我拿3个1元的硬币；第二种方案是我拿起一个3元的硬币， 我的目标就变成：凑够3-3=0元需要的最少硬币数量。即d(3)=d(3-3)+1=d(0)+1=0+1=1. 这个方案说的是，我拿1个3元的硬币。好了，这两种方案哪种更优呢？ 记得我们可是要用最少的硬币数量来凑够3元的。所以， 选择d(3)=1，怎么来的呢？具体是这样得到的：d(3)=min{d(3-1)+1, d(3-3)+1}。</p>\
\
<p>OK，码了这么多字讲具体的东西，让我们来点抽象的。从以上的文字中， 我们要抽出动态规划里非常重要的两个概念：状态和状态转移方程。</p>\
\
<p>上文中d(i)表示凑够i元需要的最少硬币数量，我们将它定义为该问题的"状态"， 这个状态是怎么找出来的呢？我在另一篇文章 动态规划之背包问题(一)中写过： 根据子问题定义状态。你找到子问题，状态也就浮出水面了。 最终我们要求解的问题，可以用这个状态来表示：d(11)，即凑够11元最少需要多少个硬币。 那状态转移方程是什么呢？既然我们用d(i)表示状态，那么状态转移方程自然包含d(i)， 上文中包含状态d(i)的方程是：d(3)=min{d(3-1)+1, d(3-3)+1}。没错， 它就是状态转移方程，描述状态之间是如何转移的。当然，我们要对它抽象一下，</p>\
\
<p>d(i) = min{ d(i-vj)+1 }，其中i-vj &gt;=0，vj表示第j个硬币的面值;</p>\
\
<p>有了状态和状态转移方程，这个问题基本上也就解决了。当然了，Talk is cheap,show me the code!</p>\
\
<p>伪代码如下：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="typ">Set</span><span class="pln"> </span><span class="typ">Min</span><span class="pun">[</span><span class="pln">i</span><span class="pun">]</span><span class="pln"> equal to </span><span class="kwd">Infinity</span><span class="pln"> </span><span class="kwd">for</span><span class="pln"> all of i</span></code></li><li class="L1"><code><span class="typ">Min</span><span class="pun">[</span><span class="lit">0</span><span class="pun">]=</span><span class="lit">0</span></code></li><li class="L2"><code></code></li><li class="L3"><code><span class="typ">For</span><span class="pln"> i </span><span class="pun">=</span><span class="pln"> </span><span class="lit">1</span><span class="pln"> to S</span></code></li><li class="L4"><code><span class="typ">For</span><span class="pln"> j </span><span class="pun">=</span><span class="pln"> </span><span class="lit">0</span><span class="pln"> to N </span><span class="pun">-</span><span class="pln"> </span><span class="lit">1</span></code></li><li class="L5"><code><span class="pln">    </span><span class="typ">If</span><span class="pln"> </span><span class="pun">(</span><span class="typ">Vj</span><span class="pun">&lt;=</span><span class="pln">i AND </span><span class="typ">Min</span><span class="pun">[</span><span class="pln">i</span><span class="pun">-</span><span class="typ">Vj</span><span class="pun">]+</span><span class="lit">1</span><span class="pun">&lt;</span><span class="typ">Min</span><span class="pun">[</span><span class="pln">i</span><span class="pun">])</span></code></li><li class="L6"><code><span class="typ">Then</span><span class="pln"> </span><span class="typ">Min</span><span class="pun">[</span><span class="pln">i</span><span class="pun">]=</span><span class="typ">Min</span><span class="pun">[</span><span class="pln">i</span><span class="pun">-</span><span class="typ">Vj</span><span class="pun">]+</span><span class="lit">1</span></code></li><li class="L7"><code></code></li><li class="L8"><code><span class="typ">Output</span><span class="pln"> </span><span class="typ">Min</span><span class="pun">[</span><span class="pln">S</span><span class="pun">]</span></code></li></ol></pre>\
\
<p>To Be Continued...</p>	动态规划所处理的问题是一个多阶段决策问题，一般由初始状态开始，通过对中间阶段决策的选择，达到结束状态。这些决策形成了一个决策序列，同时确定了完成整个过程的一条活动路线（通常是求最优的活动路线）。	369	0	2014-07-24 08:26:55	2014-07-24 08:26:55	[TOC]\
\
> 说明： 本文翻译自TopCoder上的一篇文章： [Dynamic Programming: From novice to advanced][1] ，并非严格逐字逐句翻译，加入了自己的一些理解。水平有限，还望指正。\
\
\
### 一、什么是动态规划，我们要如何描述它?\
\
动态规划算法通常基于一个递推公式及一个或多个初始状态。 当前子问题的解将由上一次子问题的解推出。使用动态规划来解题只需要多项式时间复杂度， 因此它比回溯法、暴力法等要快许多。\
\
现在让我们通过一个例子来了解一下DP的基本原理。\
\
首先，我们要找到某个状态的最优解，然后在它的帮助下，找到下一个状态的最优解。\
\
**“状态”代表什么及如何找到它?**\
\
“状态"用来描述该问题的子问题的解。原文中有两段作者阐述得不太清楚，跳过直接上例子。\
\
如果我们有面值为1元、3元和5元的硬币若干枚，如何用最少的硬币凑够11元？ (表面上这道题可以用贪心算法，但贪心算法无法保证可以求出解，比如1元换成2元的时候)\
\
首先我们思考一个问题，如何用最少的硬币凑够i元(i<11)？为什么要这么问呢？ 两个原因：1.当我们遇到一个大问题时，总是习惯把问题的规模变小，这样便于分析讨论。 2.这个规模变小后的问题和原来的问题是同质的，除了规模变小，其它的都是一样的， 本质上它还是同一个问题(规模变小后的问题其实是原问题的子问题)。\
\
好了，让我们从最小的i开始吧。当i=0，即我们需要多少个硬币来凑够0元。 由于1，3，5都大于0，即没有比0小的币值，因此凑够0元我们最少需要0个硬币。 (这个分析很傻是不是？别着急，这个思路有利于我们理清动态规划究竟在做些什么。) 这时候我们发现用一个标记来表示这句“凑够0元我们最少需要0个硬币。”会比较方便， 如果一直用纯文字来表述，不出一会儿你就会觉得很绕了。那么， 我们用d(i)=j来表示凑够i元最少需要j个硬币。于是我们已经得到了d(0)=0， 表示凑够0元最小需要0个硬币。当i=1时，只有面值为1元的硬币可用， 因此我们拿起一个面值为1的硬币，接下来只需要凑够0元即可，而这个是已经知道答案的， 即d(0)=0。所以，d(1)=d(1-1)+1=d(0)+1=0+1=1。当i=2时， 仍然只有面值为1的硬币可用，于是我拿起一个面值为1的硬币， 接下来我只需要再凑够2-1=1元即可(记得要用最小的硬币数量)，而这个答案也已经知道了。 所以d(2)=d(2-1)+1=d(1)+1=1+1=2。一直到这里，你都可能会觉得，好无聊， 感觉像做小学生的题目似的。因为我们一直都只能操作面值为1的硬币！耐心点， 让我们看看i=3时的情况。当i=3时，我们能用的硬币就有两种了：1元的和3元的( 5元的仍然没用，因为你需要凑的数目是3元！5元太多了亲)。 既然能用的硬币有两种，我就有两种方案。如果我拿了一个1元的硬币，我的目标就变为了： 凑够3-1=2元需要的最少硬币数量。即d(3)=d(3-1)+1=d(2)+1=2+1=3。 这个方案说的是，我拿3个1元的硬币；第二种方案是我拿起一个3元的硬币， 我的目标就变成：凑够3-3=0元需要的最少硬币数量。即d(3)=d(3-3)+1=d(0)+1=0+1=1. 这个方案说的是，我拿1个3元的硬币。好了，这两种方案哪种更优呢？ 记得我们可是要用最少的硬币数量来凑够3元的。所以， 选择d(3)=1，怎么来的呢？具体是这样得到的：d(3)=min{d(3-1)+1, d(3-3)+1}。\
\
OK，码了这么多字讲具体的东西，让我们来点抽象的。从以上的文字中， 我们要抽出动态规划里非常重要的两个概念：状态和状态转移方程。\
\
上文中d(i)表示凑够i元需要的最少硬币数量，我们将它定义为该问题的"状态"， 这个状态是怎么找出来的呢？我在另一篇文章 动态规划之背包问题(一)中写过： 根据子问题定义状态。你找到子问题，状态也就浮出水面了。 最终我们要求解的问题，可以用这个状态来表示：d(11)，即凑够11元最少需要多少个硬币。 那状态转移方程是什么呢？既然我们用d(i)表示状态，那么状态转移方程自然包含d(i)， 上文中包含状态d(i)的方程是：d(3)=min{d(3-1)+1, d(3-3)+1}。没错， 它就是状态转移方程，描述状态之间是如何转移的。当然，我们要对它抽象一下，\
\
d(i) = min{ d(i-vj)+1 }，其中i-vj >=0，vj表示第j个硬币的面值;\
\
有了状态和状态转移方程，这个问题基本上也就解决了。当然了，Talk is cheap,show me the code!\
\
伪代码如下：\
```\
Set Min[i] equal to Infinity for all of i\
Min[0]=0\
\
For i = 1 to S\
For j = 0 to N - 1\
    If (Vj<=i AND Min[i-Vj]+1<Min[i])\
Then Min[i]=Min[i-Vj]+1\
\
Output Min[S]\
```\
To Be Continued...\
\
  [1]: http://community.topcoder.com/tc?module=Static&d1=tutorials&d2=dynProg                
4	0	RainDon	记暑假之行 （2014）	popperxu-summer-holiday-2014	5	1		0	ImShengli	LIFE				<div class="md-section-divider"></div>\
\
<p><div class="toc">\
<ul>\
</ul>\
</div>\
</p>\
\
<p style="text-align:center">作者：PopperXu</p>\
\
<p><img src="https://dn-woerwosi.qbox.me/blog/images/2014/8/remote-road.jpg" alt="Romate Road" title=""> <br>\
<br>\
人总要有一场说走就走的旅行，这话我信了，然后，就，堵在了崇山峻岭的川藏线上。所谓堵车，那是一堵到底，绝不半堵而废。旁边的哥们唱起了歌：堵了那么久，你饿了没有……。我没有回答，只是淡定地看了看路边的青草，不禁觉得清翠诱人，隐约还有种肉香，做羊真好。至于贵贵，已经开始了自己的觅食工作，他决定碰碰运气，把手指塞进鼻孔里，寻找一种珍贵的食材。</p>\
\
<p>终于还是在阳光明媚的下午，到了一个蓝天白云、青山绿水的藏区。海拔三千米的独特气候，若有若无的泥土味，四处弥漫的野花香，零零落落的牦牛粪，在高原紫外线的催化下逐渐激发出一种酸酸爽爽的味道。我掐指一算，这一定是个不普通的地方。当然，哥几个首先跑到便利店，拿了几瓶哇哈哈就灌，我两瓶，你两瓶，他三瓶。终于解了渴也打了嗝，这时再仔细一看，娃呵呵AD钙奶，2015年3月15日生产，突然觉得活着回不去了。</p>\
\
<p>大家一致认定要玩就玩大的，于是第二天在高原上爬了9个小时山，果然，手也抖了， 肝也颤了，生活也不能自理了。站在山顶，总有种清澈明亮的感觉。清明几净的湖水没有一丝波澜，苍翠映绿的森林铺了一层地毯，层层山峦后冒出尖尖雪山，寥落的点点白云镶嵌在深蓝色的天边，倾斜的夕阳缓缓流出汩汩金光，染的这万物生辉，映的这世间荣光。这时，某个山头传来了悠远飘渺的山歌声，宛如天籁：对面的哥哥哟，唱山歌嘞。一哥们清了清嗓子，跟着唱了起来。</p>\
\
<p>嘿… … <br>\
科研要怎么搞哎，嘿哟个嘿。</p>\
\
<p>嘿… … <br>\
论文什么时候发哟，嘿哟个嘿。</p>\
\
<p>嘿… … <br>\
还能不能毕业嘞，嘿哟个嘿。</p>\
\
<p>山那头依然传来妹子甜甜的声音，余音袅袅，婉转动听。</p>\
\
<p>你~个~龟~儿~子~~~        </p>	一生当中是否需要进行一场说走就走的旅行？我们羡慕“豪放派”的勇气，也怜悯“落寞派”的缜密。背上背包，叫上小伙伴，能否开启这场梦幻之旅，这取决于你心的方向！	295	0	2015-10-18 22:40:08	2014-08-14 22:36:39	[TOC]\
\
<p style="text-align:center">作者：PopperXu</p>\
\
![Romate Road][1]\
<br>\
人总要有一场说走就走的旅行，这话我信了，然后，就，堵在了崇山峻岭的川藏线上。所谓堵车，那是一堵到底，绝不半堵而废。旁边的哥们唱起了歌：堵了那么久，你饿了没有……。我没有回答，只是淡定地看了看路边的青草，不禁觉得清翠诱人，隐约还有种肉香，做羊真好。至于贵贵，已经开始了自己的觅食工作，他决定碰碰运气，把手指塞进鼻孔里，寻找一种珍贵的食材。\
\
终于还是在阳光明媚的下午，到了一个蓝天白云、青山绿水的藏区。海拔三千米的独特气候，若有若无的泥土味，四处弥漫的野花香，零零落落的牦牛粪，在高原紫外线的催化下逐渐激发出一种酸酸爽爽的味道。我掐指一算，这一定是个不普通的地方。当然，哥几个首先跑到便利店，拿了几瓶哇哈哈就灌，我两瓶，你两瓶，他三瓶。终于解了渴也打了嗝，这时再仔细一看，娃呵呵AD钙奶，2015年3月15日生产，突然觉得活着回不去了。\
\
大家一致认定要玩就玩大的，于是第二天在高原上爬了9个小时山，果然，手也抖了， 肝也颤了，生活也不能自理了。站在山顶，总有种清澈明亮的感觉。清明几净的湖水没有一丝波澜，苍翠映绿的森林铺了一层地毯，层层山峦后冒出尖尖雪山，寥落的点点白云镶嵌在深蓝色的天边，倾斜的夕阳缓缓流出汩汩金光，染的这万物生辉，映的这世间荣光。这时，某个山头传来了悠远飘渺的山歌声，宛如天籁：对面的哥哥哟，唱山歌嘞。一哥们清了清嗓子，跟着唱了起来。\
\
嘿… …\
科研要怎么搞哎，嘿哟个嘿。\
\
嘿… …\
论文什么时候发哟，嘿哟个嘿。\
\
嘿… …\
还能不能毕业嘞，嘿哟个嘿。\
\
山那头依然传来妹子甜甜的声音，余音袅袅，婉转动听。\
\
你~个~龟~儿~子~~~        \
\
\
  [1]: https://dn-woerwosi.qbox.me/blog/images/2014/8/remote-road.jpg        
5	0	RainDon	可省的符合规范的HTML标签	omissible-html-tags	1	1		0	ImShengli	HTML				<div class="md-section-divider"></div>\
\
<p><div class="toc">\
<ul>\
</ul>\
</div>\
</p>\
\
<p>序言：细心的网友发现百度或谷歌首页的源代码中是没有闭合HTML标签的（/html），通过HTML标准可以看出，这些写法是符合规范的，这样做的目的，无非是减少页面大小。通过谷歌的搜索结果页也可以发现，TD标签也是不闭合的（以前）。本文简要介绍哪些标签可以省略（但请注意特定的文档类型声明）。</p>\
\
<p>HTML 标签主要分为两类：（1）两边封闭，（2）自封闭。</p>\
\
<p>在html4.01 strict或html5下，即doctype声明为</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="dec">&lt;!DOCTYPE HTML PUBLIC “-//W3C//DTD HTML 4.01//EN” “http://www.w3.org/TR/html4/strict.dtd”&gt;</span></code></li></ol></pre>\
\
<p>或</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="dec">&lt;!DOCTYPE html&gt;</span></code></li></ol></pre>\
\
<p>下面的标签都是可以不闭合的：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-HTML"><span class="tag">&lt;html&gt;</span></code></li><li class="L1"><code class="language-HTML"><span class="tag">&lt;body&gt;</span></code></li><li class="L2"><code class="language-HTML"><span class="tag">&lt;colgroup&gt;</span></code></li><li class="L3"><code class="language-HTML"><span class="tag">&lt;thead&gt;</span></code></li><li class="L4"><code class="language-HTML"><span class="tag">&lt;tr&gt;</span></code></li><li class="L5"><code class="language-HTML"><span class="tag">&lt;tbody&gt;</span></code></li><li class="L6"><code class="language-HTML"><span class="tag">&lt;td&gt;</span></code></li><li class="L7"><code class="language-HTML"><span class="tag">&lt;p&gt;</span></code></li><li class="L8"><code class="language-HTML"><span class="tag">&lt;dt&gt;</span></code></li><li class="L9"><code class="language-HTML"><span class="tag">&lt;dd&gt;</span></code></li><li class="L0"><code class="language-HTML"><span class="tag">&lt;li&gt;</span></code></li><li class="L1"><code class="language-HTML"><span class="tag">&lt;option&gt;</span></code></li><li class="L2"><code class="language-HTML"><span class="tag">&lt;tfoot&gt;</span><span class="pln"> </span><span class="com">&lt;!--html5下是标准的--&gt;</span></code></li></ol></pre>	在HTML中，按照规范书写代码是前端开发者所推荐的。但当用户量达到一定规模后，按照规范，少写一个标签对节省流量都有很大的益处。本文简要介绍一下这些标签。	252	0	2016-02-20 22:21:35	2014-08-19 10:03:03	[TOC]\
\
序言：细心的网友发现百度或谷歌首页的源代码中是没有闭合HTML标签的（/html），通过HTML标准可以看出，这些写法是符合规范的，这样做的目的，无非是减少页面大小。通过谷歌的搜索结果页也可以发现，TD标签也是不闭合的（以前）。本文简要介绍哪些标签可以省略（但请注意特定的文档类型声明）。\
\
HTML 标签主要分为两类：（1）两边封闭，（2）自封闭。\
\
在html4.01 strict或html5下，即doctype声明为\
```\
<!DOCTYPE HTML PUBLIC “-//W3C//DTD HTML 4.01//EN” “http://www.w3.org/TR/html4/strict.dtd”>\
```\
或\
```\
<!DOCTYPE html>\
```\
\
下面的标签都是可以不闭合的：\
```HTML\
<html>\
<body>\
<colgroup>\
<thead>\
<tr>\
<tbody>\
<td>\
<p>\
<dt>\
<dd>\
<li>\
<option>\
<tfoot> <!--html5下是标准的-->\
```        
6	0	RainDon	我的校招之旅	campus-join	1	1		0	ImShengli	JOB				<div class="md-section-divider"></div>\
\
<p><div class="toc">\
<ul>\
</ul>\
</div>\
</p>\
\
<blockquote class="white-blockquote">\
  <p>注：文中存在大量作者自夸成分，作者娇羞了！</p>\
</blockquote>\
\
<p>先说一下个人情况：山东考生2008年通过高考进入东北林业大学就读，专业是计算机科学与技术；2012年考研通过调到中南大学读研究生，研二期间在云适配实习一年，了解到不少前端知识。应聘的是Web前端开发工程师岗位。</p>\
\
<p>我一直觉得自己是幸运的：在高中之前遇到了很好的老师和同学；在大学遇到了我认为最好的辅导员，没有之一；在实习期间遇到了好的领导和同事；在校招中也几乎没有遇到什么挫折。所以十分感谢上苍。（编外话：实习期间，有桌上足球，主打后场，后场攻防还是可以的；每当后场进球，我都觉得是上天的眷顾。）</p>\
\
<p>14年8月份结束实习，从此时开始才忙起校招的事，在这之前也没有好好的复习基础知识。实习快结束时，室友想让我帮他一个忙，他投了阿里的校招职位，但岗位不知为何是Web前端工程师，他主攻后台，所以就请我帮忙做做在线笔试（邪恶了），我想想也就答应了；听他这么一提醒，我才意识到校招已经开始了，我还一头蒙的想在家好好玩几天呢。还没来得及准备的我毛里毛糙的也跟着投投了。</p>\
\
<p>其实我的目标很明确，前端工程师，所以只选择互联网公司。到10月1日为止，共投了五份简历（阿里，360，大众点评，美团，百度），其中百度还没开始。四个中：笔试挂了一个（阿里）；在线测评挂了一个（360），悲哀；有面试机会的两个（大众点评和美团）；实际面试的一个（美团）；拿到offer的一个（美团）。所以很幸运啊，只面了一个，就拿到offer啦。</p>\
\
<p>阿里的笔试是在实习快结束时做的，线上进行的，当时没有做什么准备，觉得应该问题不大吧，就大胆无畏的做笔试（笔试在规定的几天时间内，随便一个小时都行），其实题目不难，但好长时间没有接触基础知识，所以自己做的感觉很烂，也没期望能够进入面试。果然如此，阿里的旅程就结束了。</p>\
\
<p>360需要先做一下线上的逻辑思维题，有三种类型，每种类型十几道题，好像是六分钟时间。又傻眼了，实习一年题都不会做了，看了不知道往哪个思路上想，所以就做的很慢，所以每种类型都有几个没做，做的也不一定对。结果也就是没有通知笔试。但有个室友收到通知了，他说：“走，霸笔去吧！”，其实是想进360的，所以就跟他坐上了从长沙到武汉的火车，第一次去武汉，想想还有点小激动呢。360原则上是不同意霸笔的，但现场很乱，所以就跟着坐了下来。和我的室友坐在一起，一起答题，一起交卷，一起离开，隔一天后，通知他了面试，我杳无音信，所以霸笔没前途。</p>\
\
<p>美团其实是误打误撞。360笔试后，第二天没有通知，所以和室友就回长沙了。期间室友收到了美团在长沙的宣讲通知，就说反正你也没事，就去美团看看呗。下火车后，直接就去看美团的宣讲了。宣讲后是笔试，一看又傻眼了，全是大题，由于一年多没接触过Java、C等了，所以当时觉得没希望了，但题还是做做看吧，其中有一个前端的选做题，可惜我也没做。笔试后，对美团不报希望，所以再投投其他的吧，投了“大众点评”。一天后，幸运女神驾到，美团通知第二天面试。喜出望外，立即复习基础（例如继承、闭包、ajax等）。一面主要考察了实习期间的工作和CSS、HTML5的知识，我把在云适配实习做的事情的流程详细的介绍了一下，把云适配的原理说到直到面试官明白，花了45分钟。面试官也很满意，又问了一些基础的CSS和HTML5的知识，一面过了，感谢云适配！半小时后，二面。二面主要考察了JS的基础，很细很细，还有就是自己实现jQuery中的某些方法，还做了笔试中的那个前端选做题，考察的很详尽很仔细。二面中我觉得和面试官交流的很好，每当不甚明白的地方，稍微请面试官指点一下，自己就能想明白，其实这是可以的。很顺利，由于当天很晚了，就通知第二天终面。一直以为终面是HR面，准备了很多这方面的知识，想不到的是还是技术面。终面的是位高级技术经理，考察了一些算法方面的知识，还有一些逻辑题，第一个是ABCD*9=DCBA，我知道这个答案，直接写出来了，面试官不高兴了，第二个就很难，实在想不通，最后在和面试官友好的交流中解决了。其他的问的一些是平时怎么学习啊，有什么值得骄傲的吗？看过什么书啊？哪些书很好啊，为什么好啊？我其实回答的也磕磕巴巴，但我很真诚的和面试官沟通。期间，注意到一个细节，由于每个面试官都要在一张表格上详细记录面试者的情况，此面中，不经意间扫到“牙齿上有青叶”，顿时无地自容，这样的内容都记录，我也是前一天经室友提醒才知道牙齿上有青叶，汗。最后，面试官递给我一张名片，回去等通知。晚上12点多，一个电话惊醒了美梦中的我：“喂，***吗？我是美团HR，你的面试通过了，我们决定给你offer”。今夜无眠。</p>\
\
<p>大众点评：要去武汉面试。本来通知在美团面试的当天面试的，但由于美团，我推迟到了第二天，想不到的是，第二天美团接着面。美团第二天面试后，接到大众点评的电话，说是推迟呢还是PASS呢？我一想，美团其实面的还挺好，也不好意思再推迟还要去武汉，所以就PASS了。大众点评，SORRY。</p>\
\
<p>直至今天十月一号。国庆节快乐。</p>\
\
<p>可能会参加百度笔试，锻炼一下自己。</p>	正所谓“金九银十”，在今年的九月份，作者参加了一些公司的校招，把自己的经历写下来，不为了哗众取宠，只是怕以后自己忘了这其中的过程，遂记之。	479	0	2014-10-01 11:46:12	2014-10-01 11:46:12	[TOC]\
\
> 注：文中存在大量作者自夸成分，作者娇羞了！\
\
先说一下个人情况：山东考生2008年通过高考进入东北林业大学就读，专业是计算机科学与技术；2012年考研通过调到中南大学读研究生，研二期间在云适配实习一年，了解到不少前端知识。应聘的是Web前端开发工程师岗位。\
\
我一直觉得自己是幸运的：在高中之前遇到了很好的老师和同学；在大学遇到了我认为最好的辅导员，没有之一；在实习期间遇到了好的领导和同事；在校招中也几乎没有遇到什么挫折。所以十分感谢上苍。（编外话：实习期间，有桌上足球，主打后场，后场攻防还是可以的；每当后场进球，我都觉得是上天的眷顾。）\
\
14年8月份结束实习，从此时开始才忙起校招的事，在这之前也没有好好的复习基础知识。实习快结束时，室友想让我帮他一个忙，他投了阿里的校招职位，但岗位不知为何是Web前端工程师，他主攻后台，所以就请我帮忙做做在线笔试（邪恶了），我想想也就答应了；听他这么一提醒，我才意识到校招已经开始了，我还一头蒙的想在家好好玩几天呢。还没来得及准备的我毛里毛糙的也跟着投投了。\
\
其实我的目标很明确，前端工程师，所以只选择互联网公司。到10月1日为止，共投了五份简历（阿里，360，大众点评，美团，百度），其中百度还没开始。四个中：笔试挂了一个（阿里）；在线测评挂了一个（360），悲哀；有面试机会的两个（大众点评和美团）；实际面试的一个（美团）；拿到offer的一个（美团）。所以很幸运啊，只面了一个，就拿到offer啦。\
\
阿里的笔试是在实习快结束时做的，线上进行的，当时没有做什么准备，觉得应该问题不大吧，就大胆无畏的做笔试（笔试在规定的几天时间内，随便一个小时都行），其实题目不难，但好长时间没有接触基础知识，所以自己做的感觉很烂，也没期望能够进入面试。果然如此，阿里的旅程就结束了。\
\
360需要先做一下线上的逻辑思维题，有三种类型，每种类型十几道题，好像是六分钟时间。又傻眼了，实习一年题都不会做了，看了不知道往哪个思路上想，所以就做的很慢，所以每种类型都有几个没做，做的也不一定对。结果也就是没有通知笔试。但有个室友收到通知了，他说：“走，霸笔去吧！”，其实是想进360的，所以就跟他坐上了从长沙到武汉的火车，第一次去武汉，想想还有点小激动呢。360原则上是不同意霸笔的，但现场很乱，所以就跟着坐了下来。和我的室友坐在一起，一起答题，一起交卷，一起离开，隔一天后，通知他了面试，我杳无音信，所以霸笔没前途。\
\
美团其实是误打误撞。360笔试后，第二天没有通知，所以和室友就回长沙了。期间室友收到了美团在长沙的宣讲通知，就说反正你也没事，就去美团看看呗。下火车后，直接就去看美团的宣讲了。宣讲后是笔试，一看又傻眼了，全是大题，由于一年多没接触过Java、C等了，所以当时觉得没希望了，但题还是做做看吧，其中有一个前端的选做题，可惜我也没做。笔试后，对美团不报希望，所以再投投其他的吧，投了“大众点评”。一天后，幸运女神驾到，美团通知第二天面试。喜出望外，立即复习基础（例如继承、闭包、ajax等）。一面主要考察了实习期间的工作和CSS、HTML5的知识，我把在云适配实习做的事情的流程详细的介绍了一下，把云适配的原理说到直到面试官明白，花了45分钟。面试官也很满意，又问了一些基础的CSS和HTML5的知识，一面过了，感谢云适配！半小时后，二面。二面主要考察了JS的基础，很细很细，还有就是自己实现jQuery中的某些方法，还做了笔试中的那个前端选做题，考察的很详尽很仔细。二面中我觉得和面试官交流的很好，每当不甚明白的地方，稍微请面试官指点一下，自己就能想明白，其实这是可以的。很顺利，由于当天很晚了，就通知第二天终面。一直以为终面是HR面，准备了很多这方面的知识，想不到的是还是技术面。终面的是位高级技术经理，考察了一些算法方面的知识，还有一些逻辑题，第一个是ABCD*9=DCBA，我知道这个答案，直接写出来了，面试官不高兴了，第二个就很难，实在想不通，最后在和面试官友好的交流中解决了。其他的问的一些是平时怎么学习啊，有什么值得骄傲的吗？看过什么书啊？哪些书很好啊，为什么好啊？我其实回答的也磕磕巴巴，但我很真诚的和面试官沟通。期间，注意到一个细节，由于每个面试官都要在一张表格上详细记录面试者的情况，此面中，不经意间扫到“牙齿上有青叶”，顿时无地自容，这样的内容都记录，我也是前一天经室友提醒才知道牙齿上有青叶，汗。最后，面试官递给我一张名片，回去等通知。晚上12点多，一个电话惊醒了美梦中的我：“喂，***吗？我是美团HR，你的面试通过了，我们决定给你offer”。今夜无眠。\
\
大众点评：要去武汉面试。本来通知在美团面试的当天面试的，但由于美团，我推迟到了第二天，想不到的是，第二天美团接着面。美团第二天面试后，接到大众点评的电话，说是推迟呢还是PASS呢？我一想，美团其实面的还挺好，也不好意思再推迟还要去武汉，所以就PASS了。大众点评，SORRY。\
\
直至今天十月一号。国庆节快乐。\
\
可能会参加百度笔试，锻炼一下自己。\
                                        
7	0	RainDon	云适配实习这一年	internship-2013-2014	5	1		0	ImShengli	Internship				<div class="md-section-divider"></div>\
\
<p><div class="toc">\
<ul>\
</ul>\
</div>\
</p>\
\
<p>2014.08.29，DEMO DAY之后，大家乘着大巴迈上了十渡游玩的路；而我，打理好个人物品，夜深人静时分，结束了这为期一年零两个月（2013.07 ~ 2014.08）的实习之旅，感谢、感动、感恩，感慨万千。</p>\
\
<p><img src="https://dn-woerwosi.qbox.me/blog/images/2014/10/allmobilize.jpg" alt="Allmobilize" title=""></p>\
\
<p>2013.07.08，周一，正值公司搬进1+1大厦的第一天，正式加入云适配。这是我第一次走进北京城，第一份工作。由于性格偏于内向，不善言辞，故开始时只顾埋头做事，除工作外很少和大家交流。<code>@Ben</code>（QQ昵称，下同）对我的“沉默寡言”应该深有体会。一般 <code>@Ben</code> 和我的对话是这样的：</p>\
\
<blockquote class="white-blockquote">\
  <p><code>@Ben</code> : 胜利，有个事给你说一下。 <br>\
  <code>@Me</code>  : 恩，你说。 <br>\
  <code>@Ben</code> : Babababa...你看怎么样？ <br>\
  <code>@Me</code>  : 好。 <br>\
  <code>@Ben</code> : 那你有什么意见吗？ <br>\
  <code>@Me</code>  : 恩...没有。 <br>\
  <code>@Ben</code> : 那其它的想法呢？ <br>\
  <code>@Me</code>  : 也没有。 <br>\
  <code>@Ben</code> : 那...那......你先回去吧！</p>\
</blockquote>\
\
<p>直到 <code>@安</code> 来，在其左一个“胜利，早啊”，右一个“胜利，来了”的呼唤下，才算渐渐和大家热闹起来。后来越来越多的人加入公司，我的能见度才越来越高。当然，这个过程中，<code>@王晓亮</code>、<code>@yhben</code> 和 <code>@懒皮虫虫</code> 在我的这部戏里扮演着十分重要的角色，良师、益友、好基友。</p>\
\
<p>把“转网站是一种快乐”当做箴言后，人气爆棚。“一周七个网站”的记录，可能至今无人打破。虽然大家看来没什么意思，可我觉得这是一种荣誉，一种睡觉时都可把自己乐醒的荣誉，不服来战。后来跟着 <code>@H</code> 做AMUI后，就没有机会打破此项记录了。话说，做AMUI真是一段悠闲的时光，后来真有愿为AMUI团队继续效力的冲动想法，但被我扼杀在了摇篮里。</p>\
\
<p>搬进十二楼以前，由于不愿去大时代吃午饭，所以经常是我一人在楼下“无语凝噎”。<code>@追忆诺达希尔</code> 和 <code>@D</code> 的到来打破了这种僵局，我终于可以在内心高亢的叫着“看吧，看吧，我也有人了”。以致后来鼎盛时期有了可以与“大时代者们”旗鼓相当的人头。</p>\
\
<p><code>@广鑫</code> 于我，好比阳光之于草木，<code>@yhben</code>、 <code>@潮汐</code>、 <code>@马克思</code> 便是草木必需的空气、水分和土壤等，让“草木皆兵”不只是个典故（比喻有点恶心）。由 <code>@广鑫</code> 所推进的桌上足球是我生活蜕变的开始。无网站可转的午后休息只有靠桌上足球来安放落寞的双手。足球上的风云际会，成为了茶余饭后的谈资，也成为大家揶揄校长的良方。“一脚风云天下定”、“半走海角揽山河”，只有艳羡的份了！面对工作，能够加入AMResearch小组是我今后标榜的砝码，<code>@广鑫</code> 所教与的也是我今后工作的基石。<code>@yhben</code>、 <code>@潮汐</code> 所给予的忘乎所以的帮助无以复加。此时此刻，“你就是我的天使”的曲调萦绕在耳旁，挥之不去。</p>\
\
<p>对于 <code>@落雪飄昂Chai</code> ，更多的则是愧疚了。那一则玩笑是我们关系的催化剂，因为有话题了，便有了可以慰藉的话语。</p>\
\
<p>么么哒 ： <code>@David</code> <br>\
么么哒 ： <code>@Forever</code> <br>\
么么哒 ： <code>@~彡彡~</code> <br>\
么么哒 ： <code>@筱磊</code> <br>\
么么哒 ： <code>@潮♂领嗨</code> <br>\
么么哒 ： <code>@风帝.Java</code> <br>\
么么哒 ： <code>@＂ 梦 想 ç²º ¹³¼</code> <br>\
么么哒 ： <code>@土豆</code> <br>\
么么哒 ： <code>@哒哒的马蹄</code></p>\
\
<p>花开花落，聚散有时；潮起潮落，后会有期。                </p>	在2013.07~2014.08这一年多的时间里，作者在美通云动（北京）科技有限公司实习，此次经历充满着愉快、温暖和感动，非常感谢在公司的每个人以及留给我的美好回忆。	591	0	2015-10-13 23:02:40	2014-10-03 15:55:20	[TOC]\
\
2014.08.29，DEMO DAY之后，大家乘着大巴迈上了十渡游玩的路；而我，打理好个人物品，夜深人静时分，结束了这为期一年零两个月（2013.07 ~ 2014.08）的实习之旅，感谢、感动、感恩，感慨万千。\
\
![Allmobilize][1]\
\
2013.07.08，周一，正值公司搬进1+1大厦的第一天，正式加入云适配。这是我第一次走进北京城，第一份工作。由于性格偏于内向，不善言辞，故开始时只顾埋头做事，除工作外很少和大家交流。`@Ben`（QQ昵称，下同）对我的“沉默寡言”应该深有体会。一般 `@Ben` 和我的对话是这样的：\
\
> `@Ben` : 胜利，有个事给你说一下。\
> `@Me`  : 恩，你说。\
> `@Ben` : Babababa...你看怎么样？\
> `@Me`  : 好。\
> `@Ben` : 那你有什么意见吗？\
> `@Me`  : 恩...没有。\
> `@Ben` : 那其它的想法呢？\
> `@Me`  : 也没有。\
> `@Ben` : 那...那......你先回去吧！\
\
直到 `@安` 来，在其左一个“胜利，早啊”，右一个“胜利，来了”的呼唤下，才算渐渐和大家热闹起来。后来越来越多的人加入公司，我的能见度才越来越高。当然，这个过程中，`@王晓亮`、`@yhben` 和 `@懒皮虫虫` 在我的这部戏里扮演着十分重要的角色，良师、益友、好基友。\
\
把“转网站是一种快乐”当做箴言后，人气爆棚。“一周七个网站”的记录，可能至今无人打破。虽然大家看来没什么意思，可我觉得这是一种荣誉，一种睡觉时都可把自己乐醒的荣誉，不服来战。后来跟着 `@H` 做AMUI后，就没有机会打破此项记录了。话说，做AMUI真是一段悠闲的时光，后来真有愿为AMUI团队继续效力的冲动想法，但被我扼杀在了摇篮里。\
\
搬进十二楼以前，由于不愿去大时代吃午饭，所以经常是我一人在楼下“无语凝噎”。`@追忆诺达希尔` 和 `@D` 的到来打破了这种僵局，我终于可以在内心高亢的叫着“看吧，看吧，我也有人了”。以致后来鼎盛时期有了可以与“大时代者们”旗鼓相当的人头。\
\
`@广鑫` 于我，好比阳光之于草木，`@yhben`、 `@潮汐`、 `@马克思` 便是草木必需的空气、水分和土壤等，让“草木皆兵”不只是个典故（比喻有点恶心）。由 `@广鑫` 所推进的桌上足球是我生活蜕变的开始。无网站可转的午后休息只有靠桌上足球来安放落寞的双手。足球上的风云际会，成为了茶余饭后的谈资，也成为大家揶揄校长的良方。“一脚风云天下定”、“半走海角揽山河”，只有艳羡的份了！面对工作，能够加入AMResearch小组是我今后标榜的砝码，`@广鑫` 所教与的也是我今后工作的基石。`@yhben`、 `@潮汐` 所给予的忘乎所以的帮助无以复加。此时此刻，“你就是我的天使”的曲调萦绕在耳旁，挥之不去。\
\
对于 `@落雪飄昂Chai` ，更多的则是愧疚了。那一则玩笑是我们关系的催化剂，因为有话题了，便有了可以慰藉的话语。\
\
么么哒 ： `@David`\
么么哒 ： `@Forever`\
么么哒 ： `@~彡彡~`\
么么哒 ： `@筱磊`\
么么哒 ： `@潮♂领嗨`\
么么哒 ： `@风帝.Java`\
么么哒 ： `@＂ 梦 想 ç²º ¹³¼`\
么么哒 ： `@土豆`\
么么哒 ： `@哒哒的马蹄`\
\
花开花落，聚散有时；潮起潮落，后会有期。                \
\
\
  [1]: https://dn-woerwosi.qbox.me/blog/images/2014/10/allmobilize.jpg                                                
8	0	RainDon	不哭，坚强~~	not-cry-to-be-stronger	4	1		0	ImShengli	诗词				<div class="md-section-divider"></div>\
\
<p><br>\
别让灿烂的花变成斑驳的墙 <br>\
别让暂时的痛成为永恒的伤 <br>\
别让明眸化作泪眼 <br>\
别让任何人看到你梨花带雨的模样 <br>\
<br>\
别让清澈的水混入了污浊的泥浆 <br>\
别让攀援的心懈怠在低矮的山梁 <br>\
别让激情燃成灰烬 <br>\
别让任何忧郁掩盖那一路飘洒的芬芳 <br>\
<br>\
不哭 <br>\
于是阴霾变得闪亮 <br>\
坚强 <br>\
于是萤火化作耀眼的光</p>	也许夜最适合哭，爱情太多盲目，用眼泪洗掉痛苦， 却逃不脱孤独；\
我在搜索着幸福，却收录了痛楚，我想坚强着不哭，泪偏偏连成珠。 \
可别要我再感悟，犯不过错误，直到丢失了全部，我不止是在夜里哭；\
也许悲伤在潜伏，夜掩饰了无助，无法确定你在乎，又飘零无是处。	184	0	2015-03-04 19:49:13	2015-03-04 19:49:13	\
<br>\
别让灿烂的花变成斑驳的墙\
别让暂时的痛成为永恒的伤\
别让明眸化作泪眼\
别让任何人看到你梨花带雨的模样\
<br>\
别让清澈的水混入了污浊的泥浆\
别让攀援的心懈怠在低矮的山梁\
别让激情燃成灰烬\
别让任何忧郁掩盖那一路飘洒的芬芳\
<br>\
不哭\
于是阴霾变得闪亮\
坚强\
于是萤火化作耀眼的光
9	0	RainDon	JavaScript 小知识点集锦	javascript-tips-summary	1	1		0	ImShengli	JAVASCRIPT				<div class="md-section-divider"></div>\
\
<p><div class="toc">\
<ul>\
<li><ul>\
<li><ul>\
<li><a href="#一对变量值是否为-undefined-的判断">一、对变量值是否为 undefined 的判断</a></li>\
<li><a href="#二ecma5-中的-bind">二、ECMA5 中的 bind()</a></li>\
<li><a href="#三call-和-apply">三、call() 和 apply()</a></li>\
</ul>\
</li>\
</ul>\
</li>\
</ul>\
</div>\
</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="一对变量值是否为-undefined-的判断">一、对变量值是否为 undefined 的判断</h3>\
\
<p>（1）若关心的是变量是否声明而不是其值的话，最好使用 <code>in</code> ；如果使用 <code>typeof</code>，对于只声明而未初始化的变量其值为 "undefine"；</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-javascript"><span class="com">// global scope</span></code></li><li class="L1"><code class="language-javascript"><span class="kwd">var</span><span class="pln"> test</span><span class="pun">;</span><span class="pln">  </span><span class="com">// value: "undefined"</span></code></li><li class="L2"><code class="language-javascript"><span class="str">"test"</span><span class="pln"> in window</span><span class="pun">;</span><span class="pln">  </span><span class="com">// true</span></code></li><li class="L3"><code class="language-javascript"><span class="str">"tempTest"</span><span class="pln"> in window</span><span class="pun">;</span><span class="pln">  </span><span class="com">// false</span></code></li><li class="L4"><code class="language-javascript"><span class="str">"undefine"</span><span class="pln"> </span><span class="pun">===</span><span class="pln"> </span><span class="kwd">typeof</span><span class="pln"> test</span><span class="pun">;</span><span class="pln">  </span><span class="com">// true</span></code></li></ol></pre>\
\
<p>（2）若关心的是变量是否声明或者其值是否为 "undefined" （一种情况是未初始化），使用 <code>typeof</code>；直接与 "undefined" 比较是有问题的，因为 "undefined" 可以被重写，而在 ECMA5 中已修复，不可重写；</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-javascript"><span class="str">"undefined"</span><span class="pln"> </span><span class="pun">===</span><span class="pln"> </span><span class="kwd">typeof</span><span class="pln"> test</span><span class="pun">;</span><span class="pln"> </span><span class="com">// true</span></code></li><li class="L1"><code class="language-javascript"><span class="pln">window</span><span class="pun">.</span><span class="kwd">undefined</span><span class="pln"> </span><span class="pun">=</span><span class="pln"> </span><span class="str">"omg"</span><span class="pun">;</span></code></li><li class="L2"><code class="language-javascript"><span class="str">"omg"</span><span class="pln"> </span><span class="pun">===</span><span class="pln"> </span><span class="kwd">undefined</span><span class="pun">;</span><span class="pln">  </span><span class="com">// true</span></code></li></ol></pre>\
\
<p>（3）注意：if 条件中的变量要先定义，否则会报 ReferenceError；</p>\
\
<p><br></p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="二ecma5-中的-bind">二、ECMA5 中的 bind()</h3>\
\
<p>（1）作用：给调用函数中的 this 传递对象；考虑下面一种情况：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-javascript"><span class="kwd">this</span><span class="pun">.</span><span class="pln">x </span><span class="pun">=</span><span class="pln"> </span><span class="lit">9</span><span class="pun">;</span><span class="pln"> </span></code></li><li class="L1"><code class="language-javascript"><span class="kwd">var</span><span class="pln"> module </span><span class="pun">=</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L2"><code class="language-javascript"><span class="pln">    x</span><span class="pun">:</span><span class="pln"> </span><span class="lit">81</span><span class="pun">,</span></code></li><li class="L3"><code class="language-javascript"><span class="pln">    getX</span><span class="pun">:</span><span class="pln"> </span><span class="kwd">function</span><span class="pun">()</span><span class="pln"> </span><span class="pun">{</span><span class="pln"> </span></code></li><li class="L4"><code class="language-javascript"><span class="pln">        </span><span class="kwd">return</span><span class="pln"> </span><span class="kwd">this</span><span class="pun">.</span><span class="pln">x</span><span class="pun">;</span><span class="pln"> </span></code></li><li class="L5"><code class="language-javascript"><span class="pln">    </span><span class="pun">}</span></code></li><li class="L6"><code class="language-javascript"><span class="pun">};</span></code></li><li class="L7"><code class="language-javascript"><span class="pln">module</span><span class="pun">.</span><span class="pln">getX</span><span class="pun">();</span><span class="pln"> </span><span class="com">// 81</span></code></li><li class="L8"><code class="language-javascript"></code></li><li class="L9"><code class="language-javascript"><span class="kwd">var</span><span class="pln"> getX </span><span class="pun">=</span><span class="pln"> module</span><span class="pun">.</span><span class="pln">getX</span><span class="pun">;</span></code></li><li class="L0"><code class="language-javascript"><span class="pln">getX</span><span class="pun">();</span><span class="pln">  </span><span class="com">// 9, "this" refers to the global object</span></code></li><li class="L1"><code class="language-javascript"></code></li><li class="L2"><code class="language-javascript"><span class="com">// Create a new function with "this" bound to module</span></code></li><li class="L3"><code class="language-javascript"><span class="kwd">var</span><span class="pln"> boundGetX </span><span class="pun">=</span><span class="pln"> getX</span><span class="pun">.</span><span class="pln">bind</span><span class="pun">(</span><span class="pln">module</span><span class="pun">);</span></code></li><li class="L4"><code class="language-javascript"><span class="pln">boundGetX</span><span class="pun">();</span><span class="pln"> </span><span class="com">// 81</span></code></li></ol></pre>\
\
<p>（2）自定义实现 bind()</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-javascript"><span class="kwd">if</span><span class="pln"> </span><span class="pun">(!</span><span class="typ">Function</span><span class="pun">.</span><span class="pln">prototype</span><span class="pun">.</span><span class="pln">bind</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L1"><code class="language-javascript"><span class="pln">    </span><span class="typ">Function</span><span class="pun">.</span><span class="pln">prototype</span><span class="pun">.</span><span class="pln">bind </span><span class="pun">=</span><span class="pln"> </span><span class="kwd">function</span><span class="pln"> </span><span class="pun">(</span><span class="pln">oThis</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L2"><code class="language-javascript"><span class="pln">        </span><span class="kwd">if</span><span class="pln"> </span><span class="pun">(</span><span class="kwd">typeof</span><span class="pln"> </span><span class="kwd">this</span><span class="pln"> </span><span class="pun">!==</span><span class="pln"> </span><span class="str">"function"</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L3"><code class="language-javascript"><span class="pln">            </span><span class="com">// closest thing possible to the ECMAScript 5 internal IsCallable function</span></code></li><li class="L4"><code class="language-javascript"><span class="pln">           </span><span class="kwd">throw</span><span class="pln"> </span><span class="kwd">new</span><span class="pln"> </span><span class="typ">TypeError</span><span class="pun">(</span><span class="str">"Function.prototype.bind - what is trying to be bound is not callable"</span><span class="pun">);</span></code></li><li class="L5"><code class="language-javascript"><span class="pln">        </span><span class="pun">}</span></code></li><li class="L6"><code class="language-javascript"></code></li><li class="L7"><code class="language-javascript"><span class="pln">        </span><span class="kwd">var</span><span class="pln"> aArgs </span><span class="pun">=</span><span class="pln"> </span><span class="typ">Array</span><span class="pun">.</span><span class="pln">prototype</span><span class="pun">.</span><span class="pln">slice</span><span class="pun">.</span><span class="pln">call</span><span class="pun">(</span><span class="pln">arguments</span><span class="pun">,</span><span class="pln"> </span><span class="lit">1</span><span class="pun">),</span><span class="pln"> </span></code></li><li class="L8"><code class="language-javascript"><span class="pln">            fToBind </span><span class="pun">=</span><span class="pln"> </span><span class="kwd">this</span><span class="pun">,</span><span class="pln"> </span></code></li><li class="L9"><code class="language-javascript"><span class="pln">            fNOP </span><span class="pun">=</span><span class="pln"> </span><span class="kwd">function</span><span class="pln"> </span><span class="pun">()</span><span class="pln"> </span><span class="pun">{},</span></code></li><li class="L0"><code class="language-javascript"><span class="pln">            fBound </span><span class="pun">=</span><span class="pln"> </span><span class="kwd">function</span><span class="pln"> </span><span class="pun">()</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L1"><code class="language-javascript"><span class="pln">                </span><span class="kwd">return</span><span class="pln"> fToBind</span><span class="pun">.</span><span class="pln">apply</span><span class="pun">(</span><span class="kwd">this</span><span class="pln"> instanceof fNOP </span><span class="pun">&amp;&amp;</span><span class="pln"> oThis</span></code></li><li class="L2"><code class="language-javascript"><span class="pln">                                     </span><span class="pun">?</span><span class="pln"> </span><span class="kwd">this</span></code></li><li class="L3"><code class="language-javascript"><span class="pln">                                     </span><span class="pun">:</span><span class="pln"> oThis </span><span class="pun">||</span><span class="pln"> window</span><span class="pun">,</span></code></li><li class="L4"><code class="language-javascript"><span class="pln">                                    aArgs</span><span class="pun">.</span><span class="pln">concat</span><span class="pun">(</span><span class="typ">Array</span><span class="pun">.</span><span class="pln">prototype</span><span class="pun">.</span><span class="pln">slice</span><span class="pun">.</span><span class="pln">call</span><span class="pun">(</span><span class="pln">arguments</span><span class="pun">)));</span></code></li><li class="L5"><code class="language-javascript"><span class="pln">            </span><span class="pun">};</span></code></li><li class="L6"><code class="language-javascript"></code></li><li class="L7"><code class="language-javascript"><span class="pln">        fNOP</span><span class="pun">.</span><span class="pln">prototype </span><span class="pun">=</span><span class="pln"> </span><span class="kwd">this</span><span class="pun">.</span><span class="pln">prototype</span><span class="pun">;</span></code></li><li class="L8"><code class="language-javascript"><span class="pln">        fBound</span><span class="pun">.</span><span class="pln">prototype </span><span class="pun">=</span><span class="pln"> </span><span class="kwd">new</span><span class="pln"> fNOP</span><span class="pun">();</span></code></li><li class="L9"><code class="language-javascript"></code></li><li class="L0"><code class="language-javascript"><span class="pln">        </span><span class="kwd">return</span><span class="pln"> fBound</span><span class="pun">;</span></code></li><li class="L1"><code class="language-javascript"><span class="pln">    </span><span class="pun">};</span></code></li><li class="L2"><code class="language-javascript"><span class="pun">}</span></code></li></ol></pre>\
\
<p>（3）参考：<a href="https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Function/bind" target="_blank">MDN bind()</a>  </p>\
\
<p><br></p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="三call-和-apply">三、call() 和 apply()</h3>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-javascript"><span class="pun">&lt;</span><span class="pln">input type</span><span class="pun">=</span><span class="str">"text"</span><span class="pln"> id</span><span class="pun">=</span><span class="str">"myText"</span><span class="pln"> value</span><span class="pun">=</span><span class="str">"input text"</span><span class="pun">&gt;</span></code></li><li class="L1"><code class="language-javascript"><span class="kwd">function</span><span class="pln"> </span><span class="typ">Obj</span><span class="pun">(){</span></code></li><li class="L2"><code class="language-javascript"><span class="pln">    </span><span class="kwd">this</span><span class="pun">.</span><span class="pln">value </span><span class="pun">=</span><span class="pln"> </span><span class="str">"对象！"</span><span class="pun">;</span></code></li><li class="L3"><code class="language-javascript"><span class="pun">}</span></code></li><li class="L4"><code class="language-javascript"><span class="kwd">var</span><span class="pln"> value </span><span class="pun">=</span><span class="pln"> </span><span class="str">"global 变量"</span><span class="pun">;</span></code></li><li class="L5"><code class="language-javascript"><span class="kwd">function</span><span class="pln"> </span><span class="typ">Fun1</span><span class="pun">()</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L6"><code class="language-javascript"><span class="pln">    alert</span><span class="pun">(</span><span class="kwd">this</span><span class="pun">.</span><span class="pln">value</span><span class="pun">);</span></code></li><li class="L7"><code class="language-javascript"><span class="pun">}</span></code></li><li class="L8"><code class="language-javascript"><span class="pln">window</span><span class="pun">.</span><span class="typ">Fun1</span><span class="pun">();</span><span class="pln">  </span><span class="com">//global 变量</span></code></li><li class="L9"><code class="language-javascript"><span class="typ">Fun1</span><span class="pun">.</span><span class="pln">call</span><span class="pun">(</span><span class="pln">window</span><span class="pun">);</span><span class="pln">  </span><span class="com">//global 变量</span></code></li><li class="L0"><code class="language-javascript"><span class="typ">Fun1</span><span class="pun">.</span><span class="pln">call</span><span class="pun">(</span><span class="pln">document</span><span class="pun">.</span><span class="pln">getElementById</span><span class="pun">(</span><span class="str">"myText"</span><span class="pun">));</span><span class="pln">  </span><span class="com">//input text</span></code></li><li class="L1"><code class="language-javascript"><span class="typ">Fun1</span><span class="pun">.</span><span class="pln">call</span><span class="pun">(</span><span class="kwd">new</span><span class="pln"> </span><span class="typ">Obj</span><span class="pun">());</span><span class="pln">  </span><span class="com">//对象</span></code></li></ol></pre>\
\
<p>通过上述代码，可以看出使用 call() 主要替换了函数中的 this 值；call() 可以传多个参数，从第二个开始作为参数传递给函数；代码如下：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-javascript"><span class="kwd">var</span><span class="pln"> first_object </span><span class="pun">=</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L1"><code class="language-javascript"><span class="pln">    num</span><span class="pun">:</span><span class="pln"> </span><span class="lit">42</span></code></li><li class="L2"><code class="language-javascript"><span class="pun">};</span></code></li><li class="L3"><code class="language-javascript"><span class="kwd">var</span><span class="pln"> second_object </span><span class="pun">=</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L4"><code class="language-javascript"><span class="pln">    num</span><span class="pun">:</span><span class="pln"> </span><span class="lit">24</span></code></li><li class="L5"><code class="language-javascript"><span class="pun">};</span></code></li><li class="L6"><code class="language-javascript"><span class="kwd">function</span><span class="pln"> multiply</span><span class="pun">(</span><span class="pln">mult</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L7"><code class="language-javascript"><span class="pln">    </span><span class="kwd">return</span><span class="pln"> </span><span class="kwd">this</span><span class="pun">.</span><span class="pln">num </span><span class="pun">*</span><span class="pln"> mult</span><span class="pun">;</span></code></li><li class="L8"><code class="language-javascript"><span class="pun">}</span></code></li><li class="L9"><code class="language-javascript"><span class="pln">multiply</span><span class="pun">.</span><span class="pln">call</span><span class="pun">(</span><span class="pln">first_object</span><span class="pun">,</span><span class="pln"> </span><span class="lit">5</span><span class="pun">);</span><span class="pln"> </span><span class="com">// returns 42 * 5</span></code></li><li class="L0"><code class="language-javascript"><span class="pln">multiply</span><span class="pun">.</span><span class="pln">call</span><span class="pun">(</span><span class="pln">second_object</span><span class="pun">,</span><span class="pln"> </span><span class="lit">5</span><span class="pun">);</span><span class="pln"> </span><span class="com">// returns 24 * 5</span></code></li></ol></pre>\
\
<p>对于apply()：</p>	本文对 JavaScript 中常用的知识点进行加以总结，以备不时之需。	165	0	2015-03-10 19:24:50	2015-03-10 19:24:50	[TOC]\
\
### 一、对变量值是否为 undefined 的判断\
\
（1）若关心的是变量是否声明而不是其值的话，最好使用 `in` ；如果使用 `typeof`，对于只声明而未初始化的变量其值为 "undefine"；\
\
```javascript\
// global scope\
var test;  // value: "undefined"\
"test" in window;  // true\
"tempTest" in window;  // false\
"undefine" === typeof test;  // true\
```\
\
（2）若关心的是变量是否声明或者其值是否为 "undefined" （一种情况是未初始化），使用 `typeof`；直接与 "undefined" 比较是有问题的，因为 "undefined" 可以被重写，而在 ECMA5 中已修复，不可重写；\
\
```javascript\
"undefined" === typeof test; // true\
window.undefined = "omg";\
"omg" === undefined;  // true\
```\
\
（3）注意：if 条件中的变量要先定义，否则会报 ReferenceError；\
\
<br>\
\
### 二、ECMA5 中的 bind() \
\
（1）作用：给调用函数中的 this 传递对象；考虑下面一种情况：\
\
```javascript\
this.x = 9; \
var module = {\
    x: 81,\
    getX: function() { \
        return this.x; \
    }\
};\
module.getX(); // 81\
\
var getX = module.getX;\
getX();  // 9, "this" refers to the global object\
\
// Create a new function with "this" bound to module\
var boundGetX = getX.bind(module);\
boundGetX(); // 81\
```\
\
（2）自定义实现 bind()\
\
```javascript\
if (!Function.prototype.bind) {\
    Function.prototype.bind = function (oThis) {\
        if (typeof this !== "function") {\
            // closest thing possible to the ECMAScript 5 internal IsCallable function\
           throw new TypeError("Function.prototype.bind - what is trying to be bound is not callable");\
        }\
\
        var aArgs = Array.prototype.slice.call(arguments, 1), \
            fToBind = this, \
            fNOP = function () {},\
            fBound = function () {\
                return fToBind.apply(this instanceof fNOP && oThis\
                                     ? this\
                                     : oThis || window,\
                                    aArgs.concat(Array.prototype.slice.call(arguments)));\
            };\
\
        fNOP.prototype = this.prototype;\
        fBound.prototype = new fNOP();\
\
        return fBound;\
    };\
}\
```\
\
（3）参考：[MDN bind()](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/Function/bind)  \
\
<br>\
### 三、call() 和 apply()\
\
```javascript\
<input type="text" id="myText" value="input text">\
function Obj(){\
    this.value = "对象！";\
}\
var value = "global 变量";\
function Fun1() {\
    alert(this.value);\
}\
window.Fun1();  //global 变量\
Fun1.call(window);  //global 变量\
Fun1.call(document.getElementById("myText"));  //input text\
Fun1.call(new Obj());  //对象\
```\
通过上述代码，可以看出使用 call() 主要替换了函数中的 this 值；call() 可以传多个参数，从第二个开始作为参数传递给函数；代码如下：\
\
```javascript\
var first_object = {\
    num: 42\
};\
var second_object = {\
    num: 24\
};\
function multiply(mult) {\
    return this.num * mult;\
}\
multiply.call(first_object, 5); // returns 42 * 5\
multiply.call(second_object, 5); // returns 24 * 5\
```\
\
对于apply()：
10	0	RainDon	前端笔试题汇总	front-end-interview-question	1	1		0	ImShengli	JAVASCRIPT				<div class="md-section-divider"></div>\
\
<p><div class="toc">\
<ul>\
<li><ul>\
<li><ul>\
<li><a href="#javascript">JavaScript</a></li>\
<li><a href="#css">CSS</a></li>\
<li><a href="#html">HTML</a></li>\
<li><a href="#算法">算法</a></li>\
<li><a href="#http">HTTP</a></li>\
<li><a href="#百度2015校园招聘前端笔试题西安站">百度2015校园招聘前端笔试题（西安站）</a></li>\
<li><a href="#参考链接">参考链接</a></li>\
</ul>\
</li>\
</ul>\
</li>\
</ul>\
</div>\
</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="javascript">JavaScript</h3>\
\
<p>1、跨域问题：</p>\
\
<p>为什么会有跨域？哪些实现跨域的方法？</p>\
\
<p>2、事件循环、事件委托：</p>\
\
<p>分别是什么？有什么作用？</p>\
\
<p>3、事件冒泡和事件捕获：</p>\
\
<p>4、闭包：</p>\
\
<p>什么是闭包？有什么作用？</p>\
\
<p>闭包中使用的变量需不需要考虑回收？如果要回收，可以怎么做？JavaScript中的<code>delete</code>可以删除吗？</p>\
\
<p>哪些类型的变量、属性是可以被<code>delete</code>删除的？</p>\
\
<p>5、继承：</p>\
\
<p>继承的原理？怎样实现继承？</p>\
\
<p>6、设计模式</p>\
\
<p>知道哪些设计模式？分别指的是什么？哪些地方可能会用到？</p>\
\
<p>7、性能优化</p>\
\
<p>8、基本数据类型，Array和String的基本函数</p>\
\
<p>9、正则基本使用</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="css">CSS</h3>\
\
<p>1、盒模型</p>\
\
<p>2、样式导入方式？有什么区别？</p>\
\
<p>3、解析优先级</p>\
\
<p>4、position定位：对于行内元素和块级元素设置后有什么区别？</p>\
\
<p>5、浮动：清除浮动的方式？</p>\
\
<p>6、BFC</p>\
\
<p>7、基本样式的写法：例如单行显示(...)、三角、清除浮动等；</p>\
\
<p>8、水平居中和垂直居中；</p>\
\
<p>9、兼容性；</p>\
\
<p>10、CSS3的新特性；</p>\
\
<p>11、如何实现跨屏适配？</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="html">HTML</h3>\
\
<p>1、HTML5的新特性；</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="算法">算法</h3>\
\
<p>1、数组去重</p>\
\
<p>2、快速排序</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="http">HTTP</h3>\
\
<p>1、HTTP 请求头和响应头</p>\
\
<p>2、缓存策略</p>\
\
<p>3、HTTP状态码</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="百度2015校园招聘前端笔试题西安站">百度2015校园招聘前端笔试题（西安站）</h3>\
\
<p>1、列举你所知道的HTML行内元素、块级元素和空(void)元素。(10分)</p>\
\
<p>2、请简述CSS加载方式link和@import的区别。(8分)</p>\
\
<p>3、请简述javascript延迟加载的方式。(10分)</p>\
\
<p>4、下列代码执行后，x、y、z的值各为多少？(12分)</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-javascript"><span class="kwd">var</span><span class="pln"> x </span><span class="pun">=</span><span class="pln"> </span><span class="lit">1</span><span class="pun">,</span><span class="pln"> y </span><span class="pun">=</span><span class="pln"> z </span><span class="pun">=</span><span class="pln"> </span><span class="lit">0</span><span class="pun">;</span></code></li><li class="L1"><code class="language-javascript"><span class="kwd">function</span><span class="pln"> add</span><span class="pun">(</span><span class="pln">n</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L2"><code class="language-javascript"><span class="pln">    </span><span class="kwd">return</span><span class="pln"> n </span><span class="pun">=</span><span class="pln"> n </span><span class="pun">+</span><span class="pln"> </span><span class="lit">1</span><span class="pun">;</span></code></li><li class="L3"><code class="language-javascript"><span class="pun">}</span></code></li><li class="L4"><code class="language-javascript"><span class="pln">y </span><span class="pun">=</span><span class="pln"> add</span><span class="pun">(</span><span class="pln">x</span><span class="pun">);</span></code></li><li class="L5"><code class="language-javascript"><span class="kwd">function</span><span class="pln"> add</span><span class="pun">(</span><span class="pln">n</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L6"><code class="language-javascript"><span class="pln">    </span><span class="kwd">return</span><span class="pln"> n </span><span class="pun">=</span><span class="pln"> n </span><span class="pun">+</span><span class="pln"> </span><span class="lit">3</span><span class="pun">;</span></code></li><li class="L7"><code class="language-javascript"><span class="pun">}</span></code></li><li class="L8"><code class="language-javascript"><span class="pln">z </span><span class="pun">=</span><span class="pln"> add</span><span class="pun">(</span><span class="pln">x</span><span class="pun">);</span></code></li></ol></pre>\
\
<p>5、试从域名解析原理的角度简单分析，域名劫持是怎么发生的？有什么危害？(20分)</p>\
\
<p>6、列举至少5种前端性能优化的具体方法，简要说明理由。(20分)</p>\
\
<p>7、用js实现如下功能，将给定的数字转化成千分位的格式，如把“10000”转化成“10,000”，并考虑到性能方面的因素。(20分)</p>\
\
<p>8、【附加题】介绍一个你做过的自认为最有挑战性的项目，可以但不限从以下方面进行描述：用到了哪些新技术？挑战点在哪里？过程中和结果的收获是什么？</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="参考链接">参考链接</h3>\
\
<ul>\
<li><a href="http://woerwosi.com/blog/" target="_blank">http://woerwosi.com/blog</a>        </li>\
</ul>	总结近几年各大公司的前端笔试试题，并加以汇总！	229	0	2016-01-21 21:43:12	2015-03-11 19:20:59	[TOC]\
\
### JavaScript\
\
1、跨域问题：\
\
为什么会有跨域？哪些实现跨域的方法？\
\
2、事件循环、事件委托：\
\
分别是什么？有什么作用？\
\
3、事件冒泡和事件捕获：\
\
4、闭包：\
\
什么是闭包？有什么作用？\
\
闭包中使用的变量需不需要考虑回收？如果要回收，可以怎么做？JavaScript中的`delete`可以删除吗？\
\
哪些类型的变量、属性是可以被`delete`删除的？\
\
5、继承：\
\
继承的原理？怎样实现继承？\
\
6、设计模式\
\
知道哪些设计模式？分别指的是什么？哪些地方可能会用到？\
\
7、性能优化\
\
8、基本数据类型，Array和String的基本函数\
\
9、正则基本使用\
\
### CSS\
\
1、盒模型\
\
2、样式导入方式？有什么区别？\
\
3、解析优先级\
\
4、position定位：对于行内元素和块级元素设置后有什么区别？\
\
5、浮动：清除浮动的方式？\
\
6、BFC\
\
7、基本样式的写法：例如单行显示(...)、三角、清除浮动等；\
\
8、水平居中和垂直居中；\
\
9、兼容性；\
\
10、CSS3的新特性；\
\
11、如何实现跨屏适配？\
\
### HTML\
\
1、HTML5的新特性；\
\
### 算法\
\
1、数组去重\
\
2、快速排序\
\
### HTTP\
\
1、HTTP 请求头和响应头\
\
2、缓存策略\
\
3、HTTP状态码\
\
### 百度2015校园招聘前端笔试题（西安站）\
\
1、列举你所知道的HTML行内元素、块级元素和空(void)元素。(10分)\
\
2、请简述CSS加载方式link和@import的区别。(8分)\
\
3、请简述javascript延迟加载的方式。(10分)\
\
4、下列代码执行后，x、y、z的值各为多少？(12分)\
\
```javascript\
var x = 1, y = z = 0;\
function add(n) {\
    return n = n + 1;\
}\
y = add(x);\
function add(n) {\
    return n = n + 3;\
}\
z = add(x);\
```\
\
5、试从域名解析原理的角度简单分析，域名劫持是怎么发生的？有什么危害？(20分)\
\
6、列举至少5种前端性能优化的具体方法，简要说明理由。(20分)\
\
7、用js实现如下功能，将给定的数字转化成千分位的格式，如把“10000”转化成“10,000”，并考虑到性能方面的因素。(20分)\
\
8、【附加题】介绍一个你做过的自认为最有挑战性的项目，可以但不限从以下方面进行描述：用到了哪些新技术？挑战点在哪里？过程中和结果的收获是什么？\
\
    \
\
### 参考链接\
\
- [http://woerwosi.com/blog](http://woerwosi.com/blog/)        
11	0	RainDon	[译文]优化网页加载速度	optimizing-page-load-time	1	1		0	die.net	网页优化				<div class="md-section-divider"></div>\
\
<p><div class="toc">\
<ul>\
</ul>\
</div>\
</p>\
\
<p>It is widely accepted that fast-loading pages improve the user experience. In recent years, many sites have started using AJAX techniques to reduce latency. Rather than round-trip through the server retrieving a completely new page with every click, often the browser can either alter the layout of the page instantly or fetch a small amount of HTML, XML, or javascript from the server and alter the existing page. In either case, this significantly decreases the amount of time between a user click and the browser finishing rendering the new content.</p>\
\
<p>However, for many sites that reference dozens of external objects, the majority of the page load time is spent in separate HTTP requests for images, javascript, and stylesheets. AJAX probably could help, but speeding up or eliminating these separate HTTP requests might help more, yet there isn't a common body of knowledge about how to do so.</p>\
\
<p>While working on optimizing page load times for a high-profile AJAX application, I had a chance to investigate how much I could reduce latency due to external objects. Specifically, I looked into how the HTTP client implementation in common browsers and characteristics of common Internet connections affect page load time for pages with many small objects.</p>\
\
<p>I found a few things to be interesting:</p>\
\
<ul>\
<li><p>IE, Firefox, and Safari ship with HTTP pipelining disabled by default; Opera is the only browser I know of that enables it. No pipelining means each request has to be answered and its connection freed up before the next request can be sent. This incurs average extra latency of the round-trip (ping) time to the user divided by the number of connections allowed. Or if your server has HTTP keepalives disabled, doing another TCP three-way handshake adds another round trip, doubling this latency.</p></li>\
<li><p>By default, IE allows only two outstanding connections per hostname when talking to HTTP/1.1 servers or eight-ish outstanding connections total. Firefox has similar limits. Using up to four hostnames instead of one will give you more connections. (IP addresses don't matter; the hostnames can all point to the same IP.)</p></li>\
<li><p>Most DSL or cable Internet connections have asymmetric bandwidth, at rates like 1.5Mbit down/128Kbit up, 6Mbit down/512Kbit up, etc. Ratios of download to upload bandwidth are commonly in the 5:1 to 20:1 range. This means that for your users, a request takes the same amount of time to send as it takes to receive an object of 5 to 20 times the request size. Requests are commonly around 500 bytes, so this should significantly impact objects that are smaller than maybe 2.5k to 10k. This means that serving small objects might mean the page load is bottlenecked on the users' upload bandwidth, as strange as that may sound.</p></li>\
</ul>\
\
<p>Using these, I came up with a model to guesstimate the effective bandwidth of users of various flavors of network connections when loading various object sizes. It assumes that each HTTP request is 500 bytes and that the HTTP reply includes 500 bytes of headers in addition to the object requested. It is simplistic and only covers connection limits and asymmetric bandwidth, and doesn't account for the TCP handshake of the first request of a persistent (keepalive) connection, which is amortized when requesting many objects from the same connection. Note that this is best-case effective bandwidth and doesn't include other limitations like TCP slow-start, packet loss, etc. The results are interesting enough to suggest avenues of exploration but are no substitute for actually measuring the difference with real browsers.</p>\
\
<p>To show the effect of keepalives and multiple hostnames, I simulated a user on net offering 1.5Mbit down/384Kbit up who is 100ms away with 0% packet loss. This roughly corresponds to medium-speed ADSL on the other side of the U.S. from your servers. Shown here is the effective bandwidth while loading a page with many objects of a given size, with effective bandwidth defined as total object bytes received divided by the time to receive them:</p>\
\
<p><img src="http://static.woerwosi.com/blog/images/2015/6/5/ebps_1500k_100ms.png" alt="" title=""></p>\
\
<p>Interesting things to note:</p>\
\
<ul>\
<li><p>For objects of relatively small size (the left-hand portion of the graph), you can see from the empty space above the plotted line how little of the user's downstream bandwidth is being used, even though the browser is requesting objects as fast as it can. This user has to be requesting objects larger than 100k before he's mostly filling his available downstream bandwidth.</p></li>\
<li><p>For objects under roughly 8k in size, you can double his effective bandwidth by turning keepalives on and spreading the requests over four hostnames. This is a huge win.</p></li>\
<li><p>If the user were to enable pipelining in his browser (such as setting Firefox's network.http.pipelining in about:config), the number of hostnames we use wouldn't matter, and he'd make even more effective use of his available bandwidth. But we can't control that server-side.</p></li>\
</ul>\
\
<p>Perhaps more clearly, the following is a graph of how much faster pages could load for an assortment of common access speeds and latencies with many external objects spread over four hostnames and keepalives enabled. Baseline (0%) is one hostname and keepalives disabled.</p>\
\
<p><img src="http://static.woerwosi.com/blog/images/2015/6/5/ebps_request_size.png" alt="" title=""></p>\
\
<p>Interesting things from that graph:</p>\
\
<ul>\
<li><p>If you load many objects smaller than 10k, both local users and ones on the other side of the world could see substantial improvement from enabling keepalives and spreading requests over 4 hostnames.</p></li>\
<li><p>There is a much greater improvement for users further away.</p></li>\
<li><p>This will matter more as access speeds increase. The user on 100meg ethernet only 20ms away from the server saw the biggest improvement.</p></li>\
</ul>\
\
<p>One more thing I examined was the effect of request size on effective bandwidth. The above graphs assumed 500 byte requests and 500 bytes of reply headers in addition to the object contents. How does changing that affect performance of our 1.5Mbit down/384Kbit up and 100ms away user, assuming we're already using four hostnames and keepalives?</p>\
\
<p><img src="http://static.woerwosi.com/blog/images/2015/6/5/ebps_speedup.png" alt="" title=""></p>\
\
<p>This shows that at small object sizes, we're bottlenecked on the upstream bandwidth. The browser sending larger requests (such as ones laden with lots of cookies) seems to slow the requests down by 40% worst-case for this user.</p>\
\
<p>As I've said, these graphs are based on a simulation and don't account for a number of real-world factors. But I've unscientifically verified the results with real browsers on real net and believe them to be a useful gauge. I'd like to find the time and resources to reproduce these using real data collected from real browsers over a range of object sizes, access speeds, and latencies.</p>\
\
<p>原文链接：<a href="http://www.die.net/musings/page_load_time/" target="_blank">Optimizing Page Load Time</a></p>	本文讲述如何加快网页的加载速度！	128	0	2015-07-03 20:48:29	2015-07-03 20:48:29	[TOC]\
\
It is widely accepted that fast-loading pages improve the user experience. In recent years, many sites have started using AJAX techniques to reduce latency. Rather than round-trip through the server retrieving a completely new page with every click, often the browser can either alter the layout of the page instantly or fetch a small amount of HTML, XML, or javascript from the server and alter the existing page. In either case, this significantly decreases the amount of time between a user click and the browser finishing rendering the new content.\
\
However, for many sites that reference dozens of external objects, the majority of the page load time is spent in separate HTTP requests for images, javascript, and stylesheets. AJAX probably could help, but speeding up or eliminating these separate HTTP requests might help more, yet there isn't a common body of knowledge about how to do so.\
\
While working on optimizing page load times for a high-profile AJAX application, I had a chance to investigate how much I could reduce latency due to external objects. Specifically, I looked into how the HTTP client implementation in common browsers and characteristics of common Internet connections affect page load time for pages with many small objects.\
\
I found a few things to be interesting:\
\
- IE, Firefox, and Safari ship with HTTP pipelining disabled by default; Opera is the only browser I know of that enables it. No pipelining means each request has to be answered and its connection freed up before the next request can be sent. This incurs average extra latency of the round-trip (ping) time to the user divided by the number of connections allowed. Or if your server has HTTP keepalives disabled, doing another TCP three-way handshake adds another round trip, doubling this latency.\
\
- By default, IE allows only two outstanding connections per hostname when talking to HTTP/1.1 servers or eight-ish outstanding connections total. Firefox has similar limits. Using up to four hostnames instead of one will give you more connections. (IP addresses don't matter; the hostnames can all point to the same IP.)\
\
- Most DSL or cable Internet connections have asymmetric bandwidth, at rates like 1.5Mbit down/128Kbit up, 6Mbit down/512Kbit up, etc. Ratios of download to upload bandwidth are commonly in the 5:1 to 20:1 range. This means that for your users, a request takes the same amount of time to send as it takes to receive an object of 5 to 20 times the request size. Requests are commonly around 500 bytes, so this should significantly impact objects that are smaller than maybe 2.5k to 10k. This means that serving small objects might mean the page load is bottlenecked on the users' upload bandwidth, as strange as that may sound.\
\
Using these, I came up with a model to guesstimate the effective bandwidth of users of various flavors of network connections when loading various object sizes. It assumes that each HTTP request is 500 bytes and that the HTTP reply includes 500 bytes of headers in addition to the object requested. It is simplistic and only covers connection limits and asymmetric bandwidth, and doesn't account for the TCP handshake of the first request of a persistent (keepalive) connection, which is amortized when requesting many objects from the same connection. Note that this is best-case effective bandwidth and doesn't include other limitations like TCP slow-start, packet loss, etc. The results are interesting enough to suggest avenues of exploration but are no substitute for actually measuring the difference with real browsers.\
\
To show the effect of keepalives and multiple hostnames, I simulated a user on net offering 1.5Mbit down/384Kbit up who is 100ms away with 0% packet loss. This roughly corresponds to medium-speed ADSL on the other side of the U.S. from your servers. Shown here is the effective bandwidth while loading a page with many objects of a given size, with effective bandwidth defined as total object bytes received divided by the time to receive them:\
\
![](http://static.woerwosi.com/blog/images/2015/6/5/ebps_1500k_100ms.png)\
\
Interesting things to note:\
\
- For objects of relatively small size (the left-hand portion of the graph), you can see from the empty space above the plotted line how little of the user's downstream bandwidth is being used, even though the browser is requesting objects as fast as it can. This user has to be requesting objects larger than 100k before he's mostly filling his available downstream bandwidth.\
\
- For objects under roughly 8k in size, you can double his effective bandwidth by turning keepalives on and spreading the requests over four hostnames. This is a huge win.\
\
- If the user were to enable pipelining in his browser (such as setting Firefox's network.http.pipelining in about:config), the number of hostnames we use wouldn't matter, and he'd make even more effective use of his available bandwidth. But we can't control that server-side.\
\
Perhaps more clearly, the following is a graph of how much faster pages could load for an assortment of common access speeds and latencies with many external objects spread over four hostnames and keepalives enabled. Baseline (0%) is one hostname and keepalives disabled.\
\
\
![](http://static.woerwosi.com/blog/images/2015/6/5/ebps_request_size.png)\
\
Interesting things from that graph:\
\
- If you load many objects smaller than 10k, both local users and ones on the other side of the world could see substantial improvement from enabling keepalives and spreading requests over 4 hostnames.\
\
- There is a much greater improvement for users further away.\
\
- This will matter more as access speeds increase. The user on 100meg ethernet only 20ms away from the server saw the biggest improvement.\
\
One more thing I examined was the effect of request size on effective bandwidth. The above graphs assumed 500 byte requests and 500 bytes of reply headers in addition to the object contents. How does changing that affect performance of our 1.5Mbit down/384Kbit up and 100ms away user, assuming we're already using four hostnames and keepalives?\
\
\
![](http://static.woerwosi.com/blog/images/2015/6/5/ebps_speedup.png)\
\
This shows that at small object sizes, we're bottlenecked on the upstream bandwidth. The browser sending larger requests (such as ones laden with lots of cookies) seems to slow the requests down by 40% worst-case for this user.\
\
As I've said, these graphs are based on a simulation and don't account for a number of real-world factors. But I've unscientifically verified the results with real browsers on real net and believe them to be a useful gauge. I'd like to find the time and resources to reproduce these using real data collected from real browsers over a range of object sizes, access speeds, and latencies.\
\
\
\
\
原文链接：[Optimizing Page Load Time](http://www.die.net/musings/page_load_time/)\

12	0	RainDon	[译文]请先思考五分钟	give-it-five-minutes	5	1		0	medium	Criticism				<div class="md-section-divider"></div>\
\
<p><div class="toc">\
<ul>\
<li><ul>\
<li><a href="#原文">【原文】</a></li>\
</ul>\
</li>\
</ul>\
</div>\
</p>\
\
<p>我过去是个鲁莽的人。每当别人说一些观点的时候，我都想方设法的表达不同的观点。如果与我的世界观相违背，我会毫不犹豫的去反驳。</p>\
\
<p>这好像是我首先要抛出某种观点，好比我必须得先说出点有意义的东西一样。但同时也意味着没有对某个问题作出深层次的思考。反应的越快，思考的越少。虽然不尽如此，但时常如此。</p>\
\
<p>我们嬉笑着谈论别人的膝跳反射时，总以为这种情况只有别人有，但其实你也有。如果你的邻居们无法控制膝跳反射，那么你也无法控制。</p>\
\
<p>故事发生在2007年，我当时在罗德岛州的普罗维登斯(Providence, RI)举行的一次商业创新工厂会议(Business Innovation Factory conference)上发言。Richard Saul Wurman那时也在。当我发言过后，Richard过来介绍他自己并夸赞我的演讲。他这番举动确实很慷慨大方，他完全没必要这么做。</p>\
\
<p>那么，我又是怎么回应的呢？我反而对他的演讲做了一番挑刺。其实当时他在台上演讲的时候，我就一直在记录哪些我不同意的观点。现在有机会和他当面谈，我就立即把我的一些看法跟他讲。我想当时我看起来肯定像个混蛋。</p>\
\
<p>但是他的回应却改变了我的一生。其实就是几句很简单的话，<strong>“哥们儿，就给它个五分钟吧！”</strong>他说。我问他到底什么意思，他说，不同意别人的观点很正常，反驳别人观点也很正常，有自己坚持的观点和坚定的信念是好事，但是我想说的是，给我的观点一点时间，能让你再感受一下它，然后再定夺你是否需要反驳它。<strong>“拿五分钟去仔细思考一下”</strong>，而不是立即就反驳它。事实证明他是对的，我来参加这次会议压根就是为了证明我自己，而却没想过要虚心学习一点什么东西。</p>\
\
<p>现在想起来，那真是我人生中的一个重大时刻。</p>\
\
<p>Richard把他整个职业生涯都用来思考这些问题，他研究了30年了，而我却只想了几分钟。诚然，也许真的是他错了而我是对的，但是在坚信自己是对的之前真的应该首先仔细深入思考一番。</p>\
\
<p>问问题和反驳之间也存在区别。反驳意味着你认为自己懂了，问问题表示你想知道。我们更应该多问。</p>\
\
<p>学习遇事先思考而不是先断言是够一个人一生追求的目标。这个目标确实很难，我现在还常常在不该脑子发热的时候却鲁莽行事。但是我也确实享受这个不断提升修炼自己的过程。</p>\
\
<p>如果你还是不确定为什么这很重要，可以思考一下苹果设计部高级副总裁说的一段关于乔布斯对敬畏创意(ideas)的话：</p>\
\
<blockquote class="white-blockquote">\
  <p>即便像乔布斯这样喜欢创意、喜欢做新奇玩意儿的人，他对创意的产生过程也保持着罕见和非同一般的敬畏之心。你看，我认为乔布斯比任何人都更加懂得，虽然创意最终可以变得无比强大，但在最初，它们却只是脆弱的、未经斟酌的想法，一不留神就会丢失、被妥协、被摧毁。</p>\
</blockquote>\
\
<p>这段话说得很深刻，创意真的是很脆弱的，它们刚开始都是如此不起眼，我们甚至都无法察觉到它的存在，它们是如此轻易就被忽略、跳过、丢失了。</p>\
\
<p>世界上有两样东西不需要技能：1、花别人的钱；2反对一种观点。</p>\
\
<p>反对别人的观点如此容易，它不需要消耗任何力气。对于一个观点，你可以嘲笑它，可以忽略它，也可以喷它，这些举动都是如此容易。而难的事情是如何去维护一个观点，去思考它，让它发酵，探索它，玩味它，尝试它。一个好的观点也许因为你的一些先入为主的看法就让它变成了一个糟糕的观点。</p>\
\
<p>所以下次当你听到什么，或者听到别人在谈论他的观点、在建议或力荐他们的观点，给它个五分钟。在反驳它之前，或者对他们说你无法理解或无力理解之前，先微微思考一下。不同意观点的做法可能是对的，但是别人的观点里或许有一些可以收获的东西呢，总之值得你这样做。</p>\
\
<hr>\
\
<div class="md-section-divider"></div>\
\
<h2 id="原文">【原文】</h2>\
\
<p>I used to be a hothead. Whenever anyone said anything, I'd think of a way to disagree. I'd push back hard if something didn't fit my world-view.</p>\
\
<p>It's like I had to be first with an opinion — as if being first meant something. But what it really meant was that I wasn't thinking hard enough about the problem. The faster you react, the less you think. Not always, but often.</p>\
\
<p>It's easy to talk about knee jerk reactions as if they are things that only other people have. You have them too. If your neighbor isn’t immune, neither are you.</p>\
\
<p>This came to a head back in 2007. I was speaking at the Business Innovation Factory conference in Providence, RI. So was Richard Saul Wurman. After my talk Richard came up to introduce himself and compliment my talk. That was very generous of him. He certainly didn't have to do that.</p>\
\
<p>And what did I do? I pushed back at him about the talk he gave. While he was making his points on stage, I was taking an inventory of the things I didn't agree with. And when presented with an opportunity to speak with him, I quickly pushed back at some of his ideas. I must have seemed like such an asshole.</p>\
\
<p>His response changed my life. It was a simple thing. He said “Man, give it five minutes.” I asked him what he meant by that? He said, it's fine to disagree, it's fine to push back, it's great to have strong opinions and beliefs, but give my ideas some time to set in before you're sure you want to argue against them. “Five minutes” represented “think”, not react. He was totally right. I came into the discussion looking to prove something, not learn something.</p>\
\
<p>This was a big moment for me.</p>\
\
<p>Richard has spent his career thinking about these problems. He's given it 30 years. And I gave it just a few minutes. Now, certainly he can be wrong and I could be right, but it's better to think deeply about something first before being so certain you’re right.</p>\
\
<p>There's also a difference between asking questions and pushing back. Pushing back means you already think you know. Asking questions means you want to know. Ask more questions.</p>\
\
<p>Learning to think first rather than react quick is a life long pursuit. It's tough. I still get hot sometimes when I shouldn't. But I'm really enjoying all the benefits of getting better.</p>\
\
<p>If you aren't sure why this is important, think about this quote from Jonathan Ive regarding Steve Jobs' reverence for ideas:</p>\
\
<blockquote class="white-blockquote">\
  <p>And just as Steve loved ideas, and loved making stuff, he treated the process of creativity with a rare and a wonderful reverence. You see, I think he better than anyone understood that while ideas ultimately can be so powerful, they begin as fragile, barely formed thoughts, so easily missed, so easily compromised, so easily just squished.</p>\
</blockquote>\
\
<p>That's deep. Ideas are fragile. They often start powerless. They're barely there, so easy to ignore or skip or miss.</p>\
\
<p>There are two things in this world that take no skill: 1. Spending other people's money and 2. Dismissing an idea.</p>\
\
<p>Dismissing an idea is so easy because it doesn't involve any work. You can scoff at it. You can ignore it. You can puff some smoke at it. That's easy. The hard thing to do is protect it, think about it, let it marinate, explore it, riff on it, and try it. The right idea could start out life as the wrong idea.</p>\
\
<p>So next time you hear something, or someone, talk about an idea, pitch an idea, or suggest an idea, give it five minutes. Think about it a little bit before pushing back, before saying it's too hard or it's too much work. Those things may be true, but there may be another truth in there too: It may be worth it.</p>	我过去是个鲁莽的人。每当别人说一些观点的时候，我都想方设法的表达不同的观点。如果与我的世界观相违背，我会毫不犹豫的去反驳。这好像是我首先要抛出某种观点，好比我必须得先说出点有意义的东西一样	47	0	2015-09-16 17:06:37	2015-09-16 17:06:37	[TOC]\
\
\
我过去是个鲁莽的人。每当别人说一些观点的时候，我都想方设法的表达不同的观点。如果与我的世界观相违背，我会毫不犹豫的去反驳。\
\
这好像是我首先要抛出某种观点，好比我必须得先说出点有意义的东西一样。但同时也意味着没有对某个问题作出深层次的思考。反应的越快，思考的越少。虽然不尽如此，但时常如此。\
\
我们嬉笑着谈论别人的膝跳反射时，总以为这种情况只有别人有，但其实你也有。如果你的邻居们无法控制膝跳反射，那么你也无法控制。\
\
故事发生在2007年，我当时在罗德岛州的普罗维登斯(Providence, RI)举行的一次商业创新工厂会议(Business Innovation Factory conference)上发言。Richard Saul Wurman那时也在。当我发言过后，Richard过来介绍他自己并夸赞我的演讲。他这番举动确实很慷慨大方，他完全没必要这么做。\
\
那么，我又是怎么回应的呢？我反而对他的演讲做了一番挑刺。其实当时他在台上演讲的时候，我就一直在记录哪些我不同意的观点。现在有机会和他当面谈，我就立即把我的一些看法跟他讲。我想当时我看起来肯定像个混蛋。\
\
但是他的回应却改变了我的一生。其实就是几句很简单的话，**“哥们儿，就给它个五分钟吧！”**他说。我问他到底什么意思，他说，不同意别人的观点很正常，反驳别人观点也很正常，有自己坚持的观点和坚定的信念是好事，但是我想说的是，给我的观点一点时间，能让你再感受一下它，然后再定夺你是否需要反驳它。**“拿五分钟去仔细思考一下”**，而不是立即就反驳它。事实证明他是对的，我来参加这次会议压根就是为了证明我自己，而却没想过要虚心学习一点什么东西。\
\
现在想起来，那真是我人生中的一个重大时刻。\
\
Richard把他整个职业生涯都用来思考这些问题，他研究了30年了，而我却只想了几分钟。诚然，也许真的是他错了而我是对的，但是在坚信自己是对的之前真的应该首先仔细深入思考一番。\
\
问问题和反驳之间也存在区别。反驳意味着你认为自己懂了，问问题表示你想知道。我们更应该多问。\
\
学习遇事先思考而不是先断言是够一个人一生追求的目标。这个目标确实很难，我现在还常常在不该脑子发热的时候却鲁莽行事。但是我也确实享受这个不断提升修炼自己的过程。\
\
如果你还是不确定为什么这很重要，可以思考一下苹果设计部高级副总裁说的一段关于乔布斯对敬畏创意(ideas)的话：\
\
> 即便像乔布斯这样喜欢创意、喜欢做新奇玩意儿的人，他对创意的产生过程也保持着罕见和非同一般的敬畏之心。你看，我认为乔布斯比任何人都更加懂得，虽然创意最终可以变得无比强大，但在最初，它们却只是脆弱的、未经斟酌的想法，一不留神就会丢失、被妥协、被摧毁。\
\
这段话说得很深刻，创意真的是很脆弱的，它们刚开始都是如此不起眼，我们甚至都无法察觉到它的存在，它们是如此轻易就被忽略、跳过、丢失了。\
\
世界上有两样东西不需要技能：1、花别人的钱；2反对一种观点。\
\
反对别人的观点如此容易，它不需要消耗任何力气。对于一个观点，你可以嘲笑它，可以忽略它，也可以喷它，这些举动都是如此容易。而难的事情是如何去维护一个观点，去思考它，让它发酵，探索它，玩味它，尝试它。一个好的观点也许因为你的一些先入为主的看法就让它变成了一个糟糕的观点。\
\
所以下次当你听到什么，或者听到别人在谈论他的观点、在建议或力荐他们的观点，给它个五分钟。在反驳它之前，或者对他们说你无法理解或无力理解之前，先微微思考一下。不同意观点的做法可能是对的，但是别人的观点里或许有一些可以收获的东西呢，总之值得你这样做。\
\
\
----------\
\
## 【原文】\
\
I used to be a hothead. Whenever anyone said anything, I'd think of a way to disagree. I'd push back hard if something didn't fit my world-view.\
\
It's like I had to be first with an opinion — as if being first meant something. But what it really meant was that I wasn't thinking hard enough about the problem. The faster you react, the less you think. Not always, but often.\
\
It's easy to talk about knee jerk reactions as if they are things that only other people have. You have them too. If your neighbor isn’t immune, neither are you.\
\
This came to a head back in 2007. I was speaking at the Business Innovation Factory conference in Providence, RI. So was Richard Saul Wurman. After my talk Richard came up to introduce himself and compliment my talk. That was very generous of him. He certainly didn't have to do that.\
\
And what did I do? I pushed back at him about the talk he gave. While he was making his points on stage, I was taking an inventory of the things I didn't agree with. And when presented with an opportunity to speak with him, I quickly pushed back at some of his ideas. I must have seemed like such an asshole.\
\
His response changed my life. It was a simple thing. He said “Man, give it five minutes.” I asked him what he meant by that? He said, it's fine to disagree, it's fine to push back, it's great to have strong opinions and beliefs, but give my ideas some time to set in before you're sure you want to argue against them. “Five minutes” represented “think”, not react. He was totally right. I came into the discussion looking to prove something, not learn something.\
\
This was a big moment for me.\
\
Richard has spent his career thinking about these problems. He's given it 30 years. And I gave it just a few minutes. Now, certainly he can be wrong and I could be right, but it's better to think deeply about something first before being so certain you’re right.\
\
There's also a difference between asking questions and pushing back. Pushing back means you already think you know. Asking questions means you want to know. Ask more questions.\
\
Learning to think first rather than react quick is a life long pursuit. It's tough. I still get hot sometimes when I shouldn't. But I'm really enjoying all the benefits of getting better.\
\
If you aren't sure why this is important, think about this quote from Jonathan Ive regarding Steve Jobs' reverence for ideas:\
\
> And just as Steve loved ideas, and loved making stuff, he treated the process of creativity with a rare and a wonderful reverence. You see, I think he better than anyone understood that while ideas ultimately can be so powerful, they begin as fragile, barely formed thoughts, so easily missed, so easily compromised, so easily just squished.\
\
That's deep. Ideas are fragile. They often start powerless. They're barely there, so easy to ignore or skip or miss.\
\
There are two things in this world that take no skill: 1. Spending other people's money and 2. Dismissing an idea.\
\
Dismissing an idea is so easy because it doesn't involve any work. You can scoff at it. You can ignore it. You can puff some smoke at it. That's easy. The hard thing to do is protect it, think about it, let it marinate, explore it, riff on it, and try it. The right idea could start out life as the wrong idea.\
\
So next time you hear something, or someone, talk about an idea, pitch an idea, or suggest an idea, give it five minutes. Think about it a little bit before pushing back, before saying it's too hard or it's too much work. Those things may be true, but there may be another truth in there too: It may be worth it.\
\
        
14	0	RainDon	Linux基本命令总结	linux-basic-command	1	1		0	ImShengli	Linux				<div class="md-section-divider"></div>\
\
<p><div class="toc">\
<ul>\
<li><ul>\
<li><ul>\
<li><a href="#cd命令change-directory">cd命令（Change Directory）</a></li>\
<li><a href="#pwd命令print-working-directory">pwd命令（Print Working Directory）</a></li>\
<li><a href="#ls命令list">ls命令（List）</a></li>\
<li><a href="#mkdir命令make-directory">mkdir命令（Make Directory）</a></li>\
<li><a href="#tar命令tape-archive">tar命令（Tape Archive）</a></li>\
</ul>\
</li>\
</ul>\
</li>\
</ul>\
</div>\
</p>\
\
<blockquote class="white-blockquote">\
  <p>本文只是总结Linux中较为常用的命令，对于一些命令的详解后续会给出单独的文章或者链接；</p>\
</blockquote>\
\
<div class="md-section-divider"></div>\
\
<h3 id="cd命令change-directory">cd命令（Change Directory）</h3>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="com">// 功能：进入到某个目录；</span></code></li><li class="L1"><code><span class="com">// 使用示例：</span></code></li><li class="L2"><code><span class="pln">cd </span><span class="pun">或</span><span class="pln"> cd </span><span class="pun">~</span><span class="pln"> </span><span class="pun">:</span><span class="pln"> </span><span class="pun">进入当前用户的主目录；</span></code></li><li class="L3"><code><span class="pln">cd </span><span class="pun">/</span><span class="pln"> </span><span class="pun">:</span><span class="pln"> </span><span class="pun">进入到根目录；</span><span class="pln"> </span></code></li><li class="L4"><code><span class="pln">cd </span><span class="pun">..</span><span class="pln"> </span><span class="pun">：进入到上级目录，如果目前是根目录，则不变；</span></code></li><li class="L5"><code><span class="pln">cd </span><span class="pun">…</span><span class="pln"> </span><span class="pun">：进入到上级目录的上级目录（与具体的</span><span class="typ">Shell</span><span class="pun">有关）；</span></code></li><li class="L6"><code><span class="pln">cd </span><span class="pun">../../../</span><span class="pln"> </span><span class="pun">：依次进入到上级目录；</span></code></li><li class="L7"><code><span class="pln">cd </span><span class="pun">../</span><span class="pln">folder_name </span><span class="pun">:</span><span class="pln"> </span><span class="pun">进入上级目录下的某个目录；</span></code></li><li class="L8"><code><span class="pln">cd folder_name </span><span class="pun">：进入当前目录的某个文件夹下；</span></code></li><li class="L9"><code><span class="pln">cd </span><span class="pun">/</span><span class="pln">folder_name</span><span class="pun">/</span><span class="pln">folder_name </span><span class="pun">：从根目录开始进入到某个目录；</span></code></li><li class="L0"><code><span class="pln">cd </span><span class="pun">-</span><span class="pln"> </span><span class="pun">：返回到进入此目录之前所在的目录；</span></code></li><li class="L1"><code><span class="pln">cd </span><span class="pun">!</span><span class="pln">$ </span><span class="pun">：执行上条命令；</span></code></li></ol></pre>\
\
<div class="md-section-divider"></div>\
\
<h3 id="pwd命令print-working-directory">pwd命令（Print Working Directory）</h3>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="com">// 功能：查看当前工作目录的完整路径；</span></code></li><li class="L1"><code><span class="com">// 参数：</span></code></li><li class="L2"><code><span class="pun">-</span><span class="pln">P </span><span class="pun">:</span><span class="pln"> </span><span class="pun">如果目录是链接时，显示出实际路径，而非使用链接（</span><span class="pln">link</span><span class="pun">）路径；</span></code></li><li class="L3"><code><span class="pun">-</span><span class="pln">L </span><span class="pun">:</span><span class="pln"> </span><span class="pun">如果目录是链接时，显示出链接路径；</span></code></li><li class="L4"><code><span class="com">// 注意：如果在一个目录中删除了这个目录，pwd依然会显示删除的这个目录，而使用/bin/pwd则会报错！        </span></code></li></ol></pre>\
\
<div class="md-section-divider"></div>\
\
<h3 id="ls命令list">ls命令（List）</h3>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="com">// 功能：显示文件夹下的文件；</span></code></li><li class="L1"><code><span class="com">// 参数：</span></code></li><li class="L2"><code><span class="pun">-</span><span class="pln">a </span><span class="pun">：显示所有文件；</span></code></li><li class="L3"><code><span class="com">// ll ：是 ls -l 的缩写；</span></code></li><li class="L4"><code><span class="pun">&gt;</span><span class="pln"> ll</span></code></li><li class="L5"><code><span class="pun">&gt;</span><span class="pln"> drwxr</span><span class="pun">-</span><span class="pln">xr</span><span class="pun">-</span><span class="pln">x  </span><span class="lit">175</span><span class="pln"> root  staff   </span><span class="lit">5.8K</span><span class="pln"> </span><span class="lit">10</span><span class="pln"> </span><span class="lit">11</span><span class="pln"> </span><span class="lit">10</span><span class="pun">:</span><span class="lit">52</span><span class="pln"> node_modules</span></code></li><li class="L6"><code><span class="com">/*</span></code></li><li class="L7"><code><span class="com">对于上面的输出，各个字段的意义如下：</span></code></li><li class="L8"><code><span class="com">第一个字符，表示文件类型，- 表示普通文件，d 表示目录，l 表示符号链接，b 表示块设备文件，c 表示字符设备文件；</span></code></li><li class="L9"><code><span class="com">紧接着是3*3个字符分三组，各指示此文件的读、写、执行权限，对于owner、group、others而言；</span></code></li><li class="L0"><code><span class="com">接下来表示文件个数；然后是拥有者；然后是所属组；然后是文件大小；然后是最后修改时间；然后是文件或文件夹名；</span></code></li><li class="L1"><code><span class="com">*/</span></code></li></ol></pre>\
\
<div class="md-section-divider"></div>\
\
<h3 id="mkdir命令make-directory">mkdir命令（Make Directory）</h3>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="com">// 功能：创建指定名称的目录；</span></code></li><li class="L1"><code><span class="com">// 条件：当前用户在当前目录中有写的权限；</span></code></li><li class="L2"><code><span class="com">// 参数：</span></code></li><li class="L3"><code><span class="pun">-</span><span class="pln">p</span><span class="pun">：可以一次创建多个目录；</span></code></li><li class="L4"><code><span class="pun">-</span><span class="pln">v</span><span class="pun">：显示创建信息；</span></code></li><li class="L5"><code><span class="pun">-</span><span class="pln">m</span><span class="pun">：设置权限模式，例如：</span><span class="pln">mkdir </span><span class="pun">-</span><span class="pln">m </span><span class="lit">777</span><span class="pln"> folder_name</span></code></li><li class="L6"><code><span class="com">// 高级用法：</span></code></li><li class="L7"><code><span class="pln">mkdir </span><span class="pun">-</span><span class="pln">vp scf</span><span class="pun">/{</span><span class="pln">lib</span><span class="pun">/,</span><span class="pln">bin</span><span class="pun">/,</span><span class="pln">doc</span><span class="pun">/{</span><span class="pln">info</span><span class="pun">,</span><span class="pln">product</span><span class="pun">},</span><span class="pln">logs</span><span class="pun">/{</span><span class="pln">info</span><span class="pun">,</span><span class="pln">product</span><span class="pun">},</span><span class="pln">service</span><span class="pun">/</span><span class="pln">deploy</span><span class="pun">/{</span><span class="pln">info</span><span class="pun">,</span><span class="pln">product</span><span class="pun">}}</span><span class="pln"> </span><span class="com">// 创建目录结构</span></code></li></ol></pre>\
\
<div class="md-section-divider"></div>\
\
<h3 id="tar命令tape-archive">tar命令（Tape Archive）</h3>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="com">// 功能：打包和解包；tar本身不具备压缩功能，是调用别的压缩功能实现的；从全称可以看出，tar最初的设计目的是将文件备份到磁带上；</span></code></li><li class="L1"><code><span class="com">// 参数：</span></code></li><li class="L2"><code><span class="pun">-</span><span class="pln">c</span><span class="pun">：建立新的压缩文件，打包；</span></code></li><li class="L3"><code><span class="pun">-</span><span class="pln">x</span><span class="pun">：从压缩文件中提取文件，解包；</span></code></li><li class="L4"><code><span class="pun">-</span><span class="pln">t</span><span class="pun">：查看</span><span class="pln">tar</span><span class="pun">包中的文件；</span><span class="com">// c, x, t 在一条tar命令只可存在一个</span></code></li><li class="L5"><code><span class="pun">-</span><span class="pln">v</span><span class="pun">：显示执行过程；</span></code></li><li class="L6"><code><span class="pun">-</span><span class="pln">z</span><span class="pun">：支持</span><span class="pln">gzip</span><span class="pun">解压文件；</span></code></li><li class="L7"><code><span class="pun">-</span><span class="pln">f</span><span class="pun">：指定文件，直接跟文件，保证为最后一个参数；</span></code></li><li class="L8"><code><span class="com">// 示例：</span></code></li><li class="L9"><code><span class="pln">tar </span><span class="pun">-</span><span class="pln">xzf fileName</span><span class="pun">.</span><span class="pln">tar </span><span class="com">// 解压文件</span></code></li><li class="L0"><code><span class="com">// 说明：打包和压缩的区别，打包是将一大堆文件或目录变成一个总的文件，压缩将一个大的文件通过一些压缩算法变成一个小文件。</span></code></li></ol></pre>	Linux中的命令的确非常多，尤其在参数选择上。但是玩过Linux的人也从来不会因为Linux的命令如此之多而烦恼，因为我们只需要掌握最常用的命令即可。因为不想在使用是总是东查西找，所以在此总结一下，方便一下以后的查看。	18	0	2015-10-20 09:30:02	2015-10-11 14:31:59	[TOC]\
\
>本文只是总结Linux中较为常用的命令，对于一些命令的详解后续会给出单独的文章或者链接；\
\
### cd命令（Change Directory）\
```\
// 功能：进入到某个目录；\
// 使用示例：\
cd 或 cd ~ : 进入当前用户的主目录；\
cd / : 进入到根目录； \
cd .. ：进入到上级目录，如果目前是根目录，则不变；\
cd … ：进入到上级目录的上级目录（与具体的Shell有关）；\
cd ../../../ ：依次进入到上级目录；\
cd ../folder_name : 进入上级目录下的某个目录；\
cd folder_name ：进入当前目录的某个文件夹下；\
cd /folder_name/folder_name ：从根目录开始进入到某个目录；\
cd - ：返回到进入此目录之前所在的目录；\
cd !$ ：执行上条命令；\
``` \
\
### pwd命令（Print Working Directory）\
```\
// 功能：查看当前工作目录的完整路径；\
// 参数：\
-P : 如果目录是链接时，显示出实际路径，而非使用链接（link）路径；\
-L : 如果目录是链接时，显示出链接路径；\
// 注意：如果在一个目录中删除了这个目录，pwd依然会显示删除的这个目录，而使用/bin/pwd则会报错！        \
```\
\
### ls命令（List）\
```\
// 功能：显示文件夹下的文件；\
// 参数：\
-a ：显示所有文件；\
// ll ：是 ls -l 的缩写；\
> ll\
> drwxr-xr-x  175 root  staff   5.8K 10 11 10:52 node_modules\
/*\
对于上面的输出，各个字段的意义如下：\
第一个字符，表示文件类型，- 表示普通文件，d 表示目录，l 表示符号链接，b 表示块设备文件，c 表示字符设备文件；\
紧接着是3*3个字符分三组，各指示此文件的读、写、执行权限，对于owner、group、others而言；\
接下来表示文件个数；然后是拥有者；然后是所属组；然后是文件大小；然后是最后修改时间；然后是文件或文件夹名；\
*/\
```       \
\
### mkdir命令（Make Directory）\
```\
// 功能：创建指定名称的目录；\
// 条件：当前用户在当前目录中有写的权限；\
// 参数：\
-p：可以一次创建多个目录；\
-v：显示创建信息；\
-m：设置权限模式，例如：mkdir -m 777 folder_name\
// 高级用法：\
mkdir -vp scf/{lib/,bin/,doc/{info,product},logs/{info,product},service/deploy/{info,product}} // 创建目录结构\
```        \
\
### tar命令（Tape Archive）\
```\
// 功能：打包和解包；tar本身不具备压缩功能，是调用别的压缩功能实现的；从全称可以看出，tar最初的设计目的是将文件备份到磁带上；\
// 参数：\
-c：建立新的压缩文件，打包；\
-x：从压缩文件中提取文件，解包；\
-t：查看tar包中的文件；// c, x, t 在一条tar命令只可存在一个\
-v：显示执行过程；\
-z：支持gzip解压文件；\
-f：指定文件，直接跟文件，保证为最后一个参数；\
// 示例：\
tar -xzf fileName.tar // 解压文件\
// 说明：打包和压缩的区别，打包是将一大堆文件或目录变成一个总的文件，压缩将一个大的文件通过一些压缩算法变成一个小文件。\
```
15	0	RainDon	十一下厨小记	national-day-go-cooking	5	1		0	ImShengli	Cook				<div class="md-section-divider"></div>\
\
<p><div class="toc">\
<ul>\
<li><ul>\
<li><ul>\
<li><a href="#101-可乐鸡翅">10.1 可乐鸡翅</a></li>\
<li><a href="#102-葱花鸡蛋饼">10.2 葱花鸡蛋饼</a></li>\
<li><a href="#104-土豆鸡块">10.4 土豆鸡块</a></li>\
</ul>\
</li>\
</ul>\
</li>\
</ul>\
</div>\
</p>\
\
<p>人的基本需求是人前进的最大动力。比如为了写博客，卖弄一下自己的知识，但胸中无墨难以下笔，就只好多读书喽。而如今走出校园、进入社会，吃饭成了基本需求，这不要开始研究厨艺慰藉要“举兵起义”的肠胃。这也应了胜利·张·托洛夫斯基<a href="#fn:footnote" id="fnref:footnote" title="查看注脚" class="footnote">[1]</a>的那句话：“人什么都可以都不会，但是不能不会做饭”！</p>\
\
<p>凑着十一小长假，小小的研究了一把如何做饭。给自己定的初级目标是：不管哪一样，最起码要做熟；与此同时也引起了另外一个严重的后果：熟过了！不过也不是每一次都这样了，做同一道菜，第二次还是比第一次有不少的进步的！我是相信10000小时法则的，哈！^_^</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="101-可乐鸡翅">10.1 可乐鸡翅</h3>\
\
<p>其实可乐鸡翅算是很简单的一道菜了，可是看了几个做菜风格迥异的视频之后，也不知道如何下手了。淹一下和用热水过一下，都是为了去腥，结果做的时候这两样都做了。</p>\
\
<p><img src="https://dn-woerwosi.qbox.me/blog/images/2015/9/2/cook_1.jpg" alt="可乐鸡翅进行中" title=""></p>\
\
<p>另外一个问题就是第一次做的鸡翅有点硬了，分析原因可能是煎制的过程可能时间有点长了。不管怎样，熟了，可以吃了！</p>\
\
<p><img src="https://dn-woerwosi.qbox.me/blog/images/2015/9/2/cook_2.jpg" alt="制作好的可乐鸡翅" title=""></p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="102-葱花鸡蛋饼">10.2 葱花鸡蛋饼</h3>\
\
<p>葱花鸡蛋饼倒也简单；葱花、鸡蛋、淀粉，加水搅拌成稍稀些；在倒入锅中时，稍微倒上一层即可，倒多了如果不均匀就不好了；等到两面煎制金黄即可。图中的明显不均匀！</p>\
\
<p><img src="https://dn-woerwosi.qbox.me/blog/images/2015/9/2/cook_3.jpg" alt="葱花鸡蛋饼煎制中" title=""></p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="104-土豆鸡块">10.4 土豆鸡块</h3>\
\
<p>做土豆鸡块和可乐鸡翅有相似之处，都要先对鸡肉进行去腥，先炒肉，后放入蔬菜，加入水煮到剩余少许水，收汁即可。</p>\
\
<p><img src="https://dn-woerwosi.qbox.me/blog/images/2015/9/2/cook_4.jpg" alt="土豆鸡块制作中" title=""></p>\
\
<p>好了，一个假期也就基本上学了这三样，以后要多多努力了！最后一点体会：<span style="color:red"><strong>买个好锅</strong></span>！</p>\
\
<div class="footnotes">\
<hr>\
<small>\
\
<span id="fn:footnote">[1] </span>这是高中同学恶搞的俄文名； <a href="#fnref:footnote" title="回到文稿" class="reversefootnote">↩</a><br>\
\
</small>\
</div>	人的基本需求是人前进的最大动力。比如为了写博客，卖弄一下自己的知识，但胸中无墨难以下笔，只好多读书喽。而如今走出校园、进入社会，吃饭成了基本需求，这不要开始研究厨艺慰藉要“举兵起义”的肠胃。	32	0	2015-10-13 22:53:48	2015-10-13 21:26:08	[TOC]\
\
人的基本需求是人前进的最大动力。比如为了写博客，卖弄一下自己的知识，但胸中无墨难以下笔，就只好多读书喽。而如今走出校园、进入社会，吃饭成了基本需求，这不要开始研究厨艺慰藉要“举兵起义”的肠胃。这也应了胜利·张·托洛夫斯基[^footnote]的那句话：“人什么都可以都不会，但是不能不会做饭”！\
\
凑着十一小长假，小小的研究了一把如何做饭。给自己定的初级目标是：不管哪一样，最起码要做熟；与此同时也引起了另外一个严重的后果：熟过了！不过也不是每一次都这样了，做同一道菜，第二次还是比第一次有不少的进步的！我是相信10000小时法则的，哈！^_^\
\
### 10.1 可乐鸡翅\
\
其实可乐鸡翅算是很简单的一道菜了，可是看了几个做菜风格迥异的视频之后，也不知道如何下手了。淹一下和用热水过一下，都是为了去腥，结果做的时候这两样都做了。\
\
![可乐鸡翅进行中][1]\
\
另外一个问题就是第一次做的鸡翅有点硬了，分析原因可能是煎制的过程可能时间有点长了。不管怎样，熟了，可以吃了！\
\
![制作好的可乐鸡翅][2]\
\
\
[1]: https://dn-woerwosi.qbox.me/blog/images/2015/9/2/cook_1.jpg\
\
[2]: https://dn-woerwosi.qbox.me/blog/images/2015/9/2/cook_2.jpg\
\
### 10.2 葱花鸡蛋饼\
\
葱花鸡蛋饼倒也简单；葱花、鸡蛋、淀粉，加水搅拌成稍稀些；在倒入锅中时，稍微倒上一层即可，倒多了如果不均匀就不好了；等到两面煎制金黄即可。图中的明显不均匀！\
\
![葱花鸡蛋饼煎制中][3]\
\
[3]: https://dn-woerwosi.qbox.me/blog/images/2015/9/2/cook_3.jpg\
\
### 10.4 土豆鸡块\
\
做土豆鸡块和可乐鸡翅有相似之处，都要先对鸡肉进行去腥，先炒肉，后放入蔬菜，加入水煮到剩余少许水，收汁即可。\
\
![土豆鸡块制作中][4]\
\
[4]: https://dn-woerwosi.qbox.me/blog/images/2015/9/2/cook_4.jpg\
\
好了，一个假期也就基本上学了这三样，以后要多多努力了！最后一点体会：<span style="color:red">**买个好锅**</span>！\
\
[^footnote]:这是高中同学恶搞的俄文名；
16	0	RainDon	V2015.0 页面改版说明	version-2015-0-page-visual-change	1	1		0	ImShengli	Woerwosi				<div class="md-section-divider"></div>\
\
<p><div class="toc">\
<ul>\
<li><ul>\
<li><ul>\
<li><a href="#改版说明">改版说明</a></li>\
<li><a href="#改版内容">改版内容</a></li>\
<li><a href="#内容说明">内容说明</a></li>\
<li><a href="#其它说明">其它说明</a></li>\
<li><a href="#附改版效果图">附：改版效果图</a></li>\
</ul>\
</li>\
</ul>\
</li>\
</ul>\
</div>\
</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="改版说明">改版说明</h3>\
\
<p>本站2015版（编号：Version 2015.0）已基本开发完成并上线；由于定位于博客类型，内容分享为主，故设计此版时主要考虑如何让用户更加注重于页面内容，力求简洁大方；内容类型上，不作特殊限制。</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="改版内容">改版内容</h3>\
\
<p>本次改版涉及到以下几个方面： <br>\
（1）页面显示效果上力求简洁大方； <br>\
（2）对文章类型不作过多的分类，以标签涵盖； <br>\
（3）页面实现静态化（WIKI页面除外）； <br>\
（4）使用<code>https</code>安全协议； <br>\
（5）图片托管于七牛； <br>\
（6）评论系统采用<code>Disqus</code>； <br>\
（7）扫一扫：加我微信；</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="内容说明">内容说明</h3>\
\
<p>关于文章内容： <br>\
（1）文章更新频率约每周一篇； <br>\
（2）内容主要为前端方面； <br>\
（3）WIKI：是对有关方面知识的集锦；</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="其它说明">其它说明</h3>\
\
<p>本次改版中遗留的几个问题： <br>\
（1）由于文章较少，搜索功能不可用； <br>\
（2）部分标签尚无内容，仅作预留标签；</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="附改版效果图">附：改版效果图</h3>\
\
<p><img src="https://dn-woerwosi.qbox.me/blog/images/2015/10/5/mywebsite-version2015.png" alt="此处输入图片的描述" title=""></p>	本站2015版（编号：Version 2015.0）已基本开发完成并上线；由于定位于博客类型，内容分享为主，故设计此版时主要考虑如何让用户更加注重于页面内容，力求简洁大方；内容类型上，不作特殊限制。	22	0	2015-12-13 12:09:58	2015-10-18 18:33:59	[TOC]\
\
### 改版说明\
\
本站2015版（编号：Version 2015.0）已基本开发完成并上线；由于定位于博客类型，内容分享为主，故设计此版时主要考虑如何让用户更加注重于页面内容，力求简洁大方；内容类型上，不作特殊限制。\
\
### 改版内容 \
\
本次改版涉及到以下几个方面：\
（1）页面显示效果上力求简洁大方；\
（2）对文章类型不作过多的分类，以标签涵盖；\
（3）页面实现静态化（WIKI页面除外）；\
（4）使用`https`安全协议；\
（5）图片托管于七牛；\
（6）评论系统采用`Disqus`；\
（7）扫一扫：加我微信；\
\
### 内容说明\
\
关于文章内容：\
（1）文章更新频率约每周一篇；\
（2）内容主要为前端方面；\
（3）WIKI：是对有关方面知识的集锦；\
\
### 其它说明\
\
本次改版中遗留的几个问题：\
（1）由于文章较少，搜索功能不可用；\
（2）部分标签尚无内容，仅作预留标签；\
\
### 附：改版效果图\
\
![此处输入图片的描述][1]\
\
[1]: https://dn-woerwosi.qbox.me/blog/images/2015/10/5/mywebsite-version2015.png        
17	0	RainDon	页面性能影响因素概述	web-performance-factors	1	1		0	ImShengli	性能				<div class="md-section-divider"></div>\
\
<p><div class="toc">\
<ul>\
<li><ul>\
<li><ul>\
<li><a href="#时间都去哪儿了">时间都去哪儿了</a></li>\
<li><a href="#网络传输">网络传输</a></li>\
<li><a href="#服务器处理">服务器处理</a></li>\
<li><a href="#客户端处理">客户端处理</a></li>\
<li><a href="#总结">总结</a></li>\
</ul>\
</li>\
</ul>\
</li>\
</ul>\
</div>\
</p>\
\
<blockquote class="white-blockquote">\
  <p>前言：对于站点来说，越快的把用户请求的页面内容呈现给用户，对用户的体验越好；此时的“越快”问题便是站点性能优化问题，性能优化问题具体包含哪些问题呢？针对每个性能优化点有哪些解决方案呢？在本篇文章中将予以概述；需要注意的是，本篇并不会深入每个问题的细节，而对于每个问题都需要大量的精力去深入研究。</p>\
</blockquote>\
\
<div class="md-section-divider"></div>\
\
<h3 id="时间都去哪儿了">时间都去哪儿了</h3>\
\
<p>借用歌名《时间都去哪儿了》并非为了故弄玄虚，在用户发起请求到看到相关内容，这之间的时间差中都发生了什么呢？考虑一种最简单的情况，一个请求只返回一个HTML页面；当我们发起此请求时，将大致经历以下三个方面的时间消耗：</p>\
\
<p>（1）网络传输：包括两个方面，把请求发送给服务器和服务器把响应数据返回给用户； <br>\
（2）服务器处理时间：服务器接到请求后，准备响应数据消耗的时间； <br>\
（3）客户端处理时间：如果客户端是浏览器，则为浏览器根据响应内容生成相应页面的时间；</p>\
\
<blockquote class="white-blockquote">\
  <p>注：除此以外，可能还包括DNS解析的时间、建立HTTP连接的时间、根据用户输入生成请求数据包的时间等，这些暂不考虑。</p>\
</blockquote>\
\
<p>上述假定的是只需要加载一个HTML资源，更为现实情况是站点通常需要加载不同类型的多个资源（如图片、样式文件、JS文件等），如果对每个资源都需建立HTTP连接，这无疑又增加了页面全部加载所需要的时间；另外需要考虑的是页面资源加载是否并行、是否阻塞加载等；对于这部分内容一般由前端工程师负责。</p>\
\
<p>提高网站性能的关键是<strong>找出瓶颈在哪里</strong>，可通过相关压力测试进行分析；本文并不会假定瓶颈可能出现的地方，只是从上述三个方面将可以优化的点加以概述。</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="网络传输">网络传输</h3>\
\
<p>影响网络传输的两个因素是带宽和传输数据量的大小，这里的带宽指的是服务器端的带宽；对于这两个方面可通过提高服务器网络带宽和优化压缩代码予以改进；</p>\
\
<p>（1）在网络带宽方面，除了服务器方面，用户自己的带宽对其自身的用户体验也很重要；作为开发人员，对此就心有余而力不足了！ <br>\
（2）在优化压缩代码层面，可以改进的点包括优化HTML结构、精简CSS代码、使用更加短小精悍的JS库（如使用Zepto代替jQuery）、压缩HTML、CSS、JS代码；另一个可以优化的点为<strong>请求和响应的头（header）</strong>，例如可以缩小Cookie的体积；最后需要提示的是：<strong>尽管可能这部分优化的非常好，但相对于其它的影响站点性能的因素，这部分优化可能并不足以对网站性能有显著的改善，这需要在需要优化的点和其对性能的提升上把握平衡</strong>。</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="服务器处理">服务器处理</h3>\
\
<p>服务器端要根据用户的请求进行业务逻辑计算，而后把响应内容进行输出，在此先梳理一下服务器接到请求到返回数据这段时间内都做了什么？</p>\
\
<p>【实际情况可能比较复杂，这里只是简要叙述】如果只有一台服务器，服务器拿到请求后，根据服务器配置定位到相应的处理页面，处理页面执行代码，可能需要查询数据库，把获取的内容填充到页面模板中，把生产的页面输出。这部分涉及的细节及可以优化的点相对较多，总体目标是缩短服务器的处理时间，可从下面几个方面考虑：</p>\
\
<ul>\
<li>如果涉及数据库查询，是否可以优化数据库和对查询结果进行缓存；</li>\
<li>是否可以把生成的动态页面进行缓存；</li>\
<li>是否可以静态化页面；</li>\
<li>脚本解释器生成的中间代码是否可以缓存；</li>\
<li>如果提供的全国性的功能服务，是否需要负载均衡，使用何种策略的负载均衡；</li>\
<li>达到服务器功能上线，是否考虑增加服务器资源，又将如何的合理部署服务器，要如何兼顾各大运营商；</li>\
<li>对于不同的页面资源，将分别提供什么样的并发策略；</li>\
<li>如何更好的优化服务器设置，使其达到服务上线，这里的服务上线很虚，需要各种指标加以判断，比如吞吐率等；</li>\
</ul>\
\
<div class="md-section-divider"></div>\
\
<h3 id="客户端处理">客户端处理</h3>\
\
<p>客户端处理需要解决的问题是根据请求的页面内容，尽快的把内容呈现给用户，给用户行为一个响应，即使部分资源还未加载完成；因此需要把影响页面呈现的因素推迟处理，比如：JavaScript脚本会阻塞页面渲染，把它放在页面底部；Img元素资源，可以使用懒加载技术。总之，要减少用户的视觉等待。</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="总结">总结</h3>\
\
<p>提高页面性能，要优化的点很多，从上述三个方面多加考虑；但最为关键的是，<strong>找出影响性能的瓶颈所在</strong>！</p>	对于站点来说，越快的把用户请求的页面内容呈现给用户，对用户的体验越好；此时的“越快”问题便是站点性能优化问题，性能优化问题具体包含哪些问题呢？针对每个性能优化点有哪些解决方案呢？在本篇文章中将予以概述；需要注意的是，本篇并不会深入每个问题的细节，而对于每个问题都需要大量的精力去深入研究。	16	0	2015-10-24 09:10:29	2015-10-24 00:25:59	[TOC]\
\
> 前言：对于站点来说，越快的把用户请求的页面内容呈现给用户，对用户的体验越好；此时的“越快”问题便是站点性能优化问题，性能优化问题具体包含哪些问题呢？针对每个性能优化点有哪些解决方案呢？在本篇文章中将予以概述；需要注意的是，本篇并不会深入每个问题的细节，而对于每个问题都需要大量的精力去深入研究。\
\
### 时间都去哪儿了\
\
借用歌名《时间都去哪儿了》并非为了故弄玄虚，在用户发起请求到看到相关内容，这之间的时间差中都发生了什么呢？考虑一种最简单的情况，一个请求只返回一个HTML页面；当我们发起此请求时，将大致经历以下三个方面的时间消耗：\
\
（1）网络传输：包括两个方面，把请求发送给服务器和服务器把响应数据返回给用户；\
（2）服务器处理时间：服务器接到请求后，准备响应数据消耗的时间；\
（3）客户端处理时间：如果客户端是浏览器，则为浏览器根据响应内容生成相应页面的时间；\
\
> 注：除此以外，可能还包括DNS解析的时间、建立HTTP连接的时间、根据用户输入生成请求数据包的时间等，这些暂不考虑。\
\
上述假定的是只需要加载一个HTML资源，更为现实情况是站点通常需要加载不同类型的多个资源（如图片、样式文件、JS文件等），如果对每个资源都需建立HTTP连接，这无疑又增加了页面全部加载所需要的时间；另外需要考虑的是页面资源加载是否并行、是否阻塞加载等；对于这部分内容一般由前端工程师负责。\
\
提高网站性能的关键是**找出瓶颈在哪里**，可通过相关压力测试进行分析；本文并不会假定瓶颈可能出现的地方，只是从上述三个方面将可以优化的点加以概述。\
\
### 网络传输\
\
影响网络传输的两个因素是带宽和传输数据量的大小，这里的带宽指的是服务器端的带宽；对于这两个方面可通过提高服务器网络带宽和优化压缩代码予以改进；\
\
（1）在网络带宽方面，除了服务器方面，用户自己的带宽对其自身的用户体验也很重要；作为开发人员，对此就心有余而力不足了！\
（2）在优化压缩代码层面，可以改进的点包括优化HTML结构、精简CSS代码、使用更加短小精悍的JS库（如使用Zepto代替jQuery）、压缩HTML、CSS、JS代码；另一个可以优化的点为**请求和响应的头（header）**，例如可以缩小Cookie的体积；最后需要提示的是：**尽管可能这部分优化的非常好，但相对于其它的影响站点性能的因素，这部分优化可能并不足以对网站性能有显著的改善，这需要在需要优化的点和其对性能的提升上把握平衡**。\
\
### 服务器处理\
\
服务器端要根据用户的请求进行业务逻辑计算，而后把响应内容进行输出，在此先梳理一下服务器接到请求到返回数据这段时间内都做了什么？\
\
【实际情况可能比较复杂，这里只是简要叙述】如果只有一台服务器，服务器拿到请求后，根据服务器配置定位到相应的处理页面，处理页面执行代码，可能需要查询数据库，把获取的内容填充到页面模板中，把生产的页面输出。这部分涉及的细节及可以优化的点相对较多，总体目标是缩短服务器的处理时间，可从下面几个方面考虑：\
\
- 如果涉及数据库查询，是否可以优化数据库和对查询结果进行缓存；\
- 是否可以把生成的动态页面进行缓存；\
- 是否可以静态化页面；\
- 脚本解释器生成的中间代码是否可以缓存；\
- 如果提供的全国性的功能服务，是否需要负载均衡，使用何种策略的负载均衡；\
- 达到服务器功能上线，是否考虑增加服务器资源，又将如何的合理部署服务器，要如何兼顾各大运营商；\
- 对于不同的页面资源，将分别提供什么样的并发策略；\
- 如何更好的优化服务器设置，使其达到服务上线，这里的服务上线很虚，需要各种指标加以判断，比如吞吐率等；\
\
### 客户端处理\
\
客户端处理需要解决的问题是根据请求的页面内容，尽快的把内容呈现给用户，给用户行为一个响应，即使部分资源还未加载完成；因此需要把影响页面呈现的因素推迟处理，比如：JavaScript脚本会阻塞页面渲染，把它放在页面底部；Img元素资源，可以使用懒加载技术。总之，要减少用户的视觉等待。\
\
### 总结\
\
提高页面性能，要优化的点很多，从上述三个方面多加考虑；但最为关键的是，**找出影响性能的瓶颈所在**！\
\
        
18	0	RainDon	CSS的起源	css-origin-start	1	1		0	ImShengli	CSS				<div class="md-section-divider"></div>\
\
<p><div class="toc">\
<ul>\
<li><ul>\
<li><ul>\
<li><a href="#浏览器">浏览器</a></li>\
</ul>\
</li>\
</ul>\
</li>\
</ul>\
</div>\
</p>\
\
<p>CSS开始发展于1994年。《Cascading Style Sheets: Designing for the Web》的作者之一Hakon Wium Lie在Web的发源地欧洲原子核研究会（CERN）工作，此时Web开始被用于电子刊物发布的平台。可是，一个重要部分被遗漏了，那就是如何去展现文档。例如：无法像报纸一样对Web文档进行排版。在MIT多媒体实验室工作致力于研究个性化新闻呈现的Hakon看到了对Web文档添加样式的迫切需求。</p>\
\
<p>在浏览器中添加样式表并非全新的概念，1990年HTML发展之初文档结构和布局分离便在考虑之内。蒂姆·伯纳斯-李（Tim Berners Lee，WWW的发明人）实现了基于浏览器的下一代文本编辑器，在此编辑器内可以添加几个带有样式的标签。然而，他并没有进一步开发样式规范，在他看来，如何呈现内容给用户是浏览器应该考虑的问题。在此期间，浏览器还包括Viola（Pei Wei，1992）和Harmony浏览器。Hyper-G系统是Web早期的竞争者，它也有自己的样式语言。</p>\
\
<p>初始时，浏览器厂商并不提供高级别的样式文件，只提供一些简单的样式选项供用户选择。1993年，对Web有重大影响的NCSA Mosaic（网景公司的浏览器）发布。在样式方面，它只允许用户修改颜色和字体。</p>\
\
<p>与此同时，站长们开始抱怨他们无法对Web页面调整出他们期望的样子（译者注：类似于Word中的样式），对于新手来说更不知如何去改变元素的字体和颜色，此时HTML并没有正确的表现出它的功能。下面这是摘自1994年发送给WWW制定者的一段话，这段话把Web开发者和浏览器厂商紧张的气氛表露无遗：</p>\
\
<blockquote class="white-blockquote">\
  <p>实际上，过去几年我很高兴告诉那些想把他们的文档设置成类似于TeX、Word等文本处理器中样式的人，对他们说：“对不起，你们被’绑架’了”。</p>\
</blockquote>\
\
<p>这条信息出自Marc Andreessen（马克·安德森，NCSA Mosaic的作者之一）之手，他后来成为网景公司的联合创始人。在他看来，格式化的方式已经发生改变。在1994年10月13日，马克·安德森宣布Mozilla的第一个beta版本已经可以测试，在新版浏览器中将以标签为中心，并且标签将被简化。</p>\
\
<p>在网景新浏览器发布的前三天，Hakon公布了CSS的第一份草案。Dave Raggett（HTML3.0的主要缔造者）鼓励在即将举行的“Mosaic and the Web”大会之前公布此草案，Dave已意识到HTML不能也不应该只是页面描述语言，更多的内建机制应该要满足开发者的需求。尽管文档第一版本不成熟，但它提供了讨论的有价值的基础。</p>\
\
<p>对第一份CSS响应的人中有本书的另一位作者，伯特·波斯（Bert Bos）。那时他正致力于开发Argo浏览器，这个浏览器是把研究人文学科的学者们通过网络联系在一起的项目的一部分。它先于网景支持插件，通过插件可以高度定制样式表，Bos决定和 Hakon展开合作。虽说草案已发生重大变化，但不可否认的是它当初的理念。 <br>\
Argo样式语言的一个功能是允许添加其他的标记语言到HTML中，这也成为CSS的设计目标，并且“HTML”被从规范中移除。Argo还有一些高级的功能并没有添加到CSS1中，例如属性选择器和文本生成，这两个特色寄希望于CSS2。</p>\
\
<p>这时“样式表”并不是唯一的样式语言，还有Viola浏览器的Pei Wei的语言和早在1993年6月O’Reilly出版社的Robert Raisch写的另一种语言。除此之外，还有DSSSL，ISO领导下的一种复杂的样式和转换语言，它用来打印SGML格式的文档。DSSSL也能应用于HTML，但CSS区别其它语言一大功能是：它把Web上文档的样式不能有开发者或者用户修改考虑进去了，同时希望通过合并或者“层叠”的方式来做；事实上，不仅用户和开发者希望如此，而且这样对于显示设备和浏览器有着很好的兼容性。</p>\
\
<p>最初的CSS提案计划于1994年11月在芝加哥举行的Web会议上提出。可在开发者日（Developer's Day）这份报告引起剧烈争论。首先，在用户和开发者之间平衡的概念上是新奇的，假设这样一个画面，一个滑块两端分别为用户和开发者，通过调节滑块，用户可以调节站在用户角度还是开发者角度的比例；其次，人们已经习惯使用简单的CSS去设计开发，不愿为了给文档添加样式去学习更为复杂的程序语言。CSS已经脱离了当初简单、直接的使用方式。</p>\
\
<p>在1995年4月举行的WWW会议上，CSS再一次被提出。此次Bert和Hakon都在（实际上，这也是我们第一次见到他们），这次我们也能展示我们的实现。Bert对Argo的样式表寄予支持，Hakon展示了已经支持CSS的Arena浏览器版本。Dave Raggett实现的Arena是用来测试新想法，包括样式表。这场以技术展示开始的回忆在关于用户-开发者平衡的政治讨论中结束。支持开发者的认为开发者具有如何让展现文档的权利，例如一个争论是对警告标签必须打印要有规范要求，并且不能修改这些警告字体的大小。另一方这本书作者的支持者们认为用户必须要有如何展现的权利，当有冲突时必须要能表达他们看法的权利。</p>\
\
<p>抛开派系之争，技术工作仍在继续。www-style邮件列表创建于1995年5月，这里的讨论内容经常影响着CSS草案的制作。三年后在此列表中已经超过了4000条信息。</p>\
\
<p>1995年，W3C委员会<del>~，很多公司积极加入，组织得以建立。各种各样的工作组</del>~，W3C的成员和工作人员会晤和讨论未来技术的发展。因此决定成立另一个工作组：主要负责样式表。</p>\
\
<p>1997年2月，CSS成立W3C旗下自己的工作小组，新的工作小组去解决CSS1中没有解决的问题。工作小组有Chris Lilley领导，他是来自曼彻斯特大学的爱尔兰人。CSS2在1998年5月成为推荐标准，CSS3并于1999年开始推进。此时，不只是HTML依赖于CSS呈现样式，很多基于XML的文件也需要CSS来进行呈现，浏览器于1998年开始对XML类型的数据提供支持，尽管存在限制。</p>\
\
<p>W3C工作小组，官方名称为“Cascading Style Sheets and Formatting Properties Working Group”，工作不局限于CSS，有大约15个成员，被W3C的公司成员和组织成员委任。他们来自世界各地，通过电话进行每周一次大约一个小时的会议，每年举行四次聚会。最近几次分别在Provo、Redmond、San Francisco和Paris举办。在Paris举办时是在法国电力天然气的总部EDF-GDF召开，此次会议上，公司给小组提供了极好的晚餐：可以一边俯瞰巴黎和塞纳河，一边品尝美食，这是历史上为数不多的给辛苦的技术工作组最高的待遇之一。每个法国人可以因此而骄傲，虽然他们没有从天然气和电力提供者那里得到任何好处。</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="浏览器">浏览器</h3>\
\
<p><img src="http://dn-woerwosi.qbox.me/blog/images/2015/10/3/ie-vs-netscape.jpg" alt="IE VS Netscape" title=""></p>\
\
<p>CSS的发展离不开浏览器的支持，如果没有浏览器，CSS只是学术界感兴趣的提案。第一个支持CSS的商业化浏览器是1996年8月发布的微软IE3。那时CSS1还没有成为W3C的推荐标准，HTML ERB（HTML编辑审查委员会）的任何讨论结果都将影响微软Chris Wilson领导的开发者，且讨论结果是不可预见的。最终发布的IE3稳定版支持大部分的颜色、背景、字体、文本属性，但不支持box模型。</p>\
\
<p>下一个宣布支持的是网景的Navigator4.0。由于起初网景对样式表持怀疑态度，并且该公司的第一个实现版本是用来阻止微软宣传他们是比自己更加符合标准。网景这个版本中支持很多功能，例如浮动元素，但是Netscape的开发人员并没有时间对他们支持的功能做全面的测试，这也导致了很多CSS属性在Navigator4中不可用。</p>\
\
<p>网景的实现方式将CSS转换为JavaScript的腻子脚本，和其他脚本一起运行。同时公司决定让开发者写JSSS程序，从而绕过CSS。如果JSSS成功了，在Web中将会多出一种不需要的样式表。幸运的是，这种情况没有发生。</p>\
\
<p>同时，微软开始努力取代网景去争取浏览器市场占有率的宝座。在IE4中微软开始使用命名为“Trident”的渲染引擎，该引擎主要负责渲染CSS。Trident去除了IE3中的很多限制，但同时又引入了自己的一些限制和问题。IE4并不能完全的支持CSS1，Web标准项目组（WaSP）甚至在1998年11月由于公布了“IE的十大CSS问题”而大放异彩。</p>\
\
<p>除了可以显示静态的文件，Trident也有能力动态的改变样式的属性。例如，元素可以通过不断修改top和left值从而呈现出动态效果，因此创造了“Dynamic HTML”。本质上，DHTML和JSSS类似，都是通过脚本设置样式属性，但DHTML从宣称是另一种样式语言。实际上，CSS是DHTML的一部分。</p>\
\
<p>第三个支持CSS的是Opera。1998年，这个来自挪威的公司的浏览器因为小、可定制且支持微软和网景支持的大部分功能而闻名。1998年11月发布了Opera3.5，支持大部分的CSS1。Opera的开发者在发布之前已经进行了测试，由Eric Meyer在志愿者的帮助下开发的CSS1测试套件，对于测试的实现和提高产品的质量有重大意义。</p>\
\
<p>此时此刻，网景和微软正在致力开发他们的下一个浏览器版本。网景已经决定在Navigator中使用新的渲染引擎“nglayout”，已经从头开始编写CSS的基础，他们新的浏览器命名为“Gecko”，并可从<a href="http://www.mozilla.org" target="_blank">http://www.mozilla.org</a>上下载beta版本。微软已经发布了IE5的预览版，一些CSS实现已经得到改进，希望WaSP的倡议可以提醒微软在CSS1完全被支持以前还有很多工作要做。</p>\
\
<blockquote class="white-blockquote">\
  <p>内容来自于1999年的图书《Cascading Style Sheets: Designing for the Web》        </p>\
</blockquote>	CSS开始发展于1994年。在此期间经历了CSS1.0不完备的版本，到较完善的CSS2.1，直至如今发展良好的CSS3.0。此篇文章主要介绍的是早期的CSS的发展状况及浏览器的支持情况，可以作为课外材料予以了解！	13	0	2015-11-11 22:35:33	2015-11-08 23:48:17	[TOC]\
\
CSS开始发展于1994年。《Cascading Style Sheets: Designing for the Web》的作者之一Hakon Wium Lie在Web的发源地欧洲原子核研究会（CERN）工作，此时Web开始被用于电子刊物发布的平台。可是，一个重要部分被遗漏了，那就是如何去展现文档。例如：无法像报纸一样对Web文档进行排版。在MIT多媒体实验室工作致力于研究个性化新闻呈现的Hakon看到了对Web文档添加样式的迫切需求。\
\
在浏览器中添加样式表并非全新的概念，1990年HTML发展之初文档结构和布局分离便在考虑之内。蒂姆·伯纳斯-李（Tim Berners Lee，WWW的发明人）实现了基于浏览器的下一代文本编辑器，在此编辑器内可以添加几个带有样式的标签。然而，他并没有进一步开发样式规范，在他看来，如何呈现内容给用户是浏览器应该考虑的问题。在此期间，浏览器还包括Viola（Pei Wei，1992）和Harmony浏览器。Hyper-G系统是Web早期的竞争者，它也有自己的样式语言。\
\
初始时，浏览器厂商并不提供高级别的样式文件，只提供一些简单的样式选项供用户选择。1993年，对Web有重大影响的NCSA Mosaic（网景公司的浏览器）发布。在样式方面，它只允许用户修改颜色和字体。\
\
与此同时，站长们开始抱怨他们无法对Web页面调整出他们期望的样子（译者注：类似于Word中的样式），对于新手来说更不知如何去改变元素的字体和颜色，此时HTML并没有正确的表现出它的功能。下面这是摘自1994年发送给WWW制定者的一段话，这段话把Web开发者和浏览器厂商紧张的气氛表露无遗：\
\
> 实际上，过去几年我很高兴告诉那些想把他们的文档设置成类似于TeX、Word等文本处理器中样式的人，对他们说：“对不起，你们被’绑架’了”。\
\
这条信息出自Marc Andreessen（马克·安德森，NCSA Mosaic的作者之一）之手，他后来成为网景公司的联合创始人。在他看来，格式化的方式已经发生改变。在1994年10月13日，马克·安德森宣布Mozilla的第一个beta版本已经可以测试，在新版浏览器中将以标签为中心，并且标签将被简化。\
\
在网景新浏览器发布的前三天，Hakon公布了CSS的第一份草案。Dave Raggett（HTML3.0的主要缔造者）鼓励在即将举行的“Mosaic and the Web”大会之前公布此草案，Dave已意识到HTML不能也不应该只是页面描述语言，更多的内建机制应该要满足开发者的需求。尽管文档第一版本不成熟，但它提供了讨论的有价值的基础。\
\
对第一份CSS响应的人中有本书的另一位作者，伯特·波斯（Bert Bos）。那时他正致力于开发Argo浏览器，这个浏览器是把研究人文学科的学者们通过网络联系在一起的项目的一部分。它先于网景支持插件，通过插件可以高度定制样式表，Bos决定和 Hakon展开合作。虽说草案已发生重大变化，但不可否认的是它当初的理念。\
Argo样式语言的一个功能是允许添加其他的标记语言到HTML中，这也成为CSS的设计目标，并且“HTML”被从规范中移除。Argo还有一些高级的功能并没有添加到CSS1中，例如属性选择器和文本生成，这两个特色寄希望于CSS2。\
\
这时“样式表”并不是唯一的样式语言，还有Viola浏览器的Pei Wei的语言和早在1993年6月O’Reilly出版社的Robert Raisch写的另一种语言。除此之外，还有DSSSL，ISO领导下的一种复杂的样式和转换语言，它用来打印SGML格式的文档。DSSSL也能应用于HTML，但CSS区别其它语言一大功能是：它把Web上文档的样式不能有开发者或者用户修改考虑进去了，同时希望通过合并或者“层叠”的方式来做；事实上，不仅用户和开发者希望如此，而且这样对于显示设备和浏览器有着很好的兼容性。\
\
最初的CSS提案计划于1994年11月在芝加哥举行的Web会议上提出。可在开发者日（Developer's Day）这份报告引起剧烈争论。首先，在用户和开发者之间平衡的概念上是新奇的，假设这样一个画面，一个滑块两端分别为用户和开发者，通过调节滑块，用户可以调节站在用户角度还是开发者角度的比例；其次，人们已经习惯使用简单的CSS去设计开发，不愿为了给文档添加样式去学习更为复杂的程序语言。CSS已经脱离了当初简单、直接的使用方式。\
\
在1995年4月举行的WWW会议上，CSS再一次被提出。此次Bert和Hakon都在（实际上，这也是我们第一次见到他们），这次我们也能展示我们的实现。Bert对Argo的样式表寄予支持，Hakon展示了已经支持CSS的Arena浏览器版本。Dave Raggett实现的Arena是用来测试新想法，包括样式表。这场以技术展示开始的回忆在关于用户-开发者平衡的政治讨论中结束。支持开发者的认为开发者具有如何让展现文档的权利，例如一个争论是对警告标签必须打印要有规范要求，并且不能修改这些警告字体的大小。另一方这本书作者的支持者们认为用户必须要有如何展现的权利，当有冲突时必须要能表达他们看法的权利。\
\
抛开派系之争，技术工作仍在继续。www-style邮件列表创建于1995年5月，这里的讨论内容经常影响着CSS草案的制作。三年后在此列表中已经超过了4000条信息。\
\
1995年，W3C委员会~~~，很多公司积极加入，组织得以建立。各种各样的工作组~~~，W3C的成员和工作人员会晤和讨论未来技术的发展。因此决定成立另一个工作组：主要负责样式表。\
\
1997年2月，CSS成立W3C旗下自己的工作小组，新的工作小组去解决CSS1中没有解决的问题。工作小组有Chris Lilley领导，他是来自曼彻斯特大学的爱尔兰人。CSS2在1998年5月成为推荐标准，CSS3并于1999年开始推进。此时，不只是HTML依赖于CSS呈现样式，很多基于XML的文件也需要CSS来进行呈现，浏览器于1998年开始对XML类型的数据提供支持，尽管存在限制。\
\
W3C工作小组，官方名称为“Cascading Style Sheets and Formatting Properties Working Group”，工作不局限于CSS，有大约15个成员，被W3C的公司成员和组织成员委任。他们来自世界各地，通过电话进行每周一次大约一个小时的会议，每年举行四次聚会。最近几次分别在Provo、Redmond、San Francisco和Paris举办。在Paris举办时是在法国电力天然气的总部EDF-GDF召开，此次会议上，公司给小组提供了极好的晚餐：可以一边俯瞰巴黎和塞纳河，一边品尝美食，这是历史上为数不多的给辛苦的技术工作组最高的待遇之一。每个法国人可以因此而骄傲，虽然他们没有从天然气和电力提供者那里得到任何好处。\
\
### 浏览器\
\
![IE VS Netscape](http://dn-woerwosi.qbox.me/blog/images/2015/10/3/ie-vs-netscape.jpg)\
\
CSS的发展离不开浏览器的支持，如果没有浏览器，CSS只是学术界感兴趣的提案。第一个支持CSS的商业化浏览器是1996年8月发布的微软IE3。那时CSS1还没有成为W3C的推荐标准，HTML ERB（HTML编辑审查委员会）的任何讨论结果都将影响微软Chris Wilson领导的开发者，且讨论结果是不可预见的。最终发布的IE3稳定版支持大部分的颜色、背景、字体、文本属性，但不支持box模型。\
\
下一个宣布支持的是网景的Navigator4.0。由于起初网景对样式表持怀疑态度，并且该公司的第一个实现版本是用来阻止微软宣传他们是比自己更加符合标准。网景这个版本中支持很多功能，例如浮动元素，但是Netscape的开发人员并没有时间对他们支持的功能做全面的测试，这也导致了很多CSS属性在Navigator4中不可用。\
\
网景的实现方式将CSS转换为JavaScript的腻子脚本，和其他脚本一起运行。同时公司决定让开发者写JSSS程序，从而绕过CSS。如果JSSS成功了，在Web中将会多出一种不需要的样式表。幸运的是，这种情况没有发生。\
\
同时，微软开始努力取代网景去争取浏览器市场占有率的宝座。在IE4中微软开始使用命名为“Trident”的渲染引擎，该引擎主要负责渲染CSS。Trident去除了IE3中的很多限制，但同时又引入了自己的一些限制和问题。IE4并不能完全的支持CSS1，Web标准项目组（WaSP）甚至在1998年11月由于公布了“IE的十大CSS问题”而大放异彩。\
\
除了可以显示静态的文件，Trident也有能力动态的改变样式的属性。例如，元素可以通过不断修改top和left值从而呈现出动态效果，因此创造了“Dynamic HTML”。本质上，DHTML和JSSS类似，都是通过脚本设置样式属性，但DHTML从宣称是另一种样式语言。实际上，CSS是DHTML的一部分。\
\
第三个支持CSS的是Opera。1998年，这个来自挪威的公司的浏览器因为小、可定制且支持微软和网景支持的大部分功能而闻名。1998年11月发布了Opera3.5，支持大部分的CSS1。Opera的开发者在发布之前已经进行了测试，由Eric Meyer在志愿者的帮助下开发的CSS1测试套件，对于测试的实现和提高产品的质量有重大意义。\
\
此时此刻，网景和微软正在致力开发他们的下一个浏览器版本。网景已经决定在Navigator中使用新的渲染引擎“nglayout”，已经从头开始编写CSS的基础，他们新的浏览器命名为“Gecko”，并可从http://www.mozilla.org上下载beta版本。微软已经发布了IE5的预览版，一些CSS实现已经得到改进，希望WaSP的倡议可以提醒微软在CSS1完全被支持以前还有很多工作要做。\
                \
> 内容来自于1999年的图书《Cascading Style Sheets: Designing for the Web》        
19	0	RainDon	Apache+PHP环境配置	apache-php-environment-setting	1	1		0	ImShengli	Technology				<div class="md-section-divider"></div>\
\
<p><div class="toc">\
<ul>\
<li><ul>\
<li><ul>\
<li><a href="#apache配置">Apache配置</a></li>\
<li><a href="#php">PHP</a></li>\
<li><a href="#mysql">MySQL</a></li>\
<li><a href="#xdebug">XDebug</a></li>\
</ul>\
</li>\
</ul>\
</li>\
</ul>\
</div>\
</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="apache配置">Apache配置</h3>\
\
<p>1、检查Apache是否安装和配置文件路径</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="com">// 查看Apache是否安装，若已安装，则会显示Apache的版本号；</span></code></li><li class="L1"><code><span class="pln">apachectl </span><span class="pun">-</span><span class="pln">v </span></code></li><li class="L2"><code><span class="com">// 或者</span></code></li><li class="L3"><code><span class="pln">httpd </span><span class="pun">-</span><span class="pln">v</span></code></li><li class="L4"><code></code></li><li class="L5"><code><span class="com">// 查看httpd的执行路径</span></code></li><li class="L6"><code><span class="pln">ps aux </span><span class="pun">|</span><span class="pln"> grep httpd</span></code></li><li class="L7"><code><span class="com">// 或者</span></code></li><li class="L8"><code><span class="pln">whereis httpd</span></code></li><li class="L9"><code></code></li><li class="L0"><code><span class="com">// 查找httpd.conf文件路径</span></code></li><li class="L1"><code><span class="com">// 1. 第一种方式</span></code></li><li class="L2"><code><span class="pln">httpd </span><span class="pun">-</span><span class="pln">V   </span><span class="com">// 参数SERVER_CONFIG_FILE</span></code></li><li class="L3"><code><span class="com">// 2. 第二种方式</span></code></li><li class="L4"><code><span class="pln">httpd </span><span class="pun">-</span><span class="pln">S   </span><span class="com">// 配置了VirtualHost后有提示</span></code></li><li class="L5"><code><span class="com">// 3. 第三种方式</span></code></li><li class="L6"><code><span class="pln">ps </span><span class="pun">-</span><span class="pln">ef </span><span class="pun">|</span><span class="pln"> grep httpd   </span><span class="com">// 输出中是否有 -f 选项</span></code></li><li class="L7"><code><span class="com">// 4. 使用查找功能</span></code></li><li class="L8"><code><span class="pln">sudo find </span><span class="pun">/</span><span class="pln"> </span><span class="pun">-</span><span class="pln">name </span><span class="str">"httpd.conf"</span></code></li></ol></pre>\
\
<p>2、Apache安装</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="com">// 若没有安装，执行安装操作</span></code></li><li class="L1"><code><span class="pln">wget http</span><span class="pun">:</span><span class="com">//mirrors.hust.edu.cn/apache//httpd/httpd-NN.tar.gz</span></code></li><li class="L2"><code><span class="pln">tar zxvf httpd</span><span class="pun">-</span><span class="pln">NN</span><span class="pun">.</span><span class="pln">tar</span><span class="pun">.</span><span class="pln">gz</span></code></li><li class="L3"><code><span class="pln">cd httpd</span><span class="pun">-</span><span class="pln">NN</span><span class="pun">.</span><span class="pln">tar</span><span class="pun">.</span><span class="pln">gz</span></code></li><li class="L4"><code><span class="pun">./</span><span class="pln">configure </span><span class="pun">--</span><span class="pln">prefix</span><span class="pun">=</span><span class="pln">PREFIX</span></code></li><li class="L5"><code><span class="pln">make</span></code></li><li class="L6"><code><span class="pln">make install</span></code></li><li class="L7"><code><span class="com">// NN.tar.gz 代表是版本号</span></code></li><li class="L8"><code><span class="com">// PREFIX 默认是/usr/local/apache2</span></code></li><li class="L9"><code></code></li><li class="L0"><code><span class="com">// 检查是否安装成功</span></code></li><li class="L1"><code><span class="pln">apachectl </span><span class="pun">-</span><span class="pln">t</span></code></li></ol></pre>\
\
<p>3、Apache配置</p>\
\
<blockquote class="white-blockquote">\
  <p>这里主要说的Web目录的配置，详细配置请参考：<a href="http://httpd.apache.org/docs/" target="_blank">http://httpd.apache.org/docs/</a></p>\
</blockquote>\
\
<p>默认的目录是：/Library/WebServer/Documents/ <br>\
系统级根目录默认没有开启目录列表，开启方法为： <br>\
编辑<code>httpd.conf</code>文件，搜索找到 <code>Directory "/Library/WebServer/Documents"</code>，将<code>Options FollowSymLinks Multiviews</code>修改为：<code>Options Indexes FollowSymLinks Multiviews</code> <br>\
更改目录，编辑httpd.conf文件：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="com">// 1. 第一种方式</span></code></li><li class="L1"><code><span class="com">// 将下面两行分别替换</span></code></li><li class="L2"><code><span class="com"># DocumentRoot "/Library/WebServer/Documents" </span></code></li><li class="L3"><code><span class="typ">DocumentRoot</span><span class="pln"> </span><span class="str">"/Users/username/Sites/"</span></code></li><li class="L4"><code><span class="com"># Directory "/Library/WebServer/Documents"</span></code></li><li class="L5"><code><span class="typ">Directory</span><span class="pln"> </span><span class="str">"/Users/username/Sites/"</span></code></li><li class="L6"><code><span class="com">// 其中username是自己的用户名；</span></code></li><li class="L7"><code><span class="com">// 2. 第二种方式</span></code></li><li class="L8"><code><span class="com">// (1) 在 /etc/apache2/users/ 目录下配置 username.conf 文件；输入以下内容：</span></code></li><li class="L9"><code><span class="pun">&lt;</span><span class="typ">Directory</span><span class="pln"> </span><span class="str">"/Users/username/Sites/"</span><span class="pun">&gt;</span></code></li><li class="L0"><code><span class="pln">    </span><span class="typ">Options</span><span class="pln"> </span><span class="typ">Indexes</span><span class="pln"> </span><span class="typ">MultiViews</span><span class="pln"> </span><span class="typ">FollowSymLinks</span></code></li><li class="L1"><code><span class="pln">    </span><span class="typ">AllowOverride</span><span class="pln"> </span><span class="typ">All</span></code></li><li class="L2"><code><span class="pln">    </span><span class="typ">Order</span><span class="pln"> allow</span><span class="pun">,</span><span class="pln">deny</span></code></li><li class="L3"><code><span class="pln">    </span><span class="typ">Allow</span><span class="pln"> </span><span class="kwd">from</span><span class="pln"> all</span></code></li><li class="L4"><code><span class="pln">    </span><span class="typ">Require</span><span class="pln"> all granted</span></code></li><li class="L5"><code><span class="pun">&lt;/</span><span class="typ">Directory</span><span class="pun">&gt;</span></code></li><li class="L6"><code><span class="com">// (2) 并修改此文件的权限</span></code></li><li class="L7"><code><span class="pln">sudo chmod </span><span class="lit">644</span><span class="pln"> username</span><span class="pun">.</span><span class="pln">conf</span></code></li><li class="L8"><code><span class="com">// (3) 编辑 /etc/apache2/extra/httpd-userdir.conf 文件，删除下列这些代码前的注释符号： </span></code></li><li class="L9"><code><span class="typ">Include</span><span class="pln"> </span><span class="pun">/</span><span class="kwd">private</span><span class="pun">/</span><span class="pln">etc</span><span class="pun">/</span><span class="pln">apache2</span><span class="pun">/</span><span class="pln">users</span><span class="com">/*.conf</span></code></li><li class="L0"><code><span class="com">// (4) 编辑 /etc/apache2/httpd.conf 文件，删除下列这些代码前的注释符号： </span></code></li><li class="L1"><code><span class="com">Include /private/etc/apache2/extra/httpd-userdir.conf </span></code></li><li class="L2"><code><span class="com">LoadModule authz_core_module libexec/apache2/mod_authz_core.so </span></code></li><li class="L3"><code><span class="com">LoadModule authz_host_module libexec/apache2/mod_authz_host.so </span></code></li><li class="L4"><code><span class="com">LoadModule userdir_module libexec/apache2/mod_userdir.so</span></code></li><li class="L5"><code></code></li><li class="L6"><code><span class="com">// 重启后生效</span></code></li><li class="L7"><code><span class="com">sudo apachectl restart</span></code></li><li class="L8"><code><span class="com">// 访问下面地址</span></code></li><li class="L9"><code><span class="com">http://localhost/~username/</span></code></li></ol></pre>\
\
<div class="md-section-divider"></div>\
\
<h3 id="php">PHP</h3>\
\
<p>1、PHP基本配置</p>\
\
<p>Mac已经预装了PHP5.5，不过在进行XDebug调试时需要安装PHP5.6，PHP5.5不含PHP-CGI；可使用<code>php -v</code>查看PHP版本；</p>\
\
<p>要输出PHP代码，需要将<code>httpd.conf</code>中的<code>LoadModule php5_module libexec/apache2/libphp5.so</code>注释去除；Apache重启后生效；</p>\
\
<p>查看PHP信息和Apache信息可使用下面代码查看：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-php"><span class="pun">&lt;?</span><span class="pln">php phpinfo</span><span class="pun">();</span><span class="pln"> </span><span class="pun">?&gt;</span></code></li></ol></pre>\
\
<p>2、安装PHP5.6</p>\
\
<p>执行以下代码：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="com">// 需要先安装brew</span></code></li><li class="L1"><code><span class="pln">brew install php56</span></code></li><li class="L2"><code><span class="pln">brew unlink php55</span></code></li><li class="L3"><code><span class="pln">brew link php56</span></code></li><li class="L4"><code><span class="com">// 使PHP5.6生效，需将httpd.conf中的LoadModule php5_module libexec/apache2/libphp5.so 替换为：</span></code></li><li class="L5"><code><span class="typ">LoadModule</span><span class="pln"> php5_module </span><span class="pun">/</span><span class="pln">usr</span><span class="pun">/</span><span class="kwd">local</span><span class="pun">/</span><span class="pln">opt</span><span class="pun">/</span><span class="pln">php56</span><span class="pun">/</span><span class="pln">libexec</span><span class="pun">/</span><span class="pln">apache2</span><span class="pun">/</span><span class="pln">libphp5</span><span class="pun">.</span><span class="pln">so</span></code></li></ol></pre>\
\
<div class="md-section-divider"></div>\
\
<h3 id="mysql">MySQL</h3>\
\
<p>1、检查是否安装MySQL</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="com">// MySQL启动情况下可使用下面命令：</span></code></li><li class="L1"><code><span class="pln">ps aux </span><span class="pun">|</span><span class="pln"> grep mysqld</span></code></li><li class="L2"><code><span class="com">// 或者检查3306端口是否被占用：</span></code></li><li class="L3"><code><span class="pln">netstat </span><span class="pun">-</span><span class="pln">nat </span><span class="pun">|</span><span class="pln"> grep LISTEN</span></code></li><li class="L4"><code><span class="com">// MySQL如果没有运行的话，只有去执行搜索，可搜索MySQL的配置文件my.cnf：</span></code></li><li class="L5"><code><span class="pln">sudo find </span><span class="pun">/</span><span class="pln"> </span><span class="pun">-</span><span class="pln">name </span><span class="str">"my.cnf"</span></code></li></ol></pre>\
\
<p>2、安装MySQL</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="com">// 下载地址：http://dev.mysql.com/downloads/mysql/ </span></code></li><li class="L1"><code><span class="com">// 启动MySQL：</span></code></li><li class="L2"><code><span class="pln">sudo </span><span class="pun">/</span><span class="pln">usr</span><span class="pun">/</span><span class="kwd">local</span><span class="pun">/</span><span class="pln">mysql</span><span class="pun">/</span><span class="pln">support</span><span class="pun">-</span><span class="pln">files</span><span class="pun">/</span><span class="pln">mysql</span><span class="pun">.</span><span class="pln">server start    </span></code></li><li class="L3"><code><span class="com">// 查看MySQL的安装目录，默认为/usr/local/mysql：</span></code></li><li class="L4"><code><span class="pln">ps aux </span><span class="pun">|</span><span class="pln"> grep mysqld</span></code></li><li class="L5"><code><span class="com">// 查看MySQL版本</span></code></li><li class="L6"><code><span class="pun">/</span><span class="pln">usr</span><span class="pun">/</span><span class="kwd">local</span><span class="pun">/</span><span class="pln">mysql</span><span class="pun">/</span><span class="pln">bin</span><span class="pun">/</span><span class="pln">mysql </span><span class="pun">-</span><span class="pln">v</span></code></li><li class="L7"><code></code></li><li class="L8"><code><span class="com">// 添加别名，编辑~/.bash_profile，添加：</span></code></li><li class="L9"><code><span class="kwd">export</span><span class="pln"> PATH</span><span class="pun">=</span><span class="str">"/usr/local/mysql/bin:$PATH"</span></code></li><li class="L0"><code><span class="com">// 使别名生效：</span></code></li><li class="L1"><code><span class="pln">source </span><span class="pun">~/.</span><span class="pln">bash_profile</span></code></li></ol></pre>\
\
<p>3、配置MySQL</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="com">// 修改 mysql root 账户密码：</span></code></li><li class="L1"><code><span class="pun">/</span><span class="pln">usr</span><span class="pun">/</span><span class="kwd">local</span><span class="pun">/</span><span class="pln">mysql</span><span class="pun">/</span><span class="pln">bin</span><span class="pun">/</span><span class="pln">mysqladmin </span><span class="pun">-</span><span class="pln">u root password </span><span class="str">'yourpasswordhere'</span></code></li><li class="L2"><code><span class="com">// MySQL的配置文件为my.cnf</span></code></li></ol></pre>\
\
<div class="md-section-divider"></div>\
\
<h3 id="xdebug">XDebug</h3>\
\
<p>1、安装php56-xdebug</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="pln">brew install php56</span><span class="pun">-</span><span class="pln">xdebug</span></code></li></ol></pre>\
\
<p>2、配置debug</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="com">// 配置文件为：/usr/local/etc/php/5.6/conf.d/ext-xdebug.ini</span></code></li><li class="L1"><code><span class="pln">xdebug</span><span class="pun">.</span><span class="pln">remote_enable</span><span class="pun">=</span><span class="lit">1</span></code></li><li class="L2"><code><span class="pln">xdebug</span><span class="pun">.</span><span class="pln">remote_handler</span><span class="pun">=</span><span class="pln">dbgp     </span></code></li><li class="L3"><code><span class="pln">xdebug</span><span class="pun">.</span><span class="pln">remote_host</span><span class="pun">=</span><span class="lit">127.0</span><span class="pun">.</span><span class="lit">0.1</span></code></li><li class="L4"><code><span class="pln">xdebug</span><span class="pun">.</span><span class="pln">remote_port</span><span class="pun">=</span><span class="lit">9001</span><span class="pln"> </span><span class="com">//默认端口是9000</span></code></li><li class="L5"><code><span class="pln">xdebug</span><span class="pun">.</span><span class="pln">remote_connect_back</span><span class="pun">=</span><span class="typ">On</span></code></li><li class="L6"><code><span class="pln">xdebug</span><span class="pun">.</span><span class="pln">remote_log</span><span class="pun">=</span><span class="str">"/var/log/xdebug/xdebug.log"</span><span class="pln"> </span><span class="com">//这个目录创建一下，再改下权限</span></code></li><li class="L7"><code><span class="pln">xdebug</span><span class="pun">.</span><span class="pln">idekey </span><span class="pun">=</span><span class="pln"> PHPSTORM</span></code></li></ol></pre>\
\
<p>3、配置PHPStorm</p>\
\
<p>具体请参考：<a href="https://www.jetbrains.com/phpstorm/help/debugging-php-applications.html" target="_blank">https://www.jetbrains.com/phpstorm/help/debugging-php-applications.html</a></p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="com">// 需要设置：</span></code></li><li class="L1"><code><span class="com">// 1. Interpreter</span></code></li><li class="L2"><code><span class="com">// 2. Debug端口</span></code></li><li class="L3"><code><span class="com">// 3. PHP Web Application</span></code></li></ol></pre>	记录PHP开发所需的环境，采用Apache+PHP+MySQL+Unix（MAC）的结构，并描述PHP调试工具XDebug。	12	0	2015-12-13 11:17:36	2015-12-11 10:09:59	[TOC]\
\
### Apache配置\
\
1、检查Apache是否安装和配置文件路径\
\
```\
// 查看Apache是否安装，若已安装，则会显示Apache的版本号；\
apachectl -v \
// 或者\
httpd -v\
\
// 查看httpd的执行路径\
ps aux | grep httpd\
// 或者\
whereis httpd\
\
// 查找httpd.conf文件路径\
// 1. 第一种方式\
httpd -V   // 参数SERVER_CONFIG_FILE\
// 2. 第二种方式\
httpd -S   // 配置了VirtualHost后有提示\
// 3. 第三种方式\
ps -ef | grep httpd   // 输出中是否有 -f 选项\
// 4. 使用查找功能\
sudo find / -name "httpd.conf"\
```\
\
2、Apache安装\
\
```\
// 若没有安装，执行安装操作\
wget http://mirrors.hust.edu.cn/apache//httpd/httpd-NN.tar.gz\
tar zxvf httpd-NN.tar.gz\
cd httpd-NN.tar.gz\
./configure --prefix=PREFIX\
make\
make install\
// NN.tar.gz 代表是版本号\
// PREFIX 默认是/usr/local/apache2\
\
// 检查是否安装成功\
apachectl -t\
```\
\
3、Apache配置\
\
> 这里主要说的Web目录的配置，详细配置请参考：http://httpd.apache.org/docs/\
\
默认的目录是：/Library/WebServer/Documents/\
系统级根目录默认没有开启目录列表，开启方法为：\
编辑`httpd.conf`文件，搜索找到 `Directory "/Library/WebServer/Documents"`，将`Options FollowSymLinks Multiviews`修改为：`Options Indexes FollowSymLinks Multiviews`\
更改目录，编辑httpd.conf文件：\
```\
// 1. 第一种方式\
// 将下面两行分别替换\
# DocumentRoot "/Library/WebServer/Documents" \
DocumentRoot "/Users/username/Sites/"\
# Directory "/Library/WebServer/Documents"\
Directory "/Users/username/Sites/"\
// 其中username是自己的用户名；\
// 2. 第二种方式\
// (1) 在 /etc/apache2/users/ 目录下配置 username.conf 文件；输入以下内容：\
<Directory "/Users/username/Sites/">\
    Options Indexes MultiViews FollowSymLinks\
    AllowOverride All\
    Order allow,deny\
    Allow from all\
    Require all granted\
</Directory>\
// (2) 并修改此文件的权限\
sudo chmod 644 username.conf\
// (3) 编辑 /etc/apache2/extra/httpd-userdir.conf 文件，删除下列这些代码前的注释符号： \
Include /private/etc/apache2/users/*.conf\
// (4) 编辑 /etc/apache2/httpd.conf 文件，删除下列这些代码前的注释符号： \
Include /private/etc/apache2/extra/httpd-userdir.conf \
LoadModule authz_core_module libexec/apache2/mod_authz_core.so \
LoadModule authz_host_module libexec/apache2/mod_authz_host.so \
LoadModule userdir_module libexec/apache2/mod_userdir.so\
\
// 重启后生效\
sudo apachectl restart\
// 访问下面地址\
http://localhost/~username/\
```\
\
### PHP\
\
1、PHP基本配置\
\
Mac已经预装了PHP5.5，不过在进行XDebug调试时需要安装PHP5.6，PHP5.5不含PHP-CGI；可使用`php -v`查看PHP版本；\
\
要输出PHP代码，需要将`httpd.conf`中的`LoadModule php5_module libexec/apache2/libphp5.so`注释去除；Apache重启后生效；\
\
查看PHP信息和Apache信息可使用下面代码查看：\
```php\
<?php phpinfo(); ?>\
```\
\
2、安装PHP5.6\
\
执行以下代码：\
```\
// 需要先安装brew\
brew install php56\
brew unlink php55\
brew link php56\
// 使PHP5.6生效，需将httpd.conf中的LoadModule php5_module libexec/apache2/libphp5.so 替换为：\
LoadModule php5_module /usr/local/opt/php56/libexec/apache2/libphp5.so\
```\
\
### MySQL\
\
1、检查是否安装MySQL\
\
```\
// MySQL启动情况下可使用下面命令：\
ps aux | grep mysqld\
// 或者检查3306端口是否被占用：\
netstat -nat | grep LISTEN\
// MySQL如果没有运行的话，只有去执行搜索，可搜索MySQL的配置文件my.cnf：\
sudo find / -name "my.cnf"\
```\
\
2、安装MySQL\
\
```\
// 下载地址：http://dev.mysql.com/downloads/mysql/ \
// 启动MySQL：\
sudo /usr/local/mysql/support-files/mysql.server start    \
// 查看MySQL的安装目录，默认为/usr/local/mysql：\
ps aux | grep mysqld\
// 查看MySQL版本\
/usr/local/mysql/bin/mysql -v\
\
// 添加别名，编辑~/.bash_profile，添加：\
export PATH="/usr/local/mysql/bin:$PATH"\
// 使别名生效：\
source ~/.bash_profile\
```\
\
3、配置MySQL\
\
```\
// 修改 mysql root 账户密码：\
/usr/local/mysql/bin/mysqladmin -u root password 'yourpasswordhere'\
// MySQL的配置文件为my.cnf\
```\
\
### XDebug                        \
\
1、安装php56-xdebug\
\
```\
brew install php56-xdebug\
```\
\
2、配置debug\
\
```\
// 配置文件为：/usr/local/etc/php/5.6/conf.d/ext-xdebug.ini\
xdebug.remote_enable=1\
xdebug.remote_handler=dbgp     \
xdebug.remote_host=127.0.0.1\
xdebug.remote_port=9001 //默认端口是9000\
xdebug.remote_connect_back=On\
xdebug.remote_log="/var/log/xdebug/xdebug.log" //这个目录创建一下，再改下权限\
xdebug.idekey = PHPSTORM\
```\
\
3、配置PHPStorm\
\
具体请参考：https://www.jetbrains.com/phpstorm/help/debugging-php-applications.html\
```\
// 需要设置：\
// 1. Interpreter\
// 2. Debug端口\
// 3. PHP Web Application\
```
20	0	RainDon	使用 HTML5 Canvas 创建一个拾色器	html5-canvas-color-pick	1	1		0	ImShengli	HTML				<div class="md-section-divider"></div>\
\
<p><div class="toc">\
<ul>\
<li><ul>\
<li><ul>\
<li><a href="#html">HTML</a></li>\
<li><a href="#javascript">JavaScript</a></li>\
<li><a href="#完整代码">完整代码</a></li>\
<li><a href="#总结">总结</a></li>\
</ul>\
</li>\
</ul>\
</li>\
</ul>\
</div>\
</p>\
\
<blockquote class="white-blockquote">\
  <p>创建 Canvas 应用是一件有意思且新奇的事情，甚至可以创建游戏；Canvas 在大多数的桌面和手机浏览器中都能够很好的支持，是比使用 Flash 更可行的解决方案；</p>\
</blockquote>\
\
<p>本例中使用HTML5中 Canvas 来创建一个简易的拾色器（color picker），在此过程中，不需要任何的 Flash，有一个“文本编辑器”和一个“浏览器”即可。</p>\
\
<p>开始之前，您可以在<a href="http://netdna.webdesignerdepot.com/uploads7/how-to-create-a-color-picker-with-html5-canvas/demo/" target="_blank">这里</a>看看我们将要创建的应用的效果，您也可以在<a href="http://netdna.webdesignerdepot.com/uploads7/how-to-create-a-color-picker-with-html5-canvas/demo/demo.zip" target="_blank">这里</a>下载源文件。 如果您在本地测试这个实例，最好不要使用 Chrome 浏览器，因为 Chrome 的安全模块要求 script 只在线上工作（only work online）。</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="html">HTML</h3>\
\
<p>在这个例子中，HTML 使用的不多，我们需要做的就是创建一个Canvas，然后有两个文本框用于放置所点击颜色的 RGB 表示和 16 进制颜色值表示；代码如下:</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="tag">&lt;canvas</span><span class="pln"> </span><span class="atn">width</span><span class="pun">=</span><span class="atv">"600"</span><span class="pln"> </span><span class="atn">height</span><span class="pun">=</span><span class="atv">"440"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"canvas_picker"</span><span class="tag">&gt;&lt;/canvas&gt;</span></code></li><li class="L1"><code><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"hex"</span><span class="tag">&gt;</span><span class="pln">HEX: </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="tag">&gt;&lt;/input&gt;&lt;/div&gt;</span></code></li><li class="L2"><code><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"rgb"</span><span class="tag">&gt;</span><span class="pln">RGB: </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="tag">&gt;&lt;/input&gt;&lt;/div&gt;</span></code></li></ol></pre>\
\
<p>由于我们在一张背景图片拾取颜色，因此把 Canvas 的高度和宽度设置成了背景图片的高度和宽度；所点击的颜色显示在两个文本框中； <br>\
由于我们要用到 jQuery，因此代码中要包含jQuery库。</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="javascript">JavaScript</h3>\
\
<p>要使拾色器工作，首先，我们需要做的是获取 Canvas 和它的上下文，我们可以用一句代码，像这样：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="kwd">var</span><span class="pln"> canvas </span><span class="pun">=</span><span class="pln"> document</span><span class="pun">.</span><span class="pln">getElementById</span><span class="pun">(</span><span class="str">'canvas_picker'</span><span class="pun">).</span><span class="pln">getContext</span><span class="pun">(</span><span class="str">'2d'</span><span class="pun">);</span></code></li></ol></pre>\
\
<p>紧接着，我们需要做的就是给 Canvas 元素设置一张背景图片，此过程中，我们需要创建一个 image 对象，并设置其 URL 属性，当图片加载完毕后，加载到 Canvas 中，代码如下：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="kwd">var</span><span class="pln"> img </span><span class="pun">=</span><span class="pln"> </span><span class="kwd">new</span><span class="pln"> </span><span class="typ">Image</span><span class="pun">();</span></code></li><li class="L1"><code><span class="pln">img</span><span class="pun">.</span><span class="pln">src </span><span class="pun">=</span><span class="pln"> </span><span class="str">'image.jpg'</span><span class="pun">;</span></code></li><li class="L2"><code><span class="pln">$</span><span class="pun">(</span><span class="pln">img</span><span class="pun">).</span><span class="pln">load</span><span class="pun">(</span><span class="kwd">function</span><span class="pun">(){</span></code></li><li class="L3"><code><span class="pln">    canvas</span><span class="pun">.</span><span class="pln">drawImage</span><span class="pun">(</span><span class="pln">img</span><span class="pun">,</span><span class="lit">0</span><span class="pun">,</span><span class="lit">0</span><span class="pun">);</span></code></li><li class="L4"><code><span class="pun">});</span></code></li></ol></pre>\
\
<p>下面我们应该考虑的是：当鼠标点击事件在 Canvas 中发生时，我们应该捕捉到该事件，并且获取用户点击鼠标的位置，代码可以这样写：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="pln">$</span><span class="pun">(</span><span class="str">'#canvas_picker'</span><span class="pun">).</span><span class="pln">click</span><span class="pun">(</span><span class="kwd">function</span><span class="pun">(</span><span class="kwd">event</span><span class="pun">){</span></code></li><li class="L1"><code><span class="pln">    </span><span class="kwd">var</span><span class="pln"> x </span><span class="pun">=</span><span class="pln"> </span><span class="kwd">event</span><span class="pun">.</span><span class="pln">pageX </span><span class="pun">-</span><span class="pln"> </span><span class="kwd">this</span><span class="pun">.</span><span class="pln">offsetLeft</span><span class="pun">;</span></code></li><li class="L2"><code><span class="pln">    </span><span class="kwd">var</span><span class="pln"> y </span><span class="pun">=</span><span class="pln"> </span><span class="kwd">event</span><span class="pun">.</span><span class="pln">pageY </span><span class="pun">-</span><span class="pln"> </span><span class="kwd">this</span><span class="pun">.</span><span class="pln">offsetTop</span><span class="pun">;</span></code></li><li class="L3"><code><span class="pun">});</span></code></li></ol></pre>\
\
<p>这两句代码的意思是获取用户点击的位置，我们所需做的就是获取其坐标，并减去 Canvas 元素的偏移量(offsetLeft 和 offsetTop)； 这样就得到了相对于 Canvas 用户点击的位置； <br>\
下一步就是获取用户点击位置的 RGB 值，我们需要用到 getImageData() 函数，并把上面代码中 x，y 值传递进去：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="pln">$</span><span class="pun">(</span><span class="str">'#canvas_picker'</span><span class="pun">).</span><span class="pln">click</span><span class="pun">(</span><span class="kwd">function</span><span class="pun">(</span><span class="kwd">event</span><span class="pun">){</span></code></li><li class="L1"><code><span class="pln">    </span><span class="kwd">var</span><span class="pln"> x </span><span class="pun">=</span><span class="pln"> </span><span class="kwd">event</span><span class="pun">.</span><span class="pln">pageX </span><span class="pun">-</span><span class="pln"> </span><span class="kwd">this</span><span class="pun">.</span><span class="pln">offsetLeft</span><span class="pun">;</span></code></li><li class="L2"><code><span class="pln">    </span><span class="kwd">var</span><span class="pln"> y </span><span class="pun">=</span><span class="pln"> </span><span class="kwd">event</span><span class="pun">.</span><span class="pln">pageY </span><span class="pun">-</span><span class="pln"> </span><span class="kwd">this</span><span class="pun">.</span><span class="pln">offsetTop</span><span class="pun">;</span></code></li><li class="L3"><code></code></li><li class="L4"><code><span class="pln">    </span><span class="kwd">var</span><span class="pln"> imgData </span><span class="pun">=</span><span class="pln"> canvas</span><span class="pun">.</span><span class="pln">getImageData</span><span class="pun">(</span><span class="pln">x</span><span class="pun">,</span><span class="pln"> y</span><span class="pun">,</span><span class="pln"> </span><span class="lit">1</span><span class="pun">,</span><span class="pln"> </span><span class="lit">1</span><span class="pun">).</span><span class="pln">data</span><span class="pun">;</span></code></li><li class="L5"><code><span class="pln">    </span><span class="kwd">var</span><span class="pln"> R </span><span class="pun">=</span><span class="pln"> imgData</span><span class="pun">[</span><span class="lit">0</span><span class="pun">];</span></code></li><li class="L6"><code><span class="pln">    </span><span class="kwd">var</span><span class="pln"> G </span><span class="pun">=</span><span class="pln"> imgData</span><span class="pun">[</span><span class="lit">1</span><span class="pun">];</span></code></li><li class="L7"><code><span class="pln">    </span><span class="kwd">var</span><span class="pln"> B </span><span class="pun">=</span><span class="pln"> imgData</span><span class="pun">[</span><span class="lit">2</span><span class="pun">];</span></code></li><li class="L8"><code></code></li><li class="L9"><code><span class="pun">});</span></code></li></ol></pre>\
\
<p>接下来就是把 RGB 值显示给用户：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="pln">$</span><span class="pun">(</span><span class="str">'#canvas_picker'</span><span class="pun">).</span><span class="pln">click</span><span class="pun">(</span><span class="kwd">function</span><span class="pun">(</span><span class="kwd">event</span><span class="pun">){</span></code></li><li class="L1"><code><span class="pln">    </span><span class="kwd">var</span><span class="pln"> x </span><span class="pun">=</span><span class="pln"> </span><span class="kwd">event</span><span class="pun">.</span><span class="pln">pageX </span><span class="pun">-</span><span class="pln"> </span><span class="kwd">this</span><span class="pun">.</span><span class="pln">offsetLeft</span><span class="pun">;</span></code></li><li class="L2"><code><span class="pln">    </span><span class="kwd">var</span><span class="pln"> y </span><span class="pun">=</span><span class="pln"> </span><span class="kwd">event</span><span class="pun">.</span><span class="pln">pageY </span><span class="pun">-</span><span class="pln"> </span><span class="kwd">this</span><span class="pun">.</span><span class="pln">offsetTop</span><span class="pun">;</span></code></li><li class="L3"><code></code></li><li class="L4"><code><span class="pln">    </span><span class="kwd">var</span><span class="pln"> imgData </span><span class="pun">=</span><span class="pln"> canvas</span><span class="pun">.</span><span class="pln">getImageData</span><span class="pun">(</span><span class="pln">x</span><span class="pun">,</span><span class="pln"> y</span><span class="pun">,</span><span class="pln"> </span><span class="lit">1</span><span class="pun">,</span><span class="pln"> </span><span class="lit">1</span><span class="pun">).</span><span class="pln">data</span><span class="pun">;</span></code></li><li class="L5"><code><span class="pln">    </span><span class="kwd">var</span><span class="pln"> R </span><span class="pun">=</span><span class="pln"> imgData</span><span class="pun">[</span><span class="lit">0</span><span class="pun">];</span></code></li><li class="L6"><code><span class="pln">    </span><span class="kwd">var</span><span class="pln"> G </span><span class="pun">=</span><span class="pln"> imgData</span><span class="pun">[</span><span class="lit">1</span><span class="pun">];</span></code></li><li class="L7"><code><span class="pln">    </span><span class="kwd">var</span><span class="pln"> B </span><span class="pun">=</span><span class="pln"> imgData</span><span class="pun">[</span><span class="lit">2</span><span class="pun">];</span></code></li><li class="L8"><code></code></li><li class="L9"><code><span class="pln">    </span><span class="kwd">var</span><span class="pln"> rgb </span><span class="pun">=</span><span class="pln"> R </span><span class="pun">+</span><span class="pln"> </span><span class="str">','</span><span class="pln"> </span><span class="pun">+</span><span class="pln"> G </span><span class="pun">+</span><span class="pln"> </span><span class="str">','</span><span class="pln"> </span><span class="pun">+</span><span class="pln"> B</span><span class="pun">;</span></code></li><li class="L0"><code><span class="pln">    $</span><span class="pun">(</span><span class="str">'#rgb input'</span><span class="pun">).</span><span class="pln">val</span><span class="pun">(</span><span class="pln">rgb</span><span class="pun">);</span></code></li><li class="L1"><code><span class="pun">});</span></code></li></ol></pre>\
\
<p>现在已经可以得到用户点击位置的 RGB 值，不过，为了有更好的体验，我们同时显示点击位置的 16 进制值颜色值，把 RGB 值转换为 16 进制颜色值的代码如下：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="kwd">function</span><span class="pln"> rgbToHex</span><span class="pun">(</span><span class="pln">R</span><span class="pun">,</span><span class="pln">G</span><span class="pun">,</span><span class="pln">B</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L1"><code><span class="pln">    </span><span class="kwd">return</span><span class="pln"> toHex</span><span class="pun">(</span><span class="pln">R</span><span class="pun">)+</span><span class="pln">toHex</span><span class="pun">(</span><span class="pln">G</span><span class="pun">)+</span><span class="pln">toHex</span><span class="pun">(</span><span class="pln">B</span><span class="pun">)</span></code></li><li class="L2"><code><span class="pun">}</span></code></li><li class="L3"><code><span class="kwd">function</span><span class="pln"> toHex</span><span class="pun">(</span><span class="pln">n</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L4"><code><span class="pln">    n </span><span class="pun">=</span><span class="pln"> parseInt</span><span class="pun">(</span><span class="pln">n</span><span class="pun">,</span><span class="lit">10</span><span class="pun">);</span></code></li><li class="L5"><code><span class="pln">    </span><span class="kwd">if</span><span class="pln"> </span><span class="pun">(</span><span class="pln">isNaN</span><span class="pun">(</span><span class="pln">n</span><span class="pun">))</span><span class="pln"> </span></code></li><li class="L6"><code><span class="pln">        </span><span class="kwd">return</span><span class="pln"> </span><span class="str">"00"</span><span class="pun">;</span></code></li><li class="L7"><code><span class="pln">    n </span><span class="pun">=</span><span class="pln"> </span><span class="typ">Math</span><span class="pun">.</span><span class="pln">max</span><span class="pun">(</span><span class="lit">0</span><span class="pun">,</span><span class="typ">Math</span><span class="pun">.</span><span class="pln">min</span><span class="pun">(</span><span class="pln">n</span><span class="pun">,</span><span class="lit">255</span><span class="pun">));</span></code></li><li class="L8"><code><span class="pln">    </span><span class="kwd">return</span><span class="pln"> </span><span class="str">"0123456789ABCDEF"</span><span class="pun">.</span><span class="pln">charAt</span><span class="pun">((</span><span class="pln">n</span><span class="pun">-</span><span class="pln">n</span><span class="pun">%</span><span class="lit">16</span><span class="pun">)/</span><span class="lit">16</span><span class="pun">)</span><span class="pln"> </span><span class="pun">+</span><span class="pln"> </span><span class="str">"0123456789ABCDEF"</span><span class="pun">.</span><span class="pln">charAt</span><span class="pun">(</span><span class="pln">n</span><span class="pun">%</span><span class="lit">16</span><span class="pun">);</span></code></li><li class="L9"><code><span class="pun">}</span></code></li></ol></pre>\
\
<p>我们已经完成了本例子的大部分功能，下面就是把16进制颜色值显示在文本框中：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="kwd">var</span><span class="pln"> hex </span><span class="pun">=</span><span class="pln"> rgbToHex</span><span class="pun">(</span><span class="pln">R</span><span class="pun">,</span><span class="pln">G</span><span class="pun">,</span><span class="pln">B</span><span class="pun">);</span></code></li><li class="L1"><code><span class="pln">$</span><span class="pun">(</span><span class="str">'#hex input'</span><span class="pun">).</span><span class="pln">val</span><span class="pun">(</span><span class="str">'#'</span><span class="pln"> </span><span class="pun">+</span><span class="pln"> hex</span><span class="pun">);</span></code></li></ol></pre>\
\
<div class="md-section-divider"></div>\
\
<h3 id="完整代码">完整代码</h3>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="dec">&lt;!DOCTYPE html&gt;</span></code></li><li class="L1"><code><span class="tag">&lt;html</span><span class="pln"> </span><span class="atn">lang</span><span class="pun">=</span><span class="atv">"en"</span><span class="tag">&gt;</span></code></li><li class="L2"><code><span class="tag">&lt;head&gt;</span></code></li><li class="L3"><code><span class="pln">    </span><span class="tag">&lt;meta</span><span class="pln"> </span><span class="atn">charset</span><span class="pun">=</span><span class="atv">"utf-8"</span><span class="pln"> </span><span class="tag">/&gt;</span></code></li><li class="L4"><code><span class="pln">    </span><span class="tag">&lt;title&gt;</span><span class="pln">拾色器事例代码</span><span class="tag">&lt;/title&gt;</span></code></li><li class="L5"><code><span class="pln">    </span><span class="tag">&lt;script</span><span class="pln"> </span><span class="atn">src</span><span class="pun">=</span><span class="atv">"http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"</span><span class="tag">&gt;&lt;/script&gt;</span></code></li><li class="L6"><code><span class="tag">&lt;/head&gt;</span></code></li><li class="L7"><code><span class="tag">&lt;body&gt;</span></code></li><li class="L8"><code></code></li><li class="L9"><code><span class="tag">&lt;canvas</span><span class="pln"> </span><span class="atn">width</span><span class="pun">=</span><span class="atv">"600"</span><span class="pln"> </span><span class="atn">height</span><span class="pun">=</span><span class="atv">"440"</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"canvas_picker"</span><span class="tag">&gt;&lt;/canvas&gt;</span></code></li><li class="L0"><code><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"hex"</span><span class="tag">&gt;</span><span class="pln">HEX: </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="tag">&gt;&lt;/input&gt;&lt;/div&gt;</span></code></li><li class="L1"><code><span class="tag">&lt;div</span><span class="pln"> </span><span class="atn">id</span><span class="pun">=</span><span class="atv">"rgb"</span><span class="tag">&gt;</span><span class="pln">RGB: </span><span class="tag">&lt;input</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text"</span><span class="tag">&gt;&lt;/input&gt;&lt;/div&gt;</span></code></li><li class="L2"><code></code></li><li class="L3"><code><span class="tag">&lt;script</span><span class="pln"> </span><span class="atn">type</span><span class="pun">=</span><span class="atv">"text/javascript"</span><span class="tag">&gt;</span></code></li><li class="L4"><code><span class="pln">    </span><span class="kwd">var</span><span class="pln"> canvas </span><span class="pun">=</span><span class="pln"> document</span><span class="pun">.</span><span class="pln">getElementById</span><span class="pun">(</span><span class="str">'canvas_picker'</span><span class="pun">).</span><span class="pln">getContext</span><span class="pun">(</span><span class="str">'2d'</span><span class="pun">);</span></code></li><li class="L5"><code></code></li><li class="L6"><code><span class="pln">    </span><span class="com">// 创建一个 image 对象</span></code></li><li class="L7"><code><span class="pln">    </span><span class="kwd">var</span><span class="pln"> img </span><span class="pun">=</span><span class="pln"> </span><span class="kwd">new</span><span class="pln"> </span><span class="typ">Image</span><span class="pun">();</span></code></li><li class="L8"><code><span class="pln">    img</span><span class="pun">.</span><span class="pln">src </span><span class="pun">=</span><span class="pln"> </span><span class="str">'image.jpg'</span><span class="pun">;</span></code></li><li class="L9"><code></code></li><li class="L0"><code><span class="pln">    </span><span class="com">// 把图片设置到Canvas中</span></code></li><li class="L1"><code><span class="pln">    $</span><span class="pun">(</span><span class="pln">img</span><span class="pun">).</span><span class="pln">load</span><span class="pun">(</span><span class="kwd">function</span><span class="pun">(){</span></code></li><li class="L2"><code><span class="pln">        canvas</span><span class="pun">.</span><span class="pln">drawImage</span><span class="pun">(</span><span class="pln">img</span><span class="pun">,</span><span class="lit">0</span><span class="pun">,</span><span class="lit">0</span><span class="pun">);</span></code></li><li class="L3"><code><span class="pln">    </span><span class="pun">});</span></code></li><li class="L4"><code></code></li><li class="L5"><code><span class="pln">    </span><span class="com">// RGB 转换成 HEX</span></code></li><li class="L6"><code><span class="pln">    </span><span class="kwd">function</span><span class="pln"> rgbToHex</span><span class="pun">(</span><span class="pln">R</span><span class="pun">,</span><span class="pln">G</span><span class="pun">,</span><span class="pln">B</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span><span class="kwd">return</span><span class="pln"> toHex</span><span class="pun">(</span><span class="pln">R</span><span class="pun">)+</span><span class="pln">toHex</span><span class="pun">(</span><span class="pln">G</span><span class="pun">)+</span><span class="pln">toHex</span><span class="pun">(</span><span class="pln">B</span><span class="pun">)}</span></code></li><li class="L7"><code><span class="pln">    </span><span class="kwd">function</span><span class="pln"> toHex</span><span class="pun">(</span><span class="pln">n</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L8"><code><span class="pln">         n </span><span class="pun">=</span><span class="pln"> parseInt</span><span class="pun">(</span><span class="pln">n</span><span class="pun">,</span><span class="lit">10</span><span class="pun">);</span></code></li><li class="L9"><code><span class="pln">         </span><span class="kwd">if</span><span class="pln"> </span><span class="pun">(</span><span class="pln">isNaN</span><span class="pun">(</span><span class="pln">n</span><span class="pun">))</span><span class="pln"> </span><span class="kwd">return</span><span class="pln"> </span><span class="str">"00"</span><span class="pun">;</span></code></li><li class="L0"><code><span class="pln">         n </span><span class="pun">=</span><span class="pln"> </span><span class="typ">Math</span><span class="pun">.</span><span class="pln">max</span><span class="pun">(</span><span class="lit">0</span><span class="pun">,</span><span class="typ">Math</span><span class="pun">.</span><span class="pln">min</span><span class="pun">(</span><span class="pln">n</span><span class="pun">,</span><span class="lit">255</span><span class="pun">));</span></code></li><li class="L1"><code><span class="pln">         </span><span class="kwd">return</span><span class="pln"> </span><span class="str">"0123456789ABCDEF"</span><span class="pun">.</span><span class="pln">charAt</span><span class="pun">((</span><span class="pln">n</span><span class="pun">-</span><span class="pln">n</span><span class="pun">%</span><span class="lit">16</span><span class="pun">)/</span><span class="lit">16</span><span class="pun">)</span><span class="pln">  </span><span class="pun">+</span><span class="pln"> </span><span class="str">"0123456789ABCDEF"</span><span class="pun">.</span><span class="pln">charAt</span><span class="pun">(</span><span class="pln">n</span><span class="pun">%</span><span class="lit">16</span><span class="pun">);</span></code></li><li class="L2"><code><span class="pln">    </span><span class="pun">}</span></code></li><li class="L3"><code><span class="pln">    $</span><span class="pun">(</span><span class="str">'#canvas_picker'</span><span class="pun">).</span><span class="pln">click</span><span class="pun">(</span><span class="kwd">function</span><span class="pun">(</span><span class="pln">event</span><span class="pun">){</span></code></li><li class="L4"><code><span class="pln">        </span><span class="com">// 获取用户点击坐标</span></code></li><li class="L5"><code><span class="pln">        </span><span class="kwd">var</span><span class="pln"> x </span><span class="pun">=</span><span class="pln"> event</span><span class="pun">.</span><span class="pln">pageX </span><span class="pun">-</span><span class="pln"> </span><span class="kwd">this</span><span class="pun">.</span><span class="pln">offsetLeft</span><span class="pun">;</span></code></li><li class="L6"><code><span class="pln">        </span><span class="kwd">var</span><span class="pln"> y </span><span class="pun">=</span><span class="pln"> event</span><span class="pun">.</span><span class="pln">pageY </span><span class="pun">-</span><span class="pln"> </span><span class="kwd">this</span><span class="pun">.</span><span class="pln">offsetTop</span><span class="pun">;</span></code></li><li class="L7"><code><span class="pln">        </span><span class="com">// 获取 RGB 值</span></code></li><li class="L8"><code><span class="pln">        </span><span class="kwd">var</span><span class="pln"> img_data </span><span class="pun">=</span><span class="pln"> canvas</span><span class="pun">.</span><span class="pln">getImageData</span><span class="pun">(</span><span class="pln">x</span><span class="pun">,</span><span class="pln"> y</span><span class="pun">,</span><span class="pln"> </span><span class="lit">1</span><span class="pun">,</span><span class="pln"> </span><span class="lit">1</span><span class="pun">).</span><span class="pln">data</span><span class="pun">;</span></code></li><li class="L9"><code><span class="pln">        </span><span class="kwd">var</span><span class="pln"> R </span><span class="pun">=</span><span class="pln"> img_data</span><span class="pun">[</span><span class="lit">0</span><span class="pun">];</span></code></li><li class="L0"><code><span class="pln">        </span><span class="kwd">var</span><span class="pln"> G </span><span class="pun">=</span><span class="pln"> img_data</span><span class="pun">[</span><span class="lit">1</span><span class="pun">];</span></code></li><li class="L1"><code><span class="pln">        </span><span class="kwd">var</span><span class="pln"> B </span><span class="pun">=</span><span class="pln"> img_data</span><span class="pun">[</span><span class="lit">2</span><span class="pun">];</span><span class="pln">  </span><span class="kwd">var</span><span class="pln"> rgb </span><span class="pun">=</span><span class="pln"> R </span><span class="pun">+</span><span class="pln"> </span><span class="str">','</span><span class="pln"> </span><span class="pun">+</span><span class="pln"> G </span><span class="pun">+</span><span class="pln"> </span><span class="str">','</span><span class="pln"> </span><span class="pun">+</span><span class="pln"> B</span><span class="pun">;</span></code></li><li class="L2"><code><span class="pln">        </span><span class="com">// RGB 转成 HEX</span></code></li><li class="L3"><code><span class="pln">        </span><span class="kwd">var</span><span class="pln"> hex </span><span class="pun">=</span><span class="pln"> rgbToHex</span><span class="pun">(</span><span class="pln">R</span><span class="pun">,</span><span class="pln">G</span><span class="pun">,</span><span class="pln">B</span><span class="pun">);</span></code></li><li class="L4"><code><span class="pln">        </span><span class="com">// 显示颜色值</span></code></li><li class="L5"><code><span class="pln">        $</span><span class="pun">(</span><span class="str">'#rgb input'</span><span class="pun">).</span><span class="pln">val</span><span class="pun">(</span><span class="pln">rgb</span><span class="pun">);</span></code></li><li class="L6"><code><span class="pln">        $</span><span class="pun">(</span><span class="str">'#hex input'</span><span class="pun">).</span><span class="pln">val</span><span class="pun">(</span><span class="str">'#'</span><span class="pln"> </span><span class="pun">+</span><span class="pln"> hex</span><span class="pun">);</span></code></li><li class="L7"><code><span class="pln">    </span><span class="pun">});</span></code></li><li class="L8"><code><span class="tag">&lt;/script&gt;</span></code></li><li class="L9"><code></code></li><li class="L0"><code><span class="tag">&lt;/body&gt;</span></code></li><li class="L1"><code><span class="tag">&lt;/html&gt;</span></code></li></ol></pre>\
\
<div class="md-section-divider"></div>\
\
<h3 id="总结">总结</h3>\
\
<p>通过本事例我们应该意识到使用 Canvas 创建应用有很大的潜力；在其他地方有很多更好的例子，甚至很多人用Canvas 做游戏，Canvas 的巨大潜能等待你的挖掘。</p>\
\
<p>原文地址：<a href="http://www.webdesignerdepot.com/2013/03/how-to-create-a-color-picker-with-html5-canvas/" target="_blank">How to create a color picker with HTML5 Canvas</a></p>	创建 Canvas 应用是一件有意思且新奇的事情，甚至可以创建游戏；Canvas 在大多数的桌面和手机浏览器中都能够很好的支持，是比使用 Flash 更可行的解决方案；	11	0	2015-12-13 00:14:14	2015-12-13 00:07:46	[TOC]\
\
> 创建 Canvas 应用是一件有意思且新奇的事情，甚至可以创建游戏；Canvas 在大多数的桌面和手机浏览器中都能够很好的支持，是比使用 Flash 更可行的解决方案；\
\
本例中使用HTML5中 Canvas 来创建一个简易的拾色器（color picker），在此过程中，不需要任何的 Flash，有一个“文本编辑器”和一个“浏览器”即可。\
\
开始之前，您可以在[这里](http://netdna.webdesignerdepot.com/uploads7/how-to-create-a-color-picker-with-html5-canvas/demo/)看看我们将要创建的应用的效果，您也可以在[这里](http://netdna.webdesignerdepot.com/uploads7/how-to-create-a-color-picker-with-html5-canvas/demo/demo.zip)下载源文件。 如果您在本地测试这个实例，最好不要使用 Chrome 浏览器，因为 Chrome 的安全模块要求 script 只在线上工作（only work online）。\
\
### HTML\
\
在这个例子中，HTML 使用的不多，我们需要做的就是创建一个Canvas，然后有两个文本框用于放置所点击颜色的 RGB 表示和 16 进制颜色值表示；代码如下:\
```\
<canvas width="600" height="440" id="canvas_picker"></canvas>\
<div id="hex">HEX: <input type="text"></input></div>\
<div id="rgb">RGB: <input type="text"></input></div>\
```\
由于我们在一张背景图片拾取颜色，因此把 Canvas 的高度和宽度设置成了背景图片的高度和宽度；所点击的颜色显示在两个文本框中；\
由于我们要用到 jQuery，因此代码中要包含jQuery库。\
\
### JavaScript\
\
要使拾色器工作，首先，我们需要做的是获取 Canvas 和它的上下文，我们可以用一句代码，像这样：\
```\
var canvas = document.getElementById('canvas_picker').getContext('2d');\
```\
紧接着，我们需要做的就是给 Canvas 元素设置一张背景图片，此过程中，我们需要创建一个 image 对象，并设置其 URL 属性，当图片加载完毕后，加载到 Canvas 中，代码如下：\
```\
var img = new Image();\
img.src = 'image.jpg';\
$(img).load(function(){\
    canvas.drawImage(img,0,0);\
});\
```\
下面我们应该考虑的是：当鼠标点击事件在 Canvas 中发生时，我们应该捕捉到该事件，并且获取用户点击鼠标的位置，代码可以这样写：\
```\
$('#canvas_picker').click(function(event){\
    var x = event.pageX - this.offsetLeft;\
    var y = event.pageY - this.offsetTop;\
});\
```\
这两句代码的意思是获取用户点击的位置，我们所需做的就是获取其坐标，并减去 Canvas 元素的偏移量(offsetLeft 和 offsetTop)； 这样就得到了相对于 Canvas 用户点击的位置；\
下一步就是获取用户点击位置的 RGB 值，我们需要用到 getImageData() 函数，并把上面代码中 x，y 值传递进去：\
```\
$('#canvas_picker').click(function(event){\
    var x = event.pageX - this.offsetLeft;\
    var y = event.pageY - this.offsetTop;\
\
    var imgData = canvas.getImageData(x, y, 1, 1).data;\
    var R = imgData[0];\
    var G = imgData[1];\
    var B = imgData[2];\
\
});\
```\
接下来就是把 RGB 值显示给用户：\
```\
$('#canvas_picker').click(function(event){\
    var x = event.pageX - this.offsetLeft;\
    var y = event.pageY - this.offsetTop;\
\
    var imgData = canvas.getImageData(x, y, 1, 1).data;\
    var R = imgData[0];\
    var G = imgData[1];\
    var B = imgData[2];\
\
    var rgb = R + ',' + G + ',' + B;\
    $('#rgb input').val(rgb);\
});\
```\
现在已经可以得到用户点击位置的 RGB 值，不过，为了有更好的体验，我们同时显示点击位置的 16 进制值颜色值，把 RGB 值转换为 16 进制颜色值的代码如下：\
```\
function rgbToHex(R,G,B) {\
    return toHex(R)+toHex(G)+toHex(B)\
}\
function toHex(n) {\
    n = parseInt(n,10);\
    if (isNaN(n)) \
        return "00";\
    n = Math.max(0,Math.min(n,255));\
    return "0123456789ABCDEF".charAt((n-n%16)/16) + "0123456789ABCDEF".charAt(n%16);\
}\
```\
我们已经完成了本例子的大部分功能，下面就是把16进制颜色值显示在文本框中：\
```\
var hex = rgbToHex(R,G,B);\
$('#hex input').val('#' + hex);\
```\
\
### 完整代码\
```\
<!DOCTYPE html>\
<html lang="en">\
<head>\
    <meta charset="utf-8" />\
    <title>拾色器事例代码</title>\
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>\
</head>\
<body>\
\
<canvas width="600" height="440" id="canvas_picker"></canvas>\
<div id="hex">HEX: <input type="text"></input></div>\
<div id="rgb">RGB: <input type="text"></input></div>\
\
<script type="text/javascript">\
    var canvas = document.getElementById('canvas_picker').getContext('2d');\
\
    // 创建一个 image 对象\
    var img = new Image();\
    img.src = 'image.jpg';\
\
    // 把图片设置到Canvas中\
    $(img).load(function(){\
        canvas.drawImage(img,0,0);\
    });\
\
    // RGB 转换成 HEX\
    function rgbToHex(R,G,B) {return toHex(R)+toHex(G)+toHex(B)}\
    function toHex(n) {\
         n = parseInt(n,10);\
         if (isNaN(n)) return "00";\
         n = Math.max(0,Math.min(n,255));\
         return "0123456789ABCDEF".charAt((n-n%16)/16)  + "0123456789ABCDEF".charAt(n%16);\
    }\
    $('#canvas_picker').click(function(event){\
        // 获取用户点击坐标\
        var x = event.pageX - this.offsetLeft;\
        var y = event.pageY - this.offsetTop;\
        // 获取 RGB 值\
        var img_data = canvas.getImageData(x, y, 1, 1).data;\
        var R = img_data[0];\
        var G = img_data[1];\
        var B = img_data[2];  var rgb = R + ',' + G + ',' + B;\
        // RGB 转成 HEX\
        var hex = rgbToHex(R,G,B);\
        // 显示颜色值\
        $('#rgb input').val(rgb);\
        $('#hex input').val('#' + hex);\
    });\
</script>\
\
</body>\
</html>\
```\
### 总结\
\
通过本事例我们应该意识到使用 Canvas 创建应用有很大的潜力；在其他地方有很多更好的例子，甚至很多人用Canvas 做游戏，Canvas 的巨大潜能等待你的挖掘。\
\
原文地址：[How to create a color picker with HTML5 Canvas](http://www.webdesignerdepot.com/2013/03/how-to-create-a-color-picker-with-html5-canvas/)\

21	0	RainDon	让专注更为专注	more-absorption	5	1		0	ImShengli	Learning				<div class="md-section-divider"></div>\
\
<p><div class="toc">\
<ul>\
</ul>\
</div>\
</p>\
\
<blockquote class="white-blockquote">\
  <p>互联网正在不知不觉中改造着我们的大脑，使我们失去深度阅读和缜密思维的能力。我们的注意力如今已如此分散支离——专注做事，有时竟已成为了一种稀缺能力。然而不管对工作还是生活，专注都是一项不可或缺的能力。</p>\
</blockquote>\
\
<p>我们总是爱寻找努力的方向，却很难在一个方向无畏前行。每个人的脑袋就像这样，方向很多，时常彷徨。</p>\
\
<p><img src="https://dn-woerwosi.qbox.me/blog/images/2015/11/0/brain.jpg" alt="Brain" title=""></p>\
\
<p>在无穷的想法驱使之下，我们永远没有足够的时间，因为总是不知道自己都将时间花在了什么地方。<strong>Oliver Emberton有过一个精妙的比喻。他将我们的大脑比作就像灌满了蜜蜂的沙滩排球，上百个互相矛盾的冲动想法把我们推向不同的方向。</strong></p>\
\
<p>我们恨不得一下做完所有的事情：我们想同时既锻炼身体又学英语，还要出去吃披萨。我们的欲望是无限的，各个不同的力量，把我们大脑的这个“沙滩排球”推向各个方向。</p>\
\
<p><img src="https://dn-woerwosi.qbox.me/blog/images/2015/11/0/bumblebee_1.jpg" alt="bumblebee" title=""></p>\
\
<p>于是，通常的情况是那个球那儿也到不了。它更容易受地形的影响，而不是受到“蜜蜂”们的控制。这是绝大多数人的生活方式。</p>\
\
<p>偏执狂一般聚焦在一个目标上，这可能是能够成功的唯一策略。当能够在一个目标上聚焦，而且是持久地，成就或将会达到它们的理论上限。想像一个自己做梦也不敢想的目标，比如想写一本书，或者登上火星。扔掉所有其它的事情，把自己变成一只巨大的大黄蜂，向一个方向猛推。</p>\
\
<p><img src="https://dn-woerwosi.qbox.me/blog/images/2015/11/0/bumblebee_2.jpg" alt="bumblebee" title=""></p>\
\
<p>信息科技千方百计地吸引我们的注意力，最后又把我们的注意力分散支离。互联网正在不知不觉中改造着我们的大脑，使我们充满了方向，却又失去了方向。</p>\
\
<p><img src="https://dn-woerwosi.qbox.me/blog/images/2015/11/0/bumblebee_3.png" alt="bumblebee" title=""></p>\
\
<p>事实上，方向的数量与我们可以取得成就在某种程度上成反比。按照上面的这个公式，每多一个方向将会使你所能达成的成果降到1/4。我们脑袋里的想法越多，就越难抵制诱惑，去专注和执着于一个目标。 </p>\
\
<p><img src="https://dn-woerwosi.qbox.me/blog/images/2015/11/0/bumblebee_4.jpg" alt="bumblebee" title=""></p>\
\
<p>在互联网内容中每日浸泡的我们每个人，思路就象一只跳来跳去的猴子，一会想这个，一会想那个，而训练自己集中注意力就是要驯服这只大猴子。 </p>\
\
<p>在日常生活中，可以采用下面这些技巧，让自己更加专注。</p>\
\
<p>1、专注力到底是什么？ </p>\
\
<p>专注的概念其实很简单，它就是讲你从多个方向中解放出来，一次只将精力放在一件事上。 “Concentration is taking your mind off many things and putting it on one thing at a time.” </p>\
\
<p>2、控制思维 </p>\
\
<p>学会控制思维。事实上，如果认定自己可以保持专注，那么就可以。可以试试“5 More”法则，当自己就快要放弃的时候，告诉自己：我还可以再坚持五分钟。完成这五分钟之后，再来一轮新的五分钟。如此一来，大目标就在这样的每一个五分钟的过程逐渐完成。 </p>\
\
<p>还有一个小窍门：对于本可以不需要手参与的事情，增加手参与一下，是特别好的一个方法。比如，看书的时候，同时手上做笔记。 </p>\
\
<p>3、最麻烦的任务先做 </p>\
\
<p>在完成一系列的任务时，将难的任务放在第一个，因为最开始做一件事时，我们总是会更加专注和富有能量。如此一来，就会发现，事情完成得越多就越容易。 </p>\
\
<p>4、只关注生活中最重要的事 </p>\
\
<p>很多时候，我们会慢慢变成我们专注的那个人或事。 </p>\
\
<p>你是否注意到，结婚多年的夫妻会变得越来越像对方，而在性格上，很多人会逐渐和他们工作的上司、同事甚至是和他朝夕相处的宠物越来越像。 </p>\
\
<p>人的精力是有限的，如果操心太多事情，就坚持2-3件已经开始操心的事情，然后放弃剩下的那些。这些放弃不仅包括一些工作和生活上的目标，甚至会包括长久以来的生活习惯甚至是一些人脉关系。 </p>\
\
<p>5、明确自己的目标 </p>\
\
<p>我们都要做一个目的导向型的人，然后顺应着心中的方向一点一点去实现。不要担心如果目标不能够100%实现怎么办，我们所需要做的，就是努力去接近它。 </p>\
\
<p>没有目标的持续高强度的专注于某件事，将只会造成困扰。 </p>\
\
<p>6、找到专注力“杀手” </p>\
\
<p>如果把思路比作猴子，知道为什么会注意力不集中，就容易驯服这只大猴子了。注意力不集中的原因主要分内因和外因两类:  <br>\
外部干扰包括：噪音，对话，不舒服的椅子和桌子，不合适的灯光，电视，工作，家务，网络，电子邮件等。  <br>\
内部因素包括：饿了，累了，病了，没有动力，感到厌烦，没有兴趣，焦虑，压力和烦恼，消极的想法，白日梦等等。  <br>\
找到这些杀手，排除他们。 </p>\
\
<p>7、找准效率最高的时间 </p>\
\
<p>专注并不意味着能够在所有的工作时间里满负荷工作。人都会有消极的状态（并不犯困却又无法高效工作时），深入了解自己，知道什么时候效率最高。 如果觉得自己在晚上写作的效率更高，那么就安排晚上作为写作时间，这样就可以在第二天早上寄出文章，这样的方式能让你更高效。 </p>\
\
<p>8、学会休息，保证充足睡眠 </p>\
\
<p>就算是牺牲一些活动，也要坚持准时睡觉，同时管理好白天的日常安排，保证晚上能够有至少8小时的睡眠时间。床单和床垫一定要买质量好的。这是一个非常有价值的投资，因为人的一生中有30%的时间是需要花在床上的。 </p>\
\
<p>也许我们已经习惯在睡前或醒后刷刷朋友圈和微博，刷完之后我们学到了什么了呢？或许可以尝试不去做这些事情来保证自己的休息。</p>\
\
<p>电脑硬盘碎片化了可以进行磁盘整理，大脑注意力碎片化了却没有简单的程序一键修复。 专注是一种能力，它需要花费很长的时间来学习和培养。</p>\
\
<p>文章修改自：<a href="http://www.nowamagic.net/librarys/veda/detail/2755" target="_blank">专注做事，竟然也成为我们的稀缺能力</a></p>	互联网正在不知不觉中改造着我们的大脑，使我们失去深度阅读和缜密思维的能力。我们的注意力如今如此分散支离——专注做事，有时竟已成为了一种稀缺能力。然而不管对工作还是生活，专注都是一项不可或缺的能力。	24	0	2015-12-13 12:08:16	2015-12-13 11:35:14	[TOC]\
\
> 互联网正在不知不觉中改造着我们的大脑，使我们失去深度阅读和缜密思维的能力。我们的注意力如今已如此分散支离——专注做事，有时竟已成为了一种稀缺能力。然而不管对工作还是生活，专注都是一项不可或缺的能力。\
\
我们总是爱寻找努力的方向，却很难在一个方向无畏前行。每个人的脑袋就像这样，方向很多，时常彷徨。\
\
![Brain](https://dn-woerwosi.qbox.me/blog/images/2015/11/0/brain.jpg)\
\
在无穷的想法驱使之下，我们永远没有足够的时间，因为总是不知道自己都将时间花在了什么地方。**Oliver Emberton有过一个精妙的比喻。他将我们的大脑比作就像灌满了蜜蜂的沙滩排球，上百个互相矛盾的冲动想法把我们推向不同的方向。**\
\
我们恨不得一下做完所有的事情：我们想同时既锻炼身体又学英语，还要出去吃披萨。我们的欲望是无限的，各个不同的力量，把我们大脑的这个“沙滩排球”推向各个方向。\
\
![bumblebee](https://dn-woerwosi.qbox.me/blog/images/2015/11/0/bumblebee_1.jpg)\
\
于是，通常的情况是那个球那儿也到不了。它更容易受地形的影响，而不是受到“蜜蜂”们的控制。这是绝大多数人的生活方式。\
\
偏执狂一般聚焦在一个目标上，这可能是能够成功的唯一策略。当能够在一个目标上聚焦，而且是持久地，成就或将会达到它们的理论上限。想像一个自己做梦也不敢想的目标，比如想写一本书，或者登上火星。扔掉所有其它的事情，把自己变成一只巨大的大黄蜂，向一个方向猛推。\
\
![bumblebee](https://dn-woerwosi.qbox.me/blog/images/2015/11/0/bumblebee_2.jpg)\
\
信息科技千方百计地吸引我们的注意力，最后又把我们的注意力分散支离。互联网正在不知不觉中改造着我们的大脑，使我们充满了方向，却又失去了方向。\
\
![bumblebee](https://dn-woerwosi.qbox.me/blog/images/2015/11/0/bumblebee_3.png)\
\
事实上，方向的数量与我们可以取得成就在某种程度上成反比。按照上面的这个公式，每多一个方向将会使你所能达成的成果降到1/4。我们脑袋里的想法越多，就越难抵制诱惑，去专注和执着于一个目标。 \
\
![bumblebee](https://dn-woerwosi.qbox.me/blog/images/2015/11/0/bumblebee_4.jpg)\
\
在互联网内容中每日浸泡的我们每个人，思路就象一只跳来跳去的猴子，一会想这个，一会想那个，而训练自己集中注意力就是要驯服这只大猴子。 \
\
在日常生活中，可以采用下面这些技巧，让自己更加专注。\
\
1、专注力到底是什么？ \
\
专注的概念其实很简单，它就是讲你从多个方向中解放出来，一次只将精力放在一件事上。 “Concentration is taking your mind off many things and putting it on one thing at a time.” \
\
2、控制思维 \
\
学会控制思维。事实上，如果认定自己可以保持专注，那么就可以。可以试试“5 More”法则，当自己就快要放弃的时候，告诉自己：我还可以再坚持五分钟。完成这五分钟之后，再来一轮新的五分钟。如此一来，大目标就在这样的每一个五分钟的过程逐渐完成。 \
\
还有一个小窍门：对于本可以不需要手参与的事情，增加手参与一下，是特别好的一个方法。比如，看书的时候，同时手上做笔记。 \
\
3、最麻烦的任务先做 \
\
在完成一系列的任务时，将难的任务放在第一个，因为最开始做一件事时，我们总是会更加专注和富有能量。如此一来，就会发现，事情完成得越多就越容易。 \
\
4、只关注生活中最重要的事 \
\
很多时候，我们会慢慢变成我们专注的那个人或事。 \
\
你是否注意到，结婚多年的夫妻会变得越来越像对方，而在性格上，很多人会逐渐和他们工作的上司、同事甚至是和他朝夕相处的宠物越来越像。 \
\
人的精力是有限的，如果操心太多事情，就坚持2-3件已经开始操心的事情，然后放弃剩下的那些。这些放弃不仅包括一些工作和生活上的目标，甚至会包括长久以来的生活习惯甚至是一些人脉关系。 \
\
5、明确自己的目标 \
\
我们都要做一个目的导向型的人，然后顺应着心中的方向一点一点去实现。不要担心如果目标不能够100%实现怎么办，我们所需要做的，就是努力去接近它。 \
\
没有目标的持续高强度的专注于某件事，将只会造成困扰。 \
\
6、找到专注力“杀手” \
\
如果把思路比作猴子，知道为什么会注意力不集中，就容易驯服这只大猴子了。注意力不集中的原因主要分内因和外因两类: \
外部干扰包括：噪音，对话，不舒服的椅子和桌子，不合适的灯光，电视，工作，家务，网络，电子邮件等。 \
内部因素包括：饿了，累了，病了，没有动力，感到厌烦，没有兴趣，焦虑，压力和烦恼，消极的想法，白日梦等等。 \
找到这些杀手，排除他们。 \
\
7、找准效率最高的时间 \
\
专注并不意味着能够在所有的工作时间里满负荷工作。人都会有消极的状态（并不犯困却又无法高效工作时），深入了解自己，知道什么时候效率最高。 如果觉得自己在晚上写作的效率更高，那么就安排晚上作为写作时间，这样就可以在第二天早上寄出文章，这样的方式能让你更高效。 \
\
8、学会休息，保证充足睡眠 \
\
就算是牺牲一些活动，也要坚持准时睡觉，同时管理好白天的日常安排，保证晚上能够有至少8小时的睡眠时间。床单和床垫一定要买质量好的。这是一个非常有价值的投资，因为人的一生中有30%的时间是需要花在床上的。 \
\
也许我们已经习惯在睡前或醒后刷刷朋友圈和微博，刷完之后我们学到了什么了呢？或许可以尝试不去做这些事情来保证自己的休息。\
\
电脑硬盘碎片化了可以进行磁盘整理，大脑注意力碎片化了却没有简单的程序一键修复。 专注是一种能力，它需要花费很长的时间来学习和培养。\
\
文章修改自：[专注做事，竟然也成为我们的稀缺能力](http://www.nowamagic.net/librarys/veda/detail/2755)\
\
\
\

22	0	RainDon	前端性能优化：资源预加载	source-preload	1	1		0	ImShengli	性能优化				<div class="md-section-divider"></div>\
\
<p><div class="toc">\
<ul>\
<li><ul>\
<li><ul>\
<li><a href="#dns-prefetch">DNS-Prefetch</a></li>\
<li><a href="#preconnect">Preconnect</a></li>\
<li><a href="#prefetching">Prefetching</a></li>\
<li><a href="#subresources">Subresources</a></li>\
<li><a href="#prerender">Prerender</a></li>\
<li><a href="#preload">Preload</a></li>\
<li><a href="#问题">问题</a></li>\
<li><a href="#参考链接">参考链接：</a></li>\
</ul>\
</li>\
</ul>\
</li>\
</ul>\
</div>\
</p>\
\
<blockquote class="white-blockquote">\
  <p>本文是前端性能优化系列文章之一，从预加载方面阐述前端性能优化的可能性。所有预加载技术都存在一个潜在的风险：对资源预测错误，而预加载的开销（抢占 CPU 资源，消耗电池，浪费带宽等）是高昂的，所以必须谨慎行事。</p>\
</blockquote>\
\
<div class="md-section-divider"></div>\
\
<h3 id="dns-prefetch">DNS-Prefetch</h3>\
\
<p>1、综述</p>\
\
<p>在很多网站的源代码中都有一段dns-prefetch的代码，例如淘宝：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="tag">&lt;link</span><span class="pln"> </span><span class="atn">rel</span><span class="pun">=</span><span class="atv">"dns-prefetch"</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"//g.tbcdn.cn"</span><span class="tag">&gt;</span></code></li><li class="L1"><code><span class="tag">&lt;link</span><span class="pln"> </span><span class="atn">rel</span><span class="pun">=</span><span class="atv">"dns-prefetch"</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"//g.alicdn.com"</span><span class="tag">&gt;</span></code></li><li class="L2"><code><span class="tag">&lt;link</span><span class="pln"> </span><span class="atn">rel</span><span class="pun">=</span><span class="atv">"dns-prefetch"</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"//gw.alicdn.com"</span><span class="tag">&gt;</span></code></li><li class="L3"><code><span class="tag">&lt;link</span><span class="pln"> </span><span class="atn">rel</span><span class="pun">=</span><span class="atv">"dns-prefetch"</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"//gtms01.alicdn.com"</span><span class="tag">&gt;</span></code></li><li class="L4"><code><span class="pln">...</span></code></li></ol></pre>\
\
<p>dns-prefetch便是DNS预解析；通过DNS预解析来告诉浏览器未来我们可能从某个特定的URL获取资源，当浏览器真正使用到该域中的某个资源时就可以尽快地完成DNS解析。</p>\
\
<p>2、使用</p>\
\
<p>默认情况下浏览器会对页面中和当前域名（正在浏览网页的域名）不在同一个域的域名进行预获取，并且缓存结果，这就是隐式的DNS-Prefetch。如果想对页面中没有出现的域进行预解析，那么就要使用显示的DNS-Prefetch了，使用link标签，如：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="tag">&lt;link</span><span class="pln"> </span><span class="atn">rel</span><span class="pun">=</span><span class="atv">"dns-prefetch"</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"//g.cloudcdn.com"</span><span class="tag">&gt;</span></code></li></ol></pre>\
\
<p>禁止使用隐式的DNS-Prefetch，可使用下面代码：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="tag">&lt;meta</span><span class="pln"> </span><span class="atn">http-equiv</span><span class="pun">=</span><span class="atv">”x-dns-prefetch-control”</span><span class="pln"> </span><span class="atn">content</span><span class="pun">=</span><span class="atv">”off”</span><span class="tag">&gt;</span></code></li></ol></pre>\
\
<p>3、优缺点</p>\
\
<p>优点：当浏览器真正请求该域中的某个资源时，就无需再进行DNS解析； <br>\
缺点：多页面重复DNS预解析会增加重复DNS查询次数；</p>\
\
<p>4、兼容性</p>\
\
<p>（1）Chrome：Supported <br>\
（2）Safari：5+ <br>\
（3）Firefox：3.5+ <br>\
（4）Opera：Unknown <br>\
（5）IE：9+，名称为：Pre-resolution</p>\
\
<p>5、扩展阅读</p>\
\
<p>（1）数据显示典型的一次DNS解析耗费20~120毫秒，所以DNS预解析可以减少用户等待的时间；而域名解析和内容载入是串行的网络操作，并不会影响页面其他内容的加载或渲染； <br>\
（2）对于DNS的优化，除了预解析之外，另外就是减少DNS解析的数目； <br>\
（3）另外加速DNS解析的速度可以使用 <a href="http://members.home.nl/p.a.rombouts/pdnsd/index.html#aboutpdnsd" target="_blank">pdnsd</a> 之类的缓存DNS代理服务器； <br>\
（4）在Chrome中，可以通过输入<code>chrome://DNS</code>来查看一些DNS数据。</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="preconnect">Preconnect</h3>\
\
<p>1、综述</p>\
\
<p>Preconnect 称为“预连接”，除了进行预解析之外，还将进行TCP握手和建立传输层协议。</p>\
\
<p>2、使用</p>\
\
<p>可以通过以下方式进行 Preconnect：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="tag">&lt;link</span><span class="pln"> </span><span class="atn">rel</span><span class="pun">=</span><span class="atv">"preconnect"</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"//g.cloudcdn.com"</span><span class="tag">&gt;</span></code></li></ol></pre>\
\
<p>3、优缺点</p>\
\
<p>4、兼容性</p>\
\
<p>（1）Chrome：46+ <br>\
（2）Firefox：39+ <br>\
（3）其他：不支持</p>\
\
<p>5、扩展阅读</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="prefetching">Prefetching</h3>\
\
<p>1、综述</p>\
\
<p>Prefetching 称为“预获取”，让浏览器预先请求资源并放入浏览器缓存中。</p>\
\
<p>2、使用</p>\
\
<p>可以通过以下方式进行 Prefetching：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="tag">&lt;link</span><span class="pln"> </span><span class="atn">rel</span><span class="pun">=</span><span class="atv">"prefetch"</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"/images/big.jpeg"</span><span class="tag">&gt;</span></code></li></ol></pre>\
\
<p>3、优缺点</p>\
\
<p>4、兼容性</p>\
\
<p>5、扩展阅读</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="subresources">Subresources</h3>\
\
<p>1、综述</p>\
\
<p>这是另一种预获取方式，这种方式指定的预获取资源具有最高的优先级，在所有 prefetch 项之前进行；如果资源是当前页面必须的，或者资源需要尽快可用，那么最好使用<code>subresource</code>而不是<code>prefetch</code>；</p>\
\
<p>2、使用</p>\
\
<p>通过以下方式使用 subresource：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="tag">&lt;link</span><span class="pln"> </span><span class="atn">rel</span><span class="pun">=</span><span class="atv">"subresource"</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"index.css"</span><span class="tag">&gt;</span></code></li></ol></pre>\
\
<p>3、优缺点</p>\
\
<p>4、兼容性</p>\
\
<p>5、扩展阅读</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="prerender">Prerender</h3>\
\
<p>1、综述</p>\
\
<p><code>prerender</code>可以预先加载文档的所有资源。这类似于在一个隐藏的 tab 页中打开了某个链接 – 将下载所有资源、创建 DOM 结构、完成页面布局、应用 CSS 样式和执行 JavaScript 脚本等。当用户真正访问该链接时，隐藏的页面就切换为可见，使页面看起来就是瞬间加载完成一样。Google 搜索在其即时搜索页面中已经应用该技术多年了，微软也宣称将在 IE11 中支持该特性。</p>\
\
<p>2、使用</p>\
\
<p>通过以下方式使用 prerender：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="tag">&lt;link</span><span class="pln"> </span><span class="atn">rel</span><span class="pun">=</span><span class="atv">"prerender"</span><span class="pln"> </span><span class="atn">href</span><span class="pun">=</span><span class="atv">"http://example.com"</span><span class="tag">&gt;</span></code></li></ol></pre>\
\
<p>3、优缺点</p>\
\
<p>4、兼容性</p>\
\
<p>5、扩展阅读</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="preload">Preload</h3>\
\
<p>1、综述</p>\
\
<p>2、使用</p>\
\
<p>3、优缺点</p>\
\
<p>4、兼容性</p>\
\
<p>5、扩展阅读</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="问题">问题</h3>\
\
<p>1、验证域名解析和内容载入是串行操作；</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="参考链接">参考链接：</h3>\
\
<p>1、DNS预解析</p>\
\
<ul>\
<li><a href="http://bubkoo.com/2015/11/19/prefetching-preloading-prebrowsing/" target="_blank">http://bubkoo.com/2015/11/19/prefetching-preloading-prebrowsing/</a></li>\
<li><a href="http://blog.webfuns.net/archives/1357.html" target="_blank">http://blog.webfuns.net/archives/1357.html</a></li>\
</ul>	资源预加载，即为空闲时预先加载可能会需要的页面资源。这里面涉及到几个方面的知识：DNS-Prefetch、Preconnect、Prefetching、Subresources、Prerender、Preload等，使用预加载技术从而优化页面性能。	14	0	2015-12-17 19:20:23	2015-12-16 19:26:31	[TOC]\
\
> 本文是前端性能优化系列文章之一，从预加载方面阐述前端性能优化的可能性。所有预加载技术都存在一个潜在的风险：对资源预测错误，而预加载的开销（抢占 CPU 资源，消耗电池，浪费带宽等）是高昂的，所以必须谨慎行事。\
\
### DNS-Prefetch\
\
1、综述\
\
在很多网站的源代码中都有一段dns-prefetch的代码，例如淘宝：\
```\
<link rel="dns-prefetch" href="//g.tbcdn.cn">\
<link rel="dns-prefetch" href="//g.alicdn.com">\
<link rel="dns-prefetch" href="//gw.alicdn.com">\
<link rel="dns-prefetch" href="//gtms01.alicdn.com">\
...\
```\
dns-prefetch便是DNS预解析；通过DNS预解析来告诉浏览器未来我们可能从某个特定的URL获取资源，当浏览器真正使用到该域中的某个资源时就可以尽快地完成DNS解析。\
\
2、使用\
\
默认情况下浏览器会对页面中和当前域名（正在浏览网页的域名）不在同一个域的域名进行预获取，并且缓存结果，这就是隐式的DNS-Prefetch。如果想对页面中没有出现的域进行预解析，那么就要使用显示的DNS-Prefetch了，使用link标签，如：\
```\
<link rel="dns-prefetch" href="//g.cloudcdn.com">\
```\
禁止使用隐式的DNS-Prefetch，可使用下面代码：\
```\
<meta http-equiv=”x-dns-prefetch-control” content=”off”>\
```\
\
3、优缺点\
\
优点：当浏览器真正请求该域中的某个资源时，就无需再进行DNS解析；\
缺点：多页面重复DNS预解析会增加重复DNS查询次数；\
\
4、兼容性\
\
（1）Chrome：Supported\
（2）Safari：5+\
（3）Firefox：3.5+\
（4）Opera：Unknown\
（5）IE：9+，名称为：Pre-resolution\
\
5、扩展阅读\
\
（1）数据显示典型的一次DNS解析耗费20~120毫秒，所以DNS预解析可以减少用户等待的时间；而域名解析和内容载入是串行的网络操作，并不会影响页面其他内容的加载或渲染；\
（2）对于DNS的优化，除了预解析之外，另外就是减少DNS解析的数目；\
（3）另外加速DNS解析的速度可以使用 [pdnsd](http://members.home.nl/p.a.rombouts/pdnsd/index.html#aboutpdnsd) 之类的缓存DNS代理服务器；\
（4）在Chrome中，可以通过输入`chrome://DNS`来查看一些DNS数据。\
 \
### Preconnect\
\
1、综述\
\
Preconnect 称为“预连接”，除了进行预解析之外，还将进行TCP握手和建立传输层协议。\
\
2、使用\
\
可以通过以下方式进行 Preconnect：\
```\
<link rel="preconnect" href="//g.cloudcdn.com">\
```\
\
3、优缺点\
\
4、兼容性\
\
（1）Chrome：46+\
（2）Firefox：39+\
（3）其他：不支持\
\
5、扩展阅读\
\
### Prefetching\
\
1、综述\
\
Prefetching 称为“预获取”，让浏览器预先请求资源并放入浏览器缓存中。\
\
2、使用\
\
可以通过以下方式进行 Prefetching：\
```\
<link rel="prefetch" href="/images/big.jpeg">\
```\
\
3、优缺点\
\
4、兼容性\
\
5、扩展阅读\
\
\
### Subresources\
\
1、综述\
\
这是另一种预获取方式，这种方式指定的预获取资源具有最高的优先级，在所有 prefetch 项之前进行；如果资源是当前页面必须的，或者资源需要尽快可用，那么最好使用`subresource`而不是`prefetch`；\
\
2、使用\
\
通过以下方式使用 subresource：\
```\
<link rel="subresource" href="index.css">\
```\
\
3、优缺点\
\
4、兼容性\
\
5、扩展阅读\
\
### Prerender\
\
1、综述\
\
`prerender`可以预先加载文档的所有资源。这类似于在一个隐藏的 tab 页中打开了某个链接 – 将下载所有资源、创建 DOM 结构、完成页面布局、应用 CSS 样式和执行 JavaScript 脚本等。当用户真正访问该链接时，隐藏的页面就切换为可见，使页面看起来就是瞬间加载完成一样。Google 搜索在其即时搜索页面中已经应用该技术多年了，微软也宣称将在 IE11 中支持该特性。\
\
2、使用\
\
通过以下方式使用 prerender：\
```\
<link rel="prerender" href="http://example.com">\
```\
\
3、优缺点\
\
4、兼容性\
\
5、扩展阅读\
\
### Preload\
\
1、综述\
\
2、使用\
\
3、优缺点\
\
4、兼容性\
\
5、扩展阅读\
\
### 问题\
\
1、验证域名解析和内容载入是串行操作；\
\
### 参考链接：\
\
1、DNS预解析\
\
- http://bubkoo.com/2015/11/19/prefetching-preloading-prebrowsing/\
- http://blog.webfuns.net/archives/1357.html\
                
23	0	RainDon	前端工程：前端发展历程	front-end-develop-history	1	1		0	ImShengli	前端工程				<div class="md-section-divider"></div>\
\
<p><div class="toc">\
<ul>\
<li><ul>\
<li><ul>\
<li><a href="#前端工程化包含的内容">前端工程化包含的内容</a></li>\
<li><a href="#前端工程的三个阶段">前端工程的三个阶段</a></li>\
<li><a href="#总结">总结</a></li>\
<li><a href="#参考链接">参考链接：</a></li>\
</ul>\
</li>\
</ul>\
</li>\
</ul>\
</div>\
</p>\
\
<blockquote class="white-blockquote">\
  <p>工程的本质，是改善生产力和用技术降低工程和协作成本。</p>\
</blockquote>\
\
<p>记得10年，第一次写网页，废寝忘食通宵达旦，只为写一些自认为好看的网站；体验过Dreamweaver的臃肿，因无法便利的自定义而舍弃，投入了table布局的怀抱中，现在想想，不堪回首。而如今，前端可谓包罗万象，产品形态五花八门，涉猎极广，下面一张图很能说明问题：</p>\
\
<p><img src="https://dn-woerwosi.qbox.me/blog/images/2016/0/5/fe-structer.jpg" alt="前端知识结构图" title=""></p>\
\
<p>一些复杂的Web应用，它们功能完善，界面繁多，为用户提供了完整的产品体验，可能是新闻聚合网站，可能是在线购物平台，可能是社交网络，可能是金融信贷应用，可能是音乐互动社区，也可能是视频上传与分享平台……</p>\
\
<blockquote class="white-blockquote">\
  <p>从本质上讲，所有Web应用都是一种运行在网页浏览器中的软件，这些软件的图形用户界面（Graphical User Interface，简称GUI）即为前端。</p>\
</blockquote>\
\
<p>尽管Web应用的复杂程度与日俱增，用户对其前端界面也提出了更高的要求，但时至今日如何从软件工程的角度去思考前端开发，来助力团队的开发效率，是前端开发工程师应该思考的问题。</p>\
\
<p>历史悠久的前端开发，始终像是放养的野孩子，原始如斯，不免让人慨叹！</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="前端工程化包含的内容">前端工程化包含的内容</h3>\
\
<ul>\
<li>前端开发规范</li>\
<li>开发组织结构</li>\
<li>模块化</li>\
<li>单元测试</li>\
<li>性能优化</li>\
<li>打包编译</li>\
<li>......</li>\
</ul>\
\
<div class="md-section-divider"></div>\
\
<h3 id="前端工程的三个阶段">前端工程的三个阶段</h3>\
\
<p><strong>1、库/框架选型</strong></p>\
\
<p><img src="https://dn-woerwosi.qbox.me/blog/images/2016/0/6/libs.png" alt="libs" title=""></p>\
\
<p>前端工程建设的第一项任务就是根据项目特征进行技术选型。</p>\
\
<p>基本上现在没有人完全从0开始做网站，jQuery等库的出现、React/Angularjs等框架横空出世，解放了不少生产力，合理的技术选型可以为项目节省许多工程量这点毋庸置疑。</p>\
\
<p><strong>2、简单构建优化</strong></p>\
\
<p><img src="https://dn-woerwosi.qbox.me/blog/images/2016/0/6/tools.png" alt="tools" title=""></p>\
\
<p>选型之后基本上就可以开始敲码了，不过光解决开发效率还不够，必须要兼顾运行性能。前端工程进行到第二阶段会选型一种构建工具，对代码进行压缩，校验，之后再以页面为单位进行简单的资源合并。</p>\
\
<p>前端开发工程化程度之低，常常出乎我的意料，我之前在百度工作时是没有多少概念的，直到离开大公司的温室，去到业界与更多的团队交流才发现，能做到这个阶段在业界来说已然超出平均水平，属于“具备较高工程化程度”的团队了，查看网上形形色色的网页源代码，能做到最基本的JS/CSS压缩的Web应用都已跨入标准互联网公司行列，不难理解为什么很多前端团队对于前端工程构建的认知还仅停留在“压缩、校验、合并”这种程度。</p>\
\
<p><strong>3、模块化开发</strong>             </p>\
\
<p><img src="https://dn-woerwosi.qbox.me/blog/images/2016/0/6/libs-2.png" alt="libs" title=""></p>\
\
<p>分而治之是软件工程中的重要思想，是复杂系统开发和维护的基石，这点放在前端开发中同样适用。在解决了基本开发效率运行效率问题之后，前端团队开始思考维护效率，模块化是目前前端最流行的分治手段。</p>\
\
<blockquote class="white-blockquote">\
  <p>很多人觉得模块化开发的工程意义是复用，我不太认可这种看法，在我看来，模块化开发的最大价值应该是分治，是分治，分治！（重说三）。 <br>\
  不管你将来是否要复用某段代码，你都有充分的理由将其分治为一个模块。</p>\
</blockquote>\
\
<p>JS模块化方案很多，AMD/CommonJS/UMD/ES6 Module等，对应的框架和工具也一大堆，说起来很烦，大家自行百度吧；CSS模块化开发基本都是在less、sass、stylus等预处理器的import/mixin特性支持下实现的。</p>\
\
<p>虽然这些技术由来已久，在如今这个“言必及React”的时代略显落伍，但想想业界的绝大多数团队的工程化落后程度，放眼望去，毫不夸张的说，能达到第三阶段的前端团队已属于高端行列，基本具备了开发维护一般规模Web应用的能力。</p>\
\
<p>然而，做到这些就够了么？Naive！</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="总结">总结</h3>\
\
<blockquote class="white-blockquote">\
  <p>前端是一种技术问题较少、工程问题较多的软件开发领域。</p>\
</blockquote>\
\
<p>当我们要开发一款完整的Web应用时，前端将面临更多的工程问题，比如：</p>\
\
<ul>\
<li>大体量：多功能、多页面、多状态、多系统；</li>\
<li>大规模：多人甚至多团队合作开发；</li>\
<li>高性能：CDN部署、缓存控制、文件指纹、缓存复用、请求合并、按需加载、同步/异步加载、移动端首屏CSS内嵌、HTTP 2.0服务端资源推送。</li>\
</ul>\
\
<p>这些无疑是一系列严肃的系统工程问题。</p>\
\
<p>前面讲的三个阶段虽然相比曾经“茹毛饮血”的时代进步不少，但用于支撑第四阶段的多人合作开发以及精细的性能优化似乎还欠缺点什么。</p>\
\
<p>到底，缺什么呢？</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="参考链接">参考链接：</h3>\
\
<p>（1）<a href="https://github.com/fouber/blog/issues/10" target="_blank">前端工程——基础篇</a> <br>\
（2）<a href="https://github.com/fouber/blog/issues/6" target="_blank">大公司里怎样开发和部署前端代码？</a>        </p>	前端开发在如今的工程项目中承担了举足轻重的地位，前端开发工程师所担当的角色愈发重要，前端也向工程化方向迈进。本系列是对前端工程化方面的总结，本文从前端历史承担的角色说起。	16	0	2016-01-16 21:20:23	2016-01-07 19:40:29	[TOC]\
\
> 工程的本质，是改善生产力和用技术降低工程和协作成本。\
\
记得10年，第一次写网页，废寝忘食通宵达旦，只为写一些自认为好看的网站；体验过Dreamweaver的臃肿，因无法便利的自定义而舍弃，投入了table布局的怀抱中，现在想想，不堪回首。而如今，前端可谓包罗万象，产品形态五花八门，涉猎极广，下面一张图很能说明问题：\
\
![前端知识结构图](https://dn-woerwosi.qbox.me/blog/images/2016/0/5/fe-structer.jpg)\
\
一些复杂的Web应用，它们功能完善，界面繁多，为用户提供了完整的产品体验，可能是新闻聚合网站，可能是在线购物平台，可能是社交网络，可能是金融信贷应用，可能是音乐互动社区，也可能是视频上传与分享平台……\
\
> 从本质上讲，所有Web应用都是一种运行在网页浏览器中的软件，这些软件的图形用户界面（Graphical User Interface，简称GUI）即为前端。\
\
尽管Web应用的复杂程度与日俱增，用户对其前端界面也提出了更高的要求，但时至今日如何从软件工程的角度去思考前端开发，来助力团队的开发效率，是前端开发工程师应该思考的问题。\
\
历史悠久的前端开发，始终像是放养的野孩子，原始如斯，不免让人慨叹！\
\
### 前端工程化包含的内容\
\
 - 前端开发规范\
 - 开发组织结构\
 - 模块化\
 - 单元测试\
 - 性能优化\
 - 打包编译\
 - ......\
\
### 前端工程的三个阶段\
\
**1、库/框架选型**\
\
![libs](https://dn-woerwosi.qbox.me/blog/images/2016/0/6/libs.png)\
\
前端工程建设的第一项任务就是根据项目特征进行技术选型。\
\
基本上现在没有人完全从0开始做网站，jQuery等库的出现、React/Angularjs等框架横空出世，解放了不少生产力，合理的技术选型可以为项目节省许多工程量这点毋庸置疑。\
\
**2、简单构建优化**\
\
![tools](https://dn-woerwosi.qbox.me/blog/images/2016/0/6/tools.png)\
\
选型之后基本上就可以开始敲码了，不过光解决开发效率还不够，必须要兼顾运行性能。前端工程进行到第二阶段会选型一种构建工具，对代码进行压缩，校验，之后再以页面为单位进行简单的资源合并。\
\
前端开发工程化程度之低，常常出乎我的意料，我之前在百度工作时是没有多少概念的，直到离开大公司的温室，去到业界与更多的团队交流才发现，能做到这个阶段在业界来说已然超出平均水平，属于“具备较高工程化程度”的团队了，查看网上形形色色的网页源代码，能做到最基本的JS/CSS压缩的Web应用都已跨入标准互联网公司行列，不难理解为什么很多前端团队对于前端工程构建的认知还仅停留在“压缩、校验、合并”这种程度。\
\
**3、模块化开发**             \
\
![libs](https://dn-woerwosi.qbox.me/blog/images/2016/0/6/libs-2.png)\
\
分而治之是软件工程中的重要思想，是复杂系统开发和维护的基石，这点放在前端开发中同样适用。在解决了基本开发效率运行效率问题之后，前端团队开始思考维护效率，模块化是目前前端最流行的分治手段。\
\
> 很多人觉得模块化开发的工程意义是复用，我不太认可这种看法，在我看来，模块化开发的最大价值应该是分治，是分治，分治！（重说三）。\
不管你将来是否要复用某段代码，你都有充分的理由将其分治为一个模块。\
\
JS模块化方案很多，AMD/CommonJS/UMD/ES6 Module等，对应的框架和工具也一大堆，说起来很烦，大家自行百度吧；CSS模块化开发基本都是在less、sass、stylus等预处理器的import/mixin特性支持下实现的。\
\
虽然这些技术由来已久，在如今这个“言必及React”的时代略显落伍，但想想业界的绝大多数团队的工程化落后程度，放眼望去，毫不夸张的说，能达到第三阶段的前端团队已属于高端行列，基本具备了开发维护一般规模Web应用的能力。\
\
然而，做到这些就够了么？Naive！\
\
### 总结\
\
> 前端是一种技术问题较少、工程问题较多的软件开发领域。\
\
当我们要开发一款完整的Web应用时，前端将面临更多的工程问题，比如：\
\
- 大体量：多功能、多页面、多状态、多系统；\
- 大规模：多人甚至多团队合作开发；\
- 高性能：CDN部署、缓存控制、文件指纹、缓存复用、请求合并、按需加载、同步/异步加载、移动端首屏CSS内嵌、HTTP 2.0服务端资源推送。\
\
这些无疑是一系列严肃的系统工程问题。\
\
前面讲的三个阶段虽然相比曾经“茹毛饮血”的时代进步不少，但用于支撑第四阶段的多人合作开发以及精细的性能优化似乎还欠缺点什么。\
\
到底，缺什么呢？\
\
### 参考链接：\
\
（1）[前端工程——基础篇](https://github.com/fouber/blog/issues/10)\
（2）[大公司里怎样开发和部署前端代码？](https://github.com/fouber/blog/issues/6)        
24	0	RainDon	HTTP 缓存	http-cache	1	1		0	ImShengli	HTTP				<div class="md-section-divider"></div>\
\
<p><div class="toc">\
<ul>\
<li><ul>\
<li><ul>\
<li><a href="#缓存验证流程">缓存验证流程</a></li>\
<li><a href="#头信息解读">头信息解读</a></li>\
<li><a href="#参考链接">参考链接</a></li>\
</ul>\
</li>\
</ul>\
</li>\
</ul>\
</div>\
</p>\
\
<p>在HTTP缓存的性能优化中，我们需要做的是使服务器返回准确的HTTP Response Header，以指导浏览器何时可以缓存响应以及可以缓存多久。</p>\
\
<p>服务器在返回响应时，会同时返回一组HTTP Response Header头信息，用来描述内容类型、长度、缓存指令、验证令牌等；例如，在下图的交互中，服务器返回了一个 1024 字节的响应，指定客户端缓存响应长达 120 秒，并提供验证令牌（x234dff），在响应过期之后，可以用来验证资源是否被修改。</p>\
\
<p><img src="https://dn-woerwosi.qbox.me/blog/images/2016/0/5/http-request.png" alt="Response Header" title=""></p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="缓存验证流程">缓存验证流程</h3>\
\
<p>假设现在我们请求“/index.html”页面：</p>\
\
<p>（1）浏览器第一次访问服务器该资源，在浏览器中没有缓存文件，直接向服务器发送请求，服务器返回此页面，状态为：200 OK。在response header中可能会设置index.html页面的缓存过期时间、文件最后修改时间和根据index.html内容计算出来的实体标记Entity Tag，简称Etag。浏览器加载完成后将/index.html路径的请求缓存到本地。</p>\
\
<p>（2）浏览器第二次访问服务器资源，于本地已经有了此路径下的缓存文件，所以这一次就不直接向服务器发送请求了。首先，进行缓存过期判断。浏览器根据（1）中设置缓存过期时间判断缓存文件是否过期。</p>\
\
<ul>\
<li>情景一：若没有过期，则不向服务器发送请求，直接使用缓存中的结果，此时我们在浏览器控制台中可以看到：200 OK(from cache) ，此时的情况就是完全使用缓存，浏览器和服务器没有任何交互；</li>\
<li>情景二：若已过期，则向服务器发送请求，此时请求中会带上（1）中设置的文件修改时间和Etag；</li>\
</ul>\
\
<p>然后，进行资源更新判断。服务器根据浏览器传过来的文件修改时间，判断自浏览器上一次请求之后，文件是不是没有被修改过；根据Etag，判断文件内容自上一次请求之后，有没有发生变化：</p>\
\
<ul>\
<li>情形一：若两种判断的结论都是文件没有被修改过，则服务器就不给浏览器发index.html的内容了，直接告诉它，文件没有被修改过，你用你那边的缓存：304 Not Modified，此时浏览器就会从本地缓存中获取index.html的内容。此时的情况叫协议缓存，浏览器和服务器之间有一次请求交互。</li>\
<li>情形二：若修改时间和文件内容判断有任意一个没有通过，则服务器会受理此次请求，之后的操作同（1）。</li>\
</ul>\
\
<div class="md-section-divider"></div>\
\
<h3 id="头信息解读">头信息解读</h3>\
\
<p><strong>Cache-Control</strong> <br>\
此属性有两个值：no-cache和no-store，前者表示使用缓存前必须要和服务器发送请求确认是否可以使用缓存，后者表示客户端和中继器（路由器等）禁止使用任何版本的缓存；</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="参考链接">参考链接</h3>\
\
<ul>\
<li><a href="https://developer.mozilla.org/zh-CN/docs/Web/HTTP/Access_control_CORS" target="_blank">HTTP访问控制 CORS</a></li>\
</ul>	通过网络获取内容既缓慢，成本又高：大的响应需要在客户端和服务器之间进行多次往返通信，这拖延了浏览器可以使用和处理内容的时间，同时也增加了访问者的数据成本。因此，缓存和重用以前获取的资源的能力成为优化性能很关键的一个方面。	16	0	2016-01-23 08:17:59	2016-01-16 11:11:38	[TOC]\
\
在HTTP缓存的性能优化中，我们需要做的是使服务器返回准确的HTTP Response Header，以指导浏览器何时可以缓存响应以及可以缓存多久。\
\
服务器在返回响应时，会同时返回一组HTTP Response Header头信息，用来描述内容类型、长度、缓存指令、验证令牌等；例如，在下图的交互中，服务器返回了一个 1024 字节的响应，指定客户端缓存响应长达 120 秒，并提供验证令牌（x234dff），在响应过期之后，可以用来验证资源是否被修改。\
\
![Response Header](https://dn-woerwosi.qbox.me/blog/images/2016/0/5/http-request.png)\
\
### 缓存验证流程\
\
假设现在我们请求“/index.html”页面：\
\
（1）浏览器第一次访问服务器该资源，在浏览器中没有缓存文件，直接向服务器发送请求，服务器返回此页面，状态为：200 OK。在response header中可能会设置index.html页面的缓存过期时间、文件最后修改时间和根据index.html内容计算出来的实体标记Entity Tag，简称Etag。浏览器加载完成后将/index.html路径的请求缓存到本地。\
\
（2）浏览器第二次访问服务器资源，于本地已经有了此路径下的缓存文件，所以这一次就不直接向服务器发送请求了。首先，进行缓存过期判断。浏览器根据（1）中设置缓存过期时间判断缓存文件是否过期。\
\
 - 情景一：若没有过期，则不向服务器发送请求，直接使用缓存中的结果，此时我们在浏览器控制台中可以看到：200 OK(from cache) ，此时的情况就是完全使用缓存，浏览器和服务器没有任何交互；\
 - 情景二：若已过期，则向服务器发送请求，此时请求中会带上（1）中设置的文件修改时间和Etag；\
\
然后，进行资源更新判断。服务器根据浏览器传过来的文件修改时间，判断自浏览器上一次请求之后，文件是不是没有被修改过；根据Etag，判断文件内容自上一次请求之后，有没有发生变化：\
\
 - 情形一：若两种判断的结论都是文件没有被修改过，则服务器就不给浏览器发index.html的内容了，直接告诉它，文件没有被修改过，你用你那边的缓存：304 Not Modified，此时浏览器就会从本地缓存中获取index.html的内容。此时的情况叫协议缓存，浏览器和服务器之间有一次请求交互。\
 - 情形二：若修改时间和文件内容判断有任意一个没有通过，则服务器会受理此次请求，之后的操作同（1）。\
\
 \
### 头信息解读        \
\
**Cache-Control**\
此属性有两个值：no-cache和no-store，前者表示使用缓存前必须要和服务器发送请求确认是否可以使用缓存，后者表示客户端和中继器（路由器等）禁止使用任何版本的缓存；\
\
### 参考链接\
\
- [HTTP访问控制 CORS](https://developer.mozilla.org/zh-CN/docs/Web/HTTP/Access_control_CORS)\
        
25	0	RainDon	与快排（Quick Sort）相关	something-about-quick-sort	3	1		0	ImShengli	Algorithm				<div class="md-section-divider"></div>\
\
<p><div class="toc">\
<ul>\
<li><ul>\
<li><ul>\
<li><a href="#猜数字">猜数字</a></li>\
<li><a href="#称球">称球</a></li>\
<li><a href="#排序">排序</a></li>\
<li><a href="#总结">总结</a></li>\
<li><a href="#参考链接">参考链接</a></li>\
</ul>\
</li>\
</ul>\
</li>\
</ul>\
</div>\
</p>\
\
<p>从一个游戏说起：</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="猜数字">猜数字</h3>\
\
<p>我们先来玩一个猜数字游戏：我心里默念一个1~64之间的数，你来猜（你只能问答案是“是”或“否”的问题）。为了保证不论在什么情况下都能以尽量少的次数猜中，你应该采取什么策略呢？很显然：二分。先是猜是不是位于1~32之间，排除掉一半可能性，然后对区间继续二分。这种策略能够保证无论数字怎么跟你捉迷藏，都能在log_2{n}次以内猜中，用算法的术语来说就是它的下界是最好的。</p>\
\
<p>我们再来回顾一下这个游戏所蕴含的本质：为什么这种策略具有最优下界？答案也很简单，这个策略是平衡的。反之如果策略不是平衡的，比如问是不是在1~10之间，那么一旦发现不是在1~10之间的话就会剩下比N/2更多的可能性需要去考察。</p>\
\
<p>有人提到，这种策略的本质可以概括成“让未知世界无机可乘”。它是没有“弱点的”，答案的任何一个分支都是等概率的；反之，一旦某个分支蕴含的可能性更多，当情况落到那个分支上的时候你就郁闷了。比如猜数字游戏最糟糕的策略就是一个一个的猜：是1吗？是2吗？是3吗？等等，因为这种猜法最差的情况下需要64次才能猜对，下界非常糟糕。二分为什么好，就是因为它每次都将可能性排除一半并且无论如何都能排除一半（它是最糟情况下表现最好的）。</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="称球">称球</h3>\
\
<p>我们再来看另一个游戏：12个小球，其中有一个是坏球，有一架天平，需要你用最少的次数来确定哪个小球是坏的并且它到底是轻还是重？</p>\
\
<p>这是一道流传已久的智力题，网络上有很多讲解，还有泛化到N个球的情况下的严格证明，也有零星的一些地方提到从“信息论”的角度来看待最优解法。本来我认为这道题目除了试错之外没有其它高妙的思路了，只能一个个方法试，并尽量从结果中寻找信息，然后看看哪种方案最少。</p>\
\
<p>然而，实际上它的确有其它的思路，一个更本质的思路，而且根本用不着信息论这么拗口的知识。</p>\
\
<p>我们先回顾一下猜数字游戏：为了保证任何情况下以最少次数猜中，我们的策略是每次都排除恰好一半的可能性；类比到称球问题上：坏球可能是12个球中的任意一个，这就是12种可能性，而其中每种可能性下坏球可能轻也可能重，于是“坏球是哪个球，是轻是重”这个问题的答案就有12×2=24种可能性。现在我们用天平来称球，就等同于对这24种可能性发问，由于天平的输出结果有三种“平衡、左倾、右倾”，这就相当于我们的问题有三个答案，即可以将所有的可能性切成三份，根据猜数字游戏的启发，我们应当尽量让这三个分支概率均等，即平均切分所有的可能性为三等份。如此一来，一次称量就可以将答案的可能性缩减为原来的1/3，三次就能缩减为1/27。而总共才有24种可能性，所以理论上是完全可以3次称出来的。</p>\
\
<p>如何称的指导原则有了，构造一个称的策略就不是什么太困难的事情了。首先不妨解释一下为什么最直观的称法不是最优的：6、6称，在6、6称的时候，天平平衡的可能性是0；而最优策略应该使得天平三种状态的概率均等，这样才能三等分答案的所有可能性。</p>\
\
<p>为了更清楚的看待这个问题，我们不妨假设有6个球，来考虑一下3、3称和2、2称的区别：</p>\
\
<p>在未称之前，一共有12种可能性：1轻、1重、2轻、2重、…、6轻、6重。现在将1、2、3号放在左边，4、5、6放在右边3、3称了之后，不失一般性假设天平左倾，那么小球的可能性就变成了原来的一半（6种）：1重、2重、3重、4轻、5轻、6轻，即这种称法能排除一半可能性。</p>\
\
<p>再来看2、2称法，即1、2放左边，3、4放右边，剩下的5、6不称，放一边。假设结果是天平平衡，那么可能性剩下4种：5重、5轻、6重、6轻。假设天平左倾，可能性也剩下4种：1重、2重、3轻、4轻。右倾和左倾的情况类似。总之，这种称法，不管天平结果如何，情况都被我们缩小到了原来的三分之一！我们充分利用了“天平的结果状态可能有三种”这个条件来三等分所有可能性，而不是二等分。</p>\
\
<p>说到这里，剩下的事情就实在很简单了：第二步称法，只要记着这样一个指导思想：所选择的称法必须使得当天平平衡的时候答案剩下的可能性和天平左倾（右倾）的时候答案剩下的可能性一样多。实际上，这等同于你得选择一种称法，使得天平输出三种结果的概率是均等的，因为天平输出某个结果的概率就等同于所有支持这个结果（左倾、右倾、平衡）的答案可能性的和，并且答案的每个可能性都是等概率的。</p>\
\
<p>所以，称三次便可知道12个球中哪个是坏球，并且知道它是轻还是重。</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="排序">排序</h3>\
\
<p>用前面的看问题视角，排序的本质可以这样来表述：一组未排序的N个数字，它们一共有N!种重排，其中只有一种排列是满足题意的，譬如从大到小排列。换句话说，排序问题的可能性一共有N!种，任何基于比较的排序的基本操作单元都是“比较a和b”，这就相当于猜数字游戏里面的一个问句，显然这个问句的答案只能是“是”或“否”，一个只有两种输出的问题最多只能将可能性空间切成两半，根据上面的思路，最佳切法就是切成1/2和1/2。因此，我们希望在比较了a和b的大小关系之后，如果发现<code>a&lt;b</code>的话剩下的排列可能性就变成N!/2，如果发现<code>a&gt;b</code>也是剩下N!/2种可能性。由于假设每种排列的概率是均等的，所以这也就意味着支持<code>a&lt;b</code>的排列一共有N!/2个，支持<code>a&gt;b</code>的也是N!/2个，换言之，<code>a&lt;b</code>的概率等于<code>a&gt;b</code>的概率。</p>\
\
<p>我们希望每次在比较a和b的时候，<code>a&lt;b</code>和<code>a&gt;b</code>的概率是均等的，这样我们就能保证无论如何都能将可能性缩小为原来的一半了！最优下界。</p>\
\
<p>一个直接的推论是，如果每次都像上面这样的完美比较，那么N个元素的N!种可能排列只需要log_2{N!}就排查玩了，而log_2{N!}近似于NlogN，而这也正是快排的时间复杂度。</p>\
\
<p><strong>为什么堆排比快排慢</strong></p>\
\
<p>回顾一下堆排的过程：</p>\
\
<p>（1）建立最大堆（堆顶的元素大于其两个儿子，两个儿子又分别大于它们各自下属的两个儿子… 以此类推）； <br>\
（2）将堆顶的元素和最后一个元素对调（相当于将堆顶元素（最大值）拿走，然后将堆底的那个元素补上它的空缺），然后让那最后一个元素从顶上往下滑到恰当的位置（重新使堆最大化）； <br>\
（3） 重复第2步。</p>\
\
<p>这里的关键问题就在于第2步，堆底的元素肯定很小，将它拿到堆顶和原本属于最大元素的两个子节点比较，它比它们大的可能性是微乎其微的。实际上它肯定小于其中的一个儿子，而大于另一个儿子的可能性非常小。于是，这一次比较的结果就是概率不均等的，根据前面的分析，概率不均等的比较是不明智的，因为它并不能保证在糟糕情况下也能将问题的可能性削减到原本的1/2。可以想像一种极端情况，如果a肯定小于b，那么比较a和b就会什么信息也得不到，原本剩下多少可能性还是剩下多少可能性。</p>\
\
<p>在堆排里面有大量这种近乎无效的比较，因为被拿到堆顶的那个元素几乎肯定是很小的，而靠近堆顶的元素又几乎肯定是很大的，将一个很小的数和一个很大的数比较，结果几乎肯定是“小于”的，这就意味着问题的可能性只被排除掉了很小一部分。</p>\
\
<p>这就是为什么堆排比较慢（堆排虽然和快排一样复杂度都是O(NlogN)但堆排复杂度的常系数更大）。</p>\
\
<p>堆排的这种方式不是太好，如果每次不是将堆底的元素拿到上面去，而是直接比较堆顶（最大）元素的两个儿子，即选出次大的元素，这样进行排序又将如何呢？由于这两个儿子之间的大小关系是很不确定的，两者都很大，说不好哪个更大哪个更小，所以这次比较的两个结果就是概率均等的了。具体参考<a href="http://users.aims.ac.za/~mackay/sorting/sorting.html" target="_blank">这里</a>。</p>\
\
<p><strong>为什么快排其实也不是那么快</strong></p>\
\
<p>我们考虑快排的过程：随机选择一个元素做“轴元素”，将所有大于轴元素的移到左边，其余移到右边。根据这个过程，快排的第一次比较就是将一个元素和轴元素比较，这个时候显而易见的是，“大于”和“小于”的可能性各占一半，这是一次漂亮的比较。</p>\
\
<p>然而，快排的第二次比较就不那么高明了：我们不妨令轴元素为pivot，第一次比较结果是<code>a1&lt;pivot</code>，那么可以证明第二次比较a2也小于pivot的可能性是2/3！这容易证明：如果<code>a2&gt;pivot</code>的话，那么a1，a2，pivot这三个元素之间的关系就完全确定了： <code>a1&lt;pivot&lt;a2</code>，剩下来的元素排列的可能性我们不妨记为P（不需要具体算出来）。而如果<code>a2&lt;pivot</code>呢？那么a1和a2的关系就仍然是不确定的，也就是说，这个分支里面含有两种情况：<code>a1&lt;a2&lt;pivot</code>和<code>a2&lt;a1&lt;pivot</code>。对于其中任一种情况，剩下的元素排列的可能性都是P，于是这个分支里面剩下的排列可能性就是2P。所以当<code>a2&lt;pivot</code>的时候，还剩下2/3的可能性需要排查。</p>\
\
<p>再进一步，如果第二步比较果真发现<code>a2&lt;pivot</code>的话，第三步比较就更不妙了，模仿上面的推理，<code>a3&lt;pivot</code>的概率将会是3/4！</p>\
\
<p>这就是快排也不那么快的原因，因为它也没有做到每次比较都能将剩下的可能性砍掉一半。</p>\
\
<p><strong>基排为什么又那么快呢？</strong></p>\
\
<p>传统的解释是：基排不是基于比较的，所以不具有后者的局限性。话是没错，但其实还可以将它和基于比较的排序做一个类比。</p>\
\
<p>基排的过程也许是源于我们理顺一副牌的过程：如果你有N（N&lt;=13）张牌，乱序，如何理顺呢？我们假象桌上有十三个位置，然后我们将手里的牌一张一张放出去，如果是3，就放在位置3上，如果是J，就放在位置11上，放完了之后从位置1到位置13收集所有的牌（没有牌的位置上不收集任何牌）。</p>\
\
<p>我们可以这样来理解基排高效的本质原因：假设前i张牌都已经放到了它们对应的位置上，第i+1张牌放出去的时候，实际上就相当于“一下子”就确立了它和前i张牌的大小关系，用O(1)的操作就将这张牌正确地插入到了前i张牌中的正确位置上，这个效果就相当于插入排序的第i轮原本需要比较O(i)次的，现在只需要O(1)了。</p>\
\
<p>但是，为什么基排能够达到这个效果呢？上面只是解释了过程，解释了过程不代表解释了本质。</p>\
\
<p>当i张牌放到位之后，放置第i+1张牌的时候有多少种可能性？大约i+1种，因为前i张牌将13个位置分割成了i+1个区间——第i+1张牌可以落在任意一个区间。所以放置第i+1张牌就好比是询问这样一个问题：“这张牌落在哪个区间呢？”而这个问题的答案有i+1种可能性？所以它就将剩下来的可能性均分成了i+1份（换句话说，砍掉了i/i+1的可能性！）。再看看基于比较的排序吧：由于每次比较只有两种结果，所以最多只能将剩下的可能性砍掉一半。</p>\
\
<p>这就是为什么基排要快得多。而所有基于比较的排序都逃脱不了NlogN的宿命。</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="总结">总结</h3>\
\
<p>我们可以用<code>信息论</code>来解释为什么堆排慢，以及为什么快排也慢的。一种解释是，只有提出每种答案的概率都均等的问题，才能获得最大信息量。然而，仔细一想，其实这里信息论并不是因，而是果。这里不需要用信息论就完全能够解释，而且更明白。信息论只是对这个解释的一个形式化。当然，信息论在其它地方还是有应用的。但这里其实用不着信息论这么重量级的东西（也许具体计算一些数据的时候是需要的），而是只需要一种看问题的本质视角：将排序问题看成和猜数字一样，是通过问问题来缩小/排除（narrow down）结果的可能性区间，这样一来，就会发现，“最好的问题”就是那些能够均分所有可能性的问题，因为那样的话不管问题的答案如何，都能排除掉k-1/k（k为问题的答案有多少种输出——猜数字里面是2，称球里面是3）种可能性，而不均衡的问题总会有一个或一些答案分支排除掉的可能性要小于k-1/k。于是策略的下界就被拖累了。</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="参考链接">参考链接</h3>\
\
<ul>\
<li><a href="http://mindhacks.cn/2008/06/13/why-is-quicksort-so-quick/" target="_blank">数学之美番外篇：快排为什么那样快</a>  </li>\
<li><a href="http://groups.csail.mit.edu/mac/classes/symbolic/spring07/readings/robust-systems.pdf" target="_blank">Robust Systems</a></li>\
<li><a href="http://groups.google.com/group/pongba" target="_blank">讨论社区</a> </li>\
</ul>	有时无知是福，有时看到一点新鲜的科普也能觉得造化神奇，就好比那心如小鹿乱撞，手心湿润，仿佛第一次握住初恋情人温柔的手。	21	0	2016-01-23 08:14:53	2016-01-21 19:59:48	[TOC]\
\
从一个游戏说起：\
\
### 猜数字\
\
我们先来玩一个猜数字游戏：我心里默念一个1~64之间的数，你来猜（你只能问答案是“是”或“否”的问题）。为了保证不论在什么情况下都能以尽量少的次数猜中，你应该采取什么策略呢？很显然：二分。先是猜是不是位于1~32之间，排除掉一半可能性，然后对区间继续二分。这种策略能够保证无论数字怎么跟你捉迷藏，都能在log_2{n}次以内猜中，用算法的术语来说就是它的下界是最好的。\
\
我们再来回顾一下这个游戏所蕴含的本质：为什么这种策略具有最优下界？答案也很简单，这个策略是平衡的。反之如果策略不是平衡的，比如问是不是在1~10之间，那么一旦发现不是在1~10之间的话就会剩下比N/2更多的可能性需要去考察。\
\
有人提到，这种策略的本质可以概括成“让未知世界无机可乘”。它是没有“弱点的”，答案的任何一个分支都是等概率的；反之，一旦某个分支蕴含的可能性更多，当情况落到那个分支上的时候你就郁闷了。比如猜数字游戏最糟糕的策略就是一个一个的猜：是1吗？是2吗？是3吗？等等，因为这种猜法最差的情况下需要64次才能猜对，下界非常糟糕。二分为什么好，就是因为它每次都将可能性排除一半并且无论如何都能排除一半（它是最糟情况下表现最好的）。\
\
### 称球\
\
我们再来看另一个游戏：12个小球，其中有一个是坏球，有一架天平，需要你用最少的次数来确定哪个小球是坏的并且它到底是轻还是重？\
\
这是一道流传已久的智力题，网络上有很多讲解，还有泛化到N个球的情况下的严格证明，也有零星的一些地方提到从“信息论”的角度来看待最优解法。本来我认为这道题目除了试错之外没有其它高妙的思路了，只能一个个方法试，并尽量从结果中寻找信息，然后看看哪种方案最少。\
\
然而，实际上它的确有其它的思路，一个更本质的思路，而且根本用不着信息论这么拗口的知识。\
\
我们先回顾一下猜数字游戏：为了保证任何情况下以最少次数猜中，我们的策略是每次都排除恰好一半的可能性；类比到称球问题上：坏球可能是12个球中的任意一个，这就是12种可能性，而其中每种可能性下坏球可能轻也可能重，于是“坏球是哪个球，是轻是重”这个问题的答案就有12×2=24种可能性。现在我们用天平来称球，就等同于对这24种可能性发问，由于天平的输出结果有三种“平衡、左倾、右倾”，这就相当于我们的问题有三个答案，即可以将所有的可能性切成三份，根据猜数字游戏的启发，我们应当尽量让这三个分支概率均等，即平均切分所有的可能性为三等份。如此一来，一次称量就可以将答案的可能性缩减为原来的1/3，三次就能缩减为1/27。而总共才有24种可能性，所以理论上是完全可以3次称出来的。\
\
如何称的指导原则有了，构造一个称的策略就不是什么太困难的事情了。首先不妨解释一下为什么最直观的称法不是最优的：6、6称，在6、6称的时候，天平平衡的可能性是0；而最优策略应该使得天平三种状态的概率均等，这样才能三等分答案的所有可能性。\
\
为了更清楚的看待这个问题，我们不妨假设有6个球，来考虑一下3、3称和2、2称的区别：\
\
在未称之前，一共有12种可能性：1轻、1重、2轻、2重、…、6轻、6重。现在将1、2、3号放在左边，4、5、6放在右边3、3称了之后，不失一般性假设天平左倾，那么小球的可能性就变成了原来的一半（6种）：1重、2重、3重、4轻、5轻、6轻，即这种称法能排除一半可能性。\
\
再来看2、2称法，即1、2放左边，3、4放右边，剩下的5、6不称，放一边。假设结果是天平平衡，那么可能性剩下4种：5重、5轻、6重、6轻。假设天平左倾，可能性也剩下4种：1重、2重、3轻、4轻。右倾和左倾的情况类似。总之，这种称法，不管天平结果如何，情况都被我们缩小到了原来的三分之一！我们充分利用了“天平的结果状态可能有三种”这个条件来三等分所有可能性，而不是二等分。\
\
说到这里，剩下的事情就实在很简单了：第二步称法，只要记着这样一个指导思想：所选择的称法必须使得当天平平衡的时候答案剩下的可能性和天平左倾（右倾）的时候答案剩下的可能性一样多。实际上，这等同于你得选择一种称法，使得天平输出三种结果的概率是均等的，因为天平输出某个结果的概率就等同于所有支持这个结果（左倾、右倾、平衡）的答案可能性的和，并且答案的每个可能性都是等概率的。\
\
所以，称三次便可知道12个球中哪个是坏球，并且知道它是轻还是重。\
\
### 排序\
\
用前面的看问题视角，排序的本质可以这样来表述：一组未排序的N个数字，它们一共有N!种重排，其中只有一种排列是满足题意的，譬如从大到小排列。换句话说，排序问题的可能性一共有N!种，任何基于比较的排序的基本操作单元都是“比较a和b”，这就相当于猜数字游戏里面的一个问句，显然这个问句的答案只能是“是”或“否”，一个只有两种输出的问题最多只能将可能性空间切成两半，根据上面的思路，最佳切法就是切成1/2和1/2。因此，我们希望在比较了a和b的大小关系之后，如果发现`a<b`的话剩下的排列可能性就变成N!/2，如果发现`a>b`也是剩下N!/2种可能性。由于假设每种排列的概率是均等的，所以这也就意味着支持`a<b`的排列一共有N!/2个，支持`a>b`的也是N!/2个，换言之，`a<b`的概率等于`a>b`的概率。\
\
我们希望每次在比较a和b的时候，`a<b`和`a>b`的概率是均等的，这样我们就能保证无论如何都能将可能性缩小为原来的一半了！最优下界。\
\
一个直接的推论是，如果每次都像上面这样的完美比较，那么N个元素的N!种可能排列只需要log_2{N!}就排查玩了，而log_2{N!}近似于NlogN，而这也正是快排的时间复杂度。\
\
**为什么堆排比快排慢**\
\
回顾一下堆排的过程：\
\
（1）建立最大堆（堆顶的元素大于其两个儿子，两个儿子又分别大于它们各自下属的两个儿子… 以此类推）；\
（2）将堆顶的元素和最后一个元素对调（相当于将堆顶元素（最大值）拿走，然后将堆底的那个元素补上它的空缺），然后让那最后一个元素从顶上往下滑到恰当的位置（重新使堆最大化）；\
（3） 重复第2步。\
\
这里的关键问题就在于第2步，堆底的元素肯定很小，将它拿到堆顶和原本属于最大元素的两个子节点比较，它比它们大的可能性是微乎其微的。实际上它肯定小于其中的一个儿子，而大于另一个儿子的可能性非常小。于是，这一次比较的结果就是概率不均等的，根据前面的分析，概率不均等的比较是不明智的，因为它并不能保证在糟糕情况下也能将问题的可能性削减到原本的1/2。可以想像一种极端情况，如果a肯定小于b，那么比较a和b就会什么信息也得不到，原本剩下多少可能性还是剩下多少可能性。\
\
在堆排里面有大量这种近乎无效的比较，因为被拿到堆顶的那个元素几乎肯定是很小的，而靠近堆顶的元素又几乎肯定是很大的，将一个很小的数和一个很大的数比较，结果几乎肯定是“小于”的，这就意味着问题的可能性只被排除掉了很小一部分。\
\
这就是为什么堆排比较慢（堆排虽然和快排一样复杂度都是O(NlogN)但堆排复杂度的常系数更大）。\
\
堆排的这种方式不是太好，如果每次不是将堆底的元素拿到上面去，而是直接比较堆顶（最大）元素的两个儿子，即选出次大的元素，这样进行排序又将如何呢？由于这两个儿子之间的大小关系是很不确定的，两者都很大，说不好哪个更大哪个更小，所以这次比较的两个结果就是概率均等的了。具体参考[这里](http://users.aims.ac.za/~mackay/sorting/sorting.html)。\
\
**为什么快排其实也不是那么快**\
\
我们考虑快排的过程：随机选择一个元素做“轴元素”，将所有大于轴元素的移到左边，其余移到右边。根据这个过程，快排的第一次比较就是将一个元素和轴元素比较，这个时候显而易见的是，“大于”和“小于”的可能性各占一半，这是一次漂亮的比较。\
\
然而，快排的第二次比较就不那么高明了：我们不妨令轴元素为pivot，第一次比较结果是`a1<pivot`，那么可以证明第二次比较a2也小于pivot的可能性是2/3！这容易证明：如果`a2>pivot`的话，那么a1，a2，pivot这三个元素之间的关系就完全确定了： `a1<pivot<a2`，剩下来的元素排列的可能性我们不妨记为P（不需要具体算出来）。而如果`a2<pivot`呢？那么a1和a2的关系就仍然是不确定的，也就是说，这个分支里面含有两种情况：`a1<a2<pivot`和`a2<a1<pivot`。对于其中任一种情况，剩下的元素排列的可能性都是P，于是这个分支里面剩下的排列可能性就是2P。所以当`a2<pivot`的时候，还剩下2/3的可能性需要排查。\
\
再进一步，如果第二步比较果真发现`a2<pivot`的话，第三步比较就更不妙了，模仿上面的推理，`a3<pivot`的概率将会是3/4！\
\
这就是快排也不那么快的原因，因为它也没有做到每次比较都能将剩下的可能性砍掉一半。\
\
**基排为什么又那么快呢？**\
\
传统的解释是：基排不是基于比较的，所以不具有后者的局限性。话是没错，但其实还可以将它和基于比较的排序做一个类比。\
\
基排的过程也许是源于我们理顺一副牌的过程：如果你有N（N<=13）张牌，乱序，如何理顺呢？我们假象桌上有十三个位置，然后我们将手里的牌一张一张放出去，如果是3，就放在位置3上，如果是J，就放在位置11上，放完了之后从位置1到位置13收集所有的牌（没有牌的位置上不收集任何牌）。\
\
我们可以这样来理解基排高效的本质原因：假设前i张牌都已经放到了它们对应的位置上，第i+1张牌放出去的时候，实际上就相当于“一下子”就确立了它和前i张牌的大小关系，用O(1)的操作就将这张牌正确地插入到了前i张牌中的正确位置上，这个效果就相当于插入排序的第i轮原本需要比较O(i)次的，现在只需要O(1)了。\
\
但是，为什么基排能够达到这个效果呢？上面只是解释了过程，解释了过程不代表解释了本质。\
\
当i张牌放到位之后，放置第i+1张牌的时候有多少种可能性？大约i+1种，因为前i张牌将13个位置分割成了i+1个区间——第i+1张牌可以落在任意一个区间。所以放置第i+1张牌就好比是询问这样一个问题：“这张牌落在哪个区间呢？”而这个问题的答案有i+1种可能性？所以它就将剩下来的可能性均分成了i+1份（换句话说，砍掉了i/i+1的可能性！）。再看看基于比较的排序吧：由于每次比较只有两种结果，所以最多只能将剩下的可能性砍掉一半。\
\
这就是为什么基排要快得多。而所有基于比较的排序都逃脱不了NlogN的宿命。\
\
### 总结\
\
我们可以用`信息论`来解释为什么堆排慢，以及为什么快排也慢的。一种解释是，只有提出每种答案的概率都均等的问题，才能获得最大信息量。然而，仔细一想，其实这里信息论并不是因，而是果。这里不需要用信息论就完全能够解释，而且更明白。信息论只是对这个解释的一个形式化。当然，信息论在其它地方还是有应用的。但这里其实用不着信息论这么重量级的东西（也许具体计算一些数据的时候是需要的），而是只需要一种看问题的本质视角：将排序问题看成和猜数字一样，是通过问问题来缩小/排除（narrow down）结果的可能性区间，这样一来，就会发现，“最好的问题”就是那些能够均分所有可能性的问题，因为那样的话不管问题的答案如何，都能排除掉k-1/k（k为问题的答案有多少种输出——猜数字里面是2，称球里面是3）种可能性，而不均衡的问题总会有一个或一些答案分支排除掉的可能性要小于k-1/k。于是策略的下界就被拖累了。\
\
### 参考链接\
\
- [数学之美番外篇：快排为什么那样快](http://mindhacks.cn/2008/06/13/why-is-quicksort-so-quick/)  \
- [Robust Systems](http://groups.csail.mit.edu/mac/classes/symbolic/spring07/readings/robust-systems.pdf)\
- [讨论社区](http://groups.google.com/group/pongba) 
26	0	RainDon	手机端性能优化	mobile-web-performance	1	1		0	ImShengli	性能优化				<div class="md-section-divider"></div>\
\
<p><div class="toc">\
<ul>\
<li><ul>\
<li><ul>\
<li><a href="#给按钮添加触摸状态">给按钮添加触摸状态</a></li>\
</ul>\
</li>\
</ul>\
</li>\
</ul>\
</div>\
</p>\
\
<p>原生应用很“快”，原生应用的动画渲染的很平滑，按钮及时响应用户的点击，当App加载数据时也不会有什么问题。让你的网站像原生应用一样，意味着你需要尽可能的提高你网站响应及交互的速度。本文总结几种提高Web App性能的方法。</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="给按钮添加触摸状态">给按钮添加触摸状态</h3>\
\
<p>在提高网站的性能中最重要的是<strong>用户所感知的网站的速度</strong>，而最简单的提高站点感知性能的方法，是给网站增加”active”状态。</p>\
\
<p>任何时候访问者点击网站上的一个按钮，必须等待300毫秒才知道到底发生了啥。浏览器设置了这个超时时间，之后可以确保用户不会进行一些其他操作，例如双击。因此等待1/3秒后，浏览器知晓了用户的动作，并执行最初的点击。当这个动作发生后，按钮被一个灰色的东东覆盖。</p>\
\
<p>这是很糟糕的用户体验。Nielsen组织进行了一项研究，发现任何<a href="https://www.nngroup.com/articles/response-times-3-important-limits/" target="_blank">高于100ms的延迟都会让用户认为他们在等待</a>，他们可能只想进行一次跳转。然而很多的移动网站，包括我做的那些，没有考虑这个感知问题。设计师通常的设计是触摸时按钮或者链接保持原样。</p>\
\
<p>为了让你的网站感觉更快，你需要让你的按钮立即响应用户的触摸，给用户一个明显的视觉指示：有些事情正在发生。有一个很赞的属性用在网站上的按钮或链接，就是<code>:active</code>伪类。</p>\
\
<p>不幸的是，无论是iOS还是android，当按钮或者链接被点击时都忽略了这个属性，为了激活这个状态，需要添加一个简单的事件绑定到页面的JavaScript中:</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="pln">document</span><span class="pun">.</span><span class="pln">addEventListener</span><span class="pun">(</span><span class="str">"touchstart"</span><span class="pun">,</span><span class="pln"> </span><span class="kwd">function</span><span class="pun">(){},</span><span class="pln"> </span><span class="kwd">true</span><span class="pun">);</span></code></li></ol></pre>\
\
<p>之后可以用css定义active状态的样式，去掉点击时的高亮：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="pun">-</span><span class="pln">webkit</span><span class="pun">-</span><span class="pln">tap</span><span class="pun">-</span><span class="pln">highlight</span><span class="pun">-</span><span class="pln">color</span><span class="pun">:</span><span class="pln"> rgba</span><span class="pun">(</span><span class="lit">0</span><span class="pun">,</span><span class="lit">0</span><span class="pun">,</span><span class="lit">0</span><span class="pun">,</span><span class="lit">0</span><span class="pun">);</span></code></li></ol></pre>\
\
<p>对按钮设置这两个属性，用户会立即感觉到界面响应了用户的操作，即使最终的响应速度是一样的。你只是让你的界面即时反馈了用户的行动，而不会让用户傻等300 ms再看看到底干了啥。</p>\
\
<p>需要注意的是：<span style="color:red">设置后在UC浏览器中依然无效</span>。</p>\
\
<p>如果想去除300ms延迟，可以使用fasttap或fastclick，它的原理代码如下：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-javascript"><span class="com">// From: http://phonegap-tips.com/articles/fast-touch-event-handling-eliminate-click-delay.html</span></code></li><li class="L1"><code class="language-javascript"><span class="pln">$</span><span class="pun">.</span><span class="pln">event</span><span class="pun">.</span><span class="pln">special</span><span class="pun">.</span><span class="pln">tap </span><span class="pun">=</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L2"><code class="language-javascript"><span class="pln">    setup</span><span class="pun">:</span><span class="pln"> </span><span class="kwd">function</span><span class="pun">()</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L3"><code class="language-javascript"><span class="pln">        </span><span class="kwd">var</span><span class="pln"> self </span><span class="pun">=</span><span class="pln"> </span><span class="kwd">this</span><span class="pun">,</span><span class="pln"> $self </span><span class="pun">=</span><span class="pln"> $</span><span class="pun">(</span><span class="pln">self</span><span class="pun">);</span></code></li><li class="L4"><code class="language-javascript"><span class="pln">        </span><span class="com">// Bind touch start</span></code></li><li class="L5"><code class="language-javascript"><span class="pln">        $self</span><span class="pun">.</span><span class="pln">on</span><span class="pun">(</span><span class="str">'touchstart'</span><span class="pun">,</span><span class="pln"> </span><span class="kwd">function</span><span class="pun">(</span><span class="pln">startEvent</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L6"><code class="language-javascript"><span class="pln">            </span><span class="com">// Save the target element of the start event</span></code></li><li class="L7"><code class="language-javascript"><span class="pln">            </span><span class="kwd">var</span><span class="pln"> target </span><span class="pun">=</span><span class="pln"> startEvent</span><span class="pun">.</span><span class="pln">target</span><span class="pun">;</span></code></li><li class="L8"><code class="language-javascript"><span class="pln">            </span><span class="com">// When a touch starts, bind a touch end handler exactly once,</span></code></li><li class="L9"><code class="language-javascript"><span class="pln">            $self</span><span class="pun">.</span><span class="pln">one</span><span class="pun">(</span><span class="str">'touchend'</span><span class="pun">,</span><span class="pln"> </span><span class="kwd">function</span><span class="pun">(</span><span class="pln">endEvent</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L0"><code class="language-javascript"><span class="pln">                </span><span class="com">// When the touch end event fires, check if the target of the</span></code></li><li class="L1"><code class="language-javascript"><span class="pln">                </span><span class="com">// touch end is the same as the target of the start, and if</span></code></li><li class="L2"><code class="language-javascript"><span class="pln">                </span><span class="com">// so, fire a click.</span></code></li><li class="L3"><code class="language-javascript"><span class="pln">                </span><span class="kwd">if</span><span class="pln"> </span><span class="pun">(</span><span class="pln">target </span><span class="pun">==</span><span class="pln"> endEvent</span><span class="pun">.</span><span class="pln">target</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L4"><code class="language-javascript"><span class="pln">                    $</span><span class="pun">.</span><span class="pln">event</span><span class="pun">.</span><span class="pln">simulate</span><span class="pun">(</span><span class="str">'tap'</span><span class="pun">,</span><span class="pln"> self</span><span class="pun">,</span><span class="pln"> endEvent</span><span class="pun">);</span></code></li><li class="L5"><code class="language-javascript"><span class="pln">                </span><span class="pun">}</span></code></li><li class="L6"><code class="language-javascript"><span class="pln">            </span><span class="pun">});</span></code></li><li class="L7"><code class="language-javascript"><span class="pln">        </span><span class="pun">});</span></code></li><li class="L8"><code class="language-javascript"><span class="pln">    </span><span class="pun">}</span></code></li><li class="L9"><code class="language-javascript"><span class="pun">};</span></code></li></ol></pre>	在移动设备上构建设计良好的网站慢慢变得越来越容易，不论使用什么方法（响应式设计、自适应等），如果你了解你所做的，创建一个美观的网站不是问题。但你的用户可能仍然要求网站有原生app的体验，完成这样的体验是一个挑战。大多数时候，当人们谈论“app”或“原生”的感觉，他们讲的的不是一个网站的视觉体验，而是用户界面如何对他们的行为进行反馈，以及这种反馈是怎样呈现的。	23	0	2016-01-23 08:46:30	2016-01-23 08:24:56	[TOC]\
\
原生应用很“快”，原生应用的动画渲染的很平滑，按钮及时响应用户的点击，当App加载数据时也不会有什么问题。让你的网站像原生应用一样，意味着你需要尽可能的提高你网站响应及交互的速度。本文总结几种提高Web App性能的方法。\
\
### 给按钮添加触摸状态\
\
在提高网站的性能中最重要的是**用户所感知的网站的速度**，而最简单的提高站点感知性能的方法，是给网站增加”active”状态。\
\
任何时候访问者点击网站上的一个按钮，必须等待300毫秒才知道到底发生了啥。浏览器设置了这个超时时间，之后可以确保用户不会进行一些其他操作，例如双击。因此等待1/3秒后，浏览器知晓了用户的动作，并执行最初的点击。当这个动作发生后，按钮被一个灰色的东东覆盖。\
\
这是很糟糕的用户体验。Nielsen组织进行了一项研究，发现任何[高于100ms的延迟都会让用户认为他们在等待](https://www.nngroup.com/articles/response-times-3-important-limits/)，他们可能只想进行一次跳转。然而很多的移动网站，包括我做的那些，没有考虑这个感知问题。设计师通常的设计是触摸时按钮或者链接保持原样。\
\
为了让你的网站感觉更快，你需要让你的按钮立即响应用户的触摸，给用户一个明显的视觉指示：有些事情正在发生。有一个很赞的属性用在网站上的按钮或链接，就是`:active`伪类。\
\
不幸的是，无论是iOS还是android，当按钮或者链接被点击时都忽略了这个属性，为了激活这个状态，需要添加一个简单的事件绑定到页面的JavaScript中:\
```\
document.addEventListener("touchstart", function(){}, true);\
```\
之后可以用css定义active状态的样式，去掉点击时的高亮：\
```\
-webkit-tap-highlight-color: rgba(0,0,0,0);\
```\
对按钮设置这两个属性，用户会立即感觉到界面响应了用户的操作，即使最终的响应速度是一样的。你只是让你的界面即时反馈了用户的行动，而不会让用户傻等300 ms再看看到底干了啥。\
\
需要注意的是：<span style="color:red">设置后在UC浏览器中依然无效</span>。\
\
如果想去除300ms延迟，可以使用fasttap或fastclick，它的原理代码如下：\
```javascript\
// From: http://phonegap-tips.com/articles/fast-touch-event-handling-eliminate-click-delay.html\
$.event.special.tap = {\
    setup: function() {\
        var self = this, $self = $(self);\
        // Bind touch start\
        $self.on('touchstart', function(startEvent) {\
            // Save the target element of the start event\
            var target = startEvent.target;\
            // When a touch starts, bind a touch end handler exactly once,\
            $self.one('touchend', function(endEvent) {\
                // When the touch end event fires, check if the target of the\
                // touch end is the same as the target of the start, and if\
                // so, fire a click.\
                if (target == endEvent.target) {\
                    $.event.simulate('tap', self, endEvent);\
                }\
            });\
        });\
    }\
};\
```\

27	0	RainDon	今年我要学点心理学	this-year-learn-psychology	5	1		0	ImShengli	心理学				<div class="md-section-divider"></div>\
\
<p><div class="toc">\
<ul>\
</ul>\
</div>\
</p>\
\
<blockquote class="white-blockquote">\
  <p>这个世界上，有两门学科是真正迷人的：一是物理学，它让我们了解我们所处的这个世界；一是心理学，它让我们了解我们自己。—— Pongba </p>\
</blockquote>\
\
<p>这几日偶得几篇心理学的文章阅览，着实被其中的心理探究所折服，日常生活中看似无心的选择，实为头脑中各种力量博弈的结果。遂决心在今年学习一些有关心理学方面的知识，如今投石问路抛出几个问题作为心理学学习的敲门砖。</p>\
\
<p>我们常说“只有亲身经历才能明白”，因为“感同身受”和“亲身体验”无法比拟，但“亲身经历”了就一定可以明白吗？是否一定要去“亲身经历”呢？是否有其他的方法模拟“亲身经历”呢，毕竟人的精力有限，不能事必躬亲？</p>\
\
<p>在“旋转的女人”问题中，到底是在顺时针转还是在逆时针转？为什么我们看到的旋转方向不一样？这和我们左右脑有关系吗？是什么影响了我们所观察到的现象呢？</p>\
\
<p><img src="https://dn-woerwosi.qbox.me/blog/images/2016/1/4/rotating-girl-thumb.gif" alt="rotating girl" title=""></p>\
\
<p>在“可口可乐和百事可乐口味的双盲实验”中，人们相信他们选择可口可乐而不是百事可乐是因为前者味道更好，然而一旦把标签撕掉，人们往往惊讶地发现自己选择的却是百事可乐。显然，“味道更好”并不是人们选择可口可乐的动因，那真正的动因又是什么？为什么人们给出的原因并非自己作出决策的依据呢？</p>\
\
<p>生活中我们面临各种各样的决策，买哪款衣服、是学习还是玩游戏、买房还是不买等等，事后我们可能会给出作出此决策的充分理由，这些听起来很有道理的道理，真的是驱使我们内心做出这些决定的理由么？做出此决策的思维过程又是怎样的呢？影响我们思维过程的因素又有哪些呢？</p>\
\
<p>对于热恋中的情侣，父母越是干涉，往往会导致他们情感越发热烈，这种“罗密欧与朱丽叶式的效应”真的是因为真心觉得彼此情感越发强烈了吗？</p>\
\
<p>在“四条线段连接九个点”问题中（一笔，不重复描线，不多于四条线段，经过所有九个点），我们大多数人在第一次面对这个问题时都是抓耳挠腮，无从下手。我们总是被九个点的“隐形”边界所限制，画线条时下意识地就被束缚在了这个框内。为什么我们会被这种下意识限制住？怎么样又去突破这种束缚呢？</p>\
\
<p><img src="https://dn-woerwosi.qbox.me/blog/images/2016/1/4/nine-dot.png" alt="nine dot" title=""></p>\
\
<p>对于这些问题，心理学中已从科学的角度给予了一定的认知，虽然我们不从事这方面的研究，但同时也避开了研究中难免会遇到的繁琐技术细节，以局外人的角度纯粹去欣赏也许更有乐趣。</p>\
\
<p>最后以一则笑话结束本文的内容吧：</p>\
\
<p>在美国-墨西哥边境，看守警卫看到一个男人，骑着自行车，把手上放着一个箱子，警卫把那个男人叫下来，让他打开箱子，结果发现箱子里面全是沙子。第二天，这个男人又来了，还是骑着自行车带着个箱子，警卫打开一看还是沙子，如此两个月，这个男人每天都穿过边境，每次都带着一箱沙子。警卫终于崩溃了：“大哥你快把我们逼疯了，两个月以来你每天都骑着你的自行车，带着一箱沙子穿过边境，你这到底是走私什么呢？”。男人答到：“自行车”。</p>	所谓心理学就是关于人脑如何工作的科学，既然社会是由一个个的人构成，而人的行为很大程度上又由我们的大脑所支配，那么从这个根本上去理解很多问题便非常深入本质，所以在科研方面心理学正在渗透进越来越多关于“人”的科学。通过学习心理学，我们也可对我们自身的行为有更为清晰的认识。	13	0	2016-02-04 07:46:03	2016-02-04 07:41:33	[TOC]\
\
> 这个世界上，有两门学科是真正迷人的：一是物理学，它让我们了解我们所处的这个世界；一是心理学，它让我们了解我们自己。—— Pongba \
\
这几日偶得几篇心理学的文章阅览，着实被其中的心理探究所折服，日常生活中看似无心的选择，实为头脑中各种力量博弈的结果。遂决心在今年学习一些有关心理学方面的知识，如今投石问路抛出几个问题作为心理学学习的敲门砖。\
\
我们常说“只有亲身经历才能明白”，因为“感同身受”和“亲身体验”无法比拟，但“亲身经历”了就一定可以明白吗？是否一定要去“亲身经历”呢？是否有其他的方法模拟“亲身经历”呢，毕竟人的精力有限，不能事必躬亲？\
\
在“旋转的女人”问题中，到底是在顺时针转还是在逆时针转？为什么我们看到的旋转方向不一样？这和我们左右脑有关系吗？是什么影响了我们所观察到的现象呢？\
\
![rotating girl](https://dn-woerwosi.qbox.me/blog/images/2016/1/4/rotating-girl-thumb.gif)\
\
在“可口可乐和百事可乐口味的双盲实验”中，人们相信他们选择可口可乐而不是百事可乐是因为前者味道更好，然而一旦把标签撕掉，人们往往惊讶地发现自己选择的却是百事可乐。显然，“味道更好”并不是人们选择可口可乐的动因，那真正的动因又是什么？为什么人们给出的原因并非自己作出决策的依据呢？\
\
生活中我们面临各种各样的决策，买哪款衣服、是学习还是玩游戏、买房还是不买等等，事后我们可能会给出作出此决策的充分理由，这些听起来很有道理的道理，真的是驱使我们内心做出这些决定的理由么？做出此决策的思维过程又是怎样的呢？影响我们思维过程的因素又有哪些呢？\
\
对于热恋中的情侣，父母越是干涉，往往会导致他们情感越发热烈，这种“罗密欧与朱丽叶式的效应”真的是因为真心觉得彼此情感越发强烈了吗？\
\
在“四条线段连接九个点”问题中（一笔，不重复描线，不多于四条线段，经过所有九个点），我们大多数人在第一次面对这个问题时都是抓耳挠腮，无从下手。我们总是被九个点的“隐形”边界所限制，画线条时下意识地就被束缚在了这个框内。为什么我们会被这种下意识限制住？怎么样又去突破这种束缚呢？\
\
![nine dot](https://dn-woerwosi.qbox.me/blog/images/2016/1/4/nine-dot.png)\
\
对于这些问题，心理学中已从科学的角度给予了一定的认知，虽然我们不从事这方面的研究，但同时也避开了研究中难免会遇到的繁琐技术细节，以局外人的角度纯粹去欣赏也许更有乐趣。\
\
最后以一则笑话结束本文的内容吧：\
\
在美国-墨西哥边境，看守警卫看到一个男人，骑着自行车，把手上放着一个箱子，警卫把那个男人叫下来，让他打开箱子，结果发现箱子里面全是沙子。第二天，这个男人又来了，还是骑着自行车带着个箱子，警卫打开一看还是沙子，如此两个月，这个男人每天都穿过边境，每次都带着一箱沙子。警卫终于崩溃了：“大哥你快把我们逼疯了，两个月以来你每天都骑着你的自行车，带着一箱沙子穿过边境，你这到底是走私什么呢？”。男人答到：“自行车”。
28	0	RainDon	回家过年（2016）	go-home-in-spring-festival	5	1		0	ImShengli	Life				<div class="md-section-divider"></div>\
\
<p><div class="toc">\
<ul>\
</ul>\
</div>\
</p>\
\
<blockquote class="white-blockquote">\
  <p>有外国人把中国人的春运定义为“一次虔诚的朝圣”。人们回家的似箭归心，没有什么能够阻挡，即便是1998年的寒潮、2003年的SARS，以及2008年的雪灾。--出自《南方周末》</p>\
</blockquote>\
\
<p>记得在《舌尖上的中国》第二季中，有这样一段话：“行走一生的脚步，起点、终点，归根到底都是家所在的地方，这是中国人秉持千年的信仰，朴素但有力量”。这段话道出了每个出门在外游子的思乡之情。</p>\
\
<p>又是一年年关时，这几日公路、地铁、办公室的人流越来越少，大家遇见说的话也有“吃了吗”改为了“几号回家”，谈论的也是有关回家的话题。从开始买车票的调侃到带什么礼物回家。无论怎样，忙亦是不忙，漂泊在外在春节期间总要踏上归途。</p>\
\
<p>【一点小感受】虽说大家一直在调侃购票难、火车上拥挤等问题，这些问题客观存在着，且是一个很难协调好的工程，在可见的未来可能还会继续下去。但从自身感受来讲，这些年火车的运营能力也在不断进步着，从网上售票到高铁的大范围运行，都在不断的给人们的出行提供着便利。</p>\
\
<p>【一个朋友的小段子】逗比青年欢乐多~</p>\
\
<blockquote class="white-blockquote">\
  <p>居家闲话--长相</p>\
  \
  <p>前两天和老妈出去吃酒席，老妈教我说“嘴巴要甜一点，见人要打招呼，长的还可以的就说小伙子真帅或小姑娘好漂亮，长的实在不行的就夸人家长的高”，这不酒席才刚开始，就有很多人夸我长的高了。我的心很痛，很痛，这些人年纪轻轻的，眼睛就瞎了。</p>\
  \
  <p>其实人很多时候的烦恼不是长的丑，而是想的美。今天早晨起床，实在没忍住，我就对着镜子感慨了一句：镜子啊，镜子，请你告诉我谁是这世界上最帅的男人？话没说完，我爸就叫我滚犊子了，他说他想静一静。</p>\
  \
  <p>大早晨被赶出来，正好领略下北方的冬天， 乱云低薄暮，急雪舞回风。我突然感觉年轻了好多岁，因为冻得跟孙子似的。冷的受不了了，想去同学家里串串门，当我跟孙子似的流着鼻涕，目光呆滞，瑟瑟发抖地挤上了公交车，边上几个大妈纷纷争着给我让座，拦都拦不住。。。。。。。阿姨，我真不是个白痴。。。。。。        </p>\
</blockquote>\
\
<p><strong>走，回家！</strong></p>	俗话说：“父母在，不远游”，可处在现在高速发展的社会中，再沉迷于农耕时代的生活方式已不合潮流；出门在外，春节便成为人们一年中翘首以盼回家团圆的日子。此时此刻，此时此景……	25	0	2016-02-05 16:08:03	2016-02-05 13:38:25	[TOC]\
\
> 有外国人把中国人的春运定义为“一次虔诚的朝圣”。人们回家的似箭归心，没有什么能够阻挡，即便是1998年的寒潮、2003年的SARS，以及2008年的雪灾。--出自《南方周末》\
\
记得在《舌尖上的中国》第二季中，有这样一段话：“行走一生的脚步，起点、终点，归根到底都是家所在的地方，这是中国人秉持千年的信仰，朴素但有力量”。这段话道出了每个出门在外游子的思乡之情。\
\
又是一年年关时，这几日公路、地铁、办公室的人流越来越少，大家遇见说的话也有“吃了吗”改为了“几号回家”，谈论的也是有关回家的话题。从开始买车票的调侃到带什么礼物回家。无论怎样，忙亦是不忙，漂泊在外在春节期间总要踏上归途。\
\
【一点小感受】虽说大家一直在调侃购票难、火车上拥挤等问题，这些问题客观存在着，且是一个很难协调好的工程，在可见的未来可能还会继续下去。但从自身感受来讲，这些年火车的运营能力也在不断进步着，从网上售票到高铁的大范围运行，都在不断的给人们的出行提供着便利。\
\
【一个朋友的小段子】逗比青年欢乐多~\
\
> 居家闲话--长相\
\
> 前两天和老妈出去吃酒席，老妈教我说“嘴巴要甜一点，见人要打招呼，长的还可以的就说小伙子真帅或小姑娘好漂亮，长的实在不行的就夸人家长的高”，这不酒席才刚开始，就有很多人夸我长的高了。我的心很痛，很痛，这些人年纪轻轻的，眼睛就瞎了。\
\
> 其实人很多时候的烦恼不是长的丑，而是想的美。今天早晨起床，实在没忍住，我就对着镜子感慨了一句：镜子啊，镜子，请你告诉我谁是这世界上最帅的男人？话没说完，我爸就叫我滚犊子了，他说他想静一静。\
\
> 大早晨被赶出来，正好领略下北方的冬天， 乱云低薄暮，急雪舞回风。我突然感觉年轻了好多岁，因为冻得跟孙子似的。冷的受不了了，想去同学家里串串门，当我跟孙子似的流着鼻涕，目光呆滞，瑟瑟发抖地挤上了公交车，边上几个大妈纷纷争着给我让座，拦都拦不住。。。。。。。阿姨，我真不是个白痴。。。。。。        \
\
**走，回家！**
29	0	RainDon	HTML 标签的语义化	html-tag-semantic	1	1		0	ImShengli	HTML				<div class="md-section-divider"></div>\
\
<p><div class="toc">\
<ul>\
<li><ul>\
<li><ul>\
<li><a href="#参考文档">参考文档</a></li>\
</ul>\
</li>\
</ul>\
</li>\
</ul>\
</div>\
</p>\
\
<blockquote class="white-blockquote">\
  <p>自认为：HTML规范发展的方向为提供更加语义化的标签。</p>\
</blockquote>\
\
<p>大家知道HTML标签中ul和ol、code和pre、b和strong和em的区别吗？什么时候使用strong，什么时候使用em呢？</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="参考文档">参考文档</h3>\
\
<ul>\
<li><a href="http://justineo.github.io/slideshows/semantic-html/#/" target="_blank">Semantic HTML</a></li>\
</ul>	本文主要聊聊HTML的各种标签，标签所对应的作用以及在书写DOM结构时如何去选择标签以使其更加语义化（即符合规范，对搜索引擎良好）。	43	0	2016-02-27 10:20:50	2016-02-27 09:51:42	[TOC]\
\
> 自认为：HTML规范发展的方向为提供更加语义化的标签。\
\
大家知道HTML标签中ul和ol、code和pre、b和strong和em的区别吗？什么时候使用strong，什么时候使用em呢？\
\
### 参考文档\
\
- [Semantic HTML](http://justineo.github.io/slideshows/semantic-html/#/)
30	0	RainDon	Immutable.js及在React中的应用	immutable-react	1	1		0	ImShengli	React				<div class="md-section-divider"></div>\
\
<div class="md-section-divider"></div>\
\
<h3 id="1-为什么需要immutablejs">1. 为什么需要Immutable.js</h3>\
\
<p><strong>1.1 引用带来的副作用</strong></p>\
\
<blockquote class="white-blockquote">\
  <p>Shared mutable state is the root of all evil（共享的可变状态是万恶之源）</p>\
</blockquote>\
\
<p>JavaScript(ES5)中存在两类数据结构: primitive value(string、number、boolean、null、undefined)、object(reference)。在编译型语言(例如java)也存在object，但是JS中的对象非常灵活、多变，这给我们的开发带来了不少好处，但是也引起了非常多的问题。</p>\
\
<p>业务场景1:</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-javascript"><span class="kwd">var</span><span class="pln"> obj </span><span class="pun">=</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L1"><code class="language-javascript"><span class="pln">    count</span><span class="pun">:</span><span class="pln"> </span><span class="lit">1</span></code></li><li class="L2"><code class="language-javascript"><span class="pun">};</span></code></li><li class="L3"><code class="language-javascript"><span class="kwd">var</span><span class="pln"> clone </span><span class="pun">=</span><span class="pln"> obj</span><span class="pun">;</span></code></li><li class="L4"><code class="language-javascript"><span class="pln">clone</span><span class="pun">.</span><span class="pln">count </span><span class="pun">=</span><span class="pln"> </span><span class="lit">2</span><span class="pun">;</span></code></li><li class="L5"><code class="language-javascript"></code></li><li class="L6"><code class="language-javascript"><span class="pln">console</span><span class="pun">.</span><span class="pln">log</span><span class="pun">(</span><span class="pln">clone</span><span class="pun">.</span><span class="pln">count</span><span class="pun">)</span><span class="pln"> </span><span class="com">// 2</span></code></li><li class="L7"><code class="language-javascript"><span class="pln">console</span><span class="pun">.</span><span class="pln">log</span><span class="pun">(</span><span class="pln">obj</span><span class="pun">.</span><span class="pln">count</span><span class="pun">)</span><span class="pln"> </span><span class="com">// 2</span></code></li></ol></pre>\
\
<p>业务场景2:</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-javascript"><span class="kwd">var</span><span class="pln"> obj </span><span class="pun">=</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L1"><code class="language-javascript"><span class="pln">    count</span><span class="pun">:</span><span class="pln"> </span><span class="lit">1</span></code></li><li class="L2"><code class="language-javascript"><span class="pun">};</span></code></li><li class="L3"><code class="language-javascript"></code></li><li class="L4"><code class="language-javascript"><span class="pln">unKnownFunction</span><span class="pun">(</span><span class="pln">obj</span><span class="pun">);</span></code></li><li class="L5"><code class="language-javascript"><span class="pln">console</span><span class="pun">.</span><span class="pln">log</span><span class="pun">(</span><span class="pln">obj</span><span class="pun">.</span><span class="pln">count</span><span class="pun">)</span><span class="pln"> </span><span class="com">// 不知道结果是多少?</span></code></li></ol></pre>\
\
<p><strong>1.2 深度拷贝的性能问题</strong></p>\
\
<p>针对引用的副作用，有人会提出可以进行深度拷贝(<code>deep clone</code>), 请看下面深度拷贝的代码：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-javascript"><span class="kwd">function</span><span class="pln"> isObject</span><span class="pun">(</span><span class="pln">obj</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L1"><code class="language-javascript"><span class="pln">    </span><span class="kwd">return</span><span class="pln"> </span><span class="kwd">typeof</span><span class="pln"> obj </span><span class="pun">===</span><span class="pln"> </span><span class="str">'object'</span><span class="pun">;</span></code></li><li class="L2"><code class="language-javascript"><span class="pun">}</span></code></li><li class="L3"><code class="language-javascript"></code></li><li class="L4"><code class="language-javascript"><span class="kwd">function</span><span class="pln"> isArray</span><span class="pun">(</span><span class="pln">arr</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L5"><code class="language-javascript"><span class="pln">    </span><span class="kwd">return</span><span class="pln"> </span><span class="typ">Array</span><span class="pun">.</span><span class="pln">isArray</span><span class="pun">(</span><span class="pln">arr</span><span class="pun">);</span></code></li><li class="L6"><code class="language-javascript"><span class="pun">}</span></code></li><li class="L7"><code class="language-javascript"><span class="kwd">function</span><span class="pln"> deepClone</span><span class="pun">(</span><span class="pln">obj</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L8"><code class="language-javascript"><span class="pln">    </span><span class="kwd">if</span><span class="pln"> </span><span class="pun">(!</span><span class="pln">isObject</span><span class="pun">(</span><span class="pln">obj</span><span class="pun">))</span><span class="pln">  </span><span class="kwd">return</span><span class="pln"> obj</span><span class="pun">;</span></code></li><li class="L9"><code class="language-javascript"><span class="pln">    </span><span class="kwd">var</span><span class="pln"> cloneObj </span><span class="pun">=</span><span class="pln"> isArray</span><span class="pun">(</span><span class="pln">obj</span><span class="pun">)</span><span class="pln"> </span><span class="pun">?</span><span class="pln"> </span><span class="pun">[]</span><span class="pln"> </span><span class="pun">:</span><span class="pln"> </span><span class="pun">{};</span></code></li><li class="L0"><code class="language-javascript"></code></li><li class="L1"><code class="language-javascript"><span class="pln">    </span><span class="kwd">for</span><span class="pun">(</span><span class="kwd">var</span><span class="pln"> key in obj</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L2"><code class="language-javascript"><span class="pln">        </span><span class="kwd">if</span><span class="pln"> </span><span class="pun">(</span><span class="pln">obj</span><span class="pun">.</span><span class="pln">hasOwnProperty</span><span class="pun">(</span><span class="pln">key</span><span class="pun">))</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L3"><code class="language-javascript"><span class="pln">            </span><span class="kwd">var</span><span class="pln"> value </span><span class="pun">=</span><span class="pln"> obj</span><span class="pun">[</span><span class="pln">key</span><span class="pun">];</span></code></li><li class="L4"><code class="language-javascript"><span class="pln">            </span><span class="kwd">var</span><span class="pln"> copy </span><span class="pun">=</span><span class="pln"> value</span><span class="pun">;</span></code></li><li class="L5"><code class="language-javascript"></code></li><li class="L6"><code class="language-javascript"><span class="pln">            </span><span class="kwd">if</span><span class="pln"> </span><span class="pun">(</span><span class="pln">isObject</span><span class="pun">(</span><span class="pln">value</span><span class="pun">))</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L7"><code class="language-javascript"><span class="pln">                cloneObj</span><span class="pun">[</span><span class="pln">key</span><span class="pun">]</span><span class="pln"> </span><span class="pun">=</span><span class="pln"> deepClone</span><span class="pun">(</span><span class="pln">value</span><span class="pun">);</span></code></li><li class="L8"><code class="language-javascript"><span class="pln">            </span><span class="pun">}</span><span class="pln"> </span><span class="kwd">else</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L9"><code class="language-javascript"><span class="pln">                cloneObj</span><span class="pun">[</span><span class="pln">key</span><span class="pun">]</span><span class="pln"> </span><span class="pun">=</span><span class="pln"> value</span><span class="pun">;</span></code></li><li class="L0"><code class="language-javascript"><span class="pln">            </span><span class="pun">}</span></code></li><li class="L1"><code class="language-javascript"><span class="pln">        </span><span class="pun">}</span></code></li><li class="L2"><code class="language-javascript"><span class="pln">    </span><span class="pun">}</span></code></li><li class="L3"><code class="language-javascript"><span class="pln">    </span><span class="kwd">return</span><span class="pln"> cloneObj</span><span class="pun">;</span></code></li><li class="L4"><code class="language-javascript"><span class="pun">}</span></code></li><li class="L5"><code class="language-javascript"></code></li><li class="L6"><code class="language-javascript"><span class="kwd">var</span><span class="pln"> obj </span><span class="pun">=</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L7"><code class="language-javascript"><span class="pln">    age</span><span class="pun">:</span><span class="pln"> </span><span class="lit">5</span><span class="pun">,</span></code></li><li class="L8"><code class="language-javascript"><span class="pln">    list</span><span class="pun">:</span><span class="pln"> </span><span class="pun">[</span><span class="lit">1</span><span class="pun">,</span><span class="pln"> </span><span class="lit">2</span><span class="pun">,</span><span class="pln"> </span><span class="lit">3</span><span class="pun">]</span></code></li><li class="L9"><code class="language-javascript"><span class="pun">};</span></code></li><li class="L0"><code class="language-javascript"></code></li><li class="L1"><code class="language-javascript"><span class="kwd">var</span><span class="pln"> obj2 </span><span class="pun">=</span><span class="pln"> deepClone</span><span class="pun">(</span><span class="pln">obj</span><span class="pun">)</span></code></li><li class="L2"><code class="language-javascript"><span class="pln">console</span><span class="pun">.</span><span class="pln">log</span><span class="pun">(</span><span class="pln">obj</span><span class="pun">.</span><span class="pln">list </span><span class="pun">===</span><span class="pln"> obj2</span><span class="pun">.</span><span class="pln">list</span><span class="pun">)</span><span class="pln"> </span><span class="com">// false</span></code></li></ol></pre>\
\
<p>假如仅仅只是对<code>obj.age</code>进行操作，使用深度拷贝同样需要拷贝<code>list</code>字段，而两个对象的<code>list</code>值是相同的，对<code>list</code>的拷贝明显是多余，因此深度拷贝存在性能缺陷的问题。</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-javascript"><span class="kwd">var</span><span class="pln"> obj </span><span class="pun">=</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L1"><code class="language-javascript"><span class="pln">    age</span><span class="pun">:</span><span class="pln"> </span><span class="lit">5</span><span class="pun">,</span></code></li><li class="L2"><code class="language-javascript"><span class="pln">    list</span><span class="pun">:</span><span class="pln"> </span><span class="pun">[</span><span class="lit">1</span><span class="pun">,</span><span class="pln"> </span><span class="lit">2</span><span class="pun">,</span><span class="pln"> </span><span class="lit">3</span><span class="pun">]</span></code></li><li class="L3"><code class="language-javascript"><span class="pun">};</span></code></li><li class="L4"><code class="language-javascript"><span class="kwd">var</span><span class="pln"> obj2 </span><span class="pun">=</span><span class="pln"> deepClone</span><span class="pun">(</span><span class="pln">obj</span><span class="pun">)</span></code></li><li class="L5"><code class="language-javascript"><span class="pln">obj2</span><span class="pun">.</span><span class="pln">age </span><span class="pun">=</span><span class="pln"> </span><span class="lit">6</span><span class="pun">;</span></code></li><li class="L6"><code class="language-javascript"><span class="com">// 假如仅仅只对age字段操作，使用深度拷贝(deepClone函数)也对list进行了复制，</span></code></li><li class="L7"><code class="language-javascript"><span class="com">// 这样明显是多余的，存在性能缺陷 </span></code></li></ol></pre>\
\
<p><strong>1.3 JS本身的无力</strong></p>\
\
<p>在JS中实现数据不可变，有两个方法: const(ES6)、Object.freeze(ES5)。但是这两种方法都是shallow处理，遇到嵌套多深的结构就需要递归处理，又会存在性能上的问题。</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="2-immutable的优点">2. Immutable的优点</h3>\
\
<p><strong>2.1 Persistent data structure</strong></p>\
\
<p>Immutable.js提供了7种不可变的数据类型: <code>List</code>、<code>Map</code>、 <code>Stack</code>、 <code>OrderedMap</code>、 <code>Set</code>、 <code>OrderedSet</code>、<code>Record</code>。对Immutable对象的操作均会返回新的对象，例如:</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-javascript"><span class="kwd">var</span><span class="pln"> obj </span><span class="pun">=</span><span class="pln"> </span><span class="pun">{</span><span class="pln">count</span><span class="pun">:</span><span class="pln"> </span><span class="lit">1</span><span class="pun">};</span></code></li><li class="L1"><code class="language-javascript"><span class="kwd">var</span><span class="pln"> map </span><span class="pun">=</span><span class="pln"> </span><span class="typ">Immutable</span><span class="pun">.</span><span class="pln">fromJS</span><span class="pun">(</span><span class="pln">obj</span><span class="pun">);</span></code></li><li class="L2"><code class="language-javascript"><span class="kwd">var</span><span class="pln"> map2 </span><span class="pun">=</span><span class="pln"> map</span><span class="pun">.</span><span class="kwd">set</span><span class="pun">(</span><span class="str">'count'</span><span class="pun">,</span><span class="pln"> </span><span class="lit">2</span><span class="pun">);</span></code></li><li class="L3"><code class="language-javascript"></code></li><li class="L4"><code class="language-javascript"><span class="pln">console</span><span class="pun">.</span><span class="pln">log</span><span class="pun">(</span><span class="pln">map</span><span class="pun">.</span><span class="kwd">get</span><span class="pun">(</span><span class="str">'count'</span><span class="pun">));</span><span class="pln"> </span><span class="com">// 1</span></code></li><li class="L5"><code class="language-javascript"><span class="pln">console</span><span class="pun">.</span><span class="pln">log</span><span class="pun">(</span><span class="pln">map2</span><span class="pun">.</span><span class="kwd">get</span><span class="pun">(</span><span class="str">'count'</span><span class="pun">));</span><span class="pln"> </span><span class="com">// 2</span></code></li></ol></pre>\
\
<p>关于Persistent data structure 请查看 <a href="https://en.wikipedia.org/wiki/Persistent_data_structure" target="_blank">wikipedia</a></p>\
\
<p><strong>2.2 structural sharing</strong></p>\
\
<p>当我们对一个Immutable对象进行操作的时候，ImmutableJS基于哈希映射树(hash map tries)和vector map tries，只clone该节点以及它的祖先节点，其他保持不变，这样可以共享相同的部分，大大提高性能。</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-javascript"><span class="kwd">var</span><span class="pln"> obj </span><span class="pun">=</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L1"><code class="language-javascript"><span class="pln">  count</span><span class="pun">:</span><span class="pln"> </span><span class="lit">1</span><span class="pun">,</span></code></li><li class="L2"><code class="language-javascript"><span class="pln">  list</span><span class="pun">:</span><span class="pln"> </span><span class="pun">[</span><span class="lit">1</span><span class="pun">,</span><span class="pln"> </span><span class="lit">2</span><span class="pun">,</span><span class="pln"> </span><span class="lit">3</span><span class="pun">,</span><span class="pln"> </span><span class="lit">4</span><span class="pun">,</span><span class="pln"> </span><span class="lit">5</span><span class="pun">]</span></code></li><li class="L3"><code class="language-javascript"><span class="pun">}</span></code></li><li class="L4"><code class="language-javascript"><span class="kwd">var</span><span class="pln"> map1 </span><span class="pun">=</span><span class="pln"> </span><span class="typ">Immutable</span><span class="pun">.</span><span class="pln">fromJS</span><span class="pun">(</span><span class="pln">obj</span><span class="pun">);</span></code></li><li class="L5"><code class="language-javascript"><span class="kwd">var</span><span class="pln"> map2 </span><span class="pun">=</span><span class="pln"> map1</span><span class="pun">.</span><span class="kwd">set</span><span class="pun">(</span><span class="str">'count'</span><span class="pun">,</span><span class="pln"> </span><span class="lit">2</span><span class="pun">);</span></code></li><li class="L6"><code class="language-javascript"></code></li><li class="L7"><code class="language-javascript"><span class="pln">console</span><span class="pun">.</span><span class="pln">log</span><span class="pun">(</span><span class="pln">map1</span><span class="pun">.</span><span class="pln">list </span><span class="pun">===</span><span class="pln"> map2</span><span class="pun">.</span><span class="pln">list</span><span class="pun">);</span><span class="pln"> </span><span class="com">// true</span></code></li></ol></pre>\
\
<p>从网上找一个图片来说明结构共享的过程:</p>\
\
<p><img src="https://dn-woerwosi.qbox.me/blog/images/2016/6/5/change.gif" alt="Immutable" title=""></p>\
\
<p><strong>2.3 support lazy operation</strong></p>\
\
<p>ImmutableJS借鉴了Clojure、Scala、Haskell这些函数式编程语言，引入了一个特殊结构<code>Seq</code>(全称Sequence), 其他Immutable对象(例如<code>List</code>、<code>Map</code>)可以通过<code>toSeq</code>进行转换。</p>\
\
<p><code>Seq</code>具有两个特征: 数据不可变(Immutable)、计算延迟性(Lazy)。在下面的demo中，直接操作1到无穷的数，会超出内存限制，抛出异常，但是仅仅读取其中两个值就不存在问题，因为没有对map的结果进行暂存，只是根据需要进行计算。</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-javascript"><span class="typ">Immutable</span><span class="pun">.</span><span class="typ">Range</span><span class="pun">(</span><span class="lit">1</span><span class="pun">,</span><span class="pln"> </span><span class="kwd">Infinity</span><span class="pun">)</span></code></li><li class="L1"><code class="language-javascript"><span class="pun">.</span><span class="pln">map</span><span class="pun">(</span><span class="pln">n </span><span class="pun">=&gt;</span><span class="pln"> </span><span class="pun">-</span><span class="pln">n</span><span class="pun">)</span></code></li><li class="L2"><code class="language-javascript"><span class="com">// Error: Cannot perform this action with an infinite size.</span></code></li><li class="L3"><code class="language-javascript"></code></li><li class="L4"><code class="language-javascript"><span class="typ">Immutable</span><span class="pun">.</span><span class="typ">Range</span><span class="pun">(</span><span class="lit">1</span><span class="pun">,</span><span class="pln"> </span><span class="kwd">Infinity</span><span class="pun">)</span></code></li><li class="L5"><code class="language-javascript"><span class="pun">.</span><span class="pln">map</span><span class="pun">(</span><span class="pln">n </span><span class="pun">=&gt;</span><span class="pln"> </span><span class="pun">-</span><span class="pln">n</span><span class="pun">)</span></code></li><li class="L6"><code class="language-javascript"><span class="pun">.</span><span class="pln">take</span><span class="pun">(</span><span class="lit">2</span><span class="pun">)</span></code></li><li class="L7"><code class="language-javascript"><span class="pun">.</span><span class="pln">reduce</span><span class="pun">((</span><span class="pln">r</span><span class="pun">,</span><span class="pln"> n</span><span class="pun">)</span><span class="pln"> </span><span class="pun">=&gt;</span><span class="pln"> r </span><span class="pun">+</span><span class="pln"> n</span><span class="pun">,</span><span class="pln"> </span><span class="lit">0</span><span class="pun">);</span><span class="pln"> </span></code></li><li class="L8"><code class="language-javascript"><span class="com">// -3</span></code></li></ol></pre>\
\
<p><strong>2.4 强大的API机制</strong></p>\
\
<p>ImmutableJS的文档很Geek，提供了大量的方法，有些方法沿用原生js的类似，降低学习成本，有些方法提供了便捷操作，例如setIn、UpdateIn可以进行深度操作。</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-javascript"><span class="kwd">var</span><span class="pln"> obj </span><span class="pun">=</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L1"><code class="language-javascript"><span class="pln">    a</span><span class="pun">:</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L2"><code class="language-javascript"><span class="pln">        b</span><span class="pun">:</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L3"><code class="language-javascript"><span class="pln">            list</span><span class="pun">:</span><span class="pln"> </span><span class="pun">[</span><span class="lit">1</span><span class="pun">,</span><span class="pln"> </span><span class="lit">2</span><span class="pun">,</span><span class="pln"> </span><span class="lit">3</span><span class="pun">]</span></code></li><li class="L4"><code class="language-javascript"><span class="pln">        </span><span class="pun">}</span></code></li><li class="L5"><code class="language-javascript"><span class="pln">    </span><span class="pun">}</span></code></li><li class="L6"><code class="language-javascript"><span class="pun">};</span></code></li><li class="L7"><code class="language-javascript"><span class="kwd">var</span><span class="pln"> map </span><span class="pun">=</span><span class="pln"> </span><span class="typ">Immutable</span><span class="pun">.</span><span class="pln">fromJS</span><span class="pun">(</span><span class="pln">obj</span><span class="pun">);</span></code></li><li class="L8"><code class="language-javascript"><span class="kwd">var</span><span class="pln"> map2 </span><span class="pun">=</span><span class="pln"> </span><span class="typ">Immutable</span><span class="pun">.</span><span class="pln">updateIn</span><span class="pun">([</span><span class="str">'a'</span><span class="pun">,</span><span class="pln"> </span><span class="str">'b'</span><span class="pun">,</span><span class="pln"> </span><span class="str">'list'</span><span class="pun">],</span><span class="pln"> </span><span class="pun">(</span><span class="pln">list</span><span class="pun">)</span><span class="pln"> </span><span class="pun">=&gt;</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L9"><code class="language-javascript"><span class="pln">    </span><span class="kwd">return</span><span class="pln"> list</span><span class="pun">.</span><span class="pln">push</span><span class="pun">(</span><span class="lit">4</span><span class="pun">);</span></code></li><li class="L0"><code class="language-javascript"><span class="pun">});</span></code></li><li class="L1"><code class="language-javascript"></code></li><li class="L2"><code class="language-javascript"><span class="pln">console</span><span class="pun">.</span><span class="pln">log</span><span class="pun">(</span><span class="pln">map2</span><span class="pun">.</span><span class="pln">getIn</span><span class="pun">([</span><span class="str">'a'</span><span class="pun">,</span><span class="pln"> </span><span class="str">'b'</span><span class="pun">,</span><span class="pln"> </span><span class="str">'list'</span><span class="pun">]))</span></code></li><li class="L3"><code class="language-javascript"><span class="com">// List [ 1, 2, 3, 4 ]</span></code></li></ol></pre>\
\
<div class="md-section-divider"></div>\
\
<h3 id="3-在react中的实践">3. 在React中的实践</h3>\
\
<p><strong>3.1 快 - 性能优化</strong></p>\
\
<p>React是一个<code>UI = f(state)</code>库，为了解决性能问题引入了virtual dom，virtual dom通过diff算法修改DOM，实现高效的DOM更新。</p>\
\
<p>听起来很完美吧，但是有一个问题: 当执行setState时，即使state数据没发生改变，也会去做virtual dom的diff，因为在React的声明周期中，默认情况下<code>shouldComponentUpdate</code>总是返回true。那如何在<code>shouldComponentUpdate</code>进行state比较?</p>\
\
<p>React的解决方法: 提供了一个<code>PureRenderMixin</code>, <code>PureRenderMixin</code>对<code>shouldComponentUpdate</code>方法进行了覆盖，但是<code>PureRenderMixin</code>里面是浅比较:</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-javascript"><span class="kwd">var</span><span class="pln"> </span><span class="typ">ReactComponentWithPureRenderMixin</span><span class="pln"> </span><span class="pun">=</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L1"><code class="language-javascript"><span class="pln">    shouldComponentUpdate</span><span class="pun">:</span><span class="pln"> </span><span class="kwd">function</span><span class="pun">(</span><span class="pln">nextProps</span><span class="pun">,</span><span class="pln"> nextState</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L2"><code class="language-javascript"><span class="pln">        </span><span class="kwd">return</span><span class="pln"> shallowCompare</span><span class="pun">(</span><span class="kwd">this</span><span class="pun">,</span><span class="pln"> nextProps</span><span class="pun">,</span><span class="pln"> nextState</span><span class="pun">);</span></code></li><li class="L3"><code class="language-javascript"><span class="pln">    </span><span class="pun">},</span></code></li><li class="L4"><code class="language-javascript"><span class="pun">};</span></code></li><li class="L5"><code class="language-javascript"></code></li><li class="L6"><code class="language-javascript"><span class="kwd">function</span><span class="pln"> shallowCompare</span><span class="pun">(</span><span class="pln">instance</span><span class="pun">,</span><span class="pln"> nextProps</span><span class="pun">,</span><span class="pln"> nextState</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L7"><code class="language-javascript"><span class="pln">    </span><span class="kwd">return</span><span class="pln"> </span><span class="pun">(</span></code></li><li class="L8"><code class="language-javascript"><span class="pln">        </span><span class="pun">!</span><span class="pln">shallowEqual</span><span class="pun">(</span><span class="pln">instance</span><span class="pun">.</span><span class="pln">props</span><span class="pun">,</span><span class="pln"> nextProps</span><span class="pun">)</span><span class="pln"> </span><span class="pun">||</span></code></li><li class="L9"><code class="language-javascript"><span class="pln">        </span><span class="pun">!</span><span class="pln">shallowEqual</span><span class="pun">(</span><span class="pln">instance</span><span class="pun">.</span><span class="pln">state</span><span class="pun">,</span><span class="pln"> nextState</span><span class="pun">)</span></code></li><li class="L0"><code class="language-javascript"><span class="pln">    </span><span class="pun">);</span></code></li><li class="L1"><code class="language-javascript"><span class="pun">}</span></code></li></ol></pre>\
\
<p>浅比较只能进行简单比较，如果数据结构复杂的话，依然会存在多余的diff过程，说明<code>PureRenderMixin</code>依然不是理想的解决方案。</p>\
\
<p>Immutable来解决: 因为Immutable的结构不可变性&amp;&amp;结构共享性，能够快速进行数据的比较:</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-javascript"><span class="pln">shouldComponentUpdate</span><span class="pun">:</span><span class="pln"> </span><span class="kwd">function</span><span class="pun">(</span><span class="pln">nextProps</span><span class="pun">,</span><span class="pln"> nextState</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L1"><code class="language-javascript"><span class="pln">    </span><span class="kwd">return</span><span class="pln"> deepCompare</span><span class="pun">(</span><span class="kwd">this</span><span class="pun">,</span><span class="pln"> nextProps</span><span class="pun">,</span><span class="pln"> nextState</span><span class="pun">);</span></code></li><li class="L2"><code class="language-javascript"><span class="pun">},</span></code></li><li class="L3"><code class="language-javascript"></code></li><li class="L4"><code class="language-javascript"><span class="kwd">function</span><span class="pln"> deepCompare</span><span class="pun">(</span><span class="pln">instance</span><span class="pun">,</span><span class="pln"> nextProps</span><span class="pun">,</span><span class="pln"> nextState</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L5"><code class="language-javascript"><span class="pln">    </span><span class="kwd">return</span><span class="pln"> </span><span class="pun">!</span><span class="typ">Immutable</span><span class="pun">.</span><span class="pln">is</span><span class="pun">(</span><span class="pln">instance</span><span class="pun">.</span><span class="pln">props</span><span class="pun">,</span><span class="pln"> nextProps</span><span class="pun">)</span><span class="pln"> </span><span class="pun">||</span><span class="pln"> </span></code></li><li class="L6"><code class="language-javascript"><span class="pln">            </span><span class="pun">!</span><span class="typ">Immutable</span><span class="pun">.</span><span class="pln">is</span><span class="pun">(</span><span class="pln">instance</span><span class="pun">.</span><span class="pln">state</span><span class="pun">,</span><span class="pln"> nextState</span><span class="pun">);</span></code></li><li class="L7"><code class="language-javascript"><span class="pun">}</span></code></li></ol></pre>\
\
<p><strong>3.2 安全 - 保证state操作的安全</strong></p>\
\
<p>当我们在React中执行setState的时候，需要注意的，state merge过程是shallow merge:</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-javascript"><span class="pln">getInitState</span><span class="pun">:</span><span class="pln"> </span><span class="kwd">function</span><span class="pln"> </span><span class="pun">()</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L1"><code class="language-javascript"><span class="pln">    </span><span class="kwd">return</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L2"><code class="language-javascript"><span class="pln">        count</span><span class="pun">:</span><span class="pln"> </span><span class="lit">1</span><span class="pun">,</span></code></li><li class="L3"><code class="language-javascript"><span class="pln">        user</span><span class="pun">:</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L4"><code class="language-javascript"><span class="pln">            school</span><span class="pun">:</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L5"><code class="language-javascript"><span class="pln">                address</span><span class="pun">:</span><span class="pln"> </span><span class="str">'beijing'</span><span class="pun">,</span></code></li><li class="L6"><code class="language-javascript"><span class="pln">                level</span><span class="pun">:</span><span class="pln"> </span><span class="str">'middleSchool'</span></code></li><li class="L7"><code class="language-javascript"><span class="pln">            </span><span class="pun">}</span></code></li><li class="L8"><code class="language-javascript"><span class="pln">        </span><span class="pun">}</span></code></li><li class="L9"><code class="language-javascript"><span class="pln">    </span><span class="pun">}</span></code></li><li class="L0"><code class="language-javascript"><span class="pun">},</span></code></li><li class="L1"><code class="language-javascript"><span class="pln">handleChangeSchool</span><span class="pun">:</span><span class="pln"> </span><span class="kwd">function</span><span class="pln"> </span><span class="pun">()</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L2"><code class="language-javascript"><span class="pln">    </span><span class="kwd">this</span><span class="pun">.</span><span class="pln">setState</span><span class="pun">({</span></code></li><li class="L3"><code class="language-javascript"><span class="pln">        user</span><span class="pun">:</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L4"><code class="language-javascript"><span class="pln">            school</span><span class="pun">:</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L5"><code class="language-javascript"><span class="pln">                address</span><span class="pun">:</span><span class="pln"> </span><span class="str">'shanghai'</span></code></li><li class="L6"><code class="language-javascript"><span class="pln">            </span><span class="pun">}</span></code></li><li class="L7"><code class="language-javascript"><span class="pln">        </span><span class="pun">}</span></code></li><li class="L8"><code class="language-javascript"><span class="pln">    </span><span class="pun">})</span></code></li><li class="L9"><code class="language-javascript"><span class="pun">}</span></code></li><li class="L0"><code class="language-javascript"><span class="pln">render</span><span class="pun">()</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L1"><code class="language-javascript"><span class="pln">    console</span><span class="pun">.</span><span class="pln">log</span><span class="pun">(</span><span class="kwd">this</span><span class="pun">.</span><span class="pln">state</span><span class="pun">.</span><span class="pln">user</span><span class="pun">.</span><span class="pln">school</span><span class="pun">);</span></code></li><li class="L2"><code class="language-javascript"><span class="pln">    </span><span class="com">// {address: 'shanghai'}</span></code></li><li class="L3"><code class="language-javascript"><span class="pun">}</span></code></li></ol></pre>\
\
<p>为了让大家安心，贴上React中关于state merge的源码:</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-javascript"><span class="com">// 在 ReactCompositeComponent.js中完成state的merge,其中merger的方法来源于</span></code></li><li class="L1"><code class="language-javascript"><span class="com">// `Object.assign`这个模块</span></code></li><li class="L2"><code class="language-javascript"><span class="kwd">function</span><span class="pln"> assign</span><span class="pun">(</span><span class="pln">target</span><span class="pun">,</span><span class="pln"> sources</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L3"><code class="language-javascript"><span class="pln">  </span><span class="pun">....</span></code></li><li class="L4"><code class="language-javascript"><span class="pln">  </span><span class="kwd">var</span><span class="pln"> to </span><span class="pun">=</span><span class="pln"> </span><span class="typ">Object</span><span class="pun">(</span><span class="pln">target</span><span class="pun">);</span></code></li><li class="L5"><code class="language-javascript"><span class="pln">  </span><span class="pun">...</span><span class="pln"> </span></code></li><li class="L6"><code class="language-javascript"><span class="pln">  </span><span class="kwd">for</span><span class="pln"> </span><span class="pun">(</span><span class="kwd">var</span><span class="pln"> nextIndex </span><span class="pun">=</span><span class="pln"> </span><span class="lit">1</span><span class="pun">;</span><span class="pln"> nextIndex </span><span class="pun">&lt;</span><span class="pln"> arguments</span><span class="pun">.</span><span class="pln">length</span><span class="pun">;</span><span class="pln"> nextIndex</span><span class="pun">++)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L7"><code class="language-javascript"><span class="pln">    </span><span class="kwd">var</span><span class="pln"> nextSource </span><span class="pun">=</span><span class="pln"> arguments</span><span class="pun">[</span><span class="pln">nextIndex</span><span class="pun">];</span></code></li><li class="L8"><code class="language-javascript"><span class="pln">    </span><span class="kwd">var</span><span class="pln"> from </span><span class="pun">=</span><span class="pln"> </span><span class="typ">Object</span><span class="pun">(</span><span class="pln">nextSource</span><span class="pun">);</span></code></li><li class="L9"><code class="language-javascript"><span class="pln">    </span><span class="pun">...</span></code></li><li class="L0"><code class="language-javascript"><span class="pln">    </span><span class="kwd">for</span><span class="pln"> </span><span class="pun">(</span><span class="kwd">var</span><span class="pln"> key in from</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L1"><code class="language-javascript"><span class="pln">      </span><span class="kwd">if</span><span class="pln"> </span><span class="pun">(</span><span class="pln">hasOwnProperty</span><span class="pun">.</span><span class="pln">call</span><span class="pun">(</span><span class="pln">from</span><span class="pun">,</span><span class="pln"> key</span><span class="pun">))</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L2"><code class="language-javascript"><span class="pln">        to</span><span class="pun">[</span><span class="pln">key</span><span class="pun">]</span><span class="pln"> </span><span class="pun">=</span><span class="pln"> from</span><span class="pun">[</span><span class="pln">key</span><span class="pun">];</span></code></li><li class="L3"><code class="language-javascript"><span class="pln">      </span><span class="pun">}</span></code></li><li class="L4"><code class="language-javascript"><span class="pln">    </span><span class="pun">}</span></code></li><li class="L5"><code class="language-javascript"><span class="pln">  </span><span class="pun">}</span></code></li><li class="L6"><code class="language-javascript"><span class="pln">  </span><span class="kwd">return</span><span class="pln"> to</span></code></li><li class="L7"><code class="language-javascript"><span class="pun">}</span></code></li></ol></pre>\
\
<p><strong>3.3 方便 - 强大的API</strong></p>\
\
<p>ImmutableJS里面拥有强大的API，并且文档写的很Geek，在对state、store进行操作的时候非常方便。</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-javascript"><span class="kwd">var</span><span class="pln"> obj </span><span class="pun">=</span><span class="pln"> </span><span class="pun">{</span><span class="pln"> </span></code></li><li class="L1"><code class="language-javascript"><span class="pln">  name</span><span class="pun">:</span><span class="pln"> </span><span class="str">'mt'</span><span class="pun">,</span><span class="pln"> </span></code></li><li class="L2"><code class="language-javascript"><span class="pln">  info</span><span class="pun">:</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L3"><code class="language-javascript"><span class="pln">    address</span><span class="pun">:</span><span class="pln"> </span><span class="str">'bj'</span></code></li><li class="L4"><code class="language-javascript"><span class="pln">  </span><span class="pun">}</span><span class="pln"> </span></code></li><li class="L5"><code class="language-javascript"><span class="pun">};</span></code></li><li class="L6"><code class="language-javascript"><span class="typ">Object</span><span class="pun">.</span><span class="pln">freeze</span><span class="pun">(</span><span class="pln">obj</span><span class="pun">);</span></code></li><li class="L7"><code class="language-javascript"><span class="pln">obj</span><span class="pun">.</span><span class="pln">name </span><span class="pun">=</span><span class="pln"> </span><span class="str">'mt&amp;&amp;dp'</span><span class="pun">;</span></code></li><li class="L8"><code class="language-javascript"><span class="pln">obj</span><span class="pun">.</span><span class="pln">info</span><span class="pun">.</span><span class="pln">address </span><span class="pun">=</span><span class="pln"> </span><span class="str">'bj&amp;&amp;sh'</span><span class="pun">;</span></code></li><li class="L9"><code class="language-javascript"></code></li><li class="L0"><code class="language-javascript"><span class="pln">console</span><span class="pun">.</span><span class="pln">log</span><span class="pun">(</span><span class="pln">obj</span><span class="pun">.</span><span class="pln">name</span><span class="pun">);</span><span class="pln"> </span><span class="com">// 'mt'(no change)</span></code></li><li class="L1"><code class="language-javascript"><span class="pln">console</span><span class="pun">.</span><span class="pln">log</span><span class="pun">(</span><span class="pln">obj</span><span class="pun">.</span><span class="pln">info</span><span class="pun">.</span><span class="pln">address</span><span class="pun">);</span><span class="pln"> </span><span class="com">// 'bj&amp;&amp;sh'(change)</span></code></li></ol></pre>\
\
<p><strong>3.4 历史 - 实现回退</strong></p>\
\
<p>可以保存state的每一个状态，并保证该状态不会被修改，这样就可以实现历史记录的回退。</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="4-react中引入immutablejs带来的问题">4. React中引入Immutable.js带来的问题</h3>\
\
<ul>\
<li>源文件过大: 源码总共有5k多行，压缩后有16kb</li>\
<li>类型转换: 如果需要频繁地与服务器交互，那么Immutable对象就需要不断地与原生js进行转换，操作起来显得很繁琐</li>\
<li>侵入性: 例如引用第三方组件的时候，就不得不进行类型转换；在使用react-redux时，connect的<code>shouldComponentUpdate</code>已经实现，此处无法发挥作用。</li>\
</ul>\
\
<div class="md-section-divider"></div>\
\
<h3 id="参考">参考：</h3>\
\
<ul>\
<li><a href="http://zhenhua-lee.github.io/react/Immutable.html" target="_blank">Immutable及在React中的应用</a></li>\
<li><a href="http://facebook.github.io/immutable-js/" target="_blank">ImmutableJS官方网站</a></li>\
<li><a href="http://rhadow.github.io/2015/05/10/flux-immutable/" target="_blank">flux immutable</a></li>\
<li><a href="http://boke.io/immutable-js/" target="_blank">http://boke.io/immutable-js/</a></li>\
<li><a href="https://en.wikipedia.org/wiki/Persistent_data_structure" target="_blank">https://en.wikipedia.org/wiki/Persistent_data_structure</a></li>\
<li><a href="http://blog.nextoffer.com/why-we-invest-in-tools/" target="_blank">http://blog.nextoffer.com/why-we-invest-in-tools/</a></li>\
<li><a href="https://github.com/camsong/blog/issues/3" target="_blank">https://github.com/camsong/blog/issues/3</a></li>\
<li><a href="http://jlongster.com/Using-Immutable-Data-Structures-in-JavaScript" target="_blank">http://jlongster.com/Using-Immutable-Data-Structures-in-JavaScript</a>        </li>\
</ul>	immutable是Facebook开源的一个项目，用于实现javascript的数据不可变，解决引用带来的副作用，目前已经在很多场景下得到大量使用。	9	0	2017-01-08 00:46:54	2016-07-01 17:12:11	\
### 1. 为什么需要Immutable.js\
\
**1.1 引用带来的副作用**\
\
> Shared mutable state is the root of all evil（共享的可变状态是万恶之源）\
\
JavaScript(ES5)中存在两类数据结构: primitive value(string、number、boolean、null、undefined)、object(reference)。在编译型语言(例如java)也存在object，但是JS中的对象非常灵活、多变，这给我们的开发带来了不少好处，但是也引起了非常多的问题。\
\
业务场景1:\
\
```javascript\
var obj = {\
    count: 1\
};\
var clone = obj;\
clone.count = 2;\
\
console.log(clone.count) // 2\
console.log(obj.count) // 2\
```\
\
业务场景2:\
\
```javascript\
var obj = {\
    count: 1\
};\
\
unKnownFunction(obj);\
console.log(obj.count) // 不知道结果是多少?\
```\
\
**1.2 深度拷贝的性能问题**\
\
针对引用的副作用，有人会提出可以进行深度拷贝(`deep clone`), 请看下面深度拷贝的代码：\
\
```javascript\
function isObject(obj) {\
    return typeof obj === 'object';\
}\
\
function isArray(arr) {\
    return Array.isArray(arr);\
}\
function deepClone(obj) {\
    if (!isObject(obj))  return obj;\
    var cloneObj = isArray(obj) ? [] : {};\
  \
    for(var key in obj) {\
        if (obj.hasOwnProperty(key)) {\
            var value = obj[key];\
            var copy = value;\
      \
            if (isObject(value)) {\
                cloneObj[key] = deepClone(value);\
            } else {\
                cloneObj[key] = value;\
            }\
        }\
    }\
    return cloneObj;\
}\
\
var obj = {\
    age: 5,\
    list: [1, 2, 3]\
};\
\
var obj2 = deepClone(obj)\
console.log(obj.list === obj2.list) // false\
```\
\
假如仅仅只是对`obj.age`进行操作，使用深度拷贝同样需要拷贝`list`字段，而两个对象的`list`值是相同的，对`list`的拷贝明显是多余，因此深度拷贝存在性能缺陷的问题。\
\
```javascript\
var obj = {\
    age: 5,\
    list: [1, 2, 3]\
};\
var obj2 = deepClone(obj)\
obj2.age = 6;\
// 假如仅仅只对age字段操作，使用深度拷贝(deepClone函数)也对list进行了复制，\
// 这样明显是多余的，存在性能缺陷 \
```\
\
**1.3 JS本身的无力**\
\
在JS中实现数据不可变，有两个方法: const(ES6)、Object.freeze(ES5)。但是这两种方法都是shallow处理，遇到嵌套多深的结构就需要递归处理，又会存在性能上的问题。\
\
### 2. Immutable的优点\
\
**2.1 Persistent data structure**\
\
Immutable.js提供了7种不可变的数据类型: `List`、`Map`、 `Stack`、 `OrderedMap`、 `Set`、 `OrderedSet`、`Record`。对Immutable对象的操作均会返回新的对象，例如:\
\
```javascript\
var obj = {count: 1};\
var map = Immutable.fromJS(obj);\
var map2 = map.set('count', 2);\
\
console.log(map.get('count')); // 1\
console.log(map2.get('count')); // 2\
```\
\
关于Persistent data structure 请查看 [wikipedia](https://en.wikipedia.org/wiki/Persistent_data_structure)\
\
**2.2 structural sharing**\
\
当我们对一个Immutable对象进行操作的时候，ImmutableJS基于哈希映射树(hash map tries)和vector map tries，只clone该节点以及它的祖先节点，其他保持不变，这样可以共享相同的部分，大大提高性能。\
\
```javascript\
var obj = {\
  count: 1,\
  list: [1, 2, 3, 4, 5]\
}\
var map1 = Immutable.fromJS(obj);\
var map2 = map1.set('count', 2);\
\
console.log(map1.list === map2.list); // true\
```\
\
从网上找一个图片来说明结构共享的过程:\
\
![Immutable](https://dn-woerwosi.qbox.me/blog/images/2016/6/5/change.gif)\
\
**2.3 support lazy operation**\
\
ImmutableJS借鉴了Clojure、Scala、Haskell这些函数式编程语言，引入了一个特殊结构`Seq`(全称Sequence), 其他Immutable对象(例如`List`、`Map`)可以通过`toSeq`进行转换。\
\
`Seq`具有两个特征: 数据不可变(Immutable)、计算延迟性(Lazy)。在下面的demo中，直接操作1到无穷的数，会超出内存限制，抛出异常，但是仅仅读取其中两个值就不存在问题，因为没有对map的结果进行暂存，只是根据需要进行计算。\
\
```javascript\
Immutable.Range(1, Infinity)\
.map(n => -n)\
// Error: Cannot perform this action with an infinite size.\
\
Immutable.Range(1, Infinity)\
.map(n => -n)\
.take(2)\
.reduce((r, n) => r + n, 0); \
// -3\
```\
\
**2.4 强大的API机制**\
\
ImmutableJS的文档很Geek，提供了大量的方法，有些方法沿用原生js的类似，降低学习成本，有些方法提供了便捷操作，例如setIn、UpdateIn可以进行深度操作。\
\
```javascript\
var obj = {\
    a: {\
        b: {\
            list: [1, 2, 3]\
        }\
    }\
};\
var map = Immutable.fromJS(obj);\
var map2 = Immutable.updateIn(['a', 'b', 'list'], (list) => {\
    return list.push(4);\
});\
\
console.log(map2.getIn(['a', 'b', 'list']))\
// List [ 1, 2, 3, 4 ]\
```\
\
### 3. 在React中的实践\
\
**3.1 快 - 性能优化**\
\
React是一个`UI = f(state)`库，为了解决性能问题引入了virtual dom，virtual dom通过diff算法修改DOM，实现高效的DOM更新。\
\
听起来很完美吧，但是有一个问题: 当执行setState时，即使state数据没发生改变，也会去做virtual dom的diff，因为在React的声明周期中，默认情况下`shouldComponentUpdate`总是返回true。那如何在`shouldComponentUpdate`进行state比较?\
\
React的解决方法: 提供了一个`PureRenderMixin`, `PureRenderMixin`对`shouldComponentUpdate`方法进行了覆盖，但是`PureRenderMixin`里面是浅比较:\
\
```javascript\
var ReactComponentWithPureRenderMixin = {\
    shouldComponentUpdate: function(nextProps, nextState) {\
        return shallowCompare(this, nextProps, nextState);\
    },\
};\
\
function shallowCompare(instance, nextProps, nextState) {\
    return (\
        !shallowEqual(instance.props, nextProps) ||\
        !shallowEqual(instance.state, nextState)\
    );\
}\
```\
\
浅比较只能进行简单比较，如果数据结构复杂的话，依然会存在多余的diff过程，说明`PureRenderMixin`依然不是理想的解决方案。\
\
Immutable来解决: 因为Immutable的结构不可变性&&结构共享性，能够快速进行数据的比较:\
\
```javascript\
shouldComponentUpdate: function(nextProps, nextState) {\
    return deepCompare(this, nextProps, nextState);\
},\
  \
function deepCompare(instance, nextProps, nextState) {\
  \	return !Immutable.is(instance.props, nextProps) || \
\	    \	!Immutable.is(instance.state, nextState);\
}\
```\
\
**3.2 安全 - 保证state操作的安全**\
\
当我们在React中执行setState的时候，需要注意的，state merge过程是shallow merge:\
\
```javascript\
getInitState: function () {\
    return {\
        count: 1,\
        user: {\
            school: {\
                address: 'beijing',\
                level: 'middleSchool'\
            }\
        }\
    }\
},\
handleChangeSchool: function () {\
    this.setState({\
        user: {\
            school: {\
                address: 'shanghai'\
            }\
        }\
    })\
}\
render() {\
    console.log(this.state.user.school);\
    // {address: 'shanghai'}\
}\
```\
\
为了让大家安心，贴上React中关于state merge的源码:\
\
```javascript\
// 在 ReactCompositeComponent.js中完成state的merge,其中merger的方法来源于\
// `Object.assign`这个模块\
function assign(target, sources) {\
  ....\
  var to = Object(target);\
  ... \
  for (var nextIndex = 1; nextIndex < arguments.length; nextIndex++) {\
    var nextSource = arguments[nextIndex];\
    var from = Object(nextSource);\
    ...\
    for (var key in from) {\
      if (hasOwnProperty.call(from, key)) {\
        to[key] = from[key];\
      }\
    }\
  }\
  return to\
}\
```\
\
**3.3 方便 - 强大的API**\
\
ImmutableJS里面拥有强大的API，并且文档写的很Geek，在对state、store进行操作的时候非常方便。\
\
```javascript\
var obj = { \
  name: 'mt', \
  info: {\
    address: 'bj'\
  } \
};\
Object.freeze(obj);\
obj.name = 'mt&&dp';\
obj.info.address = 'bj&&sh';\
\
console.log(obj.name); // 'mt'(no change)\
console.log(obj.info.address); // 'bj&&sh'(change)\
```\
\
**3.4 历史 - 实现回退**\
\
可以保存state的每一个状态，并保证该状态不会被修改，这样就可以实现历史记录的回退。\
\
### 4. React中引入Immutable.js带来的问题\
\
- 源文件过大: 源码总共有5k多行，压缩后有16kb\
- 类型转换: 如果需要频繁地与服务器交互，那么Immutable对象就需要不断地与原生js进行转换，操作起来显得很繁琐\
- 侵入性: 例如引用第三方组件的时候，就不得不进行类型转换；在使用react-redux时，connect的`shouldComponentUpdate`已经实现，此处无法发挥作用。\
\
\
### 参考：\
\
- [Immutable及在React中的应用](http://zhenhua-lee.github.io/react/Immutable.html)\
- [ImmutableJS官方网站](http://facebook.github.io/immutable-js/)\
- [flux immutable](http://rhadow.github.io/2015/05/10/flux-immutable/)\
- http://boke.io/immutable-js/\
- https://en.wikipedia.org/wiki/Persistent_data_structure\
- http://blog.nextoffer.com/why-we-invest-in-tools/\
- https://github.com/camsong/blog/issues/3\
- http://jlongster.com/Using-Immutable-Data-Structures-in-JavaScript        
31	0	RainDon	函数式编程简介	functional-programming-for-the-rest-of-us	3	1		0	ImShengli	函数式编程				<div class="md-section-divider"></div>\
\
<p><div class="toc">\
<ul>\
<li><ul>\
<li><ul>\
<li><a href="#开篇">开篇</a></li>\
<li><a href="#公园漫步">公园漫步</a></li>\
<li><a href="#历史回眸3">历史回眸3</a></li>\
<li><a href="#函数式编程">函数式编程</a></li>\
<li><a href="#fp之优点">FP之优点</a><ul>\
<li><a href="#单元测试">单元测试</a></li>\
<li><a href="#调试查错">调试查错</a></li>\
<li><a href="#并发执行">并发执行</a></li>\
</ul>\
</li>\
</ul>\
</li>\
</ul>\
</li>\
</ul>\
</div>\
</p>\
\
<blockquote class="white-blockquote">\
  <p>本文发表于2006年6月19日，较为古老的一篇文章，但看了内容后觉得对自己理解函数式编程挺有帮助，就贴于此。原文链接为：<a href="http://www.defmacro.org/ramblings/fp.html" target="_blank">Functional Programming For The Rest of Us</a></p>\
</blockquote>\
\
<div class="md-section-divider"></div>\
\
<h3 id="开篇">开篇</h3>\
\
<p>我们这些码农做事都是很拖拉的。每天例行报到后，先来点咖啡，看看邮件还有RSS订阅的文章。然后翻翻新闻还有那些技术网站上的更新，再过一遍编程论坛口水区里那些无聊的论战。最后从头把这些再看一次以免错过什么精彩的内容。然后就可以吃午饭了。饭饱过后，回来盯着IDE发一会呆，再看看邮箱，再去搞杯咖啡。光阴似箭，可以回家了…… </p>\
\
<p>（在被众人鄙视之前）我唯一想说的是，在这些拖拉的日子里总会时不时读到一些<a href="http://www.baike.com/wiki/%E4%B8%8D%E6%98%8E%E8%A7%89%E5%8E%89" target="_blank">不明觉厉</a>的文章。如果没有打开不应该打开的网站，每隔几天你都可以看到至少一篇这样的东西。它们的共性：难懂，耗时，于是这些文章就慢慢的堆积成山了。很快你就会发现自己已经累积了一堆的收藏链接还有数不清的PDF文件，此时你只希望隐入一个杳无人烟的深山老林里什么也不做，用一年半载好好的消化这些私藏宝贝。当然，我是说最好每天还是能有人来给送吃的顺带帮忙打扫卫生倒垃圾，哇哈哈。   </p>\
\
<p>我不知道你都收藏了些什么，我的阅读清单里面相当大部分都是函数式编程相关的东东：基本上是最难啃的。这些文章充斥着无比枯燥的教科书语言，我想就连那些在华尔街浸淫10年以上的大牛都无法搞懂这些函数式编程（简称FP）文章到底在说什么。你可以去花旗集团或者德意志银行找个项目经理来问问<sup>1</sup>：你们为什么要选JMS而不用Erlang？答案基本上是：我认为这个学术用的语言还无法胜任实际应用。可是，现有的一些系统不仅非常复杂还需要满足十分严苛的需求，它们就都是用函数式编程的方法来实现的。这，就说不过去了。    </p>\
\
<p>关于FP的文章确实比较难懂，但我不认为一定要搞得那么晦涩。有一些历史原因造成了这种知识断层，可是FP概念本身并不难理解。我希望这篇文章可以成为一个“FP入门指南”，帮助你从<a href="http://zh.wikipedia.org/zh/%E6%8C%87%E4%BB%A4%E5%BC%8F%E7%B7%A8%E7%A8%8B" target="_blank">指令式编程</a>走向<a href="http://zh.wikipedia.org/zh/%E5%87%BD%E6%95%B8%E7%A8%8B%E5%BC%8F%E8%AA%9E%E8%A8%80" target="_blank">函数式编程</a>。先来点咖啡，然后继续读下去。很快你对FP的理解就会让同事们刮目相看了。      </p>\
\
<p>什么是函数式编程（Functional Programming，FP）？它从何而来？可以吃吗？倘若它真的像那些鼓吹FP的人说的那么好，为什么实际应用中那么少见？为什么只有那些在读博士的家伙想要用它？而最重要的是，它母亲的怎么就那么难学？那些所谓的closure、continuation，currying，lazy evaluation还有no side effects都是什么东东（译者：本着保留专用术语的原则，此处及下文类似情形均不译）？如果没有那些大学教授的帮忙怎样把它应用到实际工程里去？为什么它和我们熟悉的万能而神圣的指令式编程那么的不一样？ </p>\
\
<p>我们很快就会解开这些谜团。刚才我说过实际工程和学术界之间的知识断层是有其历史原因的，那么就先让我来解释一下这个问题。答案，就在接下来的一次公园漫步中：</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="公园漫步">公园漫步</h3>\
\
<p>时间机器启动……我们来到公元前380年，也就是2000多年前的雅典城外。这是一个阳光明媚的久违的春天，<a href="http://zh.wikipedia.org/zh/%E6%9F%8F%E6%8B%89%E5%9B%BE" target="_blank">柏拉图</a>和一个帅气的小男仆走在一片橄榄树荫下。他们正准备前往一个学院。天气很好，吃得很饱，渐渐的，两人的谈话转向了哲学。     </p>\
\
<blockquote class="white-blockquote">\
  <p>“你看那两个学生，哪一个更高一些？”，柏拉图小心的选择用字，以便让这个问题更好的引导眼前的这个小男孩。 <br>\
  小男仆望向水池旁边的两个男生，“他们差不多一样高。”。 <br>\
  “‘差不多一样高’是什么意思？”柏拉图问。 <br>\
  “嗯……从这里看来他们是一样高的，但是如果走近一点我肯定能看出差别来。” <br>\
  柏拉图笑了。他知道这个小孩已经朝他引导的方向走了。“这么说来你的意思是世界上没有什么东西是完全相同的咯？” <br>\
  思考了一会，小男孩回答：“是的。万物之间都至少有一丁点差别，哪怕我们无法分辨出来。” <br>\
  说到点子上了！“那你说，如果世界上没有什么东西是完全相等的，你怎么理解‘完全相等’这个概念？” <br>\
  小男仆看起来很困惑。“这我就不知道了。”</p>\
</blockquote>\
\
<p>这是人类第一次试图了解数学的本质。柏拉图认为我们所在的世界中，万事万物都是完美模型的一个近似。他同时意识到虽然我们不能感受到完美的模型，但这丝毫不会阻止我们了解完美模型的概念。柏拉图进而得出结论：完美的数学模型只存在于另外一个世界，而因为某种原因我们却可以通过联系着这两个世界的一个纽带来认识这些模型。一个简单的例子就是完美的圆形。没有人见过这样的一个圆，但是我们知道怎样的圆是完美的圆，而且可以用公式把它描述出来。      </p>\
\
<p>如此说来，什么是数学呢？为什么可以用数学法则来描述我们的这个宇宙？我们所处的这个世界中万事万物都可以用数学来描述吗？<sup>2</sup> <br>\
数理哲学是一门很复杂的学科。它和其他多数哲学一样，更着重于提出问题而不是给出答案。数学就像拼图一样，很多结论都是这样推导出来的：先是确立一些互不冲突的基础原理，以及一些操作这些原理的规则，然后就可以把这些原理以及规则拼凑起来形成新的更加复杂的规则或是定理了。数学家把这种方法称为“形式系统”或是“演算”。如果你想做的话，可以用形式系统描述俄罗斯方块这个游戏。而事实上，俄罗斯方块这个游戏的实现，只要它正确运行，就是一个形式系统。只不过它以一种不常见的形式表现出来罢了。     </p>\
\
<p>如果<a href="http://zh.wikipedia.org/wiki/%E5%8D%8A%E4%BA%BA%E9%A9%AC%E5%BA%A7%CE%B1" target="_blank">半人马阿尔法</a>上有文明存在的话，那里的生物可能无法解读我们的俄罗斯方块形式系统甚至是简单的圆形的形式系统，因为它们感知世界的唯一器官可能只有鼻子（译者：偶的妈你咋知道？）也许它们是无法得知俄罗斯方块的形式系统了，但是它们很有可能知道圆形。它们的圆形我们可能没法解读，因为我们的鼻子没有它们那么灵敏（译者：那狗可以么？）可是只要越过形式系统的表示方式（比如通过使用“超级鼻子”之类的工具来感知这些用味道表示的形式系统，然后使用标准的解码技术把它们翻译成人类能理解的语言），那么任何有足够智力的文明都可以理解这些形式系统的本质。  </p>\
\
<p>有意思的是，哪怕宇宙中完全不存在任何文明，类似俄罗斯方块还有圆形这样的形式系统依旧是成立的：只不过没有智慧生物去发现它们而已。这个时候如果忽然一个文明诞生了，那么这些具有智慧的生物就很有可能发现各种各样的形式系统，并且用它们发现的系统去描述各种宇宙法则。不过它们可能不会发现俄罗斯方块这样的形式系统，因为在它们的世界里没有俄罗斯方块这种东西嘛。有很多像俄罗斯方块这样的形式系统是与客观世界无关的，比如说自然数，很难说所有的自然数都与客观世界有关，随便举一个超级大的数，这个数可能就和世界上任何事物无关，因为这个世界可能不是无穷大的。</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="历史回眸3">历史回眸<sup>3</sup></h3>\
\
<p>再次启动时间机……这次到达的是20世纪30年代，离今天近了很多。无论<a href="http://zh.wikipedia.org/wiki/%E6%96%B0%E5%A4%A7%E9%99%B8" target="_blank">新</a><a href="http://zh.wikipedia.org/wiki/%E8%88%8A%E5%A4%A7%E9%99%B8" target="_blank">旧</a>大陆，经济大萧条都造成了巨大的破坏。社会各阶层几乎每一个家庭都深受其害。只有极其少数的几个地方能让人们免于遭受穷困之苦。几乎没有人能够幸运的在这些避难所里度过危机，注意，我说的是几乎没有，还真的有这么些幸运儿，比如说当时普林斯顿大学的数学家们。    </p>\
\
<p>新建成的哥特式办公楼给普林斯顿大学带来一种天堂般的安全感。来自世界各地的逻辑学者应邀来到普林斯顿，他们将组建一个新的学部。正当大部分美国人还在为找不到一片面包做晚餐而发愁的时候，在普林斯顿却是这样一番景象：高高的天花板和木雕包覆的墙，每天品茶论道，漫步丛林。</p>\
\
<p>一个名叫<a href="http://zh.wikipedia.org/zh/%E9%98%BF%E9%9A%86%E4%BD%90%C2%B7%E9%82%B1%E5%A5%87" target="_blank">阿隆佐·邱奇</a>(Alonzo Church)的年轻数学家就过着这样优越的生活。阿隆佐本科毕业于普林斯顿后被留在研究院。他觉得这样的生活完全没有必要，于是他鲜少出现在那些数学茶会中也不喜欢到树林里散心。阿隆佐更喜欢独处：自己一个人的时候他的工作效率更高。尽管如此他还是和普林斯顿学者保持着联系，这些人当中有<a href="http://zh.wikipedia.org/zh/%E8%89%BE%E4%BC%A6%C2%B7%E5%9B%BE%E7%81%B5" target="_blank">艾伦·图灵</a>、<a href="http://zh.wikipedia.org/zh/%E7%BA%A6%E7%BF%B0%C2%B7%E5%86%AF%C2%B7%E8%AF%BA%E4%BC%8A%E6%9B%BC" target="_blank">约翰·冯·诺伊曼</a>、<a href="http://zh.wikipedia.org/zh-hant/%E5%BA%93%E5%B0%94%E7%89%B9%C2%B7%E5%93%A5%E5%BE%B7%E5%B0%94" target="_blank">库尔特·哥德尔</a>。    </p>\
\
<p>这四个人都对形式系统感兴趣。相对于现实世界，他们更关心如何解决抽象的数学问题。而他们的问题都有这么一个共同点：都在尝试解答关于计算的问题。诸如：如果有一台拥有无穷计算能力的超级机器，可以用来解决什么问题？它可以自动的解决这些问题吗？是不是还是有些问题解决不了，如果有的话，是为什么？如果这样的机器采用不同的设计，它们的计算能力相同吗？</p>\
\
<p>在与这些人的合作下，阿隆佐设计了一个名为<a href="http://zh.wikipedia.org/wiki/%CE%9B%E6%BC%94%E7%AE%97" target="_blank">lambda演算</a>的形式系统。这个系统实质上是为其中一个超级机器设计的编程语言。在这种语言里面，函数的参数是函数，返回值也是函数。这种函数用希腊字母lambda（<a href="http://en.wikipedia.org/wiki/Lambda" target="_blank">λ</a>），这种系统因此得名<sup>4</sup>。有了这种形式系统，阿隆佐终于可以分析前面的那些问题并且能够给出答案了。   </p>\
\
<p>除了阿隆佐·邱奇，艾伦·图灵也在进行类似的研究。他设计了一种完全不同的系统（后来被称为<a href="http://zh.wikipedia.org/zh/%E5%9B%BE%E7%81%B5%E6%9C%BA" target="_blank">图灵机</a>），并用这种系统得出了和阿隆佐相似的答案。到了后来人们证明了图灵机和lambda演算的能力是一样的。    </p>\
\
<p>如果二战没有发生，这个故事到这里就应该结束了，我的这篇小文没什么好说的了，你们也可以去看看有什么其他好看的文章。可是二战还是爆发了，整个世界陷于火海之中。那时的美军空前的大量使用炮兵。为了提高轰炸的精度，军方聘请了大批数学家夜以继日的求解各种差分方程用于计算各种火炮发射数据表。后来他们发现单纯手工计算这些方程太耗时了，为了解决这个问题，各种各样的计算设备应运而生。IBM制造的Mark一号就是用来计算这些发射数据表的第一台机器。Mark一号重5吨，由75万个零部件构成，每一秒可以完成3次运算。     </p>\
\
<p>战后，人们为提高计算能力而做出的努力并没有停止。1949年第一台电子离散变量自动计算机诞生并取得了巨大的成功。它是<a href="http://zh.wikipedia.org/zh/%E5%86%AF%C2%B7%E8%AF%BA%E4%BC%8A%E6%9B%BC%E7%BB%93%E6%9E%84" target="_blank">冯·诺伊曼设计架构</a>的第一个实例，也是一台现实世界中实现的图灵机。相比他的这些同事，那个时候阿隆佐的运气就没那么好了。  </p>\
\
<p>到了50年代末，一个叫John McCarthy的MIT教授（他也是普林斯顿的硕士）对阿隆佐的成果产生了兴趣。1958年他发明了一种列表处理语言（Lisp），这种语言是一种阿隆佐lambda演算在现实世界的实现，而且它能在冯·诺伊曼计算机上运行！很多计算机科学家都认识到了Lisp强大的能力。1973年在MIT人工智能实验室的一些程序员研发出一种机器，并把它叫做Lisp机。于是阿隆佐的lambda演算也有自己的硬件实现了！</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="函数式编程">函数式编程</h3>\
\
<p>函数式编程是阿隆佐思想的在现实世界中的实现。不过不是全部的lambda演算思想都可以运用到实际中，因lambda演算在设计的时候就不是为了在各种现实世界中的限制下工作的。所以，就像面向对象的编程思想一样，函数式编程只是一系列想法，而不是一套严苛的规定。有很多支持函数式编程的程序语言，它们之间的具体设计都不完全一样。在这里我将用Java写的例子介绍那些被广泛应用的函数式编程思想（没错，如果你是受虐狂你可以用Java写出函数式程序）。在下面的章节中我会在Java语言的基础上，做一些修改让它变成实际可用的函数式编程语言。那么现在就开始吧。     </p>\
\
<p>Lambda演算在最初设计的时候就是为了研究计算相关的问题。所以函数式编程主要解决的也是计算问题，而出乎意料的是，是用函数来解决的！（译者：请理解原作者的苦心，我想他是希望加入一点调皮的风格以免读者在中途睡着或是转台……）。函数就是函数式编程中的基础元素，可以完成几乎所有的操作，哪怕最简单的计算，也是用函数完成的。我们通常理解的变量在函数式编程中也被函数代替了：在函数式编程中变量仅仅代表某个表达式（这样我们就不用把所有的代码都写在同一行里了）。所以我们这里所说的‘变量’是不能被修改的。所有的变量只能被赋一次初值。在Java中就意味着每一个变量都将被声明为final（如果你用C++，就是const）。在FP中，没有非final的变量。     </p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-java"><span class="kwd">final</span><span class="pln"> </span><span class="kwd">int</span><span class="pln"> i </span><span class="pun">=</span><span class="pln"> </span><span class="lit">5</span><span class="pun">;</span></code></li><li class="L1"><code class="language-java"><span class="kwd">final</span><span class="pln"> </span><span class="kwd">int</span><span class="pln"> j </span><span class="pun">=</span><span class="pln"> i </span><span class="pun">+</span><span class="pln"> </span><span class="lit">3</span><span class="pun">;</span></code></li></ol></pre>\
\
<p>既然FP中所有的变量都是final的，可以引出两个规定：一是变量前面就没有必要再加上final这个关键字了，二是变量就不能再叫做‘变量’了……于是现在开始对Java做两个改动：所有Java中声明的变量默认为final，而且我们把所谓的‘变量’称为‘符号’。     </p>\
\
<p>到现在可能会有人有疑问：这个新创造出来的语言可以用来写什么有用的复杂一些的程序吗？毕竟，如果每个符号的值都是不能修改的，那么我们就什么东西都不能改变了！别紧张，这样的说法不完全正确。阿隆佐在设计lambda演算的时候他并不想要保留状态的值以便稍后修改这些值。他更关心的是基于数据之上的操作（也就是更容易理解的“计算”）。而且，lambda演算和图灵机已经被证明了是具有同样能力的系统，因此指令式编程能做到的函数式编程也同样可以做到。那么，怎样才能做到呢？     </p>\
\
<p>事实上函数式程序是可以保存状态的，只不过它们用的不是变量，而是函数。状态保存在函数的参数中，也就是说在栈上。如果你需要保存一个状态一段时间并且时不时的修改它，那么你可以编写一个递归函数。举个例子，试着写一个函数，用来反转一个Java的字符串。记住咯，这个程序里的变量都是默认为final的<sup>5</sup>。</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-java"><span class="typ">String</span><span class="pln"> reverse</span><span class="pun">(</span><span class="typ">String</span><span class="pln"> arg</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L1"><code class="language-java"><span class="pln">    </span><span class="kwd">if</span><span class="pun">(</span><span class="pln">arg</span><span class="pun">.</span><span class="pln">length </span><span class="pun">==</span><span class="pln"> </span><span class="lit">0</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L2"><code class="language-java"><span class="pln">        </span><span class="kwd">return</span><span class="pln"> arg</span><span class="pun">;</span></code></li><li class="L3"><code class="language-java"><span class="pln">    </span><span class="pun">}</span></code></li><li class="L4"><code class="language-java"><span class="pln">    </span><span class="kwd">else</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L5"><code class="language-java"><span class="pln">        </span><span class="kwd">return</span><span class="pln"> reverse</span><span class="pun">(</span><span class="pln">arg</span><span class="pun">.</span><span class="pln">substring</span><span class="pun">(</span><span class="lit">1</span><span class="pun">,</span><span class="pln"> arg</span><span class="pun">.</span><span class="pln">length</span><span class="pun">))</span><span class="pln"> </span><span class="pun">+</span><span class="pln"> arg</span><span class="pun">.</span><span class="pln">substring</span><span class="pun">(</span><span class="lit">0</span><span class="pun">,</span><span class="pln"> </span><span class="lit">1</span><span class="pun">);</span></code></li><li class="L6"><code class="language-java"><span class="pln">    </span><span class="pun">}</span></code></li><li class="L7"><code class="language-java"><span class="pun">}</span></code></li></ol></pre>\
\
<p>这个方程运行起来会相对慢一些，因为它重复调用自己<sup>6</sup>。同时它也会大量的消耗内存，因为它会不断的分配创建内存对象。无论如何，它是用函数式编程思想写出来的。这时候可能有人要问了，为什么要用这种奇怪的方式编写程序呢？嘿，我正准备告诉你。</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="fp之优点">FP之优点</h3>\
\
<p>你大概已经在想：上面这种怪胎函数怎么也不合理嘛。在我刚开始学习FP的时候我也这样想的。不过后来我知道我是错的。使用这种方式编程有很多好处。其中一些是主观的。比如说有人认为函数式程序更容易理解。这个我就不说了，哪怕街上随便找个小孩都知道‘容易理解’是多么主观的事情。幸运的是，客观方面的好处还有很多。</p>\
\
<div class="md-section-divider"></div>\
\
<h4 id="单元测试">单元测试</h4>\
\
<p>因为FP中的每个符号都是final的，于是没有什么函数会有副作用。谁也不能在运行时修改任何东西，也没有函数可以修改在它的作用域之外修改什么值给其他函数继续使用（在指令式编程中可以用类成员或是全局变量做到）。这意味着决定函数执行结果的唯一因素就是它的返回值，而影响其返回值的唯一因素就是它的参数。    </p>\
\
<p>这正是单元测试工程师梦寐以求的啊。现在测试程序中的函数时只需要关注它的参数就可以了。完全不需要担心函数调用的顺序，也不用费心设置外部某些状态值。唯一需要做的就是传递一些可以代表边界条件的参数给这些函数。相对于指令式编程，如果FP程序中的每一个函数都能通过单元测试，那么我们对这个软件的质量必将信心百倍。反观Java或者C++，仅仅检查函数的返回值是不够的：代码可能修改外部状态值，因此我们还需要验证这些外部的状态值的正确性。在FP语言中呢，就完全不需要。</p>\
\
<div class="md-section-divider"></div>\
\
<h4 id="调试查错">调试查错</h4>\
\
<p>如果一段FP程序没有按照预期设计那样运行，调试的工作几乎不费吹灰之力。这些错误是百分之一百可以重现的，因为FP程序中的错误不依赖于之前运行过的不相关的代码。而在一个指令式程序中，一个bug可能有时能重现而有些时候又不能。因为这些函数的运行依赖于某些外部状态， 而这些外部状态又需要由某些与这个bug完全不相关的代码通过某个特别的执行流程才能修改。在FP中这种情况完全不存在：如果一个函数的返回值出错了，它一直都会出错，无论你之前运行了什么代码。 </p>\
\
<p>一旦问题可以重现，解决它就变得非常简单，几乎就是一段愉悦的旅程。中断程序的运行，检查一下栈，就可以看到每一个函数调用时使用的每一个参数，这一点和指令式代码一样。不同的是指令式程序中这些数据还不足够，因为函数的运行还可能依赖于成员变量，全局变量，还有其他类的状态（而这些状态又依赖于类似的变量）。FP中的函数只依赖于传给它的参数，而这些参数就在眼前！还有，对指令式程序中函数返回值的检查并不能保证这个函数是正确运行的。还要逐一检查若干作用域以外的对象以确保这个函数没有对这些牵连的对象做出什么越轨的行为（译者：好吧，翻译到这里我自己已经有点激动了）。对于一个FP程序，你要做的仅仅是看一下函数的返回值。  </p>\
\
<p>把栈上的数据过一遍就可以得知有哪些参数传给了什么函数，这些函数又返回了什么值。当一个返回值看起来不对头的那一刻，跳进这个函数看看里面发生了什么。一直重复跟进下去就可以找到bug的源头！</p>\
\
<div class="md-section-divider"></div>\
\
<h4 id="并发执行">并发执行</h4>\
\
<p>不需要任何改动，所有FP程序都是可以并发执行的。由于根本不需要采用锁机制，因此完全不需要担心死锁或是并发竞争的发生。在FP程序中没有哪个线程可以修改任何数据，更不用说多线程之间了。这使得我们可以轻松的添加线程，至于那些祸害并发程序的老问题，想都不用想！</p>\
\
<p>既然是这样，为什么没有人在那些高度并行的那些应用程序中采用FP编程呢？事实上，这样的例子并不少见。爱立信开发了一种FP语言，名叫Erlang，并应用在他们的电信交换机上，而这些交换机不仅容错度高而且拓展性强。许多人看到了Erlang的这些优势也纷纷开始使用这一语言。在这里提到的电信交换控制系统远远要比华尔街上使用的系统具有更好的扩展性也更可靠。事实上，用Erlang搭建的系统并不具备可扩展性和可靠性，而Java可以提供这些特性。Erlang只是像岩石一样结实不容易出错而已。   </p>\
\
<p>FP关于并行的优势不仅于此。就算某个FP程序本身只是单线程的，编译器也可以将其优化成可以在多CPU上运行的并发程序。以下面的程序为例：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-java"><span class="typ">String</span><span class="pln"> s1 </span><span class="pun">=</span><span class="pln"> somewhatLongOperation1</span><span class="pun">();</span></code></li><li class="L1"><code class="language-java"><span class="typ">String</span><span class="pln"> s2 </span><span class="pun">=</span><span class="pln"> somewhatLongOperation2</span><span class="pun">();</span></code></li><li class="L2"><code class="language-java"><span class="typ">String</span><span class="pln"> s3 </span><span class="pun">=</span><span class="pln"> concatenate</span><span class="pun">(</span><span class="pln">s1</span><span class="pun">,</span><span class="pln"> s2</span><span class="pun">);</span></code></li></ol></pre>\
\
<p>如果是函数式程序，编译器就可以对代码进行分析，然后可能分析出生成字符串s1和s2的两个函数可能会比较耗时，进而安排它们并行运行。这在指令式编程中是无法做到的，因为每一个函数都有可能修改其外部状态，然后接下来的函数又可能依赖于这些状态的值。在函数式编程中，自动分析代码并找到适合并行执行的函数十分简单，和分析C的内联函数没什么两样。从这个角度来说用FP风格编写的程序是“永不过时”的（虽然我一般不喜欢说大话空话，不过这次就算个例外吧）。硬件厂商已经没办法让CPU运行得再快了。他们只能靠增加CPU核的数量然后用并行来提高运算的速度。这些厂商故意忽略一个事实：只有可以并行的软件才能让你花大价钱买来的这些硬件物有所值。指令式的软件中只有很小一部分能做到跨核运行，而所有的函数式软件都能实现这一目标，因为FP的程序从一开始就是可以并行运行的。</p>\
\
<p>注： <br>\
<sup>1</sup>当我在2005年求职时的的确确经常问别人这个问题。看着那些茫然的面孔实在是很好玩的事情。你们这些年薪30万美金的家伙，至少应该对自己可以利用的工具有个起码的理解嘛。 <br>\
<sup>2</sup>这是个有争议的问题。物理学家和数学家不得不承认目前还无法确定宇宙万物是不是都遵从可以用数学方法描述的各种法则。 <br>\
<sup>3</sup>我一直一来都很讨厌在历史课上罗列一堆枯燥无味的时间、人名、事件。对我来说历史就是关于那些改变世界的人们活生生的故事，是他们行为背后的个人动机，是那些他们用以影响芸芸众生的方法和工具。从这个角度来说，接下来的这堂历史课是不完整的，很遗憾。只有那些非常相关的人和事会被提及。        </p>\
\
<p><strong>文章来源</strong></p>\
\
<ul>\
<li><a href="https://github.com/justinyhuang/Functional-Programming-For-The-Rest-of-Us-Cn/blob/master/FunctionalProgrammingForTheRestOfUs.cn.md" target="_blank">https://github.com/justinyhuang/Functional-Programming-For-The-Rest-of-Us-Cn/blob/master/FunctionalProgrammingForTheRestOfUs.cn.md</a></li>\
</ul>	什么是函数式编程？它从何而来？可以吃吗？倘若它真的像那些鼓吹FP的人说的那么好，为什么实际应用中那么少见？为什么只有那些在读博士的家伙想要用它？那些所谓的closure、continuation，currying，lazy evaluation还有no side effects都是什么东东？etc.	23	0	2016-07-07 22:34:45	2016-07-05 23:30:24	[TOC]\
\
> 本文发表于2006年6月19日，较为古老的一篇文章，但看了内容后觉得对自己理解函数式编程挺有帮助，就贴于此。原文链接为：[Functional Programming For The Rest of Us](http://www.defmacro.org/ramblings/fp.html)\
\
### 开篇\
\
我们这些码农做事都是很拖拉的。每天例行报到后，先来点咖啡，看看邮件还有RSS订阅的文章。然后翻翻新闻还有那些技术网站上的更新，再过一遍编程论坛口水区里那些无聊的论战。最后从头把这些再看一次以免错过什么精彩的内容。然后就可以吃午饭了。饭饱过后，回来盯着IDE发一会呆，再看看邮箱，再去搞杯咖啡。光阴似箭，可以回家了…… \
\
（在被众人鄙视之前）我唯一想说的是，在这些拖拉的日子里总会时不时读到一些[不明觉厉](http://www.baike.com/wiki/%E4%B8%8D%E6%98%8E%E8%A7%89%E5%8E%89)的文章。如果没有打开不应该打开的网站，每隔几天你都可以看到至少一篇这样的东西。它们的共性：难懂，耗时，于是这些文章就慢慢的堆积成山了。很快你就会发现自己已经累积了一堆的收藏链接还有数不清的PDF文件，此时你只希望隐入一个杳无人烟的深山老林里什么也不做，用一年半载好好的消化这些私藏宝贝。当然，我是说最好每天还是能有人来给送吃的顺带帮忙打扫卫生倒垃圾，哇哈哈。   \
\
我不知道你都收藏了些什么，我的阅读清单里面相当大部分都是函数式编程相关的东东：基本上是最难啃的。这些文章充斥着无比枯燥的教科书语言，我想就连那些在华尔街浸淫10年以上的大牛都无法搞懂这些函数式编程（简称FP）文章到底在说什么。你可以去花旗集团或者德意志银行找个项目经理来问问<sup>1</sup>：你们为什么要选JMS而不用Erlang？答案基本上是：我认为这个学术用的语言还无法胜任实际应用。可是，现有的一些系统不仅非常复杂还需要满足十分严苛的需求，它们就都是用函数式编程的方法来实现的。这，就说不过去了。    \
\
关于FP的文章确实比较难懂，但我不认为一定要搞得那么晦涩。有一些历史原因造成了这种知识断层，可是FP概念本身并不难理解。我希望这篇文章可以成为一个“FP入门指南”，帮助你从[指令式编程](http://zh.wikipedia.org/zh/%E6%8C%87%E4%BB%A4%E5%BC%8F%E7%B7%A8%E7%A8%8B)走向[函数式编程](http://zh.wikipedia.org/zh/%E5%87%BD%E6%95%B8%E7%A8%8B%E5%BC%8F%E8%AA%9E%E8%A8%80)。先来点咖啡，然后继续读下去。很快你对FP的理解就会让同事们刮目相看了。      \
\
什么是函数式编程（Functional Programming，FP）？它从何而来？可以吃吗？倘若它真的像那些鼓吹FP的人说的那么好，为什么实际应用中那么少见？为什么只有那些在读博士的家伙想要用它？而最重要的是，它母亲的怎么就那么难学？那些所谓的closure、continuation，currying，lazy evaluation还有no side effects都是什么东东（译者：本着保留专用术语的原则，此处及下文类似情形均不译）？如果没有那些大学教授的帮忙怎样把它应用到实际工程里去？为什么它和我们熟悉的万能而神圣的指令式编程那么的不一样？ \
\
我们很快就会解开这些谜团。刚才我说过实际工程和学术界之间的知识断层是有其历史原因的，那么就先让我来解释一下这个问题。答案，就在接下来的一次公园漫步中：\
\
### 公园漫步\
\
时间机器启动……我们来到公元前380年，也就是2000多年前的雅典城外。这是一个阳光明媚的久违的春天，[柏拉图](http://zh.wikipedia.org/zh/%E6%9F%8F%E6%8B%89%E5%9B%BE)和一个帅气的小男仆走在一片橄榄树荫下。他们正准备前往一个学院。天气很好，吃得很饱，渐渐的，两人的谈话转向了哲学。     \
> “你看那两个学生，哪一个更高一些？”，柏拉图小心的选择用字，以便让这个问题更好的引导眼前的这个小男孩。     \
小男仆望向水池旁边的两个男生，“他们差不多一样高。”。     \
“‘差不多一样高’是什么意思？”柏拉图问。    \
“嗯……从这里看来他们是一样高的，但是如果走近一点我肯定能看出差别来。”  \
> 柏拉图笑了。他知道这个小孩已经朝他引导的方向走了。“这么说来你的意思是世界上没有什么东西是完全相同的咯？”     \
思考了一会，小男孩回答：“是的。万物之间都至少有一丁点差别，哪怕我们无法分辨出来。”    \
说到点子上了！“那你说，如果世界上没有什么东西是完全相等的，你怎么理解‘完全相等’这个概念？”     \
小男仆看起来很困惑。“这我就不知道了。”\
\
这是人类第一次试图了解数学的本质。柏拉图认为我们所在的世界中，万事万物都是完美模型的一个近似。他同时意识到虽然我们不能感受到完美的模型，但这丝毫不会阻止我们了解完美模型的概念。柏拉图进而得出结论：完美的数学模型只存在于另外一个世界，而因为某种原因我们却可以通过联系着这两个世界的一个纽带来认识这些模型。一个简单的例子就是完美的圆形。没有人见过这样的一个圆，但是我们知道怎样的圆是完美的圆，而且可以用公式把它描述出来。      \
\
如此说来，什么是数学呢？为什么可以用数学法则来描述我们的这个宇宙？我们所处的这个世界中万事万物都可以用数学来描述吗？<sup>2</sup>\
数理哲学是一门很复杂的学科。它和其他多数哲学一样，更着重于提出问题而不是给出答案。数学就像拼图一样，很多结论都是这样推导出来的：先是确立一些互不冲突的基础原理，以及一些操作这些原理的规则，然后就可以把这些原理以及规则拼凑起来形成新的更加复杂的规则或是定理了。数学家把这种方法称为“形式系统”或是“演算”。如果你想做的话，可以用形式系统描述俄罗斯方块这个游戏。而事实上，俄罗斯方块这个游戏的实现，只要它正确运行，就是一个形式系统。只不过它以一种不常见的形式表现出来罢了。     \
\
如果[半人马阿尔法](http://zh.wikipedia.org/wiki/%E5%8D%8A%E4%BA%BA%E9%A9%AC%E5%BA%A7%CE%B1)上有文明存在的话，那里的生物可能无法解读我们的俄罗斯方块形式系统甚至是简单的圆形的形式系统，因为它们感知世界的唯一器官可能只有鼻子（译者：偶的妈你咋知道？）也许它们是无法得知俄罗斯方块的形式系统了，但是它们很有可能知道圆形。它们的圆形我们可能没法解读，因为我们的鼻子没有它们那么灵敏（译者：那狗可以么？）可是只要越过形式系统的表示方式（比如通过使用“超级鼻子”之类的工具来感知这些用味道表示的形式系统，然后使用标准的解码技术把它们翻译成人类能理解的语言），那么任何有足够智力的文明都可以理解这些形式系统的本质。  \
\
有意思的是，哪怕宇宙中完全不存在任何文明，类似俄罗斯方块还有圆形这样的形式系统依旧是成立的：只不过没有智慧生物去发现它们而已。这个时候如果忽然一个文明诞生了，那么这些具有智慧的生物就很有可能发现各种各样的形式系统，并且用它们发现的系统去描述各种宇宙法则。不过它们可能不会发现俄罗斯方块这样的形式系统，因为在它们的世界里没有俄罗斯方块这种东西嘛。有很多像俄罗斯方块这样的形式系统是与客观世界无关的，比如说自然数，很难说所有的自然数都与客观世界有关，随便举一个超级大的数，这个数可能就和世界上任何事物无关，因为这个世界可能不是无穷大的。\
\
### 历史回眸<sup>3</sup>\
\
再次启动时间机……这次到达的是20世纪30年代，离今天近了很多。无论[新](http://zh.wikipedia.org/wiki/%E6%96%B0%E5%A4%A7%E9%99%B8)[旧](http://zh.wikipedia.org/wiki/%E8%88%8A%E5%A4%A7%E9%99%B8)大陆，经济大萧条都造成了巨大的破坏。社会各阶层几乎每一个家庭都深受其害。只有极其少数的几个地方能让人们免于遭受穷困之苦。几乎没有人能够幸运的在这些避难所里度过危机，注意，我说的是几乎没有，还真的有这么些幸运儿，比如说当时普林斯顿大学的数学家们。    \
\
新建成的哥特式办公楼给普林斯顿大学带来一种天堂般的安全感。来自世界各地的逻辑学者应邀来到普林斯顿，他们将组建一个新的学部。正当大部分美国人还在为找不到一片面包做晚餐而发愁的时候，在普林斯顿却是这样一番景象：高高的天花板和木雕包覆的墙，每天品茶论道，漫步丛林。\
\
一个名叫[阿隆佐·邱奇](http://zh.wikipedia.org/zh/%E9%98%BF%E9%9A%86%E4%BD%90%C2%B7%E9%82%B1%E5%A5%87)(Alonzo Church)的年轻数学家就过着这样优越的生活。阿隆佐本科毕业于普林斯顿后被留在研究院。他觉得这样的生活完全没有必要，于是他鲜少出现在那些数学茶会中也不喜欢到树林里散心。阿隆佐更喜欢独处：自己一个人的时候他的工作效率更高。尽管如此他还是和普林斯顿学者保持着联系，这些人当中有[艾伦·图灵](http://zh.wikipedia.org/zh/%E8%89%BE%E4%BC%A6%C2%B7%E5%9B%BE%E7%81%B5)、[约翰·冯·诺伊曼](http://zh.wikipedia.org/zh/%E7%BA%A6%E7%BF%B0%C2%B7%E5%86%AF%C2%B7%E8%AF%BA%E4%BC%8A%E6%9B%BC)、[库尔特·哥德尔](http://zh.wikipedia.org/zh-hant/%E5%BA%93%E5%B0%94%E7%89%B9%C2%B7%E5%93%A5%E5%BE%B7%E5%B0%94)。    \
\
这四个人都对形式系统感兴趣。相对于现实世界，他们更关心如何解决抽象的数学问题。而他们的问题都有这么一个共同点：都在尝试解答关于计算的问题。诸如：如果有一台拥有无穷计算能力的超级机器，可以用来解决什么问题？它可以自动的解决这些问题吗？是不是还是有些问题解决不了，如果有的话，是为什么？如果这样的机器采用不同的设计，它们的计算能力相同吗？\
\
在与这些人的合作下，阿隆佐设计了一个名为[lambda演算](http://zh.wikipedia.org/wiki/%CE%9B%E6%BC%94%E7%AE%97)的形式系统。这个系统实质上是为其中一个超级机器设计的编程语言。在这种语言里面，函数的参数是函数，返回值也是函数。这种函数用希腊字母lambda（[λ](http://en.wikipedia.org/wiki/Lambda)），这种系统因此得名<sup>4</sup>。有了这种形式系统，阿隆佐终于可以分析前面的那些问题并且能够给出答案了。   \
\
除了阿隆佐·邱奇，艾伦·图灵也在进行类似的研究。他设计了一种完全不同的系统（后来被称为[图灵机](http://zh.wikipedia.org/zh/%E5%9B%BE%E7%81%B5%E6%9C%BA)），并用这种系统得出了和阿隆佐相似的答案。到了后来人们证明了图灵机和lambda演算的能力是一样的。    \
\
如果二战没有发生，这个故事到这里就应该结束了，我的这篇小文没什么好说的了，你们也可以去看看有什么其他好看的文章。可是二战还是爆发了，整个世界陷于火海之中。那时的美军空前的大量使用炮兵。为了提高轰炸的精度，军方聘请了大批数学家夜以继日的求解各种差分方程用于计算各种火炮发射数据表。后来他们发现单纯手工计算这些方程太耗时了，为了解决这个问题，各种各样的计算设备应运而生。IBM制造的Mark一号就是用来计算这些发射数据表的第一台机器。Mark一号重5吨，由75万个零部件构成，每一秒可以完成3次运算。     \
\
战后，人们为提高计算能力而做出的努力并没有停止。1949年第一台电子离散变量自动计算机诞生并取得了巨大的成功。它是[冯·诺伊曼设计架构](http://zh.wikipedia.org/zh/%E5%86%AF%C2%B7%E8%AF%BA%E4%BC%8A%E6%9B%BC%E7%BB%93%E6%9E%84)的第一个实例，也是一台现实世界中实现的图灵机。相比他的这些同事，那个时候阿隆佐的运气就没那么好了。  \
\
到了50年代末，一个叫John McCarthy的MIT教授（他也是普林斯顿的硕士）对阿隆佐的成果产生了兴趣。1958年他发明了一种列表处理语言（Lisp），这种语言是一种阿隆佐lambda演算在现实世界的实现，而且它能在冯·诺伊曼计算机上运行！很多计算机科学家都认识到了Lisp强大的能力。1973年在MIT人工智能实验室的一些程序员研发出一种机器，并把它叫做Lisp机。于是阿隆佐的lambda演算也有自己的硬件实现了！\
\
### 函数式编程\
\
函数式编程是阿隆佐思想的在现实世界中的实现。不过不是全部的lambda演算思想都可以运用到实际中，因lambda演算在设计的时候就不是为了在各种现实世界中的限制下工作的。所以，就像面向对象的编程思想一样，函数式编程只是一系列想法，而不是一套严苛的规定。有很多支持函数式编程的程序语言，它们之间的具体设计都不完全一样。在这里我将用Java写的例子介绍那些被广泛应用的函数式编程思想（没错，如果你是受虐狂你可以用Java写出函数式程序）。在下面的章节中我会在Java语言的基础上，做一些修改让它变成实际可用的函数式编程语言。那么现在就开始吧。     \
\
Lambda演算在最初设计的时候就是为了研究计算相关的问题。所以函数式编程主要解决的也是计算问题，而出乎意料的是，是用函数来解决的！（译者：请理解原作者的苦心，我想他是希望加入一点调皮的风格以免读者在中途睡着或是转台……）。函数就是函数式编程中的基础元素，可以完成几乎所有的操作，哪怕最简单的计算，也是用函数完成的。我们通常理解的变量在函数式编程中也被函数代替了：在函数式编程中变量仅仅代表某个表达式（这样我们就不用把所有的代码都写在同一行里了）。所以我们这里所说的‘变量’是不能被修改的。所有的变量只能被赋一次初值。在Java中就意味着每一个变量都将被声明为final（如果你用C++，就是const）。在FP中，没有非final的变量。     \
\
```java\
final int i = 5;\
final int j = i + 3;\
```\
\
既然FP中所有的变量都是final的，可以引出两个规定：一是变量前面就没有必要再加上final这个关键字了，二是变量就不能再叫做‘变量’了……于是现在开始对Java做两个改动：所有Java中声明的变量默认为final，而且我们把所谓的‘变量’称为‘符号’。     \
\
到现在可能会有人有疑问：这个新创造出来的语言可以用来写什么有用的复杂一些的程序吗？毕竟，如果每个符号的值都是不能修改的，那么我们就什么东西都不能改变了！别紧张，这样的说法不完全正确。阿隆佐在设计lambda演算的时候他并不想要保留状态的值以便稍后修改这些值。他更关心的是基于数据之上的操作（也就是更容易理解的“计算”）。而且，lambda演算和图灵机已经被证明了是具有同样能力的系统，因此指令式编程能做到的函数式编程也同样可以做到。那么，怎样才能做到呢？     \
\
事实上函数式程序是可以保存状态的，只不过它们用的不是变量，而是函数。状态保存在函数的参数中，也就是说在栈上。如果你需要保存一个状态一段时间并且时不时的修改它，那么你可以编写一个递归函数。举个例子，试着写一个函数，用来反转一个Java的字符串。记住咯，这个程序里的变量都是默认为final的<sup>5</sup>。\
\
```java\
String reverse(String arg) {\
    if(arg.length == 0) {\
        return arg;\
    }\
    else {\
        return reverse(arg.substring(1, arg.length)) + arg.substring(0, 1);\
    }\
}\
```\
\
这个方程运行起来会相对慢一些，因为它重复调用自己<sup>6</sup>。同时它也会大量的消耗内存，因为它会不断的分配创建内存对象。无论如何，它是用函数式编程思想写出来的。这时候可能有人要问了，为什么要用这种奇怪的方式编写程序呢？嘿，我正准备告诉你。\
\
### FP之优点\
\
你大概已经在想：上面这种怪胎函数怎么也不合理嘛。在我刚开始学习FP的时候我也这样想的。不过后来我知道我是错的。使用这种方式编程有很多好处。其中一些是主观的。比如说有人认为函数式程序更容易理解。这个我就不说了，哪怕街上随便找个小孩都知道‘容易理解’是多么主观的事情。幸运的是，客观方面的好处还有很多。\
\
#### 单元测试\
\
因为FP中的每个符号都是final的，于是没有什么函数会有副作用。谁也不能在运行时修改任何东西，也没有函数可以修改在它的作用域之外修改什么值给其他函数继续使用（在指令式编程中可以用类成员或是全局变量做到）。这意味着决定函数执行结果的唯一因素就是它的返回值，而影响其返回值的唯一因素就是它的参数。    \
\
这正是单元测试工程师梦寐以求的啊。现在测试程序中的函数时只需要关注它的参数就可以了。完全不需要担心函数调用的顺序，也不用费心设置外部某些状态值。唯一需要做的就是传递一些可以代表边界条件的参数给这些函数。相对于指令式编程，如果FP程序中的每一个函数都能通过单元测试，那么我们对这个软件的质量必将信心百倍。反观Java或者C++，仅仅检查函数的返回值是不够的：代码可能修改外部状态值，因此我们还需要验证这些外部的状态值的正确性。在FP语言中呢，就完全不需要。\
\
#### 调试查错\
\
如果一段FP程序没有按照预期设计那样运行，调试的工作几乎不费吹灰之力。这些错误是百分之一百可以重现的，因为FP程序中的错误不依赖于之前运行过的不相关的代码。而在一个指令式程序中，一个bug可能有时能重现而有些时候又不能。因为这些函数的运行依赖于某些外部状态， 而这些外部状态又需要由某些与这个bug完全不相关的代码通过某个特别的执行流程才能修改。在FP中这种情况完全不存在：如果一个函数的返回值出错了，它一直都会出错，无论你之前运行了什么代码。 \
\
一旦问题可以重现，解决它就变得非常简单，几乎就是一段愉悦的旅程。中断程序的运行，检查一下栈，就可以看到每一个函数调用时使用的每一个参数，这一点和指令式代码一样。不同的是指令式程序中这些数据还不足够，因为函数的运行还可能依赖于成员变量，全局变量，还有其他类的状态（而这些状态又依赖于类似的变量）。FP中的函数只依赖于传给它的参数，而这些参数就在眼前！还有，对指令式程序中函数返回值的检查并不能保证这个函数是正确运行的。还要逐一检查若干作用域以外的对象以确保这个函数没有对这些牵连的对象做出什么越轨的行为（译者：好吧，翻译到这里我自己已经有点激动了）。对于一个FP程序，你要做的仅仅是看一下函数的返回值。  \
\
把栈上的数据过一遍就可以得知有哪些参数传给了什么函数，这些函数又返回了什么值。当一个返回值看起来不对头的那一刻，跳进这个函数看看里面发生了什么。一直重复跟进下去就可以找到bug的源头！\
\
#### 并发执行\
\
不需要任何改动，所有FP程序都是可以并发执行的。由于根本不需要采用锁机制，因此完全不需要担心死锁或是并发竞争的发生。在FP程序中没有哪个线程可以修改任何数据，更不用说多线程之间了。这使得我们可以轻松的添加线程，至于那些祸害并发程序的老问题，想都不用想！\
\
既然是这样，为什么没有人在那些高度并行的那些应用程序中采用FP编程呢？事实上，这样的例子并不少见。爱立信开发了一种FP语言，名叫Erlang，并应用在他们的电信交换机上，而这些交换机不仅容错度高而且拓展性强。许多人看到了Erlang的这些优势也纷纷开始使用这一语言。在这里提到的电信交换控制系统远远要比华尔街上使用的系统具有更好的扩展性也更可靠。事实上，用Erlang搭建的系统并不具备可扩展性和可靠性，而Java可以提供这些特性。Erlang只是像岩石一样结实不容易出错而已。   \
\
FP关于并行的优势不仅于此。就算某个FP程序本身只是单线程的，编译器也可以将其优化成可以在多CPU上运行的并发程序。以下面的程序为例：\
\
```java\
String s1 = somewhatLongOperation1();\
String s2 = somewhatLongOperation2();\
String s3 = concatenate(s1, s2);\
```\
\
如果是函数式程序，编译器就可以对代码进行分析，然后可能分析出生成字符串s1和s2的两个函数可能会比较耗时，进而安排它们并行运行。这在指令式编程中是无法做到的，因为每一个函数都有可能修改其外部状态，然后接下来的函数又可能依赖于这些状态的值。在函数式编程中，自动分析代码并找到适合并行执行的函数十分简单，和分析C的内联函数没什么两样。从这个角度来说用FP风格编写的程序是“永不过时”的（虽然我一般不喜欢说大话空话，不过这次就算个例外吧）。硬件厂商已经没办法让CPU运行得再快了。他们只能靠增加CPU核的数量然后用并行来提高运算的速度。这些厂商故意忽略一个事实：只有可以并行的软件才能让你花大价钱买来的这些硬件物有所值。指令式的软件中只有很小一部分能做到跨核运行，而所有的函数式软件都能实现这一目标，因为FP的程序从一开始就是可以并行运行的。\
\
注：     \
<sup>1</sup>当我在2005年求职时的的确确经常问别人这个问题。看着那些茫然的面孔实在是很好玩的事情。你们这些年薪30万美金的家伙，至少应该对自己可以利用的工具有个起码的理解嘛。     \
<sup>2</sup>这是个有争议的问题。物理学家和数学家不得不承认目前还无法确定宇宙万物是不是都遵从可以用数学方法描述的各种法则。     \
<sup>3</sup>我一直一来都很讨厌在历史课上罗列一堆枯燥无味的时间、人名、事件。对我来说历史就是关于那些改变世界的人们活生生的故事，是他们行为背后的个人动机，是那些他们用以影响芸芸众生的方法和工具。从这个角度来说，接下来的这堂历史课是不完整的，很遗憾。只有那些非常相关的人和事会被提及。        \
\
\
**文章来源**\
\
- https://github.com/justinyhuang/Functional-Programming-For-The-Rest-of-Us-Cn/blob/master/FunctionalProgrammingForTheRestOfUs.cn.md
32	0	RainDon	函数式编程简介（续）	functional-programming-for-the-rest-of-us-2	1	1		0	ImShengli	函数式编程				<div class="md-section-divider"></div>\
\
<p><div class="toc">\
<ul>\
<li><ul>\
<li><ul>\
<li><a href="#高阶函数">高阶函数</a></li>\
<li><a href="#currying">Currying</a></li>\
<li><a href="#惰性求值">惰性求值</a><ul>\
<li><a href="#代码优化">代码优化</a></li>\
<li><a href="#抽象化控制结构">抽象化控制结构</a></li>\
<li><a href="#无穷数据结构">无穷数据结构</a></li>\
<li><a href="#不足之处">不足之处</a></li>\
</ul>\
</li>\
</ul>\
</li>\
</ul>\
</li>\
</ul>\
</div>\
</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="高阶函数">高阶函数</h3>\
\
<p>我还记得在了解到FP以上的各种好处后想到：“这些优势都很吸引人，可是，如果必须非要用这种所有变量都是final的蹩脚语言，估计还是不怎么实用吧”。其实这样的想法是不对的。对于Java这样的指令式语言来说，如果所有的变量都是必须是final的，那么确实很束手束脚。然而对函数式语言来说，情况就不一样了。函数式语言提供了一种特别的抽象工具，这种工具将帮助使用者编写FP代码，让他们甚至都没想到要修改变量的值。高阶函数就是这种工具之一。     </p>\
\
<p>FP语言中的函数有别于Java或是C。可以说这种函数是一个<a href="http://zh.wikipedia.org/wiki/%E5%85%A8%E9%9B%86" target="_blank">全集</a>：Java函数可以做到的它都能做，同时它还有更多的能力。首先，像在C里写程序那样创建一个函数：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-c"><span class="typ">int</span><span class="pln"> add</span><span class="pun">(</span><span class="typ">int</span><span class="pln"> i</span><span class="pun">,</span><span class="pln"> </span><span class="typ">int</span><span class="pln"> j</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L1"><code class="language-c"><span class="pln">    </span><span class="kwd">return</span><span class="pln"> i </span><span class="pun">+</span><span class="pln"> j</span><span class="pun">;</span></code></li><li class="L2"><code class="language-c"><span class="pun">}</span></code></li></ol></pre>\
\
<p>看起来和C程序没什么区别，但是很快你就可以看出区别来。接下来我们扩展Java的编译器以便支持这种代码，也就是说，当我们写下以上的程序编译器会把它转化成下面的Java程序（别忘了，所有的变量都是final的）：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-java"><span class="kwd">class</span><span class="pln"> </span><span class="typ">add_function_t</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L1"><code class="language-java"><span class="pln">    </span><span class="kwd">int</span><span class="pln"> add</span><span class="pun">(</span><span class="kwd">int</span><span class="pln"> i</span><span class="pun">,</span><span class="pln"> </span><span class="kwd">int</span><span class="pln"> j</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L2"><code class="language-java"><span class="pln">        </span><span class="kwd">return</span><span class="pln"> i </span><span class="pun">+</span><span class="pln"> j</span><span class="pun">;</span></code></li><li class="L3"><code class="language-java"><span class="pln">    </span><span class="pun">}</span></code></li><li class="L4"><code class="language-java"><span class="pun">}</span></code></li><li class="L5"><code class="language-java"></code></li><li class="L6"><code class="language-java"><span class="typ">add_function_t</span><span class="pln"> add </span><span class="pun">=</span><span class="pln"> </span><span class="kwd">new</span><span class="pln"> </span><span class="typ">add_function_t</span><span class="pun">();</span></code></li></ol></pre>\
\
<p>在这里，符号add并不是一个函数，它是只有一个函数作为其成员的简单的类。这样做有很多好处，可以在程序中把add当成参数传给其他的函数，也可以把add赋给另外一个符号，还可以在运行时创建add_function_t的实例然后在不再需要这些实例的时候由系统回收机制处理掉。这样做使得函数成为和integer或是string这样的<a href="http://zh.wikipedia.org/zh/%E7%AC%AC%E4%B8%80%E9%A1%9E%E7%89%A9%E4%BB%B6" target="_blank">第一类对象</a>。对其他函数进行操作（比如说把这些函数当成参数）的函数，就是所谓的高阶函数。别让这个看似高深的名字吓倒你（译者：好死不死起个这个名字，初一看还准备搬出已经尘封的高数教材……），它和Java中操作其他类（也就是把一个类实例传给另外的类）的类没有什么区别。可以称这样的类为“高阶类”，但是没人会在意，因为Java圈里就没有什么很强的学术社团。（译者：这是高级黑吗？） </p>\
\
<p>那么什么时候该用高阶函数，又怎样用呢？我很高兴有人问这个问题。设想一下，你写了一大堆程序而不考虑什么类结构设计，然后发现有一部分代码重复了几次，于是你就会把这部分代码独立出来作为一个函数以便多次调用（所幸学校里至少会教这个）。如果你发现这个函数里有一部分逻辑需要在不同的情况下实现不同的行为，那么你可以把这部分逻辑独立出来作为一个高阶函数。搞晕了？下面来看看我工作中的一个真实的例子。</p>\
\
<p>假设有一段Java的客户端程序用来接收消息，用各种方式对消息做转换，然后发给一个服务器。</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-java"><span class="kwd">class</span><span class="pln"> </span><span class="typ">MessageHandler</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L1"><code class="language-java"><span class="pln">    </span><span class="kwd">void</span><span class="pln"> handleMessage</span><span class="pun">(</span><span class="typ">Message</span><span class="pln"> msg</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L2"><code class="language-java"><span class="pln">        </span><span class="com">// ...</span></code></li><li class="L3"><code class="language-java"><span class="pln">        msg</span><span class="pun">.</span><span class="pln">setClientCode</span><span class="pun">(</span><span class="str">"ABCD_123"</span><span class="pun">);</span></code></li><li class="L4"><code class="language-java"><span class="pln">        </span><span class="com">// ...</span></code></li><li class="L5"><code class="language-java"></code></li><li class="L6"><code class="language-java"><span class="pln">        sendMessage</span><span class="pun">(</span><span class="pln">msg</span><span class="pun">);</span></code></li><li class="L7"><code class="language-java"><span class="pln">    </span><span class="pun">}</span></code></li><li class="L8"><code class="language-java"><span class="pln">    </span><span class="com">// ...</span></code></li><li class="L9"><code class="language-java"><span class="pun">}</span></code></li></ol></pre>\
\
<p>再进一步假设，整个系统改变了，现在需要发给两个服务器而不再是一个了。系统其他部分都不变，唯独客户端的代码需要改变：额外的那个服务器需要用另外一种格式发送消息。应该如何处理这种情况呢？我们可以先检查一下消息要发送到哪里，然后选择相应的格式把这个消息发出去：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-java"><span class="kwd">class</span><span class="pln"> </span><span class="typ">MessageHandler</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L1"><code class="language-java"><span class="pln">    </span><span class="kwd">void</span><span class="pln"> handleMessage</span><span class="pun">(</span><span class="typ">Message</span><span class="pln"> msg</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L2"><code class="language-java"><span class="pln">        </span><span class="com">// ...</span></code></li><li class="L3"><code class="language-java"><span class="pln">        </span><span class="kwd">if</span><span class="pun">(</span><span class="pln">msg</span><span class="pun">.</span><span class="pln">getDestination</span><span class="pun">().</span><span class="pln">equals</span><span class="pun">(</span><span class="str">"server1"</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L4"><code class="language-java"><span class="pln">            msg</span><span class="pun">.</span><span class="pln">setClientCode</span><span class="pun">(</span><span class="str">"ABCD_123"</span><span class="pun">);</span></code></li><li class="L5"><code class="language-java"><span class="pln">        </span><span class="pun">}</span><span class="pln"> </span><span class="kwd">else</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L6"><code class="language-java"><span class="pln">            msg</span><span class="pun">.</span><span class="pln">setClientCode</span><span class="pun">(</span><span class="str">"123_ABC"</span><span class="pun">);</span></code></li><li class="L7"><code class="language-java"><span class="pln">        </span><span class="pun">}</span></code></li><li class="L8"><code class="language-java"><span class="pln">        </span><span class="com">// ...</span></code></li><li class="L9"><code class="language-java"></code></li><li class="L0"><code class="language-java"><span class="pln">        sendMessage</span><span class="pun">(</span><span class="pln">msg</span><span class="pun">);</span></code></li><li class="L1"><code class="language-java"><span class="pln">    </span><span class="pun">}</span></code></li><li class="L2"><code class="language-java"><span class="pln">    </span><span class="com">// ...</span></code></li><li class="L3"><code class="language-java"><span class="pun">}</span></code></li></ol></pre>\
\
<p>可是这样的实现是不具备扩展性的。如果将来需要增加更多的服务器，上面函数的大小将呈线性增长，使得维护这个函数最终变成一场噩梦。面向对象的编程方法告诉我们，可以把MessageHandler变成一个基类，然后将针对不同格式的消息编写相应的子类。</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-java"><span class="kwd">abstract</span><span class="pln"> </span><span class="kwd">class</span><span class="pln"> </span><span class="typ">MessageHandler</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L1"><code class="language-java"><span class="pln">    </span><span class="kwd">void</span><span class="pln"> handleMessage</span><span class="pun">(</span><span class="typ">Message</span><span class="pln"> msg</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L2"><code class="language-java"><span class="pln">        </span><span class="com">// ...</span></code></li><li class="L3"><code class="language-java"><span class="pln">        msg</span><span class="pun">.</span><span class="pln">setClientCode</span><span class="pun">(</span><span class="pln">getClientCode</span><span class="pun">());</span></code></li><li class="L4"><code class="language-java"><span class="pln">        </span><span class="com">// ...</span></code></li><li class="L5"><code class="language-java"></code></li><li class="L6"><code class="language-java"><span class="pln">        sendMessage</span><span class="pun">(</span><span class="pln">msg</span><span class="pun">);</span></code></li><li class="L7"><code class="language-java"><span class="pln">    </span><span class="pun">}</span></code></li><li class="L8"><code class="language-java"></code></li><li class="L9"><code class="language-java"><span class="pln">    </span><span class="kwd">abstract</span><span class="pln"> </span><span class="typ">String</span><span class="pln"> getClientCode</span><span class="pun">();</span></code></li><li class="L0"><code class="language-java"></code></li><li class="L1"><code class="language-java"><span class="pln">    </span><span class="com">// ...</span></code></li><li class="L2"><code class="language-java"><span class="pun">}</span></code></li><li class="L3"><code class="language-java"></code></li><li class="L4"><code class="language-java"><span class="kwd">class</span><span class="pln"> </span><span class="typ">MessageHandlerOne</span><span class="pln"> </span><span class="kwd">extends</span><span class="pln"> </span><span class="typ">MessageHandler</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L5"><code class="language-java"><span class="pln">    </span><span class="typ">String</span><span class="pln"> getClientCode</span><span class="pun">()</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L6"><code class="language-java"><span class="pln">        </span><span class="kwd">return</span><span class="pln"> </span><span class="str">"ABCD_123"</span><span class="pun">;</span></code></li><li class="L7"><code class="language-java"><span class="pln">    </span><span class="pun">}</span></code></li><li class="L8"><code class="language-java"><span class="pun">}</span></code></li><li class="L9"><code class="language-java"></code></li><li class="L0"><code class="language-java"><span class="kwd">class</span><span class="pln"> </span><span class="typ">MessageHandlerTwo</span><span class="pln"> </span><span class="kwd">extends</span><span class="pln"> </span><span class="typ">MessageHandler</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L1"><code class="language-java"><span class="pln">    </span><span class="typ">String</span><span class="pln"> getClientCode</span><span class="pun">()</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L2"><code class="language-java"><span class="pln">        </span><span class="kwd">return</span><span class="pln"> </span><span class="str">"123_ABCD"</span><span class="pun">;</span></code></li><li class="L3"><code class="language-java"><span class="pln">    </span><span class="pun">}</span></code></li><li class="L4"><code class="language-java"><span class="pun">}</span></code></li></ol></pre>\
\
<p>这样一来就可以为每一个接收消息的服务器生成一个相应的类对象，添加服务器就变得更加容易维护了。可是，这一个简单的改动引出了很多的代码。仅仅是为了支持不同的客户端行为代码，就要定义两种新的类型！现在来试试用我们刚才改造的语言来做同样的事情，注意，这种语言支持高阶函数：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-java"><span class="kwd">class</span><span class="pln"> </span><span class="typ">MessageHandler</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L1"><code class="language-java"><span class="pln">    </span><span class="kwd">void</span><span class="pln"> handleMessage</span><span class="pun">(</span><span class="typ">Message</span><span class="pln"> msg</span><span class="pun">,</span><span class="pln"> </span><span class="typ">Function</span><span class="pln"> getClientCode</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L2"><code class="language-java"><span class="pln">        </span><span class="com">// ...</span></code></li><li class="L3"><code class="language-java"><span class="pln">        </span><span class="typ">Message</span><span class="pln"> msg1 </span><span class="pun">=</span><span class="pln"> msg</span><span class="pun">.</span><span class="pln">setClientCode</span><span class="pun">(</span><span class="pln">getClientCode</span><span class="pun">());</span></code></li><li class="L4"><code class="language-java"><span class="pln">        </span><span class="com">// ...</span></code></li><li class="L5"><code class="language-java"></code></li><li class="L6"><code class="language-java"><span class="pln">        sendMessage</span><span class="pun">(</span><span class="pln">msg1</span><span class="pun">);</span></code></li><li class="L7"><code class="language-java"><span class="pln">    </span><span class="pun">}</span></code></li><li class="L8"><code class="language-java"></code></li><li class="L9"><code class="language-java"><span class="pln">    </span><span class="com">// ...</span></code></li><li class="L0"><code class="language-java"><span class="pun">}</span></code></li><li class="L1"><code class="language-java"></code></li><li class="L2"><code class="language-java"><span class="typ">String</span><span class="pln"> getClientCodeOne</span><span class="pun">()</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L3"><code class="language-java"><span class="pln">    </span><span class="kwd">return</span><span class="pln"> </span><span class="str">"ABCD_123"</span><span class="pun">;</span></code></li><li class="L4"><code class="language-java"><span class="pun">}</span></code></li><li class="L5"><code class="language-java"></code></li><li class="L6"><code class="language-java"><span class="typ">String</span><span class="pln"> getClientCodeTwo</span><span class="pun">()</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L7"><code class="language-java"><span class="pln">    </span><span class="kwd">return</span><span class="pln"> </span><span class="str">"123_ABCD"</span><span class="pun">;</span></code></li><li class="L8"><code class="language-java"><span class="pun">}</span></code></li><li class="L9"><code class="language-java"></code></li><li class="L0"><code class="language-java"><span class="typ">MessageHandler</span><span class="pln"> handler </span><span class="pun">=</span><span class="pln"> </span><span class="kwd">new</span><span class="pln"> </span><span class="typ">MessageHandler</span><span class="pun">();</span></code></li><li class="L1"><code class="language-java"><span class="pln">handler</span><span class="pun">.</span><span class="pln">handleMessage</span><span class="pun">(</span><span class="pln">someMsg</span><span class="pun">,</span><span class="pln"> getClientCodeOne</span><span class="pun">);</span></code></li></ol></pre>\
\
<p>在上面的程序里，我们没有创建任何新的类型或是多层类的结构。仅仅是把相应的函数作为参数进行传递，就做到了和用面向对象编程一样的事情，而且还有额外的好处：一是不再受限于多层类的结构。这样做可以做运行时传递新的函数，可以在任何时候改变这些函数，而且这些改变不仅更加精准而且触碰的代码更少。这种情况下编译器其实就是在替我们编写面向对象的“粘合”代码（译者：又称胶水代码，粘接代码）！除此之外我们还可以享用FP编程的其他所有优势。函数式编程能提供的抽象服务还远不止于此。高阶函数只不过是个开始。</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="currying">Currying</h3>\
\
<p>我遇见的大多数码农都读过“<a href="http://baike.baidu.com/view/66964.htm#2" target="_blank">四人帮</a>”的那本《设计模式》。任何稍有自尊心的码农都会说这本书和语言无关，因此无论你用什么编程语言，当中提到的那些模式大体上适用于所有软件工程。听起来很厉害，然而事实却不是这样。 <br>\
函数式语言的表达能力很强。用这种语言编程的时候基本不需要设计模式，因为这种语言层次已经足够高，使得使用者可以以概念编程，从而完全不需要设计模式了。以<a href="http://zh.wikipedia.org/wiki/%E9%80%82%E9%85%8D%E5%99%A8%E6%A8%A1%E5%BC%8F" target="_blank">适配器模式</a>为例（有人知道这个模式和<a href="http://zh.wikipedia.org/wiki/%E9%80%82%E9%85%8D%E5%99%A8%E6%A8%A1%E5%BC%8F" target="_blank">外观模式</a>有什么区别吗？怎么觉得有人为了出版合同的要求而硬生生凑页数？）（译者：您不愧是高级黑啊）。对于一个支持currying技术的语言来说，这个模式就是多余的。 <br>\
在Java中最有名的适配器模式就是在其“默认”抽象单元中的应用：类。在函数式语言中这种模式其实就是函数。在这个模式中，一个接口被转换成另外一个接口，让不同的用户代码调用。接下来就有一个适配器模式的例子：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-java"><span class="kwd">int</span><span class="pln"> pow</span><span class="pun">(</span><span class="kwd">int</span><span class="pln"> i</span><span class="pun">,</span><span class="pln"> </span><span class="kwd">int</span><span class="pln"> j</span><span class="pun">);</span></code></li><li class="L1"><code class="language-java"><span class="kwd">int</span><span class="pln"> square</span><span class="pun">(</span><span class="kwd">int</span><span class="pln"> i</span><span class="pun">)</span></code></li><li class="L2"><code class="language-java"><span class="pun">{</span></code></li><li class="L3"><code class="language-java"><span class="pln">    </span><span class="kwd">return</span><span class="pln"> pow</span><span class="pun">(</span><span class="pln">i</span><span class="pun">,</span><span class="pln"> </span><span class="lit">2</span><span class="pun">);</span></code></li><li class="L4"><code class="language-java"><span class="pun">}</span></code></li></ol></pre>\
\
<p>上面的代码中square函数计算一个整数的平方，这个函数的接口被转换成计算一个整数的任意整数次幂。在学术圈里这种简单的技术就被叫做currying（因为逻辑学家<a href="http://zh.wikipedia.org/wiki/%E9%80%82%E9%85%8D%E5%99%A8%E6%A8%A1%E5%BC%8F" target="_blank">哈斯凯尔·加里</a>用其数学技巧将这种技术描述出来，于是就以他的名字来命名了）。在一个FP语言中函数（而不是类）被作为参数进行传递，currying常常用于转化一个函数的接口以便于其他代码调用。函数的接口就是它的参数，于是currying通常用于减少函数参数的数量（见前例）。 <br>\
函数式语言生来就支持这一技术，于是没有必要为某个函数手工创建另外一个函数去包装并转换它的接口，这些函数式语言已经为你做好了。我们继续拓展Java来支持这一功能。    </p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-java"><span class="pln">square </span><span class="pun">=</span><span class="pln"> </span><span class="kwd">int</span><span class="pln"> pow</span><span class="pun">(</span><span class="kwd">int</span><span class="pln"> i</span><span class="pun">,</span><span class="pln"> </span><span class="lit">2</span><span class="pun">);</span></code></li></ol></pre>\
\
<p>上面的语句实现了一个平方计算函数，它只需要一个参数。它会继而调用pow函数并且把第二个参数置为2。编译过后将生成以下Java代码：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-java"><span class="kwd">class</span><span class="pln"> </span><span class="typ">square_function_t</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L1"><code class="language-java"><span class="pln">    </span><span class="kwd">int</span><span class="pln"> square</span><span class="pun">(</span><span class="kwd">int</span><span class="pln"> i</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L2"><code class="language-java"><span class="pln">        </span><span class="kwd">return</span><span class="pln"> pow</span><span class="pun">(</span><span class="pln">i</span><span class="pun">,</span><span class="pln"> </span><span class="lit">2</span><span class="pun">);</span></code></li><li class="L3"><code class="language-java"><span class="pln">    </span><span class="pun">}</span></code></li><li class="L4"><code class="language-java"><span class="pun">}</span></code></li><li class="L5"><code class="language-java"><span class="typ">square_function_t</span><span class="pln"> square </span><span class="pun">=</span><span class="pln"> </span><span class="kwd">new</span><span class="pln"> </span><span class="typ">square_function_t</span><span class="pun">();</span></code></li></ol></pre>\
\
<p>从上面的例子可以看到，很简单的，函数pow的封装函数就创建出来了。在FP语言中currying就这么简单：一种可以快速且简单的实现函数封装的捷径。我们可以更专注于自己的设计，编译器则会为你编写正确的代码！什么时候使用currying呢？很简单，当你想要用适配器模式（或是封装函数）的时候，就是用currying的时候。</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="惰性求值"><a href="http://zh.wikipedia.org/zh/%E6%83%B0%E6%80%A7%E6%B1%82%E5%80%BC" target="_blank">惰性求值</a></h3>\
\
<p>惰性求值（或是延迟求值）是一种有趣的技术，而当我们投入函数式编程的怀抱后这种技术就有了得以实现的可能。前面介绍并发执行的时候已经提到过如下代码：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-java"><span class="typ">String</span><span class="pln"> s1 </span><span class="pun">=</span><span class="pln"> somewhatLongOperation1</span><span class="pun">();</span></code></li><li class="L1"><code class="language-java"><span class="typ">String</span><span class="pln"> s2 </span><span class="pun">=</span><span class="pln"> somewhatLongOperation2</span><span class="pun">();</span></code></li><li class="L2"><code class="language-java"><span class="typ">String</span><span class="pln"> s3 </span><span class="pun">=</span><span class="pln"> concatenate</span><span class="pun">(</span><span class="pln">s1</span><span class="pun">,</span><span class="pln"> s2</span><span class="pun">);</span></code></li></ol></pre>\
\
<p>在指令式语言中以上代码执行的顺序是显而易见的。由于每个函数都有可能改动或者依赖于其外部的状态，因此必须顺序执行。先是计算somewhatLongOperation1，然后到somewhatLongOperation2，最后执行concatenate。函数式语言就不一样了。    </p>\
\
<p>在前面讨论过，somewhatLongOperation1和somewhatLongOperation2是可以并发执行的，因为函数式语言保证了一点：没有函数会影响或者依赖于全局状态。可是万一我们不想要这两个函数并发执行呢？这种情况下是不是也还是要顺序执行这些函数？答案是否定的。只有到了执行需要s1、s2作为参数的函数的时候，才真正需要执行这两个函数。于是在concatenate这个函数没有执行之前，都没有需要去执行这两个函数：这些函数的执行可以一直推迟到concatenate()中需要用到s1和s2的时候。假如把concatenate换成另外一个函数，这个函数中有条件判断语句而且实际上只会需要两个参数中的其中一个，那么就完全没有必要执行计算另外一个参数的函数了！Haskell语言就是一个支持惰性求值的例子。Haskell不能保证任何语句会顺序执行（甚至完全不会执行到），因为Haskell的代码只有在需要的时候才会被执行到。   </p>\
\
<p>除了这些优点，惰性求值也有缺点。这里介绍了它的优点，我们将在下一章节介绍这些缺点以及如何克服它们。     </p>\
\
<div class="md-section-divider"></div>\
\
<h4 id="代码优化">代码优化</h4>\
\
<p>惰性求值使得代码具备了巨大的优化潜能。支持惰性求值的编译器会像数学家看待代数表达式那样看待函数式程序：抵消相同项从而避免执行无谓的代码，安排代码执行顺序从而实现更高的执行效率甚至是减少错误。在此基础上优化是不会破坏代码正常运行的。严格使用形式系统的基本元素进行编程带来的最大的好处，是可以用数学方法分析处理代码，因为这样的程序是完全符合数学法则的。</p>\
\
<div class="md-section-divider"></div>\
\
<h4 id="抽象化控制结构">抽象化控制结构</h4>\
\
<p>惰性求值技术提供了更高阶的抽象能力，这提供了实现程序设计独特的方法。比如说下面的控制结构：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-java"><span class="pln">unless</span><span class="pun">(</span><span class="pln">stock</span><span class="pun">.</span><span class="pln">isEuropean</span><span class="pun">())</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L1"><code class="language-java"><span class="pln">    sendToSEC</span><span class="pun">(</span><span class="pln">stock</span><span class="pun">);</span></code></li><li class="L2"><code class="language-java"><span class="pun">}</span></code></li></ol></pre>\
\
<p>程序中只有在stock为European的时候才执行sendToSEC。如何实现例子中的unless？如果没有惰性求值就需要求助于某种形式的宏（译者：用if不行么？），不过在像Haskell这样的语言中就不需要那么麻烦了。直接实现一个unless函数就可以！</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-haskell"><span class="kwd">void</span><span class="pln"> </span><span class="kwd">unless</span><span class="pun">(</span><span class="kwd">boolean</span><span class="pln"> condition</span><span class="pun">,</span><span class="pln"> </span><span class="typ">List</span><span class="pln"> code</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L1"><code class="language-haskell"><span class="pln">    </span><span class="kwd">if</span><span class="pun">(!</span><span class="pln">condition</span><span class="pun">)</span></code></li><li class="L2"><code class="language-haskell"><span class="pln">        code</span><span class="pun">;</span></code></li><li class="L3"><code class="language-haskell"><span class="pun">}</span></code></li></ol></pre>\
\
<p>请注意，如果condition值为真，那就不会计算code。在其他严格语言（见<a href="http://zh.wikipedia.org/wiki/%E6%B1%82%E5%80%BC%E7%AD%96%E7%95%A5#.E4.B8.A5.E6.A0.BC.E6.B1.82.E5.80.BC_.28Strict_evaluation.29" target="_blank">严格求值</a>）中这种行为是做不到的，因为在进入unless这个函数之前，作为参数的code已经被计算过了。</p>\
\
<div class="md-section-divider"></div>\
\
<h4 id="无穷数据结构">无穷数据结构</h4>\
\
<p>惰性求值技术允许定义无穷数据结构，这要在严格语言中实现将非常复杂。例如一个储存Fibonacci数列数字的列表。很明显这样一个列表是无法在有限的时间内计算出这个无穷的数列并存储在内存中的。在像Java这样的严格语言中，可以定义一个Fibonacci函数，返回这个序列中的某个数。而在Haskell或是类似的语言中，可以把这个函数进一步抽象化并定义一个Fibonacci数列的无穷列表结构。由于语言本身支持惰性求值，这个列表中只有真正会被用到的数才会被计算出来。这让我们可以把很多问题抽象化，然后在更高的层面上解决它们（比如可以在一个列表处理函数中处理无穷多数据的列表）。</p>\
\
<div class="md-section-divider"></div>\
\
<h4 id="不足之处">不足之处</h4>\
\
<p>俗话说天下没有免费的午餐™。惰性求值当然也有其缺点。其中最大的一个就是，嗯，惰性。现实世界中很多问题还是需要严格求值的。比如说下面的例子：   </p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-java"><span class="typ">System</span><span class="pun">.</span><span class="pln">out</span><span class="pun">.</span><span class="pln">println</span><span class="pun">(</span><span class="str">"Please enter your name: "</span><span class="pun">);</span></code></li><li class="L1"><code class="language-java"><span class="typ">System</span><span class="pun">.</span><span class="pln">in</span><span class="pun">.</span><span class="pln">readLine</span><span class="pun">();</span></code></li></ol></pre>\
\
<p>在惰性语言中没人能保证第一行会中第二行之前执行！这也就意味着我们不能处理IO，不能调用系统函数做任何有用的事情（这些函数需要按照顺序执行，因为它们依赖于外部状态），也就是说不能和外界交互了！如果在代码中引入支持顺序执行的代码原语，那么我们就失去了用数学方式分析处理代码的优势（而这也意味着失去了函数式编程的所有优势）。幸运的是我们还不算一无所有。数学家们研究了不同的方法用以保证代码按一定的顺序执行（in a functional setting?）。这一来我们就可以同时利用到函数式和指令式编程的优点了！这些方法有continuations，monads以及uniqueness typing。这篇文章仅仅介绍了continuations，以后再讨论monads和uniqueness typing。有意思的是呢，coutinuations处理强制代码以特定顺序执行之外还有其他很多出处，这些我们在后面也会提及。</p>	本文是函数式编程简介续篇，从“高阶函数”、“Currying”、“惰性求值”、“ Continuation”、“ 模式匹配”、“Closure”等几个方面来阐述。	6	0	2016-07-07 22:31:56	2016-07-07 22:27:40	[TOC]\
\
###高阶函数\
\
我还记得在了解到FP以上的各种好处后想到：“这些优势都很吸引人，可是，如果必须非要用这种所有变量都是final的蹩脚语言，估计还是不怎么实用吧”。其实这样的想法是不对的。对于Java这样的指令式语言来说，如果所有的变量都是必须是final的，那么确实很束手束脚。然而对函数式语言来说，情况就不一样了。函数式语言提供了一种特别的抽象工具，这种工具将帮助使用者编写FP代码，让他们甚至都没想到要修改变量的值。高阶函数就是这种工具之一。     \
\
FP语言中的函数有别于Java或是C。可以说这种函数是一个[全集](http://zh.wikipedia.org/wiki/%E5%85%A8%E9%9B%86)：Java函数可以做到的它都能做，同时它还有更多的能力。首先，像在C里写程序那样创建一个函数：\
\
```c\
int add(int i, int j) {\
    return i + j;\
}\
```\
\
看起来和C程序没什么区别，但是很快你就可以看出区别来。接下来我们扩展Java的编译器以便支持这种代码，也就是说，当我们写下以上的程序编译器会把它转化成下面的Java程序（别忘了，所有的变量都是final的）：\
\
```java\
class add_function_t {\
    int add(int i, int j) {\
        return i + j;\
    }\
}\
\
add_function_t add = new add_function_t();\
```\
\
在这里，符号add并不是一个函数，它是只有一个函数作为其成员的简单的类。这样做有很多好处，可以在程序中把add当成参数传给其他的函数，也可以把add赋给另外一个符号，还可以在运行时创建add_function_t的实例然后在不再需要这些实例的时候由系统回收机制处理掉。这样做使得函数成为和integer或是string这样的[第一类对象](http://zh.wikipedia.org/zh/%E7%AC%AC%E4%B8%80%E9%A1%9E%E7%89%A9%E4%BB%B6)。对其他函数进行操作（比如说把这些函数当成参数）的函数，就是所谓的高阶函数。别让这个看似高深的名字吓倒你（译者：好死不死起个这个名字，初一看还准备搬出已经尘封的高数教材……），它和Java中操作其他类（也就是把一个类实例传给另外的类）的类没有什么区别。可以称这样的类为“高阶类”，但是没人会在意，因为Java圈里就没有什么很强的学术社团。（译者：这是高级黑吗？） \
\
那么什么时候该用高阶函数，又怎样用呢？我很高兴有人问这个问题。设想一下，你写了一大堆程序而不考虑什么类结构设计，然后发现有一部分代码重复了几次，于是你就会把这部分代码独立出来作为一个函数以便多次调用（所幸学校里至少会教这个）。如果你发现这个函数里有一部分逻辑需要在不同的情况下实现不同的行为，那么你可以把这部分逻辑独立出来作为一个高阶函数。搞晕了？下面来看看我工作中的一个真实的例子。\
\
假设有一段Java的客户端程序用来接收消息，用各种方式对消息做转换，然后发给一个服务器。\
\
```java\
class MessageHandler {\
    void handleMessage(Message msg) {\
        // ...\
        msg.setClientCode("ABCD_123");\
        // ...\
    \
        sendMessage(msg);\
    }\
    // ...\
}\
```\
\
再进一步假设，整个系统改变了，现在需要发给两个服务器而不再是一个了。系统其他部分都不变，唯独客户端的代码需要改变：额外的那个服务器需要用另外一种格式发送消息。应该如何处理这种情况呢？我们可以先检查一下消息要发送到哪里，然后选择相应的格式把这个消息发出去：\
```java\
class MessageHandler {\
    void handleMessage(Message msg) {\
        // ...\
        if(msg.getDestination().equals("server1") {\
            msg.setClientCode("ABCD_123");\
        } else {\
            msg.setClientCode("123_ABC");\
        }\
        // ...\
        \
        sendMessage(msg);\
    }\
    // ...\
}\
```\
\
可是这样的实现是不具备扩展性的。如果将来需要增加更多的服务器，上面函数的大小将呈线性增长，使得维护这个函数最终变成一场噩梦。面向对象的编程方法告诉我们，可以把MessageHandler变成一个基类，然后将针对不同格式的消息编写相应的子类。\
\
```java\
abstract class MessageHandler {\
    void handleMessage(Message msg) {\
        // ...\
        msg.setClientCode(getClientCode());\
        // ...\
        \
        sendMessage(msg);\
    }\
    \
    abstract String getClientCode();\
    \
    // ...\
}\
\
class MessageHandlerOne extends MessageHandler {\
    String getClientCode() {\
        return "ABCD_123";\
    }\
}\
\
class MessageHandlerTwo extends MessageHandler {\
    String getClientCode() {\
        return "123_ABCD";\
    }\
}\
```\
这样一来就可以为每一个接收消息的服务器生成一个相应的类对象，添加服务器就变得更加容易维护了。可是，这一个简单的改动引出了很多的代码。仅仅是为了支持不同的客户端行为代码，就要定义两种新的类型！现在来试试用我们刚才改造的语言来做同样的事情，注意，这种语言支持高阶函数：\
\
```java\
class MessageHandler {\
    void handleMessage(Message msg, Function getClientCode) {\
        // ...\
        Message msg1 = msg.setClientCode(getClientCode());\
        // ...\
        \
        sendMessage(msg1);\
    }\
    \
    // ...\
}\
\
String getClientCodeOne() {\
    return "ABCD_123";\
}\
\
String getClientCodeTwo() {\
    return "123_ABCD";\
}\
\
MessageHandler handler = new MessageHandler();\
handler.handleMessage(someMsg, getClientCodeOne);\
```\
\
在上面的程序里，我们没有创建任何新的类型或是多层类的结构。仅仅是把相应的函数作为参数进行传递，就做到了和用面向对象编程一样的事情，而且还有额外的好处：一是不再受限于多层类的结构。这样做可以做运行时传递新的函数，可以在任何时候改变这些函数，而且这些改变不仅更加精准而且触碰的代码更少。这种情况下编译器其实就是在替我们编写面向对象的“粘合”代码（译者：又称胶水代码，粘接代码）！除此之外我们还可以享用FP编程的其他所有优势。函数式编程能提供的抽象服务还远不止于此。高阶函数只不过是个开始。\
\
### Currying\
\
我遇见的大多数码农都读过“[四人帮](http://baike.baidu.com/view/66964.htm#2)”的那本《设计模式》。任何稍有自尊心的码农都会说这本书和语言无关，因此无论你用什么编程语言，当中提到的那些模式大体上适用于所有软件工程。听起来很厉害，然而事实却不是这样。    \
函数式语言的表达能力很强。用这种语言编程的时候基本不需要设计模式，因为这种语言层次已经足够高，使得使用者可以以概念编程，从而完全不需要设计模式了。以[适配器模式](http://zh.wikipedia.org/wiki/%E9%80%82%E9%85%8D%E5%99%A8%E6%A8%A1%E5%BC%8F)为例（有人知道这个模式和[外观模式](http://zh.wikipedia.org/wiki/%E9%80%82%E9%85%8D%E5%99%A8%E6%A8%A1%E5%BC%8F)有什么区别吗？怎么觉得有人为了出版合同的要求而硬生生凑页数？）（译者：您不愧是高级黑啊）。对于一个支持currying技术的语言来说，这个模式就是多余的。     \
在Java中最有名的适配器模式就是在其“默认”抽象单元中的应用：类。在函数式语言中这种模式其实就是函数。在这个模式中，一个接口被转换成另外一个接口，让不同的用户代码调用。接下来就有一个适配器模式的例子：\
\
```java\
int pow(int i, int j);\
int square(int i)\
{\
    return pow(i, 2);\
}\
```\
上面的代码中square函数计算一个整数的平方，这个函数的接口被转换成计算一个整数的任意整数次幂。在学术圈里这种简单的技术就被叫做currying（因为逻辑学家[哈斯凯尔·加里](http://zh.wikipedia.org/wiki/%E9%80%82%E9%85%8D%E5%99%A8%E6%A8%A1%E5%BC%8F)用其数学技巧将这种技术描述出来，于是就以他的名字来命名了）。在一个FP语言中函数（而不是类）被作为参数进行传递，currying常常用于转化一个函数的接口以便于其他代码调用。函数的接口就是它的参数，于是currying通常用于减少函数参数的数量（见前例）。     \
函数式语言生来就支持这一技术，于是没有必要为某个函数手工创建另外一个函数去包装并转换它的接口，这些函数式语言已经为你做好了。我们继续拓展Java来支持这一功能。    \
\
```java\
square = int pow(int i, 2);\
```\
\
上面的语句实现了一个平方计算函数，它只需要一个参数。它会继而调用pow函数并且把第二个参数置为2。编译过后将生成以下Java代码：\
\
```java\
class square_function_t {\
    int square(int i) {\
        return pow(i, 2);\
    }\
}\
square_function_t square = new square_function_t();\
```\
\
从上面的例子可以看到，很简单的，函数pow的封装函数就创建出来了。在FP语言中currying就这么简单：一种可以快速且简单的实现函数封装的捷径。我们可以更专注于自己的设计，编译器则会为你编写正确的代码！什么时候使用currying呢？很简单，当你想要用适配器模式（或是封装函数）的时候，就是用currying的时候。\
\
###[惰性求值](http://zh.wikipedia.org/zh/%E6%83%B0%E6%80%A7%E6%B1%82%E5%80%BC)\
\
惰性求值（或是延迟求值）是一种有趣的技术，而当我们投入函数式编程的怀抱后这种技术就有了得以实现的可能。前面介绍并发执行的时候已经提到过如下代码：\
\
```java\
String s1 = somewhatLongOperation1();\
String s2 = somewhatLongOperation2();\
String s3 = concatenate(s1, s2);\
```\
\
在指令式语言中以上代码执行的顺序是显而易见的。由于每个函数都有可能改动或者依赖于其外部的状态，因此必须顺序执行。先是计算somewhatLongOperation1，然后到somewhatLongOperation2，最后执行concatenate。函数式语言就不一样了。    \
\
在前面讨论过，somewhatLongOperation1和somewhatLongOperation2是可以并发执行的，因为函数式语言保证了一点：没有函数会影响或者依赖于全局状态。可是万一我们不想要这两个函数并发执行呢？这种情况下是不是也还是要顺序执行这些函数？答案是否定的。只有到了执行需要s1、s2作为参数的函数的时候，才真正需要执行这两个函数。于是在concatenate这个函数没有执行之前，都没有需要去执行这两个函数：这些函数的执行可以一直推迟到concatenate()中需要用到s1和s2的时候。假如把concatenate换成另外一个函数，这个函数中有条件判断语句而且实际上只会需要两个参数中的其中一个，那么就完全没有必要执行计算另外一个参数的函数了！Haskell语言就是一个支持惰性求值的例子。Haskell不能保证任何语句会顺序执行（甚至完全不会执行到），因为Haskell的代码只有在需要的时候才会被执行到。   \
\
除了这些优点，惰性求值也有缺点。这里介绍了它的优点，我们将在下一章节介绍这些缺点以及如何克服它们。     \
\
####代码优化\
\
惰性求值使得代码具备了巨大的优化潜能。支持惰性求值的编译器会像数学家看待代数表达式那样看待函数式程序：抵消相同项从而避免执行无谓的代码，安排代码执行顺序从而实现更高的执行效率甚至是减少错误。在此基础上优化是不会破坏代码正常运行的。严格使用形式系统的基本元素进行编程带来的最大的好处，是可以用数学方法分析处理代码，因为这样的程序是完全符合数学法则的。\
\
####抽象化控制结构\
\
惰性求值技术提供了更高阶的抽象能力，这提供了实现程序设计独特的方法。比如说下面的控制结构：\
\
```java\
unless(stock.isEuropean()) {\
    sendToSEC(stock);\
}\
```\
\
程序中只有在stock为European的时候才执行sendToSEC。如何实现例子中的unless？如果没有惰性求值就需要求助于某种形式的宏（译者：用if不行么？），不过在像Haskell这样的语言中就不需要那么麻烦了。直接实现一个unless函数就可以！\
\
```haskell\
void unless(boolean condition, List code) {\
    if(!condition)\
        code;\
}\
```\
\
请注意，如果condition值为真，那就不会计算code。在其他严格语言（见[严格求值](http://zh.wikipedia.org/wiki/%E6%B1%82%E5%80%BC%E7%AD%96%E7%95%A5#.E4.B8.A5.E6.A0.BC.E6.B1.82.E5.80.BC_.28Strict_evaluation.29)）中这种行为是做不到的，因为在进入unless这个函数之前，作为参数的code已经被计算过了。\
\
####无穷数据结构\
\
惰性求值技术允许定义无穷数据结构，这要在严格语言中实现将非常复杂。例如一个储存Fibonacci数列数字的列表。很明显这样一个列表是无法在有限的时间内计算出这个无穷的数列并存储在内存中的。在像Java这样的严格语言中，可以定义一个Fibonacci函数，返回这个序列中的某个数。而在Haskell或是类似的语言中，可以把这个函数进一步抽象化并定义一个Fibonacci数列的无穷列表结构。由于语言本身支持惰性求值，这个列表中只有真正会被用到的数才会被计算出来。这让我们可以把很多问题抽象化，然后在更高的层面上解决它们（比如可以在一个列表处理函数中处理无穷多数据的列表）。\
\
####不足之处\
\
俗话说天下没有免费的午餐™。惰性求值当然也有其缺点。其中最大的一个就是，嗯，惰性。现实世界中很多问题还是需要严格求值的。比如说下面的例子：   \
```java\
System.out.println("Please enter your name: ");\
System.in.readLine();\
```\
\
在惰性语言中没人能保证第一行会中第二行之前执行！这也就意味着我们不能处理IO，不能调用系统函数做任何有用的事情（这些函数需要按照顺序执行，因为它们依赖于外部状态），也就是说不能和外界交互了！如果在代码中引入支持顺序执行的代码原语，那么我们就失去了用数学方式分析处理代码的优势（而这也意味着失去了函数式编程的所有优势）。幸运的是我们还不算一无所有。数学家们研究了不同的方法用以保证代码按一定的顺序执行（in a functional setting?）。这一来我们就可以同时利用到函数式和指令式编程的优点了！这些方法有continuations，monads以及uniqueness typing。这篇文章仅仅介绍了continuations，以后再讨论monads和uniqueness typing。有意思的是呢，coutinuations处理强制代码以特定顺序执行之外还有其他很多出处，这些我们在后面也会提及。\
\

33	0	RainDon	抽象：程序员必备的能力	abstract-ability	1	1		0	ImShengli	能力				<div class="md-section-divider"></div>\
\
<p><div class="toc">\
<ul>\
</ul>\
</div>\
</p>\
\
<p>2015年大热的动画片《动脑特工队》中描述了这么一个场景，冰棒带领乐乐和忧忧抄近路去乘坐思维列车，所谓的“近路”就是穿过抽象思维的房间，在这个房间里，他们先是变成了变成3D的块，就像计算机图形学里展示的那样，然后变成平面的图形，最后只剩下一些线条了！</p>\
\
<p><img src="https://dn-woerwosi.qbox.me/blog/images/2016/6/0/abstract.png" alt="Abstract" title=""></p>\
\
<p>真是非常生动的展示了人类做抽象活动的过程。 <br>\
　　 <br>\
在软件业，抽象能力的重要性怎么说都不为过，因为软件开发是一个高度复杂的智力活动，程序员经常需要面对、处理异常复杂的业务和逻辑，如果你不具备强大的抽象能力，无法把具体变成概念，进而驾驭概念进行思考，你就很难降低问题的复杂度，从而陷入泥潭，无法自拔。无论你学会了多么强大的程序语言，你的编程能力也很难有质的提高。 <br>\
　　 <br>\
当然抽象不仅仅是软件开发的独有概念，在别的领域可以看到更多。在自然科学领域，抽象的例子更多，开普勒定律和万有引力就是很典型的例子。 <br>\
　　 <br>\
在16世纪很多人开始相信哥白尼提出的日心说，但一直搞不清楚围绕太阳的行星到底是怎么运动的，轨道是什么样子，著名天文学家开普勒仔细的研究了他的老师——杰出的观测家——第谷留下的大量天文观测数据以后，提炼出了著名的开普勒三定律， 第一次给出了天体运行规律的解释：</p>\
\
<p>　　1. 所有行星分别是在大小不同的椭圆轨道上运行 <br>\
　　2. 在同样的时间里行星向径在轨道平面上所扫过的面积相等 <br>\
　　3. 行星公转周期的平方与它同太阳距离的立方成正比</p>\
\
<p>开普勒三定律从大量的数据中提炼出数学规律，无疑是非常伟大的发现和抽象，但这不是最终本质，当然也不是最终的抽象。 <br>\
　　 <br>\
行星运动的本质是<code>万有引力定律</code>。 <br>\
　　 <br>\
相比于开普勒定律，天才的牛顿所做的抽象向前迈进了一大步，万有引力几乎覆盖了所有大质量物体之间互相吸引和运动的规律，即简单又优美，配合牛顿（和莱布尼茨）发明的微积分，可以很容易推导开普勒定律。</p>\
\
<div class="md-section-divider"></div>\
\
<p><span class="MathJax_Preview"></span><div class="MathJax_Display" role="textbox" aria-readonly="true" style="text-align: center;"><span class="MathJax" id="MathJax-Element-337-Frame"><nobr><span class="math" id="MathJax-Span-3076" style="width: 6.104em; display: inline-block;"><span style="display: inline-block; position: relative; width: 4.814em; height: 0px; font-size: 126%;"><span style="position: absolute; clip: rect(1.094em 1000em 3.574em -0.444em); top: -2.577em; left: 0.002em;"><span class="mrow" id="MathJax-Span-3077"><span class="mi" id="MathJax-Span-3078" style="font-family: STIXGeneral-Italic;">F<span style="display: inline-block; overflow: hidden; height: 1px; width: 0.052em;"></span></span><span class="mo" id="MathJax-Span-3079" style="font-family: STIXGeneral-Regular; padding-left: 0.3em;">=</span><span class="mi" id="MathJax-Span-3080" style="font-family: STIXGeneral-Italic; padding-left: 0.3em;">G</span><span class="mfrac" id="MathJax-Span-3081" style="padding-left: 0.201em;"><span style="display: inline-block; position: relative; width: 1.739em; height: 0px; margin-right: 0.102em; margin-left: 0.102em;"><span style="position: absolute; clip: rect(1.788em 1000em 2.731em -0.444em); top: -3.271em; left: 50%; margin-left: -0.791em;"><span class="mrow" id="MathJax-Span-3082"><span class="mi" id="MathJax-Span-3083" style="font-family: STIXGeneral-Italic;">M<span style="display: inline-block; overflow: hidden; height: 1px; width: 0.052em;"></span></span><span class="mi" id="MathJax-Span-3084" style="font-family: STIXGeneral-Italic;">m</span></span><span style="display: inline-block; width: 0px; height: 2.582em;"></span></span><span style="position: absolute; clip: rect(3.028em 1000em 4.169em -0.444em); top: -3.172em; left: 50%; margin-left: -0.543em;"><span class="msubsup" id="MathJax-Span-3085"><span style="display: inline-block; position: relative; width: 1.143em; height: 0px;"><span style="position: absolute; clip: rect(1.788em 1000em 2.731em -0.444em); top: -2.577em; left: 0.002em;"><span class="mi" id="MathJax-Span-3086" style="font-family: STIXGeneral-Italic;">R</span><span style="display: inline-block; width: 0px; height: 2.582em;"></span></span><span style="position: absolute; top: -2.875em; left: 0.647em;"><span class="mn" id="MathJax-Span-3087" style="font-size: 70.7%; font-family: STIXGeneral-Regular;">2</span><span style="display: inline-block; width: 0px; height: 2.483em;"></span></span></span></span><span style="display: inline-block; width: 0px; height: 4.02em;"></span></span><span style="position: absolute; clip: rect(0.846em 1000em 1.193em -0.444em); top: -1.238em; left: 0.002em;"><span style="border-left-width: 1.739em; border-left-style: solid; display: inline-block; overflow: hidden; width: 0px; height: 1.25px; vertical-align: 0.002em;"></span><span style="display: inline-block; width: 0px; height: 1.044em;"></span></span></span></span></span><span style="display: inline-block; width: 0px; height: 2.582em;"></span></span></span><span style="border-left-width: 0.003em; border-left-style: solid; display: inline-block; overflow: hidden; width: 0px; height: 2.816em; vertical-align: -1.122em;"></span></span></nobr></span></div><script type="math/tex; mode=display" id="MathJax-Element-337"> F = Gfrac{Mm}{R^2} </script></p>\
\
<p>如果再加上牛顿力学三定律，尤其是<span class="MathJax_Preview"></span><span class="MathJax" id="MathJax-Element-338-Frame" role="textbox" aria-readonly="true"><nobr><span class="math" id="MathJax-Span-3088" style="width: 4.02em; display: inline-block;"><span style="display: inline-block; position: relative; width: 3.177em; height: 0px; font-size: 126%;"><span style="position: absolute; clip: rect(1.788em 1000em 2.731em -0.444em); top: -2.577em; left: 0.002em;"><span class="mrow" id="MathJax-Span-3089"><span class="mi" id="MathJax-Span-3090" style="font-family: STIXGeneral-Italic;">F<span style="display: inline-block; overflow: hidden; height: 1px; width: 0.052em;"></span></span><span class="mo" id="MathJax-Span-3091" style="font-family: STIXGeneral-Regular; padding-left: 0.3em;">=</span><span class="mi" id="MathJax-Span-3092" style="font-family: STIXGeneral-Italic; padding-left: 0.3em;">m</span><span class="mi" id="MathJax-Span-3093" style="font-family: STIXGeneral-Italic;">a</span></span><span style="display: inline-block; width: 0px; height: 2.582em;"></span></span></span><span style="border-left-width: 0.003em; border-left-style: solid; display: inline-block; overflow: hidden; width: 0px; height: 0.941em; vertical-align: -0.059em;"></span></span></nobr></span><script type="math/tex" id="MathJax-Element-338">F=ma</script>，整个经典物理学的架子就建起来了，后人所有的工作只是在这座大厦上进行一些装修工作，直到爱因斯坦相对论的出现，才建立一座更宏伟的大厦。 <br>\
　　 <br>\
据说爱因斯坦在评价一个研究时，会用美和丑来作为判断标准，有人拿研究成果让爱因斯坦看， 爱因斯坦不说成果的好与坏，反而说“这东西多丑陋啊”，“这东西真漂亮”。 <br>\
　　 <br>\
其实一个抽象的东西形式优美，结构简单，很有可能是正确的，很可能抓住了事物的本质。相反如果连形式都丑陋不堪，十有八九不是好的成果。以此作为标准，万有引力定律无疑是漂亮的，正确的，当然爱因斯坦的<span class="MathJax_Preview"></span><span class="MathJax" id="MathJax-Element-339-Frame" role="textbox" aria-readonly="true"><nobr><span class="math" id="MathJax-Span-3094" style="width: 4.516em; display: inline-block;"><span style="display: inline-block; position: relative; width: 3.574em; height: 0px; font-size: 126%;"><span style="position: absolute; clip: rect(1.59em 1000em 2.731em -0.444em); top: -2.577em; left: 0.002em;"><span class="mrow" id="MathJax-Span-3095"><span class="mi" id="MathJax-Span-3096" style="font-family: STIXGeneral-Italic;">E<span style="display: inline-block; overflow: hidden; height: 1px; width: 0.002em;"></span></span><span class="mo" id="MathJax-Span-3097" style="font-family: STIXGeneral-Regular; padding-left: 0.3em;">=</span><span class="mi" id="MathJax-Span-3098" style="font-family: STIXGeneral-Italic; padding-left: 0.3em;">m</span><span class="msubsup" id="MathJax-Span-3099"><span style="display: inline-block; position: relative; width: 0.945em; height: 0px;"><span style="position: absolute; clip: rect(1.987em 1000em 2.731em -0.394em); top: -2.577em; left: 0.002em;"><span class="mi" id="MathJax-Span-3100" style="font-family: STIXGeneral-Italic;">c</span><span style="display: inline-block; width: 0px; height: 2.582em;"></span></span><span style="position: absolute; top: -2.825em; left: 0.449em;"><span class="mn" id="MathJax-Span-3101" style="font-size: 70.7%; font-family: STIXGeneral-Regular;">2</span><span style="display: inline-block; width: 0px; height: 2.483em;"></span></span></span></span></span><span style="display: inline-block; width: 0px; height: 2.582em;"></span></span></span><span style="border-left-width: 0.003em; border-left-style: solid; display: inline-block; overflow: hidden; width: 0px; height: 1.191em; vertical-align: -0.059em;"></span></span></nobr></span><script type="math/tex" id="MathJax-Element-339">E=mc^2</script>更加漂亮和简单。</p>\
\
<p>抽象的例子在软件业更是数不胜数： <br>\
　　 <br>\
文件是对I/O的抽象；虚拟存储器是对物理存储器的抽象；进程是对一个正在运行的程序的抽象；我们再增加一个新的抽象：虚拟机，他提供了对整个计算机（包括操作系统，处理器，程序）的抽象。 <br>\
　　 <br>\
Andorid把一个移动应用程序抽象成Activity , Intent, Service, Provider......稍微注意一下就会发现：抽象层次越高，接口的语意就越模糊，适用的范围就越广，到最后就会变成数学模型或者概念。 <br>\
　　 <br>\
<strong>数学模型和算法</strong></p>\
\
<p>我认为把纷杂的事物抽象到数学层面是最高的抽象，也许会有人会说哲学层面才是，但到数学层面已经非常难了。尤其是重大的科学发现，身后必然有数学的影子。</p>\
\
<p>牛顿当年为了描述天体的轨道和运动，特别创立了新的数学表示：<code>微积分</code>。麦克斯韦使用一组方程对电场和磁场行为进行描述。当年爱因斯坦脑海中已经有了广义相对论，但苦于找不到合适的数学形式来描述，他特别花了几年的时间来学习非欧几何和张量分析，最后才得以成功。海森堡用矩阵理论来解释量子力学。程序员在开发过程中，也许能把一个实际的业务问题抽象成数学模型，或者抽象成特定的算法，这样会让程序实现变得非常简单和有趣。 <br>\
　　 <br>\
例如把针对税务领域的一个Credit, Debit等概念抽象为在一个二维坐标下点的运动，问题一下子简化了很多，实现简单，并且非常安全可靠。 <br>\
　　 <br>\
<strong>正交的概念</strong></p>\
\
<p>但是抽象成数学模型和算法通常是可遇而不可求的，这种情况下，我们需要退而求其次，试图抽象成若干个正交的概念，来降低复杂度。“正交”在数学上指的是线性无关，最常见的例子就是坐标系下的x轴和y轴，对于一个点来讲，它的x值的变化不会影响到y，y值得变化不会影响到x ，即x和y是正交的。</p>\
\
<p>正交的威力在于互不影响，扩展方便，单用一个坐标轴可以表示一个直线上的所有的点， 再加一个y轴就能表示平面上的所有的点， 再加一个z轴，3维空间中的所有点都能表示出来了！ <br>\
　　 <br>\
我们人类的大脑在思考问题的时候是有容量限制的，难以同时驾驭太多复杂的概念， 如果我们的软件系统也能做成x,y,z坐标这样，就带来了无与伦比的好处，你在处理x轴相关的事情时，不用考虑其他的y和z相关的东西，因为你知道他们不会受到影响，这样问题的复杂度就从3维一下子下降到1维！更容易把握了。如果单单x轴仍然很复杂，你要做的就是再次分解成更小的概念，保证正交即可。</p>\
\
<p><strong>接口</strong> <br>\
　　 <br>\
如果你说了，我的整个系统还没法抽象成正交的概念， 那只好再退一步，在局部使用接口。在著名的《设计模式》一书中，其实在反复强调一点: 发现变化并且封装变化，针对接口编程而不是实现编程。 很多人看书是只关注具体的模式，而忽略了模式的本质目的。 <br>\
　　 <br>\
我们在开发的过程中要保持一种敏锐的感觉，发现可能的变化并且封装起来，只提供一个精心定义的接口让外界调用。这样你在接口后面所做的任何变化，外边就不受影响了。 <br>\
　　 <br>\
例如在JDK中Iterator就是一个很好的抽象，它将集合本身和集合的遍历分开。 Stream抽象也不错，封装了对文件和网络操作，只是使用起来稍显麻烦。其实 一组定义良好的接口一定是正交的，不然的话接口之间的依赖就会让实现非常麻烦。</p>\
\
<p><strong>总结</strong> <br>\
　　 <br>\
说到底，软件设计和开发就是把现实中的问题映射成计算机的语言实现，但现实问题太复杂，细节太多，而且在不断的变化过程中，一般人很难同时对这么的细节进行思考 ，这时候就需要抽象。 <br>\
　　 <br>\
我们只有从纷繁复杂的现象中抽取事物的本质，从具体事物提炼出正交的概念，才能驾驭这些概念，才能在一个低复杂度的世界中进行思考。</p>\
\
<p><strong>来源</strong></p>\
\
<ul>\
<li><a href="http://kb.cnblogs.com/page/544641/" target="_blank">博客园: 抽象：程序员必备的能力</a></li>\
</ul>	在软件业，抽象能力的重要性怎么说都不为过，因为软件开发是一个高度复杂的智力活动，程序员经常需要面对、处理异常复杂的业务和逻辑，如果你不具备强大的抽象能力，无法把具体变成概念，进而驾驭概念进行思考， 你就很难降低问题的复杂度，从而陷入泥潭，无法自拔。	4	0	2016-07-17 20:19:34	2016-07-17 19:40:53	[TOC]\
\
2015年大热的动画片《动脑特工队》中描述了这么一个场景，冰棒带领乐乐和忧忧抄近路去乘坐思维列车，所谓的“近路”就是穿过抽象思维的房间，在这个房间里，他们先是变成了变成3D的块，就像计算机图形学里展示的那样，然后变成平面的图形，最后只剩下一些线条了！\
\
![Abstract](https://dn-woerwosi.qbox.me/blog/images/2016/6/0/abstract.png)\
\
真是非常生动的展示了人类做抽象活动的过程。\
　　\
在软件业，抽象能力的重要性怎么说都不为过，因为软件开发是一个高度复杂的智力活动，程序员经常需要面对、处理异常复杂的业务和逻辑，如果你不具备强大的抽象能力，无法把具体变成概念，进而驾驭概念进行思考，你就很难降低问题的复杂度，从而陷入泥潭，无法自拔。无论你学会了多么强大的程序语言，你的编程能力也很难有质的提高。\
　　\
当然抽象不仅仅是软件开发的独有概念，在别的领域可以看到更多。在自然科学领域，抽象的例子更多，开普勒定律和万有引力就是很典型的例子。\
　　\
在16世纪很多人开始相信哥白尼提出的日心说，但一直搞不清楚围绕太阳的行星到底是怎么运动的，轨道是什么样子，著名天文学家开普勒仔细的研究了他的老师——杰出的观测家——第谷留下的大量天文观测数据以后，提炼出了著名的开普勒三定律， 第一次给出了天体运行规律的解释：\
\
　　1. 所有行星分别是在大小不同的椭圆轨道上运行\
　　2. 在同样的时间里行星向径在轨道平面上所扫过的面积相等\
　　3. 行星公转周期的平方与它同太阳距离的立方成正比\
\
开普勒三定律从大量的数据中提炼出数学规律，无疑是非常伟大的发现和抽象，但这不是最终本质，当然也不是最终的抽象。\
　　\
行星运动的本质是`万有引力定律`。\
　　\
相比于开普勒定律，天才的牛顿所做的抽象向前迈进了一大步，万有引力几乎覆盖了所有大质量物体之间互相吸引和运动的规律，即简单又优美，配合牛顿（和莱布尼茨）发明的微积分，可以很容易推导开普勒定律。\
\
$$ F = Gfrac{Mm}{R^2} $$\
\
如果再加上牛顿力学三定律，尤其是$F=ma$，整个经典物理学的架子就建起来了，后人所有的工作只是在这座大厦上进行一些装修工作，直到爱因斯坦相对论的出现，才建立一座更宏伟的大厦。\
　　\
据说爱因斯坦在评价一个研究时，会用美和丑来作为判断标准，有人拿研究成果让爱因斯坦看， 爱因斯坦不说成果的好与坏，反而说“这东西多丑陋啊”，“这东西真漂亮”。\
　　\
其实一个抽象的东西形式优美，结构简单，很有可能是正确的，很可能抓住了事物的本质。相反如果连形式都丑陋不堪，十有八九不是好的成果。以此作为标准，万有引力定律无疑是漂亮的，正确的，当然爱因斯坦的$E=mc^2$更加漂亮和简单。\
\
抽象的例子在软件业更是数不胜数：\
　　\
文件是对I/O的抽象；虚拟存储器是对物理存储器的抽象；进程是对一个正在运行的程序的抽象；我们再增加一个新的抽象：虚拟机，他提供了对整个计算机（包括操作系统，处理器，程序）的抽象。\
　　\
Andorid把一个移动应用程序抽象成Activity , Intent, Service, Provider......稍微注意一下就会发现：抽象层次越高，接口的语意就越模糊，适用的范围就越广，到最后就会变成数学模型或者概念。\
　　\
**数学模型和算法**\
\
我认为把纷杂的事物抽象到数学层面是最高的抽象，也许会有人会说哲学层面才是，但到数学层面已经非常难了。尤其是重大的科学发现，身后必然有数学的影子。\
\
牛顿当年为了描述天体的轨道和运动，特别创立了新的数学表示：`微积分`。麦克斯韦使用一组方程对电场和磁场行为进行描述。当年爱因斯坦脑海中已经有了广义相对论，但苦于找不到合适的数学形式来描述，他特别花了几年的时间来学习非欧几何和张量分析，最后才得以成功。海森堡用矩阵理论来解释量子力学。程序员在开发过程中，也许能把一个实际的业务问题抽象成数学模型，或者抽象成特定的算法，这样会让程序实现变得非常简单和有趣。\
　　\
例如把针对税务领域的一个Credit, Debit等概念抽象为在一个二维坐标下点的运动，问题一下子简化了很多，实现简单，并且非常安全可靠。\
　　\
**正交的概念**\
\
但是抽象成数学模型和算法通常是可遇而不可求的，这种情况下，我们需要退而求其次，试图抽象成若干个正交的概念，来降低复杂度。“正交”在数学上指的是线性无关，最常见的例子就是坐标系下的x轴和y轴，对于一个点来讲，它的x值的变化不会影响到y，y值得变化不会影响到x ，即x和y是正交的。\
\
正交的威力在于互不影响，扩展方便，单用一个坐标轴可以表示一个直线上的所有的点， 再加一个y轴就能表示平面上的所有的点， 再加一个z轴，3维空间中的所有点都能表示出来了！\
　　\
我们人类的大脑在思考问题的时候是有容量限制的，难以同时驾驭太多复杂的概念， 如果我们的软件系统也能做成x,y,z坐标这样，就带来了无与伦比的好处，你在处理x轴相关的事情时，不用考虑其他的y和z相关的东西，因为你知道他们不会受到影响，这样问题的复杂度就从3维一下子下降到1维！更容易把握了。如果单单x轴仍然很复杂，你要做的就是再次分解成更小的概念，保证正交即可。\
\
**接口**\
　　\
如果你说了，我的整个系统还没法抽象成正交的概念， 那只好再退一步，在局部使用接口。在著名的《设计模式》一书中，其实在反复强调一点: 发现变化并且封装变化，针对接口编程而不是实现编程。 很多人看书是只关注具体的模式，而忽略了模式的本质目的。\
　　\
我们在开发的过程中要保持一种敏锐的感觉，发现可能的变化并且封装起来，只提供一个精心定义的接口让外界调用。这样你在接口后面所做的任何变化，外边就不受影响了。\
　　\
例如在JDK中Iterator就是一个很好的抽象，它将集合本身和集合的遍历分开。 Stream抽象也不错，封装了对文件和网络操作，只是使用起来稍显麻烦。其实 一组定义良好的接口一定是正交的，不然的话接口之间的依赖就会让实现非常麻烦。\
\
**总结**\
　　\
说到底，软件设计和开发就是把现实中的问题映射成计算机的语言实现，但现实问题太复杂，细节太多，而且在不断的变化过程中，一般人很难同时对这么的细节进行思考 ，这时候就需要抽象。\
　　\
我们只有从纷繁复杂的现象中抽取事物的本质，从具体事物提炼出正交的概念，才能驾驭这些概念，才能在一个低复杂度的世界中进行思考。\
\
**来源**\
\
- [博客园: 抽象：程序员必备的能力](http://kb.cnblogs.com/page/544641/)
34	0	RainDon	CO框架分析	co-frame-analyse	1	1		0	ImShengli	es6				<div class="md-section-divider"></div>\
\
<p>ES6带来了很多新的特性，其中生成器、yield等能对js金字塔式的异步回调做到很好地解决，而基于此封装的co框架能让我们完全以<strong>同步的方式来编写异步代码</strong>。这篇文章对生成器函数（Generator Function）及框架thunkify、co的核心代码做了比较彻底的分析。co的使用还是比较广泛的，除了我们日常的编码要用到使我们的代码逻辑更清晰易懂外，一些知名框架也是基于co实现的，比如被称为下一代的Nodejs web框架的koa等。</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="generate-函数">Generate 函数</h3>\
\
<p>有关 generate 函数的内容可以参考ES6的相关文档，这里仅以一个例子说明使用：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-javascript"><span class="kwd">function</span><span class="pun">*</span><span class="pln"> gen1</span><span class="pun">(){</span></code></li><li class="L1"><code class="language-javascript"><span class="pln">    yield </span><span class="lit">2</span><span class="pun">;</span></code></li><li class="L2"><code class="language-javascript"><span class="pln">    yield </span><span class="lit">3</span><span class="pun">;</span></code></li><li class="L3"><code class="language-javascript"><span class="pun">}</span></code></li><li class="L4"><code class="language-javascript"></code></li><li class="L5"><code class="language-javascript"><span class="kwd">function</span><span class="pun">*</span><span class="pln"> gen2</span><span class="pun">(){</span></code></li><li class="L6"><code class="language-javascript"><span class="pln">    yield </span><span class="lit">1</span><span class="pun">;</span></code></li><li class="L7"><code class="language-javascript"><span class="pln">    yield</span><span class="pun">*</span><span class="pln"> gen1</span><span class="pun">();</span></code></li><li class="L8"><code class="language-javascript"><span class="pln">    yield </span><span class="lit">4</span><span class="pun">;</span></code></li><li class="L9"><code class="language-javascript"><span class="pun">}</span></code></li><li class="L0"><code class="language-javascript"></code></li><li class="L1"><code class="language-javascript"><span class="kwd">var</span><span class="pln"> g2 </span><span class="pun">=</span><span class="pln"> gen2</span><span class="pun">();</span></code></li><li class="L2"><code class="language-javascript"><span class="pln">console</span><span class="pun">.</span><span class="pln">log</span><span class="pun">(</span><span class="pln">g2</span><span class="pun">.</span><span class="pln">next</span><span class="pun">().</span><span class="pln">value</span><span class="pun">);</span><span class="pln"> </span><span class="com">// 1</span></code></li><li class="L3"><code class="language-javascript"><span class="pln">console</span><span class="pun">.</span><span class="pln">log</span><span class="pun">(</span><span class="pln">g2</span><span class="pun">.</span><span class="pln">next</span><span class="pun">().</span><span class="pln">value</span><span class="pun">);</span><span class="pln"> </span><span class="com">// 2</span></code></li><li class="L4"><code class="language-javascript"><span class="pln">console</span><span class="pun">.</span><span class="pln">log</span><span class="pun">(</span><span class="pln">g2</span><span class="pun">.</span><span class="pln">next</span><span class="pun">().</span><span class="pln">value</span><span class="pun">);</span><span class="pln"> </span><span class="com">// 3</span></code></li><li class="L5"><code class="language-javascript"><span class="pln">console</span><span class="pun">.</span><span class="pln">log</span><span class="pun">(</span><span class="pln">g2</span><span class="pun">.</span><span class="pln">next</span><span class="pun">().</span><span class="pln">value</span><span class="pun">);</span><span class="pln"> </span><span class="com">// 4</span></code></li></ol></pre>\
\
<div class="md-section-divider"></div>\
\
<h3 id="thunk-函数">Thunk 函数</h3>\
\
<p>在co的应用中，为了能像写同步代码那样书写异步代码，比较多的使用方式是使用thunk函数（但不是唯一方式，还可以是：Promise）。比如读取文件内容的一步函数fs.readFile()方法，转化为thunk函数的方式如下：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-javascript"><span class="kwd">function</span><span class="pln"> readFile</span><span class="pun">(</span><span class="pln">path</span><span class="pun">,</span><span class="pln"> encoding</span><span class="pun">){</span></code></li><li class="L1"><code class="language-javascript"><span class="pln">    </span><span class="kwd">return</span><span class="pln"> </span><span class="kwd">function</span><span class="pun">(</span><span class="pln">cb</span><span class="pun">){</span></code></li><li class="L2"><code class="language-javascript"><span class="pln">        fs</span><span class="pun">.</span><span class="pln">readFile</span><span class="pun">(</span><span class="pln">path</span><span class="pun">,</span><span class="pln"> encoding</span><span class="pun">,</span><span class="pln"> cb</span><span class="pun">);</span></code></li><li class="L3"><code class="language-javascript"><span class="pln">    </span><span class="pun">};</span></code></li><li class="L4"><code class="language-javascript"><span class="pun">}</span></code></li></ol></pre>\
\
<p>thunk函数具备以下两个要素：(1) 有且只有一个参数是callback的函数；(2) callback的第一个参数是error。</p>\
\
<p>使用thunk函数，同时结合co我们就可以像写同步代码那样来写书写异步代码，先来个例子感受下：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-javascript"><span class="kwd">var</span><span class="pln"> co </span><span class="pun">=</span><span class="pln"> require</span><span class="pun">(</span><span class="str">'co'</span><span class="pun">),</span></code></li><li class="L1"><code class="language-javascript"><span class="pln">    fs </span><span class="pun">=</span><span class="pln"> require</span><span class="pun">(</span><span class="str">'fs'</span><span class="pun">),</span></code></li><li class="L2"><code class="language-javascript"><span class="pln">    </span><span class="typ">Promise</span><span class="pln"> </span><span class="pun">=</span><span class="pln"> require</span><span class="pun">(</span><span class="str">'es6-promise'</span><span class="pun">).</span><span class="typ">Promise</span><span class="pun">;</span></code></li><li class="L3"><code class="language-javascript"></code></li><li class="L4"><code class="language-javascript"><span class="kwd">function</span><span class="pln"> readFile</span><span class="pun">(</span><span class="pln">path</span><span class="pun">,</span><span class="pln"> encoding</span><span class="pun">){</span></code></li><li class="L5"><code class="language-javascript"><span class="pln">    </span><span class="kwd">return</span><span class="pln"> </span><span class="kwd">function</span><span class="pun">(</span><span class="pln">cb</span><span class="pun">){</span><span class="pln"> </span><span class="com">// thunk函数</span></code></li><li class="L6"><code class="language-javascript"><span class="pln">        fs</span><span class="pun">.</span><span class="pln">readFile</span><span class="pun">(</span><span class="pln">path</span><span class="pun">,</span><span class="pln"> encoding</span><span class="pun">,</span><span class="pln"> cb</span><span class="pun">);</span></code></li><li class="L7"><code class="language-javascript"><span class="pln">    </span><span class="pun">};</span></code></li><li class="L8"><code class="language-javascript"><span class="pun">}</span></code></li><li class="L9"><code class="language-javascript"></code></li><li class="L0"><code class="language-javascript"></code></li><li class="L1"><code class="language-javascript"><span class="pln">co</span><span class="pun">(</span><span class="kwd">function</span><span class="pun">*</span><span class="pln"> </span><span class="pun">(){</span></code></li><li class="L2"><code class="language-javascript"><span class="pln">    </span><span class="com">// 外面不可见，但在co内部其实已经转化成了promise.then().then()..链式调用的形式</span></code></li><li class="L3"><code class="language-javascript"><span class="pln">    </span><span class="kwd">var</span><span class="pln"> a </span><span class="pun">=</span><span class="pln"> yield readFile</span><span class="pun">(</span><span class="str">'a.txt'</span><span class="pun">,</span><span class="pln"> </span><span class="pun">{</span><span class="pln">encoding</span><span class="pun">:</span><span class="pln"> </span><span class="str">'utf8'</span><span class="pun">});</span></code></li><li class="L4"><code class="language-javascript"><span class="pln">    console</span><span class="pun">.</span><span class="pln">log</span><span class="pun">(</span><span class="pln">a</span><span class="pun">);</span><span class="pln"> </span><span class="com">// a</span></code></li><li class="L5"><code class="language-javascript"><span class="pln">    </span><span class="kwd">var</span><span class="pln"> b </span><span class="pun">=</span><span class="pln"> yield readFile</span><span class="pun">(</span><span class="str">'b.txt'</span><span class="pun">,</span><span class="pln"> </span><span class="pun">{</span><span class="pln">encoding</span><span class="pun">:</span><span class="pln"> </span><span class="str">'utf8'</span><span class="pun">});</span></code></li><li class="L6"><code class="language-javascript"><span class="pln">    console</span><span class="pun">.</span><span class="pln">log</span><span class="pun">(</span><span class="pln">b</span><span class="pun">);</span><span class="pln"> </span><span class="com">// b</span></code></li><li class="L7"><code class="language-javascript"><span class="pln">    </span><span class="kwd">var</span><span class="pln"> c </span><span class="pun">=</span><span class="pln"> yield readFile</span><span class="pun">(</span><span class="str">'c.txt'</span><span class="pun">,</span><span class="pln"> </span><span class="pun">{</span><span class="pln">encoding</span><span class="pun">:</span><span class="pln"> </span><span class="str">'utf8'</span><span class="pun">});</span></code></li><li class="L8"><code class="language-javascript"><span class="pln">    console</span><span class="pun">.</span><span class="pln">log</span><span class="pun">(</span><span class="pln">c</span><span class="pun">);</span><span class="pln"> </span><span class="com">// c</span></code></li><li class="L9"><code class="language-javascript"><span class="pln">    </span><span class="kwd">return</span><span class="pln"> yield </span><span class="typ">Promise</span><span class="pun">.</span><span class="pln">resolve</span><span class="pun">(</span><span class="pln">a</span><span class="pun">+</span><span class="pln">b</span><span class="pun">+</span><span class="pln">c</span><span class="pun">);</span></code></li><li class="L0"><code class="language-javascript"><span class="pun">}).</span><span class="pln">then</span><span class="pun">(</span><span class="kwd">function</span><span class="pun">(</span><span class="pln">val</span><span class="pun">){</span></code></li><li class="L1"><code class="language-javascript"><span class="pln">    console</span><span class="pun">.</span><span class="pln">log</span><span class="pun">(</span><span class="pln">val</span><span class="pun">);</span><span class="pln"> </span><span class="com">// abc</span></code></li><li class="L2"><code class="language-javascript"><span class="pun">}).</span><span class="kwd">catch</span><span class="pun">(</span><span class="kwd">function</span><span class="pun">(</span><span class="pln">error</span><span class="pun">){</span></code></li><li class="L3"><code class="language-javascript"><span class="pln">    console</span><span class="pun">.</span><span class="pln">log</span><span class="pun">(</span><span class="pln">error</span><span class="pun">);</span></code></li><li class="L4"><code class="language-javascript"><span class="pun">});</span></code></li></ol></pre>\
\
<p>其实，对于每次都去自己书写一个thunk函数还是比较麻烦的，有一个框架thunkify可以帮我们轻松实现，修改后的代码如下：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-javascript"><span class="kwd">var</span><span class="pln"> co </span><span class="pun">=</span><span class="pln"> require</span><span class="pun">(</span><span class="str">'co'</span><span class="pun">),</span></code></li><li class="L1"><code class="language-javascript"><span class="pln">    thunkify </span><span class="pun">=</span><span class="pln"> require</span><span class="pun">(</span><span class="str">'thunkify'</span><span class="pun">),</span></code></li><li class="L2"><code class="language-javascript"><span class="pln">    fs </span><span class="pun">=</span><span class="pln"> require</span><span class="pun">(</span><span class="str">'fs'</span><span class="pun">),</span></code></li><li class="L3"><code class="language-javascript"><span class="pln">    </span><span class="typ">Promise</span><span class="pln"> </span><span class="pun">=</span><span class="pln"> require</span><span class="pun">(</span><span class="str">'es6-promise'</span><span class="pun">).</span><span class="typ">Promise</span><span class="pun">;</span></code></li><li class="L4"><code class="language-javascript"></code></li><li class="L5"><code class="language-javascript"><span class="kwd">var</span><span class="pln"> readFile </span><span class="pun">=</span><span class="pln"> thunkify</span><span class="pun">(</span><span class="pln">fs</span><span class="pun">.</span><span class="pln">readFile</span><span class="pun">);</span></code></li><li class="L6"><code class="language-javascript"></code></li><li class="L7"><code class="language-javascript"></code></li><li class="L8"><code class="language-javascript"><span class="pln">co</span><span class="pun">(</span><span class="kwd">function</span><span class="pun">*</span><span class="pln"> </span><span class="pun">(){</span></code></li><li class="L9"><code class="language-javascript"><span class="pln">    </span><span class="com">// 外面不可见，但在co内部其实已经转化成了promise.then().then()..链式调用的形式</span></code></li><li class="L0"><code class="language-javascript"><span class="pln">    </span><span class="kwd">var</span><span class="pln"> a </span><span class="pun">=</span><span class="pln"> yield readFile</span><span class="pun">(</span><span class="str">'a.txt'</span><span class="pun">,</span><span class="pln"> </span><span class="pun">{</span><span class="pln">encoding</span><span class="pun">:</span><span class="pln"> </span><span class="str">'utf8'</span><span class="pun">});</span></code></li><li class="L1"><code class="language-javascript"><span class="pln">    console</span><span class="pun">.</span><span class="pln">log</span><span class="pun">(</span><span class="pln">a</span><span class="pun">);</span><span class="pln"> </span><span class="com">// a</span></code></li><li class="L2"><code class="language-javascript"><span class="pln">    </span><span class="kwd">var</span><span class="pln"> b </span><span class="pun">=</span><span class="pln"> yield readFile</span><span class="pun">(</span><span class="str">'b.txt'</span><span class="pun">,</span><span class="pln"> </span><span class="pun">{</span><span class="pln">encoding</span><span class="pun">:</span><span class="pln"> </span><span class="str">'utf8'</span><span class="pun">});</span></code></li><li class="L3"><code class="language-javascript"><span class="pln">    console</span><span class="pun">.</span><span class="pln">log</span><span class="pun">(</span><span class="pln">b</span><span class="pun">);</span><span class="pln"> </span><span class="com">// b</span></code></li><li class="L4"><code class="language-javascript"><span class="pln">    </span><span class="kwd">var</span><span class="pln"> c </span><span class="pun">=</span><span class="pln"> yield readFile</span><span class="pun">(</span><span class="str">'c.txt'</span><span class="pun">,</span><span class="pln"> </span><span class="pun">{</span><span class="pln">encoding</span><span class="pun">:</span><span class="pln"> </span><span class="str">'utf8'</span><span class="pun">});</span></code></li><li class="L5"><code class="language-javascript"><span class="pln">    console</span><span class="pun">.</span><span class="pln">log</span><span class="pun">(</span><span class="pln">c</span><span class="pun">);</span><span class="pln"> </span><span class="com">// c</span></code></li><li class="L6"><code class="language-javascript"><span class="pln">    </span><span class="kwd">return</span><span class="pln"> yield </span><span class="typ">Promise</span><span class="pun">.</span><span class="pln">resolve</span><span class="pun">(</span><span class="pln">a</span><span class="pun">+</span><span class="pln">b</span><span class="pun">+</span><span class="pln">c</span><span class="pun">);</span></code></li><li class="L7"><code class="language-javascript"><span class="pun">}).</span><span class="pln">then</span><span class="pun">(</span><span class="kwd">function</span><span class="pun">(</span><span class="pln">val</span><span class="pun">){</span></code></li><li class="L8"><code class="language-javascript"><span class="pln">    console</span><span class="pun">.</span><span class="pln">log</span><span class="pun">(</span><span class="pln">val</span><span class="pun">);</span><span class="pln"> </span><span class="com">// abc</span></code></li><li class="L9"><code class="language-javascript"><span class="pun">}).</span><span class="kwd">catch</span><span class="pun">(</span><span class="kwd">function</span><span class="pun">(</span><span class="pln">error</span><span class="pun">){</span></code></li><li class="L0"><code class="language-javascript"><span class="pln">    console</span><span class="pun">.</span><span class="pln">log</span><span class="pun">(</span><span class="pln">error</span><span class="pun">);</span></code></li><li class="L1"><code class="language-javascript"><span class="pun">});</span></code></li></ol></pre>\
\
<p>对于thunkify框架的理解注释如下：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-javascript"><span class="com">/**</span></code></li><li class="L1"><code class="language-javascript"><span class="com"> * Module dependencies.</span></code></li><li class="L2"><code class="language-javascript"><span class="com"> */</span></code></li><li class="L3"><code class="language-javascript"></code></li><li class="L4"><code class="language-javascript"><span class="kwd">var</span><span class="pln"> assert </span><span class="pun">=</span><span class="pln"> require</span><span class="pun">(</span><span class="str">'assert'</span><span class="pun">);</span></code></li><li class="L5"><code class="language-javascript"></code></li><li class="L6"><code class="language-javascript"><span class="com">/**</span></code></li><li class="L7"><code class="language-javascript"><span class="com"> * Expose `thunkify()`.</span></code></li><li class="L8"><code class="language-javascript"><span class="com"> */</span></code></li><li class="L9"><code class="language-javascript"></code></li><li class="L0"><code class="language-javascript"><span class="pln">module</span><span class="pun">.</span><span class="pln">exports </span><span class="pun">=</span><span class="pln"> thunkify</span><span class="pun">;</span></code></li><li class="L1"><code class="language-javascript"></code></li><li class="L2"><code class="language-javascript"><span class="com">/**</span></code></li><li class="L3"><code class="language-javascript"><span class="com"> * Wrap a regular callback `fn` as a thunk.</span></code></li><li class="L4"><code class="language-javascript"><span class="com"> *</span></code></li><li class="L5"><code class="language-javascript"><span class="com"> * @param {Function} fn</span></code></li><li class="L6"><code class="language-javascript"><span class="com"> * @return {Function}</span></code></li><li class="L7"><code class="language-javascript"><span class="com"> * @api public</span></code></li><li class="L8"><code class="language-javascript"><span class="com"> */</span></code></li><li class="L9"><code class="language-javascript"></code></li><li class="L0"><code class="language-javascript"><span class="kwd">function</span><span class="pln"> thunkify</span><span class="pun">(</span><span class="pln">fn</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L1"><code class="language-javascript"><span class="pln">    assert</span><span class="pun">(</span><span class="str">'function'</span><span class="pln"> </span><span class="pun">==</span><span class="pln"> </span><span class="kwd">typeof</span><span class="pln"> fn</span><span class="pun">,</span><span class="pln"> </span><span class="str">'function required'</span><span class="pun">);</span></code></li><li class="L2"><code class="language-javascript"><span class="pln">    </span><span class="com">// 返回一个包含thunk函数的函数，返回的thunk函数用于执行yield，而外围这个函数用于给thunk函数传递参数</span></code></li><li class="L3"><code class="language-javascript"><span class="pln">    </span><span class="kwd">return</span><span class="pln"> </span><span class="kwd">function</span><span class="pun">()</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L4"><code class="language-javascript"><span class="pln">        </span><span class="kwd">var</span><span class="pln"> args </span><span class="pun">=</span><span class="pln"> </span><span class="kwd">new</span><span class="pln"> </span><span class="typ">Array</span><span class="pun">(</span><span class="pln">arguments</span><span class="pun">.</span><span class="pln">length</span><span class="pun">);</span></code></li><li class="L5"><code class="language-javascript"><span class="pln">        </span><span class="com">// 缓存当前上下文环境，给fn提供执行环境</span></code></li><li class="L6"><code class="language-javascript"><span class="pln">        </span><span class="kwd">var</span><span class="pln"> ctx </span><span class="pun">=</span><span class="pln"> </span><span class="kwd">this</span><span class="pun">;</span></code></li><li class="L7"><code class="language-javascript"></code></li><li class="L8"><code class="language-javascript"><span class="pln">        </span><span class="com">// 将参数类数组转化为数组（实现方式略显臃肿，可直接用Array.prototype.slice.call(arguments)实现）</span></code></li><li class="L9"><code class="language-javascript"><span class="pln">        </span><span class="kwd">for</span><span class="pln"> </span><span class="pun">(</span><span class="kwd">var</span><span class="pln"> i </span><span class="pun">=</span><span class="pln"> </span><span class="lit">0</span><span class="pun">;</span><span class="pln"> i </span><span class="pun">&lt;</span><span class="pln"> args</span><span class="pun">.</span><span class="pln">length</span><span class="pun">;</span><span class="pln"> </span><span class="pun">++</span><span class="pln">i</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L0"><code class="language-javascript"><span class="pln">            args</span><span class="pun">[</span><span class="pln">i</span><span class="pun">]</span><span class="pln"> </span><span class="pun">=</span><span class="pln"> arguments</span><span class="pun">[</span><span class="pln">i</span><span class="pun">];</span></code></li><li class="L1"><code class="language-javascript"><span class="pln">        </span><span class="pun">}</span></code></li><li class="L2"><code class="language-javascript"></code></li><li class="L3"><code class="language-javascript"><span class="pln">        </span><span class="com">// 真正的thunk函数（有且只有一个参数是callback的函数，且callback的第一个参数为error）</span></code></li><li class="L4"><code class="language-javascript"><span class="pln">        </span><span class="com">// 类似于：</span></code></li><li class="L5"><code class="language-javascript"><span class="pln">        </span><span class="com">// function(cb) {fs.readFile(path, {encoding: 'utf8}, cb)}</span></code></li><li class="L6"><code class="language-javascript"><span class="pln">        </span><span class="kwd">return</span><span class="pln"> </span><span class="kwd">function</span><span class="pun">(</span><span class="pln">done</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L7"><code class="language-javascript"><span class="pln">            </span><span class="kwd">var</span><span class="pln"> called</span><span class="pun">;</span></code></li><li class="L8"><code class="language-javascript"></code></li><li class="L9"><code class="language-javascript"><span class="pln">            </span><span class="com">// 将回调函数再包裹一层，避免重复调用；同时，将包裹了的真正的回调函数push进参数数组</span></code></li><li class="L0"><code class="language-javascript"><span class="pln">            args</span><span class="pun">.</span><span class="pln">push</span><span class="pun">(</span><span class="kwd">function</span><span class="pun">()</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L1"><code class="language-javascript"><span class="pln">                </span><span class="kwd">if</span><span class="pln"> </span><span class="pun">(</span><span class="pln">called</span><span class="pun">)</span><span class="pln"> </span><span class="kwd">return</span><span class="pun">;</span></code></li><li class="L2"><code class="language-javascript"><span class="pln">                called </span><span class="pun">=</span><span class="pln"> </span><span class="kwd">true</span><span class="pun">;</span></code></li><li class="L3"><code class="language-javascript"><span class="pln">                done</span><span class="pun">.</span><span class="pln">apply</span><span class="pun">(</span><span class="kwd">null</span><span class="pun">,</span><span class="pln"> arguments</span><span class="pun">);</span></code></li><li class="L4"><code class="language-javascript"><span class="pln">            </span><span class="pun">});</span></code></li><li class="L5"><code class="language-javascript"></code></li><li class="L6"><code class="language-javascript"><span class="pln">            </span><span class="kwd">try</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L7"><code class="language-javascript"><span class="pln">                </span><span class="com">// 在ctx上下文执行fn（一般是异步函数，如：fs.readFile）</span></code></li><li class="L8"><code class="language-javascript"><span class="pln">                </span><span class="com">// 并将执行thunkify之后返回的函数的参数（含done回调）传入，类似于执行：</span></code></li><li class="L9"><code class="language-javascript"><span class="pln">                </span><span class="com">// fs.readFile(path, {encoding: 'utf8}, done)</span></code></li><li class="L0"><code class="language-javascript"><span class="pln">                </span><span class="com">// 关于done是做什么用，则是在co库内</span></code></li><li class="L1"><code class="language-javascript"><span class="pln">                fn</span><span class="pun">.</span><span class="pln">apply</span><span class="pun">(</span><span class="pln">ctx</span><span class="pun">,</span><span class="pln"> args</span><span class="pun">);</span></code></li><li class="L2"><code class="language-javascript"><span class="pln">            </span><span class="pun">}</span><span class="pln"> </span><span class="kwd">catch</span><span class="pln"> </span><span class="pun">(</span><span class="pln">err</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L3"><code class="language-javascript"><span class="pln">                done</span><span class="pun">(</span><span class="pln">err</span><span class="pun">);</span></code></li><li class="L4"><code class="language-javascript"><span class="pln">            </span><span class="pun">}</span></code></li><li class="L5"><code class="language-javascript"><span class="pln">        </span><span class="pun">}</span></code></li><li class="L6"><code class="language-javascript"><span class="pln">    </span><span class="pun">}</span></code></li><li class="L7"><code class="language-javascript"><span class="pun">};</span></code></li></ol></pre>	ES6带来了很多新的特性，其中生成器、yield等能对js金字塔式的异步回调做到很好地解决，而基于此封装的co框架能让我们完全以同步的方式来编写异步代码。这篇文章对生成器函数（GeneratorFunction）及框架thunkify、co的核心代码做了比较彻底的分析。	19	0	2017-01-08 00:34:29	2016-08-29 21:52:48	ES6带来了很多新的特性，其中生成器、yield等能对js金字塔式的异步回调做到很好地解决，而基于此封装的co框架能让我们完全以**同步的方式来编写异步代码**。这篇文章对生成器函数（Generator Function）及框架thunkify、co的核心代码做了比较彻底的分析。co的使用还是比较广泛的，除了我们日常的编码要用到使我们的代码逻辑更清晰易懂外，一些知名框架也是基于co实现的，比如被称为下一代的Nodejs web框架的koa等。\
\
### Generate 函数\
\
有关 generate 函数的内容可以参考ES6的相关文档，这里仅以一个例子说明使用：\
\
```javascript\
function* gen1(){\
    yield 2;\
    yield 3;\
}\
\
function* gen2(){\
    yield 1;\
    yield* gen1();\
    yield 4;\
}\
\
var g2 = gen2();\
console.log(g2.next().value); // 1\
console.log(g2.next().value); // 2\
console.log(g2.next().value); // 3\
console.log(g2.next().value); // 4\
```\
\
### Thunk 函数\
\
在co的应用中，为了能像写同步代码那样书写异步代码，比较多的使用方式是使用thunk函数（但不是唯一方式，还可以是：Promise）。比如读取文件内容的一步函数fs.readFile()方法，转化为thunk函数的方式如下：\
\
```javascript\
function readFile(path, encoding){\
    return function(cb){\
        fs.readFile(path, encoding, cb);\
    };\
}\
```\
\
thunk函数具备以下两个要素：(1) 有且只有一个参数是callback的函数；(2) callback的第一个参数是error。\
\
使用thunk函数，同时结合co我们就可以像写同步代码那样来写书写异步代码，先来个例子感受下：\
\
```javascript\
var co = require('co'),\
    fs = require('fs'),\
    Promise = require('es6-promise').Promise;\
\
function readFile(path, encoding){\
    return function(cb){ // thunk函数\
        fs.readFile(path, encoding, cb);\
    };\
}\
\
\
co(function* (){\
    // 外面不可见，但在co内部其实已经转化成了promise.then().then()..链式调用的形式\
    var a = yield readFile('a.txt', {encoding: 'utf8'});\
    console.log(a); // a\
    var b = yield readFile('b.txt', {encoding: 'utf8'});\
    console.log(b); // b\
    var c = yield readFile('c.txt', {encoding: 'utf8'});\
    console.log(c); // c\
    return yield Promise.resolve(a+b+c);\
}).then(function(val){\
    console.log(val); // abc\
}).catch(function(error){\
    console.log(error);\
});\
```\
\
其实，对于每次都去自己书写一个thunk函数还是比较麻烦的，有一个框架thunkify可以帮我们轻松实现，修改后的代码如下：\
\
```javascript\
var co = require('co'),\
    thunkify = require('thunkify'),\
    fs = require('fs'),\
    Promise = require('es6-promise').Promise;\
\
var readFile = thunkify(fs.readFile);\
\
\
co(function* (){\
    // 外面不可见，但在co内部其实已经转化成了promise.then().then()..链式调用的形式\
    var a = yield readFile('a.txt', {encoding: 'utf8'});\
    console.log(a); // a\
    var b = yield readFile('b.txt', {encoding: 'utf8'});\
    console.log(b); // b\
    var c = yield readFile('c.txt', {encoding: 'utf8'});\
    console.log(c); // c\
    return yield Promise.resolve(a+b+c);\
}).then(function(val){\
    console.log(val); // abc\
}).catch(function(error){\
    console.log(error);\
});\
```\
\
对于thunkify框架的理解注释如下：\
\
```javascript\
/**\
 * Module dependencies.\
 */\
\
var assert = require('assert');\
\
/**\
 * Expose `thunkify()`.\
 */\
\
module.exports = thunkify;\
\
/**\
 * Wrap a regular callback `fn` as a thunk.\
 *\
 * @param {Function} fn\
 * @return {Function}\
 * @api public\
 */\
\
function thunkify(fn) {\
    assert('function' == typeof fn, 'function required');\
    // 返回一个包含thunk函数的函数，返回的thunk函数用于执行yield，而外围这个函数用于给thunk函数传递参数\
    return function() {\
        var args = new Array(arguments.length);\
        // 缓存当前上下文环境，给fn提供执行环境\
        var ctx = this;\
\
        // 将参数类数组转化为数组（实现方式略显臃肿，可直接用Array.prototype.slice.call(arguments)实现）\
        for (var i = 0; i < args.length; ++i) {\
            args[i] = arguments[i];\
        }\
\
        // 真正的thunk函数（有且只有一个参数是callback的函数，且callback的第一个参数为error）\
        // 类似于：\
        // function(cb) {fs.readFile(path, {encoding: 'utf8}, cb)}\
        return function(done) {\
            var called;\
\
            // 将回调函数再包裹一层，避免重复调用；同时，将包裹了的真正的回调函数push进参数数组\
            args.push(function() {\
                if (called) return;\
                called = true;\
                done.apply(null, arguments);\
            });\
\
            try {\
                // 在ctx上下文执行fn（一般是异步函数，如：fs.readFile）\
                // 并将执行thunkify之后返回的函数的参数（含done回调）传入，类似于执行：\
                // fs.readFile(path, {encoding: 'utf8}, done)\
                // 关于done是做什么用，则是在co库内\
                fn.apply(ctx, args);\
            } catch (err) {\
                done(err);\
            }\
        }\
    }\
};\
```\
                                        
35	0	RainDon	React最佳实践	react-best-practice	1	1		0	ImShengli	React				<div class="md-section-divider"></div>\
\
<p><strong>整体结构</strong></p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-js"><span class="kwd">class</span><span class="pln"> </span><span class="typ">List</span><span class="pln"> extends </span><span class="typ">React</span><span class="pun">.</span><span class="typ">Component</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L1"><code class="language-js"></code></li><li class="L2"><code class="language-js"><span class="pln">    </span><span class="kwd">static</span><span class="pln"> propTypes </span><span class="pun">=</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L3"><code class="language-js"><span class="pln">        size</span><span class="pun">:</span><span class="pln"> </span><span class="typ">React</span><span class="pun">.</span><span class="typ">PropTypes</span><span class="pun">.</span><span class="pln">oneOf</span><span class="pun">([</span><span class="str">'large'</span><span class="pun">,</span><span class="pln"> </span><span class="str">'normal'</span><span class="pun">,</span><span class="pln"> </span><span class="str">'small'</span><span class="pun">]),</span></code></li><li class="L4"><code class="language-js"><span class="pln">        shape</span><span class="pun">:</span><span class="pln"> </span><span class="typ">React</span><span class="pun">.</span><span class="typ">PropTypes</span><span class="pun">.</span><span class="pln">oneOf</span><span class="pun">([</span><span class="str">'default'</span><span class="pun">,</span><span class="pln"> </span><span class="str">'primary'</span><span class="pun">,</span><span class="pln"> </span><span class="str">'ghost'</span><span class="pun">])</span></code></li><li class="L5"><code class="language-js"><span class="pln">        disabled</span><span class="pun">:</span><span class="pln"> </span><span class="typ">React</span><span class="pun">.</span><span class="typ">PropTypes</span><span class="pun">.</span><span class="pln">bool</span></code></li><li class="L6"><code class="language-js"><span class="pln">    </span><span class="pun">};</span></code></li><li class="L7"><code class="language-js"></code></li><li class="L8"><code class="language-js"><span class="pln">    </span><span class="kwd">static</span><span class="pln"> defaultProps </span><span class="pun">=</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L9"><code class="language-js"><span class="pln">        size</span><span class="pun">:</span><span class="pln"> </span><span class="str">'normal'</span><span class="pun">,</span></code></li><li class="L0"><code class="language-js"><span class="pln">        shape</span><span class="pun">:</span><span class="pln"> </span><span class="str">'default'</span><span class="pun">,</span></code></li><li class="L1"><code class="language-js"><span class="pln">        disabled</span><span class="pun">:</span><span class="pln"> </span><span class="kwd">false</span></code></li><li class="L2"><code class="language-js"><span class="pln">    </span><span class="pun">};</span></code></li><li class="L3"><code class="language-js"></code></li><li class="L4"><code class="language-js"><span class="pln">    constructor</span><span class="pun">(</span><span class="pln">props</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L5"><code class="language-js"><span class="pln">        super</span><span class="pun">(</span><span class="pln">props</span><span class="pun">);</span></code></li><li class="L6"><code class="language-js"><span class="pln">        </span><span class="kwd">this</span><span class="pun">.</span><span class="pln">state </span><span class="pun">=</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L7"><code class="language-js"><span class="pln">            foo</span><span class="pun">:</span><span class="pln"> </span><span class="str">'bar'</span></code></li><li class="L8"><code class="language-js"><span class="pln">        </span><span class="pun">};</span></code></li><li class="L9"><code class="language-js"><span class="pln">    </span><span class="pun">}</span></code></li><li class="L0"><code class="language-js"></code></li><li class="L1"><code class="language-js"><span class="pln">    render</span><span class="pun">()</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L2"><code class="language-js"><span class="pln">        </span><span class="kwd">return</span><span class="pln"> </span><span class="pun">&lt;</span><span class="pln">div</span><span class="pun">&gt;{</span><span class="kwd">this</span><span class="pun">.</span><span class="pln">state</span><span class="pun">.</span><span class="pln">foo</span><span class="pun">}&lt;/</span><span class="pln">div</span><span class="pun">&gt;;</span></code></li><li class="L3"><code class="language-js"><span class="pln">    </span><span class="pun">}</span><span class="pln">   </span></code></li><li class="L4"><code class="language-js"><span class="pun">}</span></code></li></ol></pre>\
\
<p><strong>基础规范</strong></p>\
\
<ul>\
<li>React组件文件使用<code>.jsx</code>扩展名；</li>\
<li>对外暴露的文件名使用<code>index</code>；</li>\
<li>React组件名使用驼峰命名，首字母大写，实例名首字母小写；</li>\
<li>每个文件只写一个组件，但多个无状态组件可以放在一个文件中；</li>\
</ul>\
\
<p><strong>方法顺序</strong></p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-js"><span class="pln">propTypes</span></code></li><li class="L1"><code class="language-js"><span class="pln">defaultProps</span></code></li><li class="L2"><code class="language-js"><span class="pln">constructor</span><span class="pun">()</span></code></li><li class="L3"><code class="language-js"><span class="pln">getChildContext</span><span class="pun">()</span></code></li><li class="L4"><code class="language-js"><span class="pln">componentWillMount</span><span class="pun">()</span></code></li><li class="L5"><code class="language-js"><span class="pln">componentDidMount</span><span class="pun">()</span></code></li><li class="L6"><code class="language-js"><span class="pln">componentWillReceiveProps</span><span class="pun">()</span></code></li><li class="L7"><code class="language-js"><span class="pln">shouldComponentUpdate</span><span class="pun">()</span></code></li><li class="L8"><code class="language-js"><span class="pln">componentWillUpdate</span><span class="pun">()</span></code></li><li class="L9"><code class="language-js"><span class="pln">componentDidUpdate</span><span class="pun">()</span></code></li><li class="L0"><code class="language-js"><span class="pln">componentWillUnmount</span><span class="pun">()</span></code></li><li class="L1"><code class="language-js"><span class="pln">render</span><span class="pun">()</span></code></li></ol></pre>\
\
<p><strong>引号</strong></p>\
\
<p>JSX属性值使用双引号，其他均使用单引号；</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-js"><span class="pun">&lt;</span><span class="typ">Foo</span><span class="pln"> bar</span><span class="pun">=</span><span class="str">"bar"</span><span class="pln"> </span><span class="pun">/&gt;</span></code></li><li class="L1"><code class="language-js"><span class="pun">&lt;</span><span class="typ">Foo</span><span class="pln"> style</span><span class="pun">={{</span><span class="pln"> left</span><span class="pun">:</span><span class="pln"> </span><span class="str">'20px'</span><span class="pln"> </span><span class="pun">}}</span><span class="pln"> </span><span class="pun">/&gt;</span></code></li></ol></pre>\
\
<p><strong>空格</strong></p>\
\
<ul>\
<li>总是在自闭合的标签<code>/&gt;</code>前加一个空格；</li>\
<li>不要在JSX<code>{}</code>引用括号里两边加空格。</li>\
</ul>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-js"><span class="pun">&lt;</span><span class="typ">Foo</span><span class="pln"> </span><span class="pun">/&gt;</span></code></li><li class="L1"><code class="language-js"><span class="pun">&lt;</span><span class="typ">Foo</span><span class="pln"> bar</span><span class="pun">={</span><span class="pln">baz</span><span class="pun">}</span><span class="pln"> </span><span class="pun">/&gt;</span></code></li></ol></pre>\
\
<p><strong>括号</strong></p>\
\
<p>将多行的JSX标签写在<code>()</code>里；</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-js"><span class="pln">render</span><span class="pun">()</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L1"><code class="language-js"><span class="pln">    </span><span class="kwd">return</span><span class="pln"> </span><span class="pun">(&lt;</span><span class="typ">MyComponent</span><span class="pln"> className</span><span class="pun">=</span><span class="str">"long body"</span><span class="pln"> foo</span><span class="pun">=</span><span class="str">"bar"</span><span class="pun">&gt;</span></code></li><li class="L2"><code class="language-js"><span class="pln">        </span><span class="pun">&lt;</span><span class="typ">MyChild</span><span class="pln"> </span><span class="pun">/&gt;</span></code></li><li class="L3"><code class="language-js"><span class="pln">    </span><span class="pun">&lt;/</span><span class="typ">MyComponent</span><span class="pun">&gt;);</span></code></li><li class="L4"><code class="language-js"><span class="pun">}</span></code></li></ol></pre>\
\
<p><strong>标签</strong></p>\
\
<p>对于没有子元素的标签来说总是闭合的；</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="tag">&lt;Foo</span><span class="pln"> </span><span class="atn">className</span><span class="pun">=</span><span class="atv">"stuff"</span><span class="pln"> </span><span class="tag">/&gt;</span></code></li></ol></pre>\
\
<p><strong>组件定义</strong></p>\
\
<p>如果有内部状态、方法或是要对外暴露ref的组件，使用<code>ES6 Class</code>写法；</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-js"><span class="kwd">class</span><span class="pln"> </span><span class="typ">List</span><span class="pln"> extends </span><span class="typ">React</span><span class="pun">.</span><span class="typ">Component</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L1"><code class="language-js"><span class="pln">    </span><span class="com">// ...</span></code></li><li class="L2"><code class="language-js"><span class="pln">    render</span><span class="pun">()</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L3"><code class="language-js"><span class="pln">        </span><span class="kwd">return</span><span class="pln"> </span><span class="pun">&lt;</span><span class="pln">div</span><span class="pun">&gt;{</span><span class="kwd">this</span><span class="pun">.</span><span class="pln">state</span><span class="pun">.</span><span class="pln">hello</span><span class="pun">}&lt;/</span><span class="pln">div</span><span class="pun">&gt;;</span></code></li><li class="L4"><code class="language-js"><span class="pln">    </span><span class="pun">}</span></code></li><li class="L5"><code class="language-js"><span class="pun">}</span></code></li></ol></pre>\
\
<p>否则的话，使用函数写法；</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-js"><span class="kwd">const</span><span class="pln"> </span><span class="typ">List</span><span class="pln"> </span><span class="pun">=</span><span class="pln"> </span><span class="pun">({</span><span class="pln"> hello </span><span class="pun">})</span><span class="pln"> </span><span class="pun">=&gt;</span><span class="pln"> </span><span class="pun">(</span></code></li><li class="L1"><code class="language-js"><span class="pln">    </span><span class="pun">&lt;</span><span class="pln">div</span><span class="pun">&gt;{</span><span class="pln">hello</span><span class="pun">}&lt;/</span><span class="pln">div</span><span class="pun">&gt;</span></code></li><li class="L2"><code class="language-js"><span class="pun">);</span></code></li></ol></pre>\
\
<p><strong>PropsType 和 DefaultProps 写法</strong></p>\
\
<p>如果有内部状态、方法或是要对外暴露ref的组件，使用<code>ES7</code>类静态属性写法； <br>\
JSX属性名使用驼峰式风格。 <br>\
如果属性值为true, 可以直接省略。</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-js"><span class="kwd">class</span><span class="pln"> </span><span class="typ">Button</span><span class="pln"> extends </span><span class="typ">Component</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L1"><code class="language-js"><span class="pln">    </span><span class="kwd">static</span><span class="pln"> propTypes </span><span class="pun">=</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L2"><code class="language-js"><span class="pln">        size</span><span class="pun">:</span><span class="pln"> </span><span class="typ">React</span><span class="pun">.</span><span class="typ">PropTypes</span><span class="pun">.</span><span class="pln">oneOf</span><span class="pun">([</span><span class="str">'large'</span><span class="pun">,</span><span class="pln"> </span><span class="str">'normal'</span><span class="pun">,</span><span class="pln"> </span><span class="str">'small'</span><span class="pun">]),</span></code></li><li class="L3"><code class="language-js"><span class="pln">        shape</span><span class="pun">:</span><span class="pln"> </span><span class="typ">React</span><span class="pun">.</span><span class="typ">PropTypes</span><span class="pun">.</span><span class="pln">oneOf</span><span class="pun">([</span><span class="str">'default'</span><span class="pun">,</span><span class="pln"> </span><span class="str">'primary'</span><span class="pun">,</span><span class="pln"> </span><span class="str">'ghost'</span><span class="pun">])</span></code></li><li class="L4"><code class="language-js"><span class="pln">        disabled</span><span class="pun">:</span><span class="pln"> </span><span class="typ">React</span><span class="pun">.</span><span class="typ">PropTypes</span><span class="pun">.</span><span class="pln">bool</span></code></li><li class="L5"><code class="language-js"><span class="pln">    </span><span class="pun">};</span></code></li><li class="L6"><code class="language-js"></code></li><li class="L7"><code class="language-js"><span class="pln">    </span><span class="kwd">static</span><span class="pln"> defaultProps </span><span class="pun">=</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L8"><code class="language-js"><span class="pln">        size</span><span class="pun">:</span><span class="pln"> </span><span class="str">'normal'</span><span class="pun">,</span></code></li><li class="L9"><code class="language-js"><span class="pln">        shape</span><span class="pun">:</span><span class="pln"> </span><span class="str">'default'</span><span class="pun">,</span></code></li><li class="L0"><code class="language-js"><span class="pln">        disabled</span><span class="pun">:</span><span class="pln"> </span><span class="kwd">false</span></code></li><li class="L1"><code class="language-js"><span class="pln">    </span><span class="pun">};</span></code></li><li class="L2"><code class="language-js"></code></li><li class="L3"><code class="language-js"><span class="pln">    render</span><span class="pun">()</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L4"><code class="language-js"><span class="pln">        </span><span class="com">// ....</span></code></li><li class="L5"><code class="language-js"><span class="pln">    </span><span class="pun">}</span></code></li><li class="L6"><code class="language-js"><span class="pun">}</span></code></li></ol></pre>\
\
<p>否则的话，使用类静态属性写法</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-js"><span class="kwd">const</span><span class="pln"> </span><span class="typ">HelloMessage</span><span class="pln"> </span><span class="pun">=</span><span class="pln"> </span><span class="pun">({</span><span class="pln"> name </span><span class="pun">})</span><span class="pln"> </span><span class="pun">=&gt;</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L1"><code class="language-js"><span class="pln">    </span><span class="kwd">return</span><span class="pln"> </span><span class="pun">&lt;</span><span class="pln">div</span><span class="pun">&gt;</span><span class="typ">Hello</span><span class="pln"> </span><span class="pun">{</span><span class="pln">name</span><span class="pun">}&lt;/</span><span class="pln">div</span><span class="pun">&gt;;</span></code></li><li class="L2"><code class="language-js"><span class="pun">};</span></code></li><li class="L3"><code class="language-js"></code></li><li class="L4"><code class="language-js"><span class="typ">HelloMessage</span><span class="pun">.</span><span class="pln">propTypes </span><span class="pun">=</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L5"><code class="language-js"><span class="pln">    name</span><span class="pun">:</span><span class="pln"> </span><span class="typ">React</span><span class="pun">.</span><span class="typ">PropTypes</span><span class="pun">.</span><span class="pln">string</span></code></li><li class="L6"><code class="language-js"><span class="pun">};</span></code></li><li class="L7"><code class="language-js"></code></li><li class="L8"><code class="language-js"><span class="typ">HelloMessage</span><span class="pun">.</span><span class="pln">defaultProps </span><span class="pun">=</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L9"><code class="language-js"><span class="pln">    name</span><span class="pun">:</span><span class="pln"> </span><span class="str">'vic'</span></code></li><li class="L0"><code class="language-js"><span class="pun">};</span></code></li></ol></pre>\
\
<p><strong>State 写法</strong></p>\
\
<p>使用ES7实例属性提案声明写法或者构造函数声明写法，后者适合需要进行一定计算后才能初始化state的情况。</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-js"><span class="kwd">class</span><span class="pln"> </span><span class="typ">Some</span><span class="pln"> extends </span><span class="typ">Component</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L1"><code class="language-js"><span class="pln">    state </span><span class="pun">=</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L2"><code class="language-js"><span class="pln">        foo</span><span class="pun">:</span><span class="pln"> </span><span class="str">'bar'</span></code></li><li class="L3"><code class="language-js"><span class="pln">    </span><span class="pun">};</span></code></li><li class="L4"><code class="language-js"><span class="pln">    </span><span class="com">// ....</span></code></li><li class="L5"><code class="language-js"><span class="pun">}</span></code></li><li class="L6"><code class="language-js"></code></li><li class="L7"><code class="language-js"><span class="kwd">class</span><span class="pln"> </span><span class="typ">Some</span><span class="pln"> extends </span><span class="typ">Component</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L8"><code class="language-js"><span class="pln">    constructor</span><span class="pun">(</span><span class="pln">props</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L9"><code class="language-js"><span class="pln">        super</span><span class="pun">(</span><span class="pln">props</span><span class="pun">);</span></code></li><li class="L0"><code class="language-js"><span class="pln">        </span><span class="kwd">this</span><span class="pun">.</span><span class="pln">state </span><span class="pun">=</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L1"><code class="language-js"><span class="pln">            foo</span><span class="pun">:</span><span class="pln"> </span><span class="str">'bar'</span></code></li><li class="L2"><code class="language-js"><span class="pln">        </span><span class="pun">};</span></code></li><li class="L3"><code class="language-js"><span class="pln">    </span><span class="pun">}</span></code></li><li class="L4"><code class="language-js"><span class="pln">    </span><span class="com">// ....</span></code></li><li class="L5"><code class="language-js"><span class="pun">}</span></code></li></ol></pre>\
\
<p><strong>函数绑定</strong></p>\
\
<p>在使用ES6编写React时，不会将方法内部的作用域自动绑定到组件的引用上。 <br>\
为此有以下几种写法仅供参考：</p>\
\
<p><strong>参考</strong></p>\
\
<ul>\
<li><a href="https://github.com/airbnb/javascript/tree/master/react" target="_blank">Airbnb React/JSX Style Guide</a></li>\
<li><a href="https://github.com/JasonBoy/javascript/tree/master/react" target="_blank">Airbnb React/JSX Style Guide 中文版</a></li>\
<li><a href="https://babeljs.io/blog/2015/06/07/react-on-es6-plus" target="_blank">React on ES6+</a></li>\
</ul>	目前React正在前端技术社区肆意蔓延着，如何更好的利用React的特性去服务，是需要考虑的重要问题之一。本文综合React及相关社区总结了一套关于React的“最佳”实践，仅供参考。	14	0	2017-01-08 00:41:49	2017-01-08 00:41:23	**整体结构**\
\
```js\
class List extends React.Component {\
    \
    static propTypes = {\
        size: React.PropTypes.oneOf(['large', 'normal', 'small']),\
        shape: React.PropTypes.oneOf(['default', 'primary', 'ghost'])\
        disabled: React.PropTypes.bool\
    };\
\
    static defaultProps = {\
        size: 'normal',\
        shape: 'default',\
        disabled: false\
    };\
    \
    constructor(props) {\
        super(props);\
        this.state = {\
            foo: 'bar'\
        };\
    }\
    \
    render() {\
        return <div>{this.state.foo}</div>;\
    }   \
}\
```\
\
**基础规范**\
\
- React组件文件使用`.jsx`扩展名；\
- 对外暴露的文件名使用`index`；\
- React组件名使用驼峰命名，首字母大写，实例名首字母小写；\
- 每个文件只写一个组件，但多个无状态组件可以放在一个文件中；\
\
**方法顺序**\
\
```js\
propTypes\
defaultProps\
constructor()\
getChildContext()\
componentWillMount()\
componentDidMount()\
componentWillReceiveProps()\
shouldComponentUpdate()\
componentWillUpdate()\
componentDidUpdate()\
componentWillUnmount()\
render()\
```\
\
**引号**\
\
JSX属性值使用双引号，其他均使用单引号；\
\
```js\
<Foo bar="bar" />\
<Foo style={{ left: '20px' }} />\
```\
\
**空格**\
\
- 总是在自闭合的标签`/>`前加一个空格；\
- 不要在JSX`{}`引用括号里两边加空格。\
\
```js\
<Foo />\
<Foo bar={baz} />\
```\
\
**括号**\
\
将多行的JSX标签写在`()`里；\
\
```js\
render() {\
    return (<MyComponent className="long body" foo="bar">\
        <MyChild />\
    </MyComponent>);\
}\
```\
\
**标签**\
\
对于没有子元素的标签来说总是闭合的；\
\
```\
<Foo className="stuff" />\
```\
\
**组件定义**\
\
如果有内部状态、方法或是要对外暴露ref的组件，使用`ES6 Class`写法；\
\
```js\
class List extends React.Component {\
    // ...\
    render() {\
        return <div>{this.state.hello}</div>;\
    }\
}\
```\
\
否则的话，使用函数写法；\
\
```js\
const List = ({ hello }) => (\
    <div>{hello}</div>\
);\
```\
\
**PropsType 和 DefaultProps 写法**\
\
如果有内部状态、方法或是要对外暴露ref的组件，使用`ES7`类静态属性写法；\
JSX属性名使用驼峰式风格。\
如果属性值为true, 可以直接省略。\
\
```js\
class Button extends Component {\
    static propTypes = {\
        size: React.PropTypes.oneOf(['large', 'normal', 'small']),\
        shape: React.PropTypes.oneOf(['default', 'primary', 'ghost'])\
        disabled: React.PropTypes.bool\
    };\
\
    static defaultProps = {\
        size: 'normal',\
        shape: 'default',\
        disabled: false\
    };\
\
    render() {\
        // ....\
    }\
}\
```\
\
否则的话，使用类静态属性写法\
\
```js\
const HelloMessage = ({ name }) => {\
    return <div>Hello {name}</div>;\
};\
\
HelloMessage.propTypes = {\
    name: React.PropTypes.string\
};\
\
HelloMessage.defaultProps = {\
    name: 'vic'\
};\
```\
\
**State 写法**\
\
使用ES7实例属性提案声明写法或者构造函数声明写法，后者适合需要进行一定计算后才能初始化state的情况。\
\
```js\
class Some extends Component {\
    state = {\
        foo: 'bar'\
    };\
    // ....\
}\
\
class Some extends Component {\
    constructor(props) {\
        super(props);\
        this.state = {\
            foo: 'bar'\
        };\
    }\
    // ....\
}\
```\
\
**函数绑定**\
\
在使用ES6编写React时，不会将方法内部的作用域自动绑定到组件的引用上。\
为此有以下几种写法仅供参考：\
\
**参考**\
\
- [Airbnb React/JSX Style Guide](https://github.com/airbnb/javascript/tree/master/react)\
- [Airbnb React/JSX Style Guide 中文版](https://github.com/JasonBoy/javascript/tree/master/react)\
- [React on ES6+](https://babeljs.io/blog/2015/06/07/react-on-es6-plus)\

36	0	RainDon	PPTP类型的VPN配置	pptp-vpn-centos	3	1		0	ImShengli	VPN				<div class="md-section-divider"></div>\
\
<blockquote class="white-blockquote">\
  <p>VPS可以使用 Digital Ocean，注册地址：<a href="https://m.do.co/c/191690191dcc" target="_blank">DigitalOcean官网</a>； <br>\
  本文基于Centos7配置，请留意； <br>\
  因为安全问题，MacOS新版已不默认支持PPTP类型的VPN，可参考：<a href="https://imshengli.com/post/2017/01/08/centos-l2tp-vpn.html" target="_blank">L2TP类型的VPN配置</a></p>\
</blockquote>\
\
<div class="md-section-divider"></div>\
\
<h3 id="yum-初始化">yum 初始化</h3>\
\
<p>在正式配置之前，先对系统环境进行一下升级；</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="com">// 更新yum</span></code></li><li class="L1"><code><span class="pln">yum </span><span class="pun">–</span><span class="pln">y undate</span></code></li><li class="L2"><code></code></li><li class="L3"><code><span class="com">// 安装程序/库</span></code></li><li class="L4"><code><span class="pln">yum </span><span class="pun">-</span><span class="pln">y install gcc gcc</span><span class="pun">-</span><span class="pln">c</span><span class="pun">++</span><span class="pln"> autoconf libjpeg libjpeg</span><span class="pun">-</span><span class="pln">devel libpng libpng</span><span class="pun">-</span><span class="pln">devel freetype freetype</span><span class="pun">-</span><span class="pln">devel libxml2 libxml2</span><span class="pun">-</span><span class="pln">devel zlib zlib</span><span class="pun">-</span><span class="pln">devel glibc glibc</span><span class="pun">-</span><span class="pln">devel glib2 glib2</span><span class="pun">-</span><span class="pln">devel bzip2 bzip2</span><span class="pun">-</span><span class="pln">devel ncurses ncurses</span><span class="pun">-</span><span class="pln">devel curl curl</span><span class="pun">-</span><span class="pln">devel e2fsprogs e2fsprogs</span><span class="pun">-</span><span class="pln">devel krb5 krb5</span><span class="pun">-</span><span class="pln">devel libidn libidn</span><span class="pun">-</span><span class="pln">devel openssl openssl</span><span class="pun">-</span><span class="pln">devel openldap openldap</span><span class="pun">-</span><span class="pln">devel nss_ldap openldap</span><span class="pun">-</span><span class="pln">clients openldap</span><span class="pun">-</span><span class="pln">servers</span></code></li><li class="L5"><code></code></li><li class="L6"><code><span class="com">// 安装libevent（事件触发的网络库），（memcached需要）</span></code></li><li class="L7"><code><span class="pln">yum </span><span class="pun">-</span><span class="pln">y install libevent libevent</span><span class="pun">-</span><span class="pln">devel</span></code></li><li class="L8"><code></code></li><li class="L9"><code><span class="com">// 列出已安装列表</span></code></li><li class="L0"><code><span class="pln">yum info installed</span></code></li><li class="L1"><code></code></li><li class="L2"><code><span class="com">// 移除已安装</span></code></li><li class="L3"><code><span class="pln">yum remove </span><span class="str">"tsclient"</span></code></li></ol></pre>\
\
<div class="md-section-divider"></div>\
\
<h3 id="安装和配置pptp">安装和配置PPTP</h3>\
\
<p><strong>检测是否可以安装PPTP</strong></p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="pln">cat </span><span class="pun">/</span><span class="pln">dev</span><span class="pun">/</span><span class="pln">ppp</span></code></li><li class="L1"><code><span class="com">// output: cat: /dev/ppp: No such device or address</span></code></li><li class="L2"><code><span class="pln">modprobe ppp</span><span class="pun">-</span><span class="pln">compress</span><span class="pun">-</span><span class="lit">18</span><span class="pln"> </span><span class="pun">&amp;&amp;</span><span class="pln"> echo ok</span></code></li><li class="L3"><code><span class="com">// output: ok</span></code></li><li class="L4"><code><span class="pln">cat </span><span class="pun">/</span><span class="pln">dev</span><span class="pun">/</span><span class="pln">net</span><span class="pun">/</span><span class="pln">tun</span></code></li><li class="L5"><code><span class="com">// output: cat: /dev/net/tun: File descriptor in bad state</span></code></li></ol></pre>\
\
<p><strong>安装PPTP</strong></p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="com">// 检查是否已安装 ppp iptables，如果没有，执行安装动作</span></code></li><li class="L1"><code><span class="pln">yum </span><span class="pun">-</span><span class="pln">y ppp iptables</span></code></li><li class="L2"><code><span class="com">// 检查是否已安装 pptpd，如果没有，执行安装动作</span></code></li><li class="L3"><code><span class="pln">yum </span><span class="pun">-</span><span class="pln">y install pptpd </span></code></li></ol></pre>\
\
<p><strong>配置 /etc/pptpd.conf</strong></p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="pln">localip </span><span class="lit">192.168</span><span class="pun">.</span><span class="lit">0.1</span></code></li><li class="L1"><code><span class="pln">remoteip </span><span class="lit">192.168</span><span class="pun">.</span><span class="lit">0.234</span><span class="pun">-</span><span class="lit">238</span><span class="pun">,</span><span class="lit">192.168</span><span class="pun">.</span><span class="lit">0.245</span></code></li><li class="L2"><code><span class="com"># 分配给客户端的ip就是234到238之间, 和245；</span></code></li></ol></pre>\
\
<p><strong>配置用户<code>/etc/ppp/chap-secrets</code></strong></p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="com"># client为帐号，server是pptpd服务，secret是密码，*表示是分配任意的ip</span></code></li><li class="L1"><code><span class="com"># Secrets for authentication using CHAP</span></code></li><li class="L2"><code><span class="com"># client        server     secret              IP addresses</span></code></li><li class="L3"><code><span class="pln">  jianning      pptpd      </span><span class="lit">12345678</span><span class="pln">            </span><span class="pun">*</span></code></li></ol></pre>\
\
<p><strong>配置DNS servers，<code>/etc/ppp/options.pptpd</code></strong></p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="com"># 在末尾添加dns</span></code></li><li class="L1"><code><span class="pln">ms</span><span class="pun">-</span><span class="pln">dns </span><span class="lit">8.8</span><span class="pun">.</span><span class="lit">8.8</span><span class="pln"> </span><span class="com">#这是谷歌的</span></code></li><li class="L2"><code><span class="pln">ms</span><span class="pun">-</span><span class="pln">dns </span><span class="lit">8.8</span><span class="pun">.</span><span class="lit">4.4</span></code></li></ol></pre>\
\
<p><strong>重启 PPTP</strong></p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="pln">service pptpd restart</span></code></li></ol></pre>\
\
<p><strong>验证可连接</strong></p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="pln">netstat </span><span class="pun">-</span><span class="pln">alpn </span><span class="pun">|</span><span class="pln"> grep </span><span class="pun">:</span><span class="lit">1723</span></code></li><li class="L1"><code><span class="com"># tcp        0      0 0.0.0.0:1723            0.0.0.0:*               LISTEN      31779/pptpd</span></code></li></ol></pre>\
\
<p>**设置转发<code>/etc/sysctl.conf</code> **</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="pln">net</span><span class="pun">.</span><span class="pln">ipv4</span><span class="pun">.</span><span class="pln">ip_forward </span><span class="pun">=</span><span class="pln"> </span><span class="lit">1</span><span class="pln">    </span></code></li><li class="L1"><code><span class="com">#运行这个命令会输出上面添加的那一行信息，意思是使内核修改生效</span></code></li><li class="L2"><code><span class="pln">sysctl </span><span class="pun">-</span><span class="pln">p</span></code></li></ol></pre>\
\
<p><strong>设置iptables转发规则，让客户端可以连接</strong></p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="pln">iptables </span><span class="pun">-</span><span class="pln">t nat </span><span class="pun">-</span><span class="pln">A POSTROUTING </span><span class="pun">-</span><span class="pln">o eth0 </span><span class="pun">-</span><span class="pln">j MASQUERADE </span><span class="pun">&amp;&amp;</span><span class="pln"> iptables</span><span class="pun">-</span><span class="pln">save</span></code></li><li class="L1"><code><span class="pln">iptables </span><span class="pun">--</span><span class="pln">table nat </span><span class="pun">--</span><span class="pln">append POSTROUTING </span><span class="pun">--</span><span class="kwd">out</span><span class="pun">-</span><span class="kwd">interface</span><span class="pln"> ppp0 </span><span class="pun">-</span><span class="pln">j MASQUERADE</span></code></li><li class="L2"><code><span class="pln">iptables </span><span class="pun">-</span><span class="pln">I INPUT </span><span class="pun">-</span><span class="pln">s </span><span class="lit">10.0</span><span class="pun">.</span><span class="lit">0.0</span><span class="pun">/</span><span class="lit">8</span><span class="pln"> </span><span class="pun">-</span><span class="pln">i ppp0 </span><span class="pun">-</span><span class="pln">j ACCEPT</span></code></li><li class="L3"><code><span class="pln">iptables </span><span class="pun">--</span><span class="pln">append FORWARD </span><span class="pun">--</span><span class="kwd">in</span><span class="pun">-</span><span class="kwd">interface</span><span class="pln"> eth0 </span><span class="pun">-</span><span class="pln">j ACCEPT</span></code></li></ol></pre>\
\
<div class="md-section-divider"></div>\
\
<h3 id="dns设置">DNS设置</h3>\
\
<p>国内的网站无需走VPN，这个利用<strong><a href="https://github.com/jimmyxu/chnroutes" target="_blank">chnroutes</a></strong>就好；</p>\
\
<p>Mac下的设置：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="com">// 1. 在终端中执行python chnroutes.py -p mac，这将生成ip-up和ip-down两个文件；</span></code></li><li class="L1"><code><span class="com">// 2. 将这两个文件移入/etc/ppp/；</span></code></li><li class="L2"><code><span class="com">// 3. 重新连接VPN，观察测试。</span></code></li></ol></pre>\
\
<div class="md-section-divider"></div>\
\
<h3 id="参考">参考</h3>\
\
<ul>\
<li><a href="https://www.digitalocean.com/community/tutorials/how-to-setup-your-own-vpn-with-pptp" target="_blank">How To Setup Your Own VPN With PPTP</a></li>\
<li><a href="https://my.oschina.net/110NotFound/blog/338080" target="_blank">Centos7搭建VPN服务器</a></li>\
<li><a href="https://ideas.spkcn.com/software/os/linux/277.html" target="_blank">CentOS安装配置pptpd的VPN</a></li>\
</ul>	科学上网很重要，本文基于CentOS7说明了PPTP类型的VPN的详细配置，VPS采用的Digital Ocean；针对国内网络无需走VPN，说明了如何配置DNS。	20	0	2017-01-08 20:47:00	2017-01-08 20:41:28	> VPS可以使用 Digital Ocean，注册地址：[DigitalOcean官网](https://m.do.co/c/191690191dcc)；\
> 本文基于Centos7配置，请留意；\
> 因为安全问题，MacOS新版已不默认支持PPTP类型的VPN，可参考：[L2TP类型的VPN配置](https://imshengli.com/post/2017/01/08/centos-l2tp-vpn.html)\
\
### yum 初始化\
\
在正式配置之前，先对系统环境进行一下升级；\
\
```\
// 更新yum\
yum –y undate\
\
// 安装程序/库\
yum -y install gcc gcc-c++ autoconf libjpeg libjpeg-devel libpng libpng-devel freetype freetype-devel libxml2 libxml2-devel zlib zlib-devel glibc glibc-devel glib2 glib2-devel bzip2 bzip2-devel ncurses ncurses-devel curl curl-devel e2fsprogs e2fsprogs-devel krb5 krb5-devel libidn libidn-devel openssl openssl-devel openldap openldap-devel nss_ldap openldap-clients openldap-servers\
\
// 安装libevent（事件触发的网络库），（memcached需要）\
yum -y install libevent libevent-devel\
\
// 列出已安装列表\
yum info installed\
\
// 移除已安装\
yum remove "tsclient"\
```\
\
### 安装和配置PPTP\
\
**检测是否可以安装PPTP**\
\
```\
cat /dev/ppp\
// output: cat: /dev/ppp: No such device or address\
modprobe ppp-compress-18 && echo ok\
// output: ok\
cat /dev/net/tun\
// output: cat: /dev/net/tun: File descriptor in bad state\
```\
\
**安装PPTP**\
\
```\
// 检查是否已安装 ppp iptables，如果没有，执行安装动作\
yum -y ppp iptables\
// 检查是否已安装 pptpd，如果没有，执行安装动作\
yum -y install pptpd \
```\
\
**配置 /etc/pptpd.conf**\
\
```\
localip 192.168.0.1\
remoteip 192.168.0.234-238,192.168.0.245\
# 分配给客户端的ip就是234到238之间, 和245；\
```\
\
**配置用户`/etc/ppp/chap-secrets`**\
\
```\
# client为帐号，server是pptpd服务，secret是密码，*表示是分配任意的ip\
# Secrets for authentication using CHAP\
# client        server     secret              IP addresses\
  jianning      pptpd      12345678            *\
```\
\
**配置DNS servers，`/etc/ppp/options.pptpd`**\
\
```\
# 在末尾添加dns\
ms-dns 8.8.8.8 #这是谷歌的\
ms-dns 8.8.4.4\
```\
\
**重启 PPTP**\
\
```\
service pptpd restart\
```\
\
**验证可连接**\
\
```\
netstat -alpn | grep :1723\
# tcp        0      0 0.0.0.0:1723            0.0.0.0:*               LISTEN      31779/pptpd\
```\
\
**设置转发`/etc/sysctl.conf` **\
\
```\
net.ipv4.ip_forward = 1    \
#运行这个命令会输出上面添加的那一行信息，意思是使内核修改生效\
sysctl -p\
```\
\
**设置iptables转发规则，让客户端可以连接**\
\
```\
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE && iptables-save\
iptables --table nat --append POSTROUTING --out-interface ppp0 -j MASQUERADE\
iptables -I INPUT -s 10.0.0.0/8 -i ppp0 -j ACCEPT\
iptables --append FORWARD --in-interface eth0 -j ACCEPT\
```\
\
### DNS设置\
\
国内的网站无需走VPN，这个利用**[chnroutes](https://github.com/jimmyxu/chnroutes)**就好；\
\
Mac下的设置：\
\
```\
// 1. 在终端中执行python chnroutes.py -p mac，这将生成ip-up和ip-down两个文件；\
// 2. 将这两个文件移入/etc/ppp/；\
// 3. 重新连接VPN，观察测试。\
```\
\
### 参考\
\
- [How To Setup Your Own VPN With PPTP](https://www.digitalocean.com/community/tutorials/how-to-setup-your-own-vpn-with-pptp)\
- [Centos7搭建VPN服务器](https://my.oschina.net/110NotFound/blog/338080)\
- [CentOS安装配置pptpd的VPN](https://ideas.spkcn.com/software/os/linux/277.html)\
\

37	0	RainDon	L2TP类型的VPN配置	centos-l2tp-vpn	3	1		0	ImShengli	VPN				<div class="md-section-divider"></div>\
\
<blockquote class="white-blockquote">\
  <p>VPS可以使用 Digital Ocean，注册地址：<a href="https://m.do.co/c/191690191dcc" target="_blank">DigitalOcean官网</a>； <br>\
  本文基于Centos7配置，请留意；</p>\
</blockquote>\
\
<div class="md-section-divider"></div>\
\
<h3 id="yum-初始化">yum 初始化</h3>\
\
<p>在正式配置之前，先对系统环境进行一下升级；</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="com">// 更新yum</span></code></li><li class="L1"><code><span class="pln">yum </span><span class="pun">–</span><span class="pln">y undate</span></code></li><li class="L2"><code></code></li><li class="L3"><code><span class="com">// 安装程序/库</span></code></li><li class="L4"><code><span class="pln">yum </span><span class="pun">-</span><span class="pln">y install gcc gcc</span><span class="pun">-</span><span class="pln">c</span><span class="pun">++</span><span class="pln"> autoconf libjpeg libjpeg</span><span class="pun">-</span><span class="pln">devel libpng libpng</span><span class="pun">-</span><span class="pln">devel freetype freetype</span><span class="pun">-</span><span class="pln">devel libxml2 libxml2</span><span class="pun">-</span><span class="pln">devel zlib zlib</span><span class="pun">-</span><span class="pln">devel glibc glibc</span><span class="pun">-</span><span class="pln">devel glib2 glib2</span><span class="pun">-</span><span class="pln">devel bzip2 bzip2</span><span class="pun">-</span><span class="pln">devel ncurses ncurses</span><span class="pun">-</span><span class="pln">devel curl curl</span><span class="pun">-</span><span class="pln">devel e2fsprogs e2fsprogs</span><span class="pun">-</span><span class="pln">devel krb5 krb5</span><span class="pun">-</span><span class="pln">devel libidn libidn</span><span class="pun">-</span><span class="pln">devel openssl openssl</span><span class="pun">-</span><span class="pln">devel openldap openldap</span><span class="pun">-</span><span class="pln">devel nss_ldap openldap</span><span class="pun">-</span><span class="pln">clients openldap</span><span class="pun">-</span><span class="pln">servers</span></code></li><li class="L5"><code></code></li><li class="L6"><code><span class="com">// 安装libevent（事件触发的网络库），（memcached需要）</span></code></li><li class="L7"><code><span class="pln">yum </span><span class="pun">-</span><span class="pln">y install libevent libevent</span><span class="pun">-</span><span class="pln">devel</span></code></li><li class="L8"><code></code></li><li class="L9"><code><span class="com">// 列出已安装列表</span></code></li><li class="L0"><code><span class="pln">yum info installed</span></code></li><li class="L1"><code></code></li><li class="L2"><code><span class="com">// 移除已安装</span></code></li><li class="L3"><code><span class="pln">yum remove </span><span class="str">"tsclient"</span></code></li></ol></pre>\
\
<div class="md-section-divider"></div>\
\
<h3 id="安装openswan-xltpd-配置ipsec">安装openswan xltpd 配置ipsec</h3>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="pln">yum install epel</span><span class="pun">-</span><span class="pln">release openswan </span><span class="pun">-</span><span class="pln">y</span></code></li><li class="L1"><code><span class="com">// xl2tpd必须放在下面单独安装，因为CentOS原本的yum源里面是没有xl2tpd的，要安装epel后才有；</span></code></li><li class="L2"><code><span class="pln">yum install xl2tpd</span></code></li></ol></pre>\
\
<p><strong>修改<code>ipsec.conf</code>配置文件</strong></p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="pln">vim </span><span class="pun">/</span><span class="pln">etc</span><span class="pun">/</span><span class="pln">ipsec</span><span class="pun">.</span><span class="pln">conf</span></code></li></ol></pre>\
\
<p>内容，可以直接用下面的替换，并用VPS实例的公网IP地址替换left=your.vps.ip.addr中的your.vps.ip.addr </p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="com"># /etc/ipsec.conf - Libreswan IPsec configuration file</span></code></li><li class="L1"><code><span class="com"># This file:  /etc/ipsec.conf</span></code></li><li class="L2"><code><span class="com">#</span></code></li><li class="L3"><code><span class="com"># Enable when using this configuration file with openswan instead of libreswan</span></code></li><li class="L4"><code><span class="com">#version 2</span></code></li><li class="L5"><code><span class="com">#</span></code></li><li class="L6"><code><span class="com"># Manual:     ipsec.conf.5</span></code></li><li class="L7"><code><span class="com"># basic configuration</span></code></li><li class="L8"><code><span class="pln">config setup</span></code></li><li class="L9"><code><span class="pln">    </span><span class="com"># NAT-TRAVERSAL support, see README.NAT-Traversal</span></code></li><li class="L0"><code><span class="pln">    nat_traversal</span><span class="pun">=</span><span class="pln">yes</span></code></li><li class="L1"><code><span class="pln">    </span><span class="com"># exclude networks used on server side by adding %v4:!a.b.c.0/24</span></code></li><li class="L2"><code><span class="pln">    virtual_private</span><span class="pun">=%</span><span class="pln">v4</span><span class="pun">:</span><span class="lit">10.0</span><span class="pun">.</span><span class="lit">0.0</span><span class="pun">/</span><span class="lit">8</span><span class="pun">,%</span><span class="pln">v4</span><span class="pun">:</span><span class="lit">192.168</span><span class="pun">.</span><span class="lit">0.0</span><span class="pun">/</span><span class="lit">16</span><span class="pun">,%</span><span class="pln">v4</span><span class="pun">:</span><span class="lit">172.16</span><span class="pun">.</span><span class="lit">0.0</span><span class="pun">/</span><span class="lit">12</span><span class="pun">,%</span><span class="pln">v4</span><span class="pun">:</span><span class="lit">25.0</span><span class="pun">.</span><span class="lit">0.0</span><span class="pun">/</span><span class="lit">8</span><span class="pun">,%</span><span class="pln">v4</span><span class="pun">:</span><span class="lit">100.64</span><span class="pun">.</span><span class="lit">0.0</span><span class="pun">/</span><span class="lit">10</span><span class="pun">,%</span><span class="pln">v6</span><span class="pun">:</span><span class="pln">fd00</span><span class="pun">::</span><span class="str">/8,%v6:fe80::/</span><span class="lit">10</span></code></li><li class="L3"><code><span class="pln">    </span><span class="com"># OE is now off by default. Uncomment and change to on, to enable.</span></code></li><li class="L4"><code><span class="pln">    oe</span><span class="pun">=</span><span class="pln">off</span></code></li><li class="L5"><code><span class="pln">    </span><span class="com"># which IPsec stack to use. auto will try netkey, then klips then mast</span></code></li><li class="L6"><code><span class="pln">    protostack</span><span class="pun">=</span><span class="pln">netkey</span></code></li><li class="L7"><code><span class="pln">    force_keepalive</span><span class="pun">=</span><span class="pln">yes</span></code></li><li class="L8"><code><span class="pln">    keep_alive</span><span class="pun">=</span><span class="lit">1800</span></code></li><li class="L9"><code><span class="pln">conn L2TP</span><span class="pun">-</span><span class="pln">PSK</span><span class="pun">-</span><span class="pln">NAT</span></code></li><li class="L0"><code><span class="pln">    rightsubnet</span><span class="pun">=</span><span class="pln">vhost</span><span class="pun">:%</span><span class="pln">priv</span></code></li><li class="L1"><code><span class="pln">    also</span><span class="pun">=</span><span class="pln">L2TP</span><span class="pun">-</span><span class="pln">PSK</span><span class="pun">-</span><span class="pln">noNAT</span></code></li><li class="L2"><code><span class="pln">conn L2TP</span><span class="pun">-</span><span class="pln">PSK</span><span class="pun">-</span><span class="pln">noNAT</span></code></li><li class="L3"><code><span class="pln">    authby</span><span class="pun">=</span><span class="pln">secret</span></code></li><li class="L4"><code><span class="pln">    pfs</span><span class="pun">=</span><span class="kwd">no</span></code></li><li class="L5"><code><span class="pln">    </span><span class="kwd">auto</span><span class="pun">=</span><span class="pln">add</span></code></li><li class="L6"><code><span class="pln">    keyingtries</span><span class="pun">=</span><span class="lit">3</span></code></li><li class="L7"><code><span class="pln">    rekey</span><span class="pun">=</span><span class="kwd">no</span></code></li><li class="L8"><code><span class="pln">    ikelifetime</span><span class="pun">=</span><span class="lit">8h</span></code></li><li class="L9"><code><span class="pln">    keylife</span><span class="pun">=</span><span class="lit">1h</span></code></li><li class="L0"><code><span class="pln">    type</span><span class="pun">=</span><span class="pln">transport</span></code></li><li class="L1"><code><span class="pln">    left</span><span class="pun">=</span><span class="pln">your</span><span class="pun">.</span><span class="pln">vps</span><span class="pun">.</span><span class="pln">ip</span><span class="pun">.</span><span class="pln">addr </span></code></li><li class="L2"><code><span class="pln">    leftprotoport</span><span class="pun">=</span><span class="lit">17</span><span class="pun">/</span><span class="lit">1701</span></code></li><li class="L3"><code><span class="pln">    right</span><span class="pun">=%</span><span class="pln">any</span></code></li><li class="L4"><code><span class="pln">    rightprotoport</span><span class="pun">=</span><span class="lit">17</span><span class="pun">/%</span><span class="pln">any</span></code></li><li class="L5"><code><span class="pln">    dpddelay</span><span class="pun">=</span><span class="lit">40</span></code></li><li class="L6"><code><span class="pln">    dpdtimeout</span><span class="pun">=</span><span class="lit">130</span></code></li><li class="L7"><code><span class="pln">    dpdaction</span><span class="pun">=</span><span class="pln">clear</span></code></li><li class="L8"><code><span class="com"># For example connections, see your distribution's documentation directory,</span></code></li><li class="L9"><code><span class="com"># or the documentation which could be located at</span></code></li><li class="L0"><code><span class="com">#  /usr/share/docs/libreswan-3.*/ or look at https://www.libreswan.org/</span></code></li><li class="L1"><code><span class="com">#</span></code></li><li class="L2"><code><span class="com"># There is also a lot of information in the manual page, "man ipsec.conf"</span></code></li><li class="L3"><code><span class="com"># You may put your configuration (.conf) file in the "/etc/ipsec.d/" directory</span></code></li><li class="L4"><code><span class="com"># by uncommenting this line</span></code></li><li class="L5"><code><span class="com">#include</span><span class="pln"> </span><span class="pun">/</span><span class="pln">etc</span><span class="pun">/</span><span class="pln">ipsec</span><span class="pun">.</span><span class="pln">d</span><span class="com">/*.conf</span></code></li></ol></pre>\
\
<p><strong>设置预共享密钥</strong></p>\
\
<p>修改ipsec.secrets配置文件</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="pln">vim </span><span class="pun">/</span><span class="pln">etc</span><span class="pun">/</span><span class="pln">ipsec</span><span class="pun">.</span><span class="pln">secrets</span></code></li><li class="L1"><code><span class="com">// 增加一行</span></code></li><li class="L2"><code><span class="com">// 公网IP地址替换 your.vps.ip.addr，用自己设定的密码替换your.pre_shared_key </span></code></li><li class="L3"><code><span class="pln">your</span><span class="pun">.</span><span class="pln">vps</span><span class="pun">.</span><span class="pln">ip</span><span class="pun">.</span><span class="pln">addr </span><span class="pun">%</span><span class="pln">any</span><span class="pun">:</span><span class="pln"> PSK </span><span class="str">"your.pre_shared_key"</span></code></li></ol></pre>\
\
<p><strong>修改<code>sysctl.conf</code>配置文件</strong></p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="com">// 添加如下内容：</span></code></li><li class="L1"><code><span class="pln">net</span><span class="pun">.</span><span class="pln">ipv4</span><span class="pun">.</span><span class="pln">ip_forward </span><span class="pun">=</span><span class="pln"> </span><span class="lit">1</span></code></li><li class="L2"><code><span class="pln">net</span><span class="pun">.</span><span class="pln">ipv4</span><span class="pun">.</span><span class="pln">conf</span><span class="pun">.</span><span class="pln">all</span><span class="pun">.</span><span class="pln">rp_filter </span><span class="pun">=</span><span class="pln"> </span><span class="lit">0</span></code></li><li class="L3"><code><span class="pln">net</span><span class="pun">.</span><span class="pln">ipv4</span><span class="pun">.</span><span class="pln">conf</span><span class="pun">.</span><span class="kwd">default</span><span class="pun">.</span><span class="pln">rp_filter </span><span class="pun">=</span><span class="pln"> </span><span class="lit">0</span></code></li><li class="L4"><code><span class="pln">net</span><span class="pun">.</span><span class="pln">ipv4</span><span class="pun">.</span><span class="pln">conf</span><span class="pun">.</span><span class="pln">eth0</span><span class="pun">.</span><span class="pln">rp_filter </span><span class="pun">=</span><span class="pln"> </span><span class="lit">0</span></code></li><li class="L5"><code><span class="pln">net</span><span class="pun">.</span><span class="pln">ipv4</span><span class="pun">.</span><span class="pln">conf</span><span class="pun">.</span><span class="pln">eth1</span><span class="pun">.</span><span class="pln">rp_filter </span><span class="pun">=</span><span class="pln"> </span><span class="lit">0</span></code></li><li class="L6"><code><span class="pln">net</span><span class="pun">.</span><span class="pln">ipv4</span><span class="pun">.</span><span class="pln">conf</span><span class="pun">.</span><span class="pln">all</span><span class="pun">.</span><span class="pln">send_redirects </span><span class="pun">=</span><span class="pln"> </span><span class="lit">0</span></code></li><li class="L7"><code><span class="pln">net</span><span class="pun">.</span><span class="pln">ipv4</span><span class="pun">.</span><span class="pln">conf</span><span class="pun">.</span><span class="kwd">default</span><span class="pun">.</span><span class="pln">send_redirects </span><span class="pun">=</span><span class="pln"> </span><span class="lit">0</span></code></li><li class="L8"><code><span class="pln">net</span><span class="pun">.</span><span class="pln">ipv4</span><span class="pun">.</span><span class="pln">conf</span><span class="pun">.</span><span class="pln">all</span><span class="pun">.</span><span class="pln">accept_redirects </span><span class="pun">=</span><span class="pln"> </span><span class="lit">0</span></code></li><li class="L9"><code><span class="pln">net</span><span class="pun">.</span><span class="pln">ipv4</span><span class="pun">.</span><span class="pln">conf</span><span class="pun">.</span><span class="kwd">default</span><span class="pun">.</span><span class="pln">accept_redirects </span><span class="pun">=</span><span class="pln"> </span><span class="lit">0</span></code></li></ol></pre>\
\
<p>此时执行：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="kwd">for</span><span class="pln"> each </span><span class="kwd">in</span><span class="pln"> </span><span class="pun">/</span><span class="pln">proc</span><span class="pun">/</span><span class="pln">sys</span><span class="pun">/</span><span class="pln">net</span><span class="pun">/</span><span class="pln">ipv4</span><span class="pun">/</span><span class="pln">conf</span><span class="com">/*; do cat $each/accept_redirects; cat $each/send_redirects; done</span></code></li><li class="L1"><code><span class="com">// 输出中有0和1；</span></code></li></ol></pre>\
\
<p>创建脚本修改/proc/sys/net/ipv4/conf/中的内容，脚本名为：modify.sh</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="com">// modify.sh</span></code></li><li class="L1"><code><span class="kwd">for</span><span class="pln"> each </span><span class="kwd">in</span><span class="pln"> </span><span class="pun">/</span><span class="pln">proc</span><span class="pun">/</span><span class="pln">sys</span><span class="pun">/</span><span class="pln">net</span><span class="pun">/</span><span class="pln">ipv4</span><span class="pun">/</span><span class="pln">conf</span><span class="com">/*</span></code></li><li class="L2"><code><span class="com">do</span></code></li><li class="L3"><code><span class="com">    echo 0 &gt; $each/accept_redirects</span></code></li><li class="L4"><code><span class="com">    echo 0 &gt; $each/send_redirects</span></code></li><li class="L5"><code><span class="com">done</span></code></li><li class="L6"><code><span class="com">// 保存执行</span></code></li><li class="L7"><code><span class="com">sh modify.sh</span></code></li></ol></pre>\
\
<p>再次执行：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="kwd">for</span><span class="pln"> each </span><span class="kwd">in</span><span class="pln"> </span><span class="pun">/</span><span class="pln">proc</span><span class="pun">/</span><span class="pln">sys</span><span class="pun">/</span><span class="pln">net</span><span class="pun">/</span><span class="pln">ipv4</span><span class="pun">/</span><span class="pln">conf</span><span class="com">/*; do cat $each/accept_redirects; cat $each/send_redirects; done</span></code></li><li class="L1"><code><span class="com">// 输出中只有0；</span></code></li></ol></pre>\
\
<p><strong>重启ipsec</strong></p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="pln">systemctl restart ipsec</span></code></li></ol></pre>\
\
<p><strong>检验ipsec的配置</strong></p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="pln">ipsec verify</span></code></li></ol></pre>\
\
<p><strong>验证</strong></p>\
\
<p>此时系统的输出如果是这样就说明到此为止都是正确的；</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="typ">Verifying</span><span class="pln"> installed system </span><span class="kwd">and</span><span class="pln"> configuration files</span></code></li><li class="L1"><code></code></li><li class="L2"><code><span class="typ">Version</span><span class="pln"> check </span><span class="kwd">and</span><span class="pln"> ipsec on</span><span class="pun">-</span><span class="pln">path </span><span class="pun">[</span><span class="pln">OK</span><span class="pun">]</span></code></li><li class="L3"><code><span class="typ">Libreswan</span><span class="pln"> </span><span class="lit">3.15</span><span class="pln"> </span><span class="pun">(</span><span class="pln">netkey</span><span class="pun">)</span><span class="pln"> on </span><span class="lit">3.10</span><span class="pun">.</span><span class="lit">0</span><span class="pun">-</span><span class="lit">327.28</span><span class="pun">.</span><span class="lit">3.el7.x86</span><span class="pln">_64</span></code></li><li class="L4"><code><span class="typ">Checking</span><span class="pln"> </span><span class="kwd">for</span><span class="pln"> </span><span class="typ">IPsec</span><span class="pln"> support </span><span class="kwd">in</span><span class="pln"> kernel </span><span class="pun">[</span><span class="pln">OK</span><span class="pun">]</span></code></li><li class="L5"><code><span class="pln">　NETKEY</span><span class="pun">:</span><span class="pln"> </span><span class="typ">Testing</span><span class="pln"> XFRM related proc values</span></code></li><li class="L6"><code><span class="pln">　　　　ICMP </span><span class="kwd">default</span><span class="pun">/</span><span class="pln">send_redirects </span><span class="pun">[</span><span class="pln">OK</span><span class="pun">]</span></code></li><li class="L7"><code><span class="pln">　　　　ICMP </span><span class="kwd">default</span><span class="pun">/</span><span class="pln">accept_redirects </span><span class="pun">[</span><span class="pln">OK</span><span class="pun">]</span></code></li><li class="L8"><code><span class="pln">　　　　XFRM larval drop </span><span class="pun">[</span><span class="pln">OK</span><span class="pun">]</span></code></li><li class="L9"><code><span class="typ">Pluto</span><span class="pln"> ipsec</span><span class="pun">.</span><span class="pln">conf syntax </span><span class="pun">[</span><span class="pln">OK</span><span class="pun">]</span></code></li><li class="L0"><code><span class="typ">Hardware</span><span class="pln"> random device </span><span class="pun">[</span><span class="pln">N</span><span class="pun">/</span><span class="pln">A</span><span class="pun">]</span></code></li><li class="L1"><code><span class="typ">Two</span><span class="pln"> </span><span class="kwd">or</span><span class="pln"> more interfaces found</span><span class="pun">,</span><span class="pln"> checking IP forwarding </span><span class="pun">[</span><span class="pln">OK</span><span class="pun">]</span></code></li><li class="L2"><code><span class="typ">Checking</span><span class="pln"> rp_filter </span><span class="pun">[</span><span class="pln">OK</span><span class="pun">]</span></code></li><li class="L3"><code><span class="typ">Checking</span><span class="pln"> that pluto </span><span class="kwd">is</span><span class="pln"> running </span><span class="pun">[</span><span class="pln">OK</span><span class="pun">]</span></code></li><li class="L4"><code><span class="typ">Pluto</span><span class="pln"> listening </span><span class="kwd">for</span><span class="pln"> IKE on udp </span><span class="lit">500</span><span class="pln"> </span><span class="pun">[</span><span class="pln">OK</span><span class="pun">]</span></code></li><li class="L5"><code><span class="typ">Pluto</span><span class="pln"> listening </span><span class="kwd">for</span><span class="pln"> IKE</span><span class="pun">/</span><span class="pln">NAT</span><span class="pun">-</span><span class="pln">T on udp </span><span class="lit">4500</span><span class="pln"> </span><span class="pun">[</span><span class="pln">OK</span><span class="pun">]</span></code></li><li class="L6"><code><span class="typ">Pluto</span><span class="pln"> ipsec</span><span class="pun">.</span><span class="pln">secret syntax </span><span class="pun">[</span><span class="pln">OK</span><span class="pun">]</span></code></li><li class="L7"><code><span class="typ">Checking</span><span class="pln"> </span><span class="str">'ip'</span><span class="pln"> command </span><span class="pun">[</span><span class="pln">OK</span><span class="pun">]</span></code></li><li class="L8"><code><span class="typ">Checking</span><span class="pln"> </span><span class="str">'iptables'</span><span class="pln"> command </span><span class="pun">[</span><span class="pln">OK</span><span class="pun">]</span></code></li><li class="L9"><code><span class="typ">Checking</span><span class="pln"> </span><span class="str">'prelink'</span><span class="pln"> command does </span><span class="kwd">not</span><span class="pln"> interfere </span><span class="kwd">with</span><span class="pln"> </span><span class="typ">FIPSChecking</span><span class="pln"> </span><span class="kwd">for</span><span class="pln"> obsolete </span><span class="pun">&gt;</span><span class="pln"> ipsec</span><span class="pun">.</span><span class="pln">conf options </span><span class="pun">[</span><span class="pln">OK</span><span class="pun">]</span></code></li><li class="L0"><code><span class="typ">Opportunistic</span><span class="pln"> </span><span class="typ">Encryption</span><span class="pln"> </span><span class="pun">[</span><span class="pln">DISABLED</span><span class="pun">]</span></code></li></ol></pre>\
\
<p>如果看到下面这样的输出</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="typ">Checking</span><span class="pln"> rp_filter </span><span class="pun">[</span><span class="pln">ENABLED</span><span class="pun">]</span></code></li><li class="L1"><code><span class="pun">/</span><span class="pln">proc</span><span class="pun">/</span><span class="pln">sys</span><span class="pun">/</span><span class="pln">net</span><span class="pun">/</span><span class="pln">ipv4</span><span class="pun">/</span><span class="pln">conf</span><span class="pun">/</span><span class="pln">eth0</span><span class="pun">/</span><span class="pln">rp_filter </span><span class="pun">[</span><span class="pln">ENABLED</span><span class="pun">]</span></code></li><li class="L2"><code><span class="pun">/</span><span class="pln">proc</span><span class="pun">/</span><span class="pln">sys</span><span class="pun">/</span><span class="pln">net</span><span class="pun">/</span><span class="pln">ipv4</span><span class="pun">/</span><span class="pln">conf</span><span class="pun">/</span><span class="pln">eth1</span><span class="pun">/</span><span class="pln">rp_filter </span><span class="pun">[</span><span class="pln">ENABLED</span><span class="pun">]</span></code></li></ol></pre>\
\
<p>那么就根据提供的路径，修改文件的内容为0</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="pln">sh </span><span class="pun">-</span><span class="pln">c </span><span class="str">"echo 0 &gt; /proc/sys/net/ipv4/conf/eth0/rp_filter"</span></code></li></ol></pre>\
\
<p>再次重启ipsec和验证</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="pln">systemctl restart ipsec </span></code></li><li class="L1"><code><span class="pln">ipsec verify</span></code></li></ol></pre>\
\
<p><strong>配置VPN登陆的账号和密码</strong></p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="com">// vim /etc/ppp/chap-secrets</span></code></li><li class="L1"><code></code></li><li class="L2"><code><span class="com">// account为要设置的账号，password为要设置的密码</span></code></li><li class="L3"><code><span class="com"># Secrets for authentication using CHAP</span></code></li><li class="L4"><code><span class="com"># client          server     secret               IP addresses</span></code></li><li class="L5"><code><span class="pln">  account         l2tpd      your</span><span class="pun">.</span><span class="pln">password        </span><span class="pun">*</span></code></li></ol></pre>\
\
<p><strong>测试</strong></p>\
\
<p>到这里我们已经完成一部分了，可以测试一下到此为止是否一切顺利。</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="com">// 在PC上设置VPN进行验证，Mac和Window都有对应的设置，可自行百度；</span></code></li></ol></pre>\
\
<p>保存配置并连接，此时还是连不上的，但是服务器端我们可以查看连接日志</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="pln">vim </span><span class="pun">/</span><span class="kwd">var</span><span class="pun">/</span><span class="pln">log</span><span class="pun">/</span><span class="pln">secure</span></code></li><li class="L1"><code></code></li><li class="L2"><code><span class="com">// 在打开的日志文件中搜索 IPsec SA established 或 IPSec connection established </span></code></li><li class="L3"><code><span class="com">// 如果能搜索到这样的字样，则说明到此为止一切顺利。</span></code></li></ol></pre>\
\
<div class="md-section-divider"></div>\
\
<h3 id="安装和配置xl2tp">安装和配置<code>xl2tp</code></h3>\
\
<p><strong>安装</strong></p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="pln">yum install xl2tpd </span></code></li></ol></pre>\
\
<p><strong>配置<code>/etc/xl2tpd/xl2tpd.conf</code></strong></p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="pun">;</span></code></li><li class="L1"><code><span class="pun">;</span><span class="pln"> </span><span class="typ">This</span><span class="pln"> </span><span class="kwd">is</span><span class="pln"> a minimal sample xl2tpd configuration file </span><span class="kwd">for</span><span class="pln"> </span><span class="kwd">use</span></code></li><li class="L2"><code><span class="pun">;</span><span class="pln"> </span><span class="kwd">with</span><span class="pln"> L2TP over </span><span class="typ">IPsec</span><span class="pun">.</span></code></li><li class="L3"><code><span class="pun">;</span></code></li><li class="L4"><code><span class="pun">;</span><span class="pln"> </span><span class="typ">The</span><span class="pln"> idea </span><span class="kwd">is</span><span class="pln"> to provide an L2TP daemon to which remote </span><span class="typ">Windows</span><span class="pln"> L2TP</span><span class="pun">/</span><span class="typ">IPsec</span></code></li><li class="L5"><code><span class="pun">;</span><span class="pln"> clients connect</span><span class="pun">.</span><span class="pln"> </span><span class="typ">In</span><span class="pln"> </span><span class="kwd">this</span><span class="pln"> example</span><span class="pun">,</span><span class="pln"> the </span><span class="kwd">internal</span><span class="pln"> </span><span class="pun">(</span><span class="kwd">protected</span><span class="pun">)</span><span class="pln"> network</span></code></li><li class="L6"><code><span class="pun">;</span><span class="pln"> </span><span class="kwd">is</span><span class="pln"> </span><span class="lit">192.168</span><span class="pun">.</span><span class="lit">1.0</span><span class="pun">/</span><span class="lit">24.</span><span class="pln">  A special IP range within </span><span class="kwd">this</span><span class="pln"> network </span><span class="kwd">is</span><span class="pln"> reserved</span></code></li><li class="L7"><code><span class="pun">;</span><span class="pln"> </span><span class="kwd">for</span><span class="pln"> the remote clients</span><span class="pun">:</span><span class="pln"> </span><span class="lit">192.168</span><span class="pun">.</span><span class="lit">1.128</span><span class="pun">/</span><span class="lit">25</span></code></li><li class="L8"><code><span class="pun">;</span><span class="pln"> </span><span class="pun">(</span><span class="pln">i</span><span class="pun">.</span><span class="pln">e</span><span class="pun">.</span><span class="pln"> </span><span class="lit">192.168</span><span class="pun">.</span><span class="lit">1.128</span><span class="pln"> </span><span class="pun">...</span><span class="pln"> </span><span class="lit">192.168</span><span class="pun">.</span><span class="lit">1.254</span><span class="pun">)</span></code></li><li class="L9"><code><span class="pun">;</span></code></li><li class="L0"><code><span class="pun">;</span><span class="pln"> </span><span class="typ">The</span><span class="pln"> listen</span><span class="pun">-</span><span class="pln">addr parameter can be used </span><span class="kwd">if</span><span class="pln"> you want to bind the L2TP daemon</span></code></li><li class="L1"><code><span class="pun">;</span><span class="pln"> to a specific IP address instead of to all interfaces</span><span class="pun">.</span><span class="pln"> </span><span class="typ">For</span><span class="pln"> instance</span><span class="pun">,</span></code></li><li class="L2"><code><span class="pun">;</span><span class="pln"> you could bind it to the </span><span class="kwd">interface</span><span class="pln"> of the </span><span class="kwd">internal</span><span class="pln"> LAN </span><span class="pun">(</span><span class="pln">e</span><span class="pun">.</span><span class="pln">g</span><span class="pun">.</span><span class="pln"> </span><span class="lit">192.168</span><span class="pun">.</span><span class="lit">1.98</span></code></li><li class="L3"><code><span class="pun">;</span><span class="pln"> </span><span class="kwd">in</span><span class="pln"> the example below</span><span class="pun">).</span><span class="pln"> </span><span class="typ">Yet</span><span class="pln"> another IP address </span><span class="pun">(</span><span class="kwd">local</span><span class="pln"> ip</span><span class="pun">,</span><span class="pln"> e</span><span class="pun">.</span><span class="pln">g</span><span class="pun">.</span><span class="pln"> </span><span class="lit">192.168</span><span class="pun">.</span><span class="lit">1.99</span><span class="pun">)</span></code></li><li class="L4"><code><span class="pun">;</span><span class="pln"> will be used </span><span class="kwd">by</span><span class="pln"> xl2tpd </span><span class="kwd">as</span><span class="pln"> its address on pppX interfaces</span><span class="pun">.</span></code></li><li class="L5"><code></code></li><li class="L6"><code><span class="pun">[</span><span class="kwd">global</span><span class="pun">]</span></code></li><li class="L7"><code><span class="pun">;</span><span class="pln"> listen</span><span class="pun">-</span><span class="pln">addr </span><span class="pun">=</span><span class="pln"> </span><span class="lit">192.168</span><span class="pun">.</span><span class="lit">1.98</span></code></li><li class="L8"><code><span class="pun">;</span></code></li><li class="L9"><code><span class="pun">;</span><span class="pln"> requires openswan</span><span class="pun">-</span><span class="lit">2.5</span><span class="pun">.</span><span class="lit">18</span><span class="pln"> </span><span class="kwd">or</span><span class="pln"> higher </span><span class="pun">-</span><span class="pln"> </span><span class="typ">Also</span><span class="pln"> does </span><span class="kwd">not</span><span class="pln"> yet work </span><span class="kwd">in</span><span class="pln"> combination</span></code></li><li class="L0"><code><span class="pun">;</span><span class="pln"> </span><span class="kwd">with</span><span class="pln"> kernel mode l2tp </span><span class="kwd">as</span><span class="pln"> present </span><span class="kwd">in</span><span class="pln"> linux </span><span class="lit">2.6</span><span class="pun">.</span><span class="lit">23</span><span class="pun">+</span></code></li><li class="L1"><code><span class="pun">;</span><span class="pln"> ipsec saref </span><span class="pun">=</span><span class="pln"> yes</span></code></li><li class="L2"><code><span class="pun">;</span><span class="pln"> </span><span class="typ">Use</span><span class="pln"> refinfo of </span><span class="lit">22</span><span class="pln"> </span><span class="kwd">if</span><span class="pln"> </span><span class="kwd">using</span><span class="pln"> an </span><span class="typ">SAref</span><span class="pln"> kernel patch based on openswan </span><span class="lit">2.6</span><span class="pun">.</span><span class="lit">35</span><span class="pln"> </span><span class="kwd">or</span></code></li><li class="L3"><code><span class="pun">;</span><span class="pln">  </span><span class="kwd">when</span><span class="pln"> </span><span class="kwd">using</span><span class="pln"> any of the </span><span class="typ">SAref</span><span class="pln"> kernel patches </span><span class="kwd">for</span><span class="pln"> kernels up to </span><span class="lit">2.6</span><span class="pun">.</span><span class="lit">35.</span></code></li><li class="L4"><code><span class="pun">;</span><span class="pln"> saref refinfo </span><span class="pun">=</span><span class="pln"> </span><span class="lit">30</span></code></li><li class="L5"><code><span class="pun">;</span></code></li><li class="L6"><code><span class="pun">;</span><span class="pln"> force userspace </span><span class="pun">=</span><span class="pln"> yes</span></code></li><li class="L7"><code><span class="pun">;</span></code></li><li class="L8"><code><span class="pun">;</span><span class="pln"> debug tunnel </span><span class="pun">=</span><span class="pln"> yes</span></code></li><li class="L9"><code><span class="pln">ipsec saref </span><span class="pun">=</span><span class="pln"> yes</span></code></li><li class="L0"><code></code></li><li class="L1"><code><span class="pun">[</span><span class="pln">lns </span><span class="kwd">default</span><span class="pun">]</span></code></li><li class="L2"><code><span class="pln">ip range </span><span class="pun">=</span><span class="pln"> </span><span class="lit">192.168</span><span class="pun">.</span><span class="lit">1.128</span><span class="pun">-</span><span class="lit">192.168</span><span class="pun">.</span><span class="lit">1.254</span></code></li><li class="L3"><code><span class="kwd">local</span><span class="pln"> ip </span><span class="pun">=</span><span class="pln"> </span><span class="lit">192.168</span><span class="pun">.</span><span class="lit">1.99</span></code></li><li class="L4"><code><span class="kwd">require</span><span class="pln"> chap </span><span class="pun">=</span><span class="pln"> yes</span></code></li><li class="L5"><code><span class="pln">refuse pap </span><span class="pun">=</span><span class="pln"> yes</span></code></li><li class="L6"><code><span class="kwd">require</span><span class="pln"> authentication </span><span class="pun">=</span><span class="pln"> yes</span></code></li><li class="L7"><code><span class="pln">name </span><span class="pun">=</span><span class="pln"> </span><span class="typ">LinuxVPNserver</span></code></li><li class="L8"><code><span class="pln">ppp debug </span><span class="pun">=</span><span class="pln"> yes</span></code></li><li class="L9"><code><span class="pln">pppoptfile </span><span class="pun">=</span><span class="pln"> </span><span class="str">/etc/</span><span class="pln">ppp</span><span class="pun">/</span><span class="pln">options</span><span class="pun">.</span><span class="pln">xl2tpd</span></code></li><li class="L0"><code><span class="pln">length bit </span><span class="pun">=</span><span class="pln"> yes</span></code></li></ol></pre>\
\
<p><strong>配置<code>/etc/ppp/options.xl2tpd</code></strong></p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="pln">ipcp</span><span class="pun">-</span><span class="pln">accept</span><span class="pun">-</span><span class="kwd">local</span></code></li><li class="L1"><code><span class="pln">ipcp</span><span class="pun">-</span><span class="pln">accept</span><span class="pun">-</span><span class="pln">remote</span></code></li><li class="L2"><code><span class="kwd">require</span><span class="pun">-</span><span class="pln">mschap</span><span class="pun">-</span><span class="pln">v2</span></code></li><li class="L3"><code><span class="pln">ms</span><span class="pun">-</span><span class="pln">dns  </span><span class="lit">8.8</span><span class="pun">.</span><span class="lit">8.8</span></code></li><li class="L4"><code><span class="pln">ms</span><span class="pun">-</span><span class="pln">dns  </span><span class="lit">8.8</span><span class="pun">.</span><span class="lit">4.4</span></code></li><li class="L5"><code><span class="com"># ms-dns  192.168.1.1</span></code></li><li class="L6"><code><span class="com"># ms-dns  192.168.1.3</span></code></li><li class="L7"><code><span class="com"># ms-wins 192.168.1.2</span></code></li><li class="L8"><code><span class="com"># ms-wins 192.168.1.4</span></code></li><li class="L9"><code><span class="pln">asyncmap </span><span class="lit">0</span></code></li><li class="L0"><code><span class="pln">noccp</span></code></li><li class="L1"><code><span class="pln">auth</span></code></li><li class="L2"><code><span class="pln">crtscts</span></code></li><li class="L3"><code><span class="pln">idle </span><span class="lit">1800</span></code></li><li class="L4"><code><span class="pln">mtu </span><span class="lit">1410</span></code></li><li class="L5"><code><span class="pln">mru </span><span class="lit">1410</span></code></li><li class="L6"><code><span class="pln">nodefaultroute</span></code></li><li class="L7"><code><span class="pln">hide</span><span class="pun">-</span><span class="pln">password</span></code></li><li class="L8"><code><span class="pln">debug</span></code></li><li class="L9"><code><span class="kwd">lock</span></code></li><li class="L0"><code><span class="pln">name l2tpd</span></code></li><li class="L1"><code><span class="pln">proxyarp</span></code></li><li class="L2"><code><span class="pln">lcp</span><span class="pun">-</span><span class="pln">echo</span><span class="pun">-</span><span class="pln">interval </span><span class="lit">30</span></code></li><li class="L3"><code><span class="pln">lcp</span><span class="pun">-</span><span class="pln">echo</span><span class="pun">-</span><span class="pln">failure </span><span class="lit">4</span></code></li><li class="L4"><code><span class="pln">connect</span><span class="pun">-</span><span class="pln">delay </span><span class="lit">5000</span></code></li><li class="L5"><code><span class="com"># To allow authentication against a Windows domain EXAMPLE, and require the</span></code></li><li class="L6"><code><span class="com"># user to be in a group "VPN Users". Requires the samba-winbind package</span></code></li><li class="L7"><code><span class="com"># require-mschap-v2</span></code></li><li class="L8"><code><span class="com"># plugin winbind.so</span></code></li><li class="L9"><code><span class="com"># ntlm_auth-helper '/usr/bin/ntlm_auth --helper-protocol=ntlm-server-1 --require-membership-of="EXAMPLE\\VPN Users"'</span></code></li><li class="L0"><code><span class="com"># You need to join the domain on the server, for example using samba:</span></code></li><li class="L1"><code><span class="com"># http://rootmanager.com/ubuntu-ipsec-l2tp-windows-domain-auth/setting-up-openswan-xl2tpd-with-native-windows-clients-lucid.html</span></code></li></ol></pre>\
\
<div class="md-section-divider"></div>\
\
<h3 id="设置防火墙">设置防火墙</h3>\
\
<p><strong>编辑文件 <code>/usr/lib/firewalld/services/l2tpd.xml</code></strong></p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="pun">&lt;?</span><span class="pln">xml version</span><span class="pun">=</span><span class="str">"1.0"</span><span class="pln"> encoding</span><span class="pun">=</span><span class="str">"utf-8"</span><span class="pun">?&gt;</span></code></li><li class="L1"><code><span class="tag">&lt;service&gt;</span></code></li><li class="L2"><code><span class="pln">  </span><span class="tag">&lt;short&gt;</span><span class="pln">l2tpd</span><span class="tag">&lt;/short&gt;</span></code></li><li class="L3"><code><span class="pln">  </span><span class="tag">&lt;description&gt;</span><span class="pln">L2TP IPSec</span><span class="tag">&lt;/description&gt;</span></code></li><li class="L4"><code><span class="pln">  </span><span class="tag">&lt;port</span><span class="pln"> </span><span class="atn">protocol</span><span class="pun">=</span><span class="atv">"udp"</span><span class="pln"> </span><span class="atn">port</span><span class="pun">=</span><span class="atv">"500"</span><span class="tag">/&gt;</span></code></li><li class="L5"><code><span class="pln">  </span><span class="tag">&lt;port</span><span class="pln"> </span><span class="atn">protocol</span><span class="pun">=</span><span class="atv">"udp"</span><span class="pln"> </span><span class="atn">port</span><span class="pun">=</span><span class="atv">"4500"</span><span class="tag">/&gt;</span></code></li><li class="L6"><code><span class="pln">  </span><span class="tag">&lt;port</span><span class="pln"> </span><span class="atn">protocol</span><span class="pun">=</span><span class="atv">"udp"</span><span class="pln"> </span><span class="atn">port</span><span class="pun">=</span><span class="atv">"1701"</span><span class="tag">/&gt;</span></code></li><li class="L7"><code><span class="tag">&lt;/service&gt;</span></code></li></ol></pre>\
\
<p><strong>设置并重启防火墙</strong></p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="com">// 如果firewalld没启动，先运行 systemctl start firewalld</span></code></li><li class="L1"><code><span class="pln">firewall</span><span class="pun">-</span><span class="pln">cmd </span><span class="pun">--</span><span class="pln">permanent </span><span class="pun">--</span><span class="pln">add</span><span class="pun">-</span><span class="pln">service</span><span class="pun">=</span><span class="pln">l2tpd</span></code></li><li class="L2"><code><span class="pln">firewall</span><span class="pun">-</span><span class="pln">cmd </span><span class="pun">--</span><span class="pln">permanent </span><span class="pun">--</span><span class="pln">add</span><span class="pun">-</span><span class="pln">service</span><span class="pun">=</span><span class="pln">ipsec</span></code></li><li class="L3"><code><span class="pln">firewall</span><span class="pun">-</span><span class="pln">cmd </span><span class="pun">--</span><span class="pln">permanent </span><span class="pun">--</span><span class="pln">add</span><span class="pun">-</span><span class="pln">masquerade</span></code></li><li class="L4"><code><span class="pln">firewall</span><span class="pun">-</span><span class="pln">cmd </span><span class="pun">--</span><span class="pln">reload</span></code></li></ol></pre>\
\
<div class="md-section-divider"></div>\
\
<h3 id="测试">测试</h3>\
\
<p>现在以debug模式启动xl2tpd </p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="pln">xl2tpd </span><span class="pun">-</span><span class="pln">D</span></code></li></ol></pre>\
\
<p>此时可以在控制台看到输出，客户端再次连接VPN，就可以连接上并访问网络了, 百度搜索ip会显示你的IP地址为你VPS实例的IP地址。</p>\
\
<p><strong>设置开机自启</strong></p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="pln">systemctl enable ipsec xl2tpd</span></code></li><li class="L1"><code><span class="pln">systemctl restart ipsec xl2tpd </span></code></li></ol></pre>\
\
<div class="md-section-divider"></div>\
\
<h3 id="dns设置">DNS设置</h3>\
\
<p>国内的网站无需走VPN，这是利用<strong><a href="https://github.com/jimmyxu/chnroutes" target="_blank">chnroutes</a></strong>就好；</p>\
\
<p>Mac下的设置：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="com">// 1. 在终端中执行python chnroutes.py -p mac，这将生成ip-up和ip-down两个文件；</span></code></li><li class="L1"><code><span class="com">// 2. 将这两个文件移入/etc/ppp/；</span></code></li><li class="L2"><code><span class="com">// 3. 重新连接VPN，观察测试。</span></code></li></ol></pre>\
\
<div class="md-section-divider"></div>\
\
<h3 id="流量统计">流量统计</h3>\
\
<p>如果要统计CentOS的流量适用情况， 推荐使用<code>vnstat</code>；</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="pln">yum install vnstat</span></code></li><li class="L1"><code><span class="com">// 启动服务</span></code></li><li class="L2"><code><span class="pln">vnstatd </span><span class="pun">-</span><span class="pln">d</span></code></li><li class="L3"><code><span class="com">// 创建要统计的网卡的数据库 </span></code></li><li class="L4"><code><span class="pln">vnstat </span><span class="pun">--</span><span class="pln">create </span><span class="pun">-</span><span class="pln">i eth0</span></code></li><li class="L5"><code><span class="com">// 具体使用</span></code></li><li class="L6"><code><span class="pln">vnstat </span><span class="com">// 输出本月和本日的统计信息</span></code></li><li class="L7"><code><span class="pln">vnstat </span><span class="pun">-</span><span class="pln">l </span><span class="com">//显示实时网络状态</span></code></li><li class="L8"><code><span class="pln">vnstat </span><span class="pun">--</span><span class="pln">help </span><span class="com">//查看vnstat所有支持参数</span></code></li><li class="L9"><code><span class="pun">可以通过修改配置文件来修改写入数据库的频率和显示时的流量单位</span></code></li><li class="L0"><code><span class="pln">vi </span><span class="pun">/</span><span class="pln">etc</span><span class="pun">/</span><span class="pln">vnstat</span><span class="pun">.</span><span class="pln">conf</span></code></li></ol></pre>\
\
<div class="md-section-divider"></div>\
\
<h3 id="参考资料">参考资料</h3>\
\
<ul>\
<li><a href="http://www.jianshu.com/p/7825f6494dba" target="_blank">VPS+Centos 7搭建L2TP IPSec的VPN</a></li>\
<li><a href="https://github.com/travislee8964/L2TP-VPN-installation-script-for-CentOS-7/blob/master/l2tp-ipsec-install-script-for-centos7.sh" target="_blank">L2TP-VPN-installation-script-for-CentOS-7</a></li>\
<li><a href="http://www.jianshu.com/p/82e0348e076e" target="_blank">CentOS下安装vnStat监控服务器流量 </a></li>\
</ul>	目前新版MacOS已不默认支持PPTP类型的VPN，为了更好的科学上网，本文详细介绍L2TP类型的VPN设置；系统为CentOS7，并说明DNS的配置。	26	0	2017-01-08 20:52:58	2017-01-08 20:50:19	> VPS可以使用 Digital Ocean，注册地址：[DigitalOcean官网](https://m.do.co/c/191690191dcc)；\
> 本文基于Centos7配置，请留意；\
\
### yum 初始化\
\
在正式配置之前，先对系统环境进行一下升级；\
\
```\
// 更新yum\
yum –y undate\
\
// 安装程序/库\
yum -y install gcc gcc-c++ autoconf libjpeg libjpeg-devel libpng libpng-devel freetype freetype-devel libxml2 libxml2-devel zlib zlib-devel glibc glibc-devel glib2 glib2-devel bzip2 bzip2-devel ncurses ncurses-devel curl curl-devel e2fsprogs e2fsprogs-devel krb5 krb5-devel libidn libidn-devel openssl openssl-devel openldap openldap-devel nss_ldap openldap-clients openldap-servers\
\
// 安装libevent（事件触发的网络库），（memcached需要）\
yum -y install libevent libevent-devel\
\
// 列出已安装列表\
yum info installed\
\
// 移除已安装\
yum remove "tsclient"\
```\
\
### 安装openswan xltpd 配置ipsec\
\
```\
yum install epel-release openswan -y\
// xl2tpd必须放在下面单独安装，因为CentOS原本的yum源里面是没有xl2tpd的，要安装epel后才有；\
yum install xl2tpd\
```\
\
**修改`ipsec.conf`配置文件**\
\
```\
vim /etc/ipsec.conf\
```\
\
内容，可以直接用下面的替换，并用VPS实例的公网IP地址替换left=your.vps.ip.addr中的your.vps.ip.addr \
\
```\
# /etc/ipsec.conf - Libreswan IPsec configuration file\
# This file:  /etc/ipsec.conf\
#\
# Enable when using this configuration file with openswan instead of libreswan\
#version 2\
#\
# Manual:     ipsec.conf.5\
# basic configuration\
config setup\
    # NAT-TRAVERSAL support, see README.NAT-Traversal\
    nat_traversal=yes\
    # exclude networks used on server side by adding %v4:!a.b.c.0/24\
    virtual_private=%v4:10.0.0.0/8,%v4:192.168.0.0/16,%v4:172.16.0.0/12,%v4:25.0.0.0/8,%v4:100.64.0.0/10,%v6:fd00::/8,%v6:fe80::/10\
    # OE is now off by default. Uncomment and change to on, to enable.\
    oe=off\
    # which IPsec stack to use. auto will try netkey, then klips then mast\
    protostack=netkey\
    force_keepalive=yes\
    keep_alive=1800\
conn L2TP-PSK-NAT\
    rightsubnet=vhost:%priv\
    also=L2TP-PSK-noNAT\
conn L2TP-PSK-noNAT\
    authby=secret\
    pfs=no\
    auto=add\
    keyingtries=3\
    rekey=no\
    ikelifetime=8h\
    keylife=1h\
    type=transport\
    left=your.vps.ip.addr \
    leftprotoport=17/1701\
    right=%any\
    rightprotoport=17/%any\
    dpddelay=40\
    dpdtimeout=130\
    dpdaction=clear\
# For example connections, see your distribution's documentation directory,\
# or the documentation which could be located at\
#  /usr/share/docs/libreswan-3.*/ or look at https://www.libreswan.org/\
#\
# There is also a lot of information in the manual page, "man ipsec.conf"\
# You may put your configuration (.conf) file in the "/etc/ipsec.d/" directory\
# by uncommenting this line\
#include /etc/ipsec.d/*.conf\
``` \
\
**设置预共享密钥**\
\
修改ipsec.secrets配置文件\
\
```\
vim /etc/ipsec.secrets\
// 增加一行\
// 公网IP地址替换 your.vps.ip.addr，用自己设定的密码替换your.pre_shared_key \
your.vps.ip.addr %any: PSK "your.pre_shared_key"\
```\
\
**修改`sysctl.conf`配置文件**\
\
```\
// 添加如下内容：\
net.ipv4.ip_forward = 1\
net.ipv4.conf.all.rp_filter = 0\
net.ipv4.conf.default.rp_filter = 0\
net.ipv4.conf.eth0.rp_filter = 0\
net.ipv4.conf.eth1.rp_filter = 0\
net.ipv4.conf.all.send_redirects = 0\
net.ipv4.conf.default.send_redirects = 0\
net.ipv4.conf.all.accept_redirects = 0\
net.ipv4.conf.default.accept_redirects = 0\
```\
\
此时执行：\
\
```\
for each in /proc/sys/net/ipv4/conf/*; do cat $each/accept_redirects; cat $each/send_redirects; done\
// 输出中有0和1；\
``` \
\
创建脚本修改/proc/sys/net/ipv4/conf/中的内容，脚本名为：modify.sh\
\
```\
// modify.sh\
for each in /proc/sys/net/ipv4/conf/*\
do\
    echo 0 > $each/accept_redirects\
    echo 0 > $each/send_redirects\
done\
// 保存执行\
sh modify.sh\
```\
\
再次执行：\
\
```\
for each in /proc/sys/net/ipv4/conf/*; do cat $each/accept_redirects; cat $each/send_redirects; done\
// 输出中只有0；\
``` \
\
**重启ipsec**\
\
```\
systemctl restart ipsec\
```\
\
**检验ipsec的配置**\
\
``` \
ipsec verify\
```\
\
**验证**\
\
此时系统的输出如果是这样就说明到此为止都是正确的；\
\
```\
Verifying installed system and configuration files\
\
Version check and ipsec on-path [OK]\
Libreswan 3.15 (netkey) on 3.10.0-327.28.3.el7.x86_64\
Checking for IPsec support in kernel [OK]\
　NETKEY: Testing XFRM related proc values\
　　　　ICMP default/send_redirects [OK]\
　　　　ICMP default/accept_redirects [OK]\
　　　　XFRM larval drop [OK]\
Pluto ipsec.conf syntax [OK]\
Hardware random device [N/A]\
Two or more interfaces found, checking IP forwarding [OK]\
Checking rp_filter [OK]\
Checking that pluto is running [OK]\
Pluto listening for IKE on udp 500 [OK]\
Pluto listening for IKE/NAT-T on udp 4500 [OK]\
Pluto ipsec.secret syntax [OK]\
Checking 'ip' command [OK]\
Checking 'iptables' command [OK]\
Checking 'prelink' command does not interfere with FIPSChecking for obsolete > ipsec.conf options [OK]\
Opportunistic Encryption [DISABLED]\
```\
\
如果看到下面这样的输出\
\
```\
Checking rp_filter [ENABLED]\
/proc/sys/net/ipv4/conf/eth0/rp_filter [ENABLED]\
/proc/sys/net/ipv4/conf/eth1/rp_filter [ENABLED]\
```\
\
那么就根据提供的路径，修改文件的内容为0\
\
```\
sh -c "echo 0 > /proc/sys/net/ipv4/conf/eth0/rp_filter"\
```\
\
再次重启ipsec和验证\
\
```\
systemctl restart ipsec \
ipsec verify\
```\
\
**配置VPN登陆的账号和密码**\
\
```\
// vim /etc/ppp/chap-secrets\
\
// account为要设置的账号，password为要设置的密码\
# Secrets for authentication using CHAP\
# client          server     secret               IP addresses\
  account   \	  l2tpd      your.password        *\
```\
\
**测试**\
\
到这里我们已经完成一部分了，可以测试一下到此为止是否一切顺利。\
\
```\
// 在PC上设置VPN进行验证，Mac和Window都有对应的设置，可自行百度；\
```\
\
保存配置并连接，此时还是连不上的，但是服务器端我们可以查看连接日志\
\
```\
vim /var/log/secure\
\
// 在打开的日志文件中搜索 IPsec SA established 或 IPSec connection established \
// 如果能搜索到这样的字样，则说明到此为止一切顺利。\
```\
\
### 安装和配置`xl2tp`\
\
**安装**\
\
```\
yum install xl2tpd \
```\
\
**配置`/etc/xl2tpd/xl2tpd.conf`**\
\
```\
;\
; This is a minimal sample xl2tpd configuration file for use\
; with L2TP over IPsec.\
;\
; The idea is to provide an L2TP daemon to which remote Windows L2TP/IPsec\
; clients connect. In this example, the internal (protected) network\
; is 192.168.1.0/24.  A special IP range within this network is reserved\
; for the remote clients: 192.168.1.128/25\
; (i.e. 192.168.1.128 ... 192.168.1.254)\
;\
; The listen-addr parameter can be used if you want to bind the L2TP daemon\
; to a specific IP address instead of to all interfaces. For instance,\
; you could bind it to the interface of the internal LAN (e.g. 192.168.1.98\
; in the example below). Yet another IP address (local ip, e.g. 192.168.1.99)\
; will be used by xl2tpd as its address on pppX interfaces.\
\
[global]\
; listen-addr = 192.168.1.98\
;\
; requires openswan-2.5.18 or higher - Also does not yet work in combination\
; with kernel mode l2tp as present in linux 2.6.23+\
; ipsec saref = yes\
; Use refinfo of 22 if using an SAref kernel patch based on openswan 2.6.35 or\
;  when using any of the SAref kernel patches for kernels up to 2.6.35.\
; saref refinfo = 30\
;\
; force userspace = yes\
;\
; debug tunnel = yes\
ipsec saref = yes\
\
[lns default]\
ip range = 192.168.1.128-192.168.1.254\
local ip = 192.168.1.99\
require chap = yes\
refuse pap = yes\
require authentication = yes\
name = LinuxVPNserver\
ppp debug = yes\
pppoptfile = /etc/ppp/options.xl2tpd\
length bit = yes\
```\
\
**配置`/etc/ppp/options.xl2tpd`**\
\
```\
ipcp-accept-local\
ipcp-accept-remote\
require-mschap-v2\
ms-dns  8.8.8.8\
ms-dns  8.8.4.4\
# ms-dns  192.168.1.1\
# ms-dns  192.168.1.3\
# ms-wins 192.168.1.2\
# ms-wins 192.168.1.4\
asyncmap 0\
noccp\
auth\
crtscts\
idle 1800\
mtu 1410\
mru 1410\
nodefaultroute\
hide-password\
debug\
lock\
name l2tpd\
proxyarp\
lcp-echo-interval 30\
lcp-echo-failure 4\
connect-delay 5000\
# To allow authentication against a Windows domain EXAMPLE, and require the\
# user to be in a group "VPN Users". Requires the samba-winbind package\
# require-mschap-v2\
# plugin winbind.so\
# ntlm_auth-helper '/usr/bin/ntlm_auth --helper-protocol=ntlm-server-1 --require-membership-of="EXAMPLE\\VPN Users"'\
# You need to join the domain on the server, for example using samba:\
# http://rootmanager.com/ubuntu-ipsec-l2tp-windows-domain-auth/setting-up-openswan-xl2tpd-with-native-windows-clients-lucid.html\
```\
\
### 设置防火墙\
\
**编辑文件 `/usr/lib/firewalld/services/l2tpd.xml`**\
\
```\
<?xml version="1.0" encoding="utf-8"?>\
<service>\
  <short>l2tpd</short>\
  <description>L2TP IPSec</description>\
  <port protocol="udp" port="500"/>\
  <port protocol="udp" port="4500"/>\
  <port protocol="udp" port="1701"/>\
</service>\
```\
\
**设置并重启防火墙**\
\
```\
// 如果firewalld没启动，先运行 systemctl start firewalld\
firewall-cmd --permanent --add-service=l2tpd\
firewall-cmd --permanent --add-service=ipsec\
firewall-cmd --permanent --add-masquerade\
firewall-cmd --reload\
```\
\
### 测试\
\
现在以debug模式启动xl2tpd \
\
```\
xl2tpd -D\
```\
\
此时可以在控制台看到输出，客户端再次连接VPN，就可以连接上并访问网络了, 百度搜索ip会显示你的IP地址为你VPS实例的IP地址。\
\
**设置开机自启**\
\
```\
systemctl enable ipsec xl2tpd\
systemctl restart ipsec xl2tpd \
```\
\
### DNS设置\
\
国内的网站无需走VPN，这是利用**[chnroutes](https://github.com/jimmyxu/chnroutes)**就好；\
\
Mac下的设置：\
\
```\
// 1. 在终端中执行python chnroutes.py -p mac，这将生成ip-up和ip-down两个文件；\
// 2. 将这两个文件移入/etc/ppp/；\
// 3. 重新连接VPN，观察测试。\
```\
\
### 流量统计\
\
如果要统计CentOS的流量适用情况， 推荐使用`vnstat`；\
\
```\
yum install vnstat\
// 启动服务\
vnstatd -d\
// 创建要统计的网卡的数据库 \
vnstat --create -i eth0\
// 具体使用\
vnstat // 输出本月和本日的统计信息\
vnstat -l //显示实时网络状态\
vnstat --help //查看vnstat所有支持参数\
可以通过修改配置文件来修改写入数据库的频率和显示时的流量单位\
vi /etc/vnstat.conf\
```\
\
### 参考资料\
\
- [VPS+Centos 7搭建L2TP IPSec的VPN](http://www.jianshu.com/p/7825f6494dba)\
- [L2TP-VPN-installation-script-for-CentOS-7](https://github.com/travislee8964/L2TP-VPN-installation-script-for-CentOS-7/blob/master/l2tp-ipsec-install-script-for-centos7.sh)\
- [CentOS下安装vnStat监控服务器流量 ](http://www.jianshu.com/p/82e0348e076e)\

38	0	RainDon	WebAssembly	webassembly	1	1		0	ImShengli	FE				<div class="md-section-divider"></div>\
\
<p>WebAssembly ，也可以称为wasm，本文统一用WebAssembly。</p>\
\
<p>本文主要介绍一下WebAssembly，从以下几个方面：</p>\
\
<ul>\
<li>WebAssembly的由来;</li>\
<li>WebAssembly是什么？</li>\
<li>WebAssembly目前的进展情况；</li>\
<li>简单的演示示例。</li>\
</ul>\
\
<div class="md-section-divider"></div>\
\
<h3 id="webassembly的由来">WebAssembly的由来</h3>\
\
<p>目前在浏览器中，大部分开发者所使用的编程语言是JavaScript，如果使用其它的语言可以吗？JavaScript是否可以先编译，浏览器直接运行编译后的结果呢？</p>\
\
<p>Arstechnica上发布了一篇 <a href="http://arstechnica.com/information-technology/2013/05/are-video-codecs-written-in-javascript-really-the-future/" target="_blank">Are video codecs written in JavaScript really the future? | Ars Technica</a> ，其中Raniz的评论引来了广泛讨论：</p>\
\
<blockquote class="white-blockquote">\
  <p>我认为我们主要的精力应该是在浏览器上支持更过的语言，而不是任何事情都用JavaScript来实现。如果浏览器端存在一个标准的字节码，开发者可以选择更多的语言；源代码对浏览器和使用者是透明的。 <br>\
  二进制数据也可以节省宽带。  </p>\
</blockquote>\
\
<p>目前多种语言都对应的LLVM编译器，有人建议将LLVM位码用作中间“字节码”； <br>\
 AlonZakai在 <a href="http://mozakai.blogspot.ro/2013/05/the-elusive-universal-web-bytecode.html" target="_blank">azakai’s blog: The Elusive Universal Web Bytecode</a>中列举了使用字节码面临的困难 ：</p>\
\
<ul>\
<li>位码方案与目标平台强绑定；</li>\
<li>字节码目前的不统一；</li>\
<li>字节码标准化，浏览器优化JavaScript有了限制等；</li>\
</ul>\
\
<p>如此看来，字节码的成功的机会不大，但在其他语言带向Web开发语言方面，有两个重要的尝试。</p>\
\
<blockquote class="white-blockquote">\
  <p>Mozilla： C/C++ –&gt; LLVM位码 –&gt;Emscripten –&gt; asm.js –&gt; 浏览器 <br>\
  Google：C/C++ –&gt; LLVM位码 –&gt;PNaCl –&gt; 浏览器  </p>\
</blockquote>\
\
<p><a href="http://asmjs.org/" target="_blank">asm.js</a> 尝试标准化能够在任何浏览器中运行的一个JavaScript子集，其设计便于JavaScript引擎优化。Emscripten( <a href="https://github.com/kripken/emscripten/wiki" target="_blank">Home · kripken/emscripten Wiki · GitHub</a> )是另一个项目，可以从LLVM位码生成asm.js。据Sakai介绍，在Firefox中通过asm.js运行的C++代码速度是原生代码的50%，他们预计随着时间的推移，性能会有所改进。</p>\
\
<p><a href="https://developer.chrome.com/native-client" target="_blank">PNaCl</a> 旨在增强Chrome中对原生应用的支持。NaCl是一个在浏览器端可运行编译后的C或C++代码的沙河，PnaCl在NaCl的基础上提出了这样的一种解决方案：为编译的NaCl模块提供一种独立于指令集体系结构的格式，无需重新编译即可支持多种目标平台。PNaCl仍然使用原来的NaCl沙盒机制，客户端从服务器请求位码，然后针对自己的架构将其转换为原生的可执行代码。</p>\
\
<p>如果要在浏览器中使用字节码，只能寄希望于某种理想的字节码。AlonZakai总结了这样的字节码可能需要满足以下几个条件：</p>\
\
<ul>\
<li>支持所有语言；</li>\
<li>高速运行代码；</li>\
<li>便于编译器生成；</li>\
<li>格式紧凑，容易转换；</li>\
<li>标准化；</li>\
<li>平台独立；</li>\
<li>安全；</li>\
</ul>\
\
<p>为此，Mozilla、谷歌、微软和苹果决定开发一种面向Web的二进制格式，该格式名为WebAssembly。</p>\
\
<p>WebAssembly可以作为任何编程语言的编译目标，使应用程序可以运行在浏览器或其它代理中。</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="webassembly是什么">WebAssembly是什么？</h3>\
\
<p>WebAssembly实际上是一个经过压缩的AST编码，以二进制形式存在，可与当前的Web平台集成并在Web环境中，最终实现在各类平台上以接近原生的速度调用常见的硬件功能。</p>\
\
<p>下面是一段WebAssembly的演示示例， <a href="https://zh.wikipedia.org/wiki/S-%E8%A1%A8%E8%BE%BE%E5%BC%8F" target="_blank">S-表达式 - 维基百科，自由的百科全书</a> AST：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="pun">;;</span><span class="pln"> </span><span class="typ">Iterative</span><span class="pln"> factorial named</span></code></li><li class="L1"><code><span class="pun">(</span><span class="pln">func $fac</span><span class="pun">-</span><span class="pln">iter </span><span class="pun">(</span><span class="pln">param $n i64</span><span class="pun">)</span><span class="pln"> </span><span class="pun">(</span><span class="pln">result i64</span><span class="pun">)</span></code></li><li class="L2"><code><span class="pln">    </span><span class="pun">(</span><span class="kwd">local</span><span class="pln"> $i i64</span><span class="pun">)</span></code></li><li class="L3"><code><span class="pln">        </span><span class="pun">(</span><span class="kwd">local</span><span class="pln"> $res i64</span><span class="pun">)</span></code></li><li class="L4"><code><span class="pln">    </span><span class="pun">(</span><span class="pln">set_local $i </span><span class="pun">(</span><span class="pln">get_local $n</span><span class="pun">))</span></code></li><li class="L5"><code><span class="pln">    </span><span class="pun">(</span><span class="pln">set_local $res </span><span class="pun">(</span><span class="pln">i64</span><span class="pun">.</span><span class="kwd">const</span><span class="pln"> </span><span class="lit">1</span><span class="pun">))</span></code></li><li class="L6"><code><span class="pln">        </span><span class="pun">(</span><span class="pln">label $done</span></code></li><li class="L7"><code><span class="pln">        </span><span class="pun">(</span><span class="pln">loop</span></code></li><li class="L8"><code><span class="pln">            </span><span class="pun">(</span><span class="kwd">if</span></code></li><li class="L9"><code><span class="pln">                </span><span class="pun">(</span><span class="pln">i64</span><span class="pun">.</span><span class="pln">eq </span><span class="pun">(</span><span class="pln">get_local $i</span><span class="pun">)</span><span class="pln"> </span><span class="pun">(</span><span class="pln">i64</span><span class="pun">.</span><span class="kwd">const</span><span class="pln"> </span><span class="lit">0</span><span class="pun">))</span></code></li><li class="L0"><code><span class="pln">                    </span><span class="pun">(</span><span class="kwd">break</span><span class="pln"> $done</span><span class="pun">)</span></code></li><li class="L1"><code><span class="pln">                </span><span class="pun">(</span><span class="pln">block</span></code></li><li class="L2"><code><span class="pln">                    </span><span class="pun">(</span><span class="pln">set_local $res </span><span class="pun">(</span><span class="pln">i64</span><span class="pun">.</span><span class="pln">mul </span><span class="pun">(</span><span class="pln">get_local $i</span><span class="pun">)</span><span class="pln"> </span><span class="pun">(</span><span class="pln">get_local $res</span><span class="pun">)))</span></code></li><li class="L3"><code><span class="pln">                        </span><span class="pun">(</span><span class="pln">set_local $i </span><span class="pun">(</span><span class="pln">i64</span><span class="pun">.</span><span class="kwd">sub</span><span class="pln"> </span><span class="pun">(</span><span class="pln">get_local $i</span><span class="pun">)</span><span class="pln"> </span><span class="pun">(</span><span class="pln">i64</span><span class="pun">.</span><span class="kwd">const</span><span class="pln"> </span><span class="lit">1</span><span class="pun">)))</span></code></li><li class="L4"><code><span class="pln">                    </span><span class="pun">)</span></code></li><li class="L5"><code><span class="pln">                </span><span class="pun">)</span></code></li><li class="L6"><code><span class="pln">            </span><span class="pun">)</span></code></li><li class="L7"><code><span class="pln">        </span><span class="pun">)</span></code></li><li class="L8"><code><span class="pln">        </span><span class="pun">(</span><span class="kwd">return</span><span class="pln"> </span><span class="pun">(</span><span class="pln">get_local $res</span><span class="pun">)</span></code></li><li class="L9"><code><span class="pln">    </span><span class="pun">)</span></code></li><li class="L0"><code><span class="pun">)</span></code></li></ol></pre>\
\
<p>使用二进制的原因是：可以提供更高的效率：它减少了下载文件大小，并加快了解码速度。</p>\
\
<p>与WebAssembly相关的概念有：源代码、编译器、汇编、字节码、机器码。WebAssembly为Web打造一套专用的字节码，这项标准在未来应用场景可能是这样的：</p>\
\
<ul>\
<li>开发应用，但使用任何一门可被编译为WebAssembly的语言编写源代码；</li>\
<li>用编译器将源代码转换为WebAssembly字节码，也可按需转换为汇编代码；</li>\
<li>在浏览器中加载字节码并运行。</li>\
</ul>\
\
<p><img src="https://dn-woerwosi.qbox.me/blog/images/2017/01/11/webassembly.png" alt="webassembly.png" title=""></p>\
\
<p>关于WebAssembly，需要了解的是（具体内容可参考： <a href="http://www.infoq.com/cn/news/2015/10/webassembly-7-things" target="_blank">关于WebAssembly你需要了解的7件事</a> ）：</p>\
\
<ul>\
<li>WebAssembly不会替代JavaScript；</li>\
<li>WebAssembly将超出JavaScript所需的功能进行扩展，例如多线程；</li>\
<li>WebAssembly由参与组建asm.js和(P)NaCl的团队共同开发；</li>\
<li>WebAssembly向后兼容，提供了Polypill；</li>\
<li>WebAssembly比CPU汇编代码更简单易懂；</li>\
<li>支持在浏览器中开启Source-maps功能调试编译后代码；</li>\
<li>即刻运行，无须等待；</li>\
</ul>\
\
<div class="md-section-divider"></div>\
\
<h3 id="webassembly目前的进展情况">WebAssembly目前的进展情况</h3>\
\
<p><a href="https://w3.org/community/webassembly/" target="_blank">WebAssembly Community Group</a>已经有了后续MVP版本的一个候选 — 浏览器预览版，部分浏览器已经实现了相应的API，在Chrome Canary(金丝雀)、Firefox中已经可以尝鲜了。目前CG正在从社区收集反馈。</p>\
\
<p><strong>里程碑事件</strong></p>\
\
<ul>\
<li>2015.4， <a href="https://w3.org/community/webassembly/" target="_blank">WebAssembly Community Group</a>成立；</li>\
<li>2015.6，发布了首次公告，<a href="https://github.com/WebAssembly/design/issues/150" target="_blank">https://github.com/WebAssembly/design/issues/150</a>；</li>\
<li>2016.3，定义和实现了核心能力；</li>\
<li>2016.10，发布了浏览器预览版；</li>\
</ul>\
\
<p><strong>其它</strong></p>\
\
<p>各浏览器目前对该功能的支持还处于实验性阶段，距离真正使用还有较长的时间周期；</p>\
\
<p>另一方面，这项新技术对实际能够产生什么样的效果，无法预知。这种方法能带来的好处是，我们从头开始设计，没有历史包袱，或许会得到一个更优雅的解决方案。这种想法很吸引人，而且一般说来优雅的方案会带来更好的结果，但以前也争论过，在这一特定情况下，优雅的方案如果没有明显的技术优势，那就是为了优雅而优雅了。</p>\
\
<p>JavaScript已经有20多年的历史了，Brendan Eich当时绝没料到这种小语言在今天竟然有了如此重要的地位。目前JavaScript广泛应用于所有主流浏览器，而且随着Node.js的流行，它还进入了服务器端。这并不是因为JavaScript设计得好，而是因为我们很难把所有的主要参与者聚到一起做出一个更好的方案，软件上的各种东西也很难切换了。和HTTP和HTML一样，尽管存在各种缺点，尽管我们都知道如果能够达成一致，我们可以做得更好，JavaScript还是会走向繁荣。</p>\
\
<p>JavaScript上存在着缺点，WebAssembly是未来的解决方案吗？</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="webassembly演示示例">WebAssembly演示示例</h3>\
\
<blockquote class="white-blockquote">\
  <p>一切都是演示性的，如果没有达到理想的效果，请保持冷静(PLEASE KEEP CALM)。  </p>\
</blockquote>\
\
<p>查看官方DEMO，请访问：<a href="http://webassembly.org/demo/" target="_blank">Angry Bots Demo</a>；官网的案例编译的是C代码，安装时请耐心。</p>\
\
<p>本演示示例在Mac上进行，需要的环境有：</p>\
\
<ul>\
<li>Git；</li>\
<li>CMake，可使用brew安装；</li>\
<li>Xcode；</li>\
<li>Python 2.7+；</li>\
</ul>\
\
<p><strong>准备工作</strong></p>\
\
<p>正式开始之前，先写一段asm.js代码，例如下面这段：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-js"><span class="com">// my-math-module.asm.js</span></code></li><li class="L1"><code class="language-js"><span class="kwd">function</span><span class="pln"> </span><span class="typ">MyMathModule</span><span class="pun">(</span><span class="pln">global</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L2"><code class="language-js"><span class="pln">    </span><span class="str">"use asm"</span><span class="pun">;</span></code></li><li class="L3"><code class="language-js"><span class="pln">    </span><span class="kwd">var</span><span class="pln"> exp </span><span class="pun">=</span><span class="pln"> global</span><span class="pun">.</span><span class="typ">Math</span><span class="pun">.</span><span class="pln">exp</span><span class="pun">;</span></code></li><li class="L4"><code class="language-js"><span class="pln">    </span><span class="kwd">function</span><span class="pln"> doubleExp</span><span class="pun">(</span><span class="pln">value</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L5"><code class="language-js"><span class="pln">        value </span><span class="pun">=</span><span class="pln"> </span><span class="pun">+</span><span class="pln">value</span><span class="pun">;</span></code></li><li class="L6"><code class="language-js"><span class="pln">        </span><span class="kwd">return</span><span class="pln"> </span><span class="pun">+(+</span><span class="pln">exp</span><span class="pun">(+</span><span class="pln">value</span><span class="pun">)</span><span class="pln"> </span><span class="pun">*</span><span class="pln"> </span><span class="lit">2.0</span><span class="pun">);</span></code></li><li class="L7"><code class="language-js"><span class="pln">    </span><span class="pun">}</span></code></li><li class="L8"><code class="language-js"><span class="pln">    </span><span class="kwd">return</span><span class="pln"> </span><span class="pun">{</span><span class="pln"> doubleExp</span><span class="pun">:</span><span class="pln"> doubleExp </span><span class="pun">};</span></code></li><li class="L9"><code class="language-js"><span class="pun">}</span></code></li></ol></pre>\
\
<p>注：这不是一个特别有用的函数，但符合规范，如果你觉得这很烂，但基本上每一个字符都是必须的。</p>\
\
<p>在上面代码中，一元运算符 <code>+</code> 的作用是类型注解，这样编译器会知道那些变量是 double 类型的，运行时就不必再次分辨它们是什么。</p>\
\
<p>在浏览器中运行，结果如下图所示：</p>\
\
<p><img src="https://dn-woerwosi.qbox.me/blog/images/2017/01/11/result.png" alt="result.png" title=""></p>\
\
<p><strong>尝试 WebAssembly</strong></p>\
\
<p>使用<a href="https://github.com/WebAssembly/binaryen" target="_blank">GitHub - WebAssembly/binaryen: Compiler infrastructure and toolchain library for WebAssembly, in C++</a> 提供的工具，将asm.js 代码片段编译为wasm；</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="pln">git clone https</span><span class="pun">:</span><span class="com">//github.com/WebAssembly/binaryen.git</span></code></li><li class="L1"><code><span class="pln">cd binaryen</span></code></li><li class="L2"><code><span class="com">// binaryen 目录下会有一个 bin 文件夹</span></code></li><li class="L3"><code><span class="pln">cmake </span><span class="pun">.</span><span class="pln"> </span><span class="pun">&amp;</span><span class="pln"> make</span></code></li><li class="L4"><code><span class="com">// 使用asm2wasm生成wast文件</span></code></li><li class="L5"><code><span class="pun">./</span><span class="pln">binaryen</span><span class="pun">/</span><span class="pln">bin</span><span class="pun">/</span><span class="pln">asm2wasm </span><span class="kwd">my</span><span class="pun">-</span><span class="pln">math</span><span class="pun">-</span><span class="kwd">module</span><span class="pun">.</span><span class="kwd">asm</span><span class="pun">.</span><span class="pln">js </span><span class="pun">-</span><span class="pln">o </span><span class="kwd">my</span><span class="pun">-</span><span class="pln">math</span><span class="pun">-</span><span class="kwd">module</span><span class="pun">.</span><span class="pln">wast</span></code></li></ol></pre>\
\
<p>生成后的内容如下：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="pun">(</span><span class="kwd">module</span></code></li><li class="L1"><code><span class="pln">  </span><span class="pun">(</span><span class="pln">type $FUNCSIG$dd </span><span class="pun">(</span><span class="pln">func </span><span class="pun">(</span><span class="pln">param f64</span><span class="pun">)</span><span class="pln"> </span><span class="pun">(</span><span class="pln">result f64</span><span class="pun">)))</span></code></li><li class="L2"><code><span class="pln">  </span><span class="pun">(</span><span class="kwd">import</span><span class="pln"> </span><span class="str">"global.Math"</span><span class="pln"> </span><span class="str">"exp"</span><span class="pln"> </span><span class="pun">(</span><span class="pln">func $exp </span><span class="pun">(</span><span class="pln">param f64</span><span class="pun">)</span><span class="pln"> </span><span class="pun">(</span><span class="pln">result f64</span><span class="pun">)))</span></code></li><li class="L3"><code><span class="pln">  </span><span class="pun">(</span><span class="kwd">import</span><span class="pln"> </span><span class="str">"env"</span><span class="pln"> </span><span class="str">"memory"</span><span class="pln"> </span><span class="pun">(</span><span class="pln">memory $0 </span><span class="lit">256</span><span class="pln"> </span><span class="lit">256</span><span class="pun">))</span></code></li><li class="L4"><code><span class="pln">  </span><span class="pun">(</span><span class="kwd">import</span><span class="pln"> </span><span class="str">"env"</span><span class="pln"> </span><span class="str">"table"</span><span class="pln"> </span><span class="pun">(</span><span class="pln">table </span><span class="lit">0</span><span class="pln"> </span><span class="lit">0</span><span class="pln"> anyfunc</span><span class="pun">))</span></code></li><li class="L5"><code><span class="pln">  </span><span class="pun">(</span><span class="kwd">import</span><span class="pln"> </span><span class="str">"env"</span><span class="pln"> </span><span class="str">"memoryBase"</span><span class="pln"> </span><span class="pun">(</span><span class="kwd">global</span><span class="pln"> $memoryBase i32</span><span class="pun">))</span></code></li><li class="L6"><code><span class="pln">  </span><span class="pun">(</span><span class="kwd">import</span><span class="pln"> </span><span class="str">"env"</span><span class="pln"> </span><span class="str">"tableBase"</span><span class="pln"> </span><span class="pun">(</span><span class="kwd">global</span><span class="pln"> $tableBase i32</span><span class="pun">))</span></code></li><li class="L7"><code><span class="pln">  </span><span class="pun">(</span><span class="kwd">export</span><span class="pln"> </span><span class="str">"doubleExp"</span><span class="pln"> </span><span class="pun">(</span><span class="pln">func $doubleExp</span><span class="pun">))</span></code></li><li class="L8"><code><span class="pln">  </span><span class="pun">(</span><span class="pln">func $doubleExp </span><span class="pun">(</span><span class="pln">param $value f64</span><span class="pun">)</span><span class="pln"> </span><span class="pun">(</span><span class="pln">result f64</span><span class="pun">)</span></code></li><li class="L9"><code><span class="pln">    </span><span class="pun">(</span><span class="kwd">return</span></code></li><li class="L0"><code><span class="pln">      </span><span class="pun">(</span><span class="pln">f64</span><span class="pun">.</span><span class="pln">mul</span></code></li><li class="L1"><code><span class="pln">        </span><span class="pun">(</span><span class="pln">call $exp</span></code></li><li class="L2"><code><span class="pln">          </span><span class="pun">(</span><span class="pln">get_local $value</span><span class="pun">)</span></code></li><li class="L3"><code><span class="pln">        </span><span class="pun">)</span></code></li><li class="L4"><code><span class="pln">        </span><span class="pun">(</span><span class="pln">f64</span><span class="pun">.</span><span class="kwd">const</span><span class="pln"> </span><span class="lit">2</span><span class="pun">)</span></code></li><li class="L5"><code><span class="pln">      </span><span class="pun">)</span></code></li><li class="L6"><code><span class="pln">    </span><span class="pun">)</span></code></li><li class="L7"><code><span class="pln">  </span><span class="pun">)</span></code></li><li class="L8"><code><span class="pun">)</span></code></li></ol></pre>\
\
<p>利用wasm-as将wast格式的代码转换为 wasm 二进制码；</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="pun">.</span><span class="str">/binaryen/</span><span class="pln">bin</span><span class="pun">/</span><span class="pln">wasm</span><span class="pun">-</span><span class="kwd">as</span><span class="pln"> </span><span class="kwd">my</span><span class="pun">-</span><span class="pln">math</span><span class="pun">-</span><span class="kwd">module</span><span class="pun">.</span><span class="pln">wast </span><span class="pun">-</span><span class="pln">o </span><span class="kwd">my</span><span class="pun">-</span><span class="pln">math</span><span class="pun">-</span><span class="kwd">module</span><span class="pun">.</span><span class="pln">wasm</span></code></li></ol></pre>\
\
<p>如下图所示：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code><span class="lit">0061</span><span class="pln"> </span><span class="lit">736d</span><span class="pln"> </span><span class="lit">0d00</span><span class="pln"> </span><span class="lit">0000</span><span class="pln"> </span><span class="lit">0186</span><span class="pln"> </span><span class="lit">8080</span><span class="pln"> </span><span class="lit">8000</span><span class="pln"> </span><span class="lit">0160</span></code></li><li class="L1"><code><span class="lit">017c</span><span class="pln"> </span><span class="lit">017c</span><span class="pln"> </span><span class="lit">02d6</span><span class="pln"> </span><span class="lit">8080</span><span class="pln"> </span><span class="lit">8000</span><span class="pln"> </span><span class="lit">050b</span><span class="pln"> </span><span class="lit">676c</span><span class="pln"> </span><span class="lit">6f62</span></code></li><li class="L2"><code><span class="lit">616c</span><span class="pln"> </span><span class="lit">2e4d</span><span class="pln"> </span><span class="lit">6174</span><span class="pln"> </span><span class="lit">6803</span><span class="pln"> </span><span class="lit">6578</span><span class="pln"> </span><span class="lit">7000</span><span class="pln"> </span><span class="lit">0003</span><span class="pln"> </span><span class="lit">656e</span></code></li><li class="L3"><code><span class="lit">7606</span><span class="pln"> </span><span class="lit">6d65</span><span class="pln"> </span><span class="lit">6d6f</span><span class="pln"> </span><span class="lit">7279</span><span class="pln"> </span><span class="lit">0201</span><span class="pln"> </span><span class="lit">8002</span><span class="pln"> </span><span class="lit">8002</span><span class="pln"> </span><span class="lit">0365</span></code></li><li class="L4"><code><span class="lit">6e76</span><span class="pln"> </span><span class="lit">0574</span><span class="pln"> </span><span class="lit">6162</span><span class="pln"> </span><span class="lit">6c65</span><span class="pln"> </span><span class="lit">0170</span><span class="pln"> </span><span class="lit">0100</span><span class="pln"> </span><span class="lit">0003</span><span class="pln"> </span><span class="lit">656e</span></code></li><li class="L5"><code><span class="lit">760a</span><span class="pln"> </span><span class="lit">6d65</span><span class="pln"> </span><span class="lit">6d6f</span><span class="pln"> </span><span class="lit">7279</span><span class="pln"> </span><span class="lit">4261</span><span class="pln"> </span><span class="lit">7365</span><span class="pln"> </span><span class="lit">037f</span><span class="pln"> </span><span class="lit">0003</span></code></li><li class="L6"><code><span class="lit">656e</span><span class="pln"> </span><span class="lit">7609</span><span class="pln"> </span><span class="lit">7461</span><span class="pln"> </span><span class="lit">626c</span><span class="pln"> </span><span class="lit">6542</span><span class="pln"> </span><span class="lit">6173</span><span class="pln"> </span><span class="lit">6503</span><span class="pln"> </span><span class="lit">7f00</span></code></li><li class="L7"><code><span class="lit">0382</span><span class="pln"> </span><span class="lit">8080</span><span class="pln"> </span><span class="lit">8000</span><span class="pln"> </span><span class="lit">0100</span><span class="pln"> </span><span class="lit">078d</span><span class="pln"> </span><span class="lit">8080</span><span class="pln"> </span><span class="lit">8000</span><span class="pln"> </span><span class="lit">0109</span></code></li><li class="L8"><code><span class="lit">646f</span><span class="pln"> </span><span class="lit">7562</span><span class="pln"> </span><span class="lit">6c65</span><span class="pln"> </span><span class="lit">4578</span><span class="pln"> </span><span class="lit">7000</span><span class="pln"> </span><span class="lit">0109</span><span class="pln"> </span><span class="lit">8180</span><span class="pln"> </span><span class="lit">8080</span></code></li><li class="L9"><code><span class="lit">0000</span><span class="pln"> </span><span class="lit">0a97</span><span class="pln"> </span><span class="lit">8080</span><span class="pln"> </span><span class="lit">8000</span><span class="pln"> </span><span class="lit">0191</span><span class="pln"> </span><span class="lit">8080</span><span class="pln"> </span><span class="lit">8000</span><span class="pln"> </span><span class="lit">0020</span></code></li><li class="L0"><code><span class="lit">0010</span><span class="pln"> </span><span class="lit">0044</span><span class="pln"> </span><span class="lit">0000</span><span class="pln"> </span><span class="lit">0000</span><span class="pln"> </span><span class="lit">0000</span><span class="pln"> </span><span class="lit">0040</span><span class="pln"> a20f </span><span class="lit">0b</span></code></li></ol></pre>\
\
<p>下图演示了如何最低限度地加载模块：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-js"><span class="pun">&lt;</span><span class="pln">script</span><span class="pun">&gt;</span></code></li><li class="L1"><code class="language-js"><span class="pln">fetch</span><span class="pun">(</span><span class="str">"my-math-module.wasm"</span><span class="pun">)</span></code></li><li class="L2"><code class="language-js"><span class="pun">.</span><span class="pln">then</span><span class="pun">(</span><span class="kwd">function</span><span class="pun">(</span><span class="pln">response</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L3"><code class="language-js"><span class="pln">    </span><span class="kwd">return</span><span class="pln"> response</span><span class="pun">.</span><span class="pln">arrayBuffer</span><span class="pun">();</span></code></li><li class="L4"><code class="language-js"><span class="pun">})</span></code></li><li class="L5"><code class="language-js"><span class="pun">.</span><span class="pln">then</span><span class="pun">(</span><span class="kwd">function</span><span class="pun">(</span><span class="pln">buffer</span><span class="pun">)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L6"><code class="language-js"><span class="pln">    </span><span class="kwd">var</span><span class="pln"> dependencies </span><span class="pun">=</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L7"><code class="language-js"><span class="pln">        </span><span class="str">"global"</span><span class="pun">:</span><span class="pln"> </span><span class="pun">{},</span></code></li><li class="L8"><code class="language-js"><span class="pln">        </span><span class="str">"env"</span><span class="pun">:</span><span class="pln"> </span><span class="pun">{}</span></code></li><li class="L9"><code class="language-js"><span class="pln">    </span><span class="pun">};</span></code></li><li class="L0"><code class="language-js"><span class="pln">    dependencies</span><span class="pun">[</span><span class="str">"global.Math"</span><span class="pun">]</span><span class="pln"> </span><span class="pun">=</span><span class="pln"> window</span><span class="pun">.</span><span class="typ">Math</span><span class="pun">;</span></code></li><li class="L1"><code class="language-js"><span class="pln">    </span><span class="kwd">var</span><span class="pln"> moduleBufferView </span><span class="pun">=</span><span class="pln"> </span><span class="kwd">new</span><span class="pln"> </span><span class="typ">Uint8Array</span><span class="pun">(</span><span class="pln">buffer</span><span class="pun">);</span></code></li><li class="L2"><code class="language-js"><span class="pln">    </span><span class="kwd">var</span><span class="pln"> myMathModule </span><span class="pun">=</span><span class="pln"> </span><span class="typ">Wasm</span><span class="pun">.</span><span class="pln">instantiateModule</span><span class="pun">(</span><span class="pln">moduleBufferView</span><span class="pun">,</span><span class="pln"> dependencies</span><span class="pun">);</span></code></li><li class="L3"><code class="language-js"><span class="pln">    console</span><span class="pun">.</span><span class="pln">log</span><span class="pun">(</span><span class="pln">myMathModule</span><span class="pun">.</span><span class="pln">exports</span><span class="pun">.</span><span class="pln">doubleExp</span><span class="pun">);</span></code></li><li class="L4"><code class="language-js"><span class="pln">    </span><span class="kwd">for</span><span class="pun">(</span><span class="kwd">var</span><span class="pln"> i </span><span class="pun">=</span><span class="pln"> </span><span class="lit">0</span><span class="pun">;</span><span class="pln"> i </span><span class="pun">&lt;</span><span class="pln"> </span><span class="lit">5</span><span class="pun">;</span><span class="pln"> i</span><span class="pun">++)</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L5"><code class="language-js"><span class="pln">        console</span><span class="pun">.</span><span class="pln">log</span><span class="pun">(</span><span class="pln">myMathModule</span><span class="pun">.</span><span class="pln">exports</span><span class="pun">.</span><span class="pln">doubleExp</span><span class="pun">(</span><span class="pln">i</span><span class="pun">));</span></code></li><li class="L6"><code class="language-js"><span class="pln">    </span><span class="pun">}</span></code></li><li class="L7"><code class="language-js"><span class="pun">});</span></code></li><li class="L8"><code class="language-js"><span class="pun">&lt;/</span><span class="pln">script</span><span class="pun">&gt;</span></code></li></ol></pre>\
\
<p>把代码放到 html 文件中，启动本地文件服务器，在浏览器中加载页面（注意：浏览器要开启WebAssembly功能），就可以在控制台中查看了！</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="参考链接">参考链接</h3>\
\
<ul>\
<li><a href="http://webassembly.org/" target="_blank">WebAssembly</a></li>\
<li><a href="http://www.infoq.com/cn/news/2013/05/javascript-browser-bytecode" target="_blank">讨论：我们是否需要一种通用的Web字节码？</a></li>\
<li><a href="http://www.infoq.com/cn/news/2015/06/webassembly-wasm" target="_blank">WebAssembly：面向Web的通用二进制和文本格式</a></li>\
<li><a href="http://www.infoq.com/cn/news/2015/10/webassembly-7-things" target="_blank">关于WebAssembly你需要了解的7件事</a></li>\
<li><a href="http://cultureofdevelopment.com/blog/build-your-first-thing-with-web-assembly" target="_blank">Build Your First Thing With WebAssembly - Culture of Development</a></li>\
<li><a href="https://www.zhihu.com/question/31415286" target="_blank">如何评论浏览器最新的 WebAssembly 字节码技术？</a></li>\
</ul>	目前在浏览器中，大部分开发者所使用的编程语言是JavaScript，如果使用其它的语言可以吗？JavaScript是否可以先编译，浏览器直接运行编译后的结果呢？	8	0	2017-01-12 13:20:41	2017-01-11 21:43:18	WebAssembly ，也可以称为wasm，本文统一用WebAssembly。\
\
本文主要介绍一下WebAssembly，从以下几个方面：\
\
- WebAssembly的由来;\
- WebAssembly是什么？\
- WebAssembly目前的进展情况；\
- 简单的演示示例。\
\
### WebAssembly的由来\
\
目前在浏览器中，大部分开发者所使用的编程语言是JavaScript，如果使用其它的语言可以吗？JavaScript是否可以先编译，浏览器直接运行编译后的结果呢？\
\
Arstechnica上发布了一篇 [Are video codecs written in JavaScript really the future? | Ars Technica](http://arstechnica.com/information-technology/2013/05/are-video-codecs-written-in-javascript-really-the-future/) ，其中Raniz的评论引来了广泛讨论：\
\
> 我认为我们主要的精力应该是在浏览器上支持更过的语言，而不是任何事情都用JavaScript来实现。如果浏览器端存在一个标准的字节码，开发者可以选择更多的语言；源代码对浏览器和使用者是透明的。  \
> 二进制数据也可以节省宽带。  \
\
目前多种语言都对应的LLVM编译器，有人建议将LLVM位码用作中间“字节码”；\
 AlonZakai在 [azakai’s blog: The Elusive Universal Web Bytecode](http://mozakai.blogspot.ro/2013/05/the-elusive-universal-web-bytecode.html)中列举了使用字节码面临的困难 ：\
\
- 位码方案与目标平台强绑定；\
- 字节码目前的不统一；\
* 字节码标准化，浏览器优化JavaScript有了限制等；\
\
如此看来，字节码的成功的机会不大，但在其他语言带向Web开发语言方面，有两个重要的尝试。\
\
> Mozilla： C/C++ –> LLVM位码 –>Emscripten –> asm.js –> 浏览器  \
> Google：C/C++ –> LLVM位码 –>PNaCl –> 浏览器  \
\
[asm.js](http://asmjs.org/) 尝试标准化能够在任何浏览器中运行的一个JavaScript子集，其设计便于JavaScript引擎优化。Emscripten( [Home · kripken/emscripten Wiki · GitHub](https://github.com/kripken/emscripten/wiki) )是另一个项目，可以从LLVM位码生成asm.js。据Sakai介绍，在Firefox中通过asm.js运行的C++代码速度是原生代码的50%，他们预计随着时间的推移，性能会有所改进。\
\
[PNaCl](https://developer.chrome.com/native-client) 旨在增强Chrome中对原生应用的支持。NaCl是一个在浏览器端可运行编译后的C或C++代码的沙河，PnaCl在NaCl的基础上提出了这样的一种解决方案：为编译的NaCl模块提供一种独立于指令集体系结构的格式，无需重新编译即可支持多种目标平台。PNaCl仍然使用原来的NaCl沙盒机制，客户端从服务器请求位码，然后针对自己的架构将其转换为原生的可执行代码。\
\
如果要在浏览器中使用字节码，只能寄希望于某种理想的字节码。AlonZakai总结了这样的字节码可能需要满足以下几个条件：\
\
- 支持所有语言；\
- 高速运行代码；\
- 便于编译器生成；\
- 格式紧凑，容易转换；\
- 标准化；\
- 平台独立；\
- 安全；\
\
为此，Mozilla、谷歌、微软和苹果决定开发一种面向Web的二进制格式，该格式名为WebAssembly。\
\
WebAssembly可以作为任何编程语言的编译目标，使应用程序可以运行在浏览器或其它代理中。\
\
### WebAssembly是什么？\
\
WebAssembly实际上是一个经过压缩的AST编码，以二进制形式存在，可与当前的Web平台集成并在Web环境中，最终实现在各类平台上以接近原生的速度调用常见的硬件功能。\
\
下面是一段WebAssembly的演示示例， [S-表达式 - 维基百科，自由的百科全书](https://zh.wikipedia.org/wiki/S-%E8%A1%A8%E8%BE%BE%E5%BC%8F) AST：\
\
```\
;; Iterative factorial named\
(func $fac-iter (param $n i64) (result i64)\
    (local $i i64)\
        (local $res i64)\
    (set_local $i (get_local $n))\
    (set_local $res (i64.const 1))\
        (label $done\
        (loop\
            (if\
                (i64.eq (get_local $i) (i64.const 0))\
                    (break $done)\
                (block\
                    (set_local $res (i64.mul (get_local $i) (get_local $res)))\
                        (set_local $i (i64.sub (get_local $i) (i64.const 1)))\
                    )\
                )\
            )\
        )\
        (return (get_local $res)\
    )\
)\
```\
\
使用二进制的原因是：可以提供更高的效率：它减少了下载文件大小，并加快了解码速度。\
\
与WebAssembly相关的概念有：源代码、编译器、汇编、字节码、机器码。WebAssembly为Web打造一套专用的字节码，这项标准在未来应用场景可能是这样的：\
\
- 开发应用，但使用任何一门可被编译为WebAssembly的语言编写源代码；\
- 用编译器将源代码转换为WebAssembly字节码，也可按需转换为汇编代码；\
- 在浏览器中加载字节码并运行。\
\
![webassembly.png](https://dn-woerwosi.qbox.me/blog/images/2017/01/11/webassembly.png)\
\
关于WebAssembly，需要了解的是（具体内容可参考： [关于WebAssembly你需要了解的7件事](http://www.infoq.com/cn/news/2015/10/webassembly-7-things) ）：\
\
- WebAssembly不会替代JavaScript；\
* WebAssembly将超出JavaScript所需的功能进行扩展，例如多线程；\
* WebAssembly由参与组建asm.js和(P)NaCl的团队共同开发；\
* WebAssembly向后兼容，提供了Polypill；\
* WebAssembly比CPU汇编代码更简单易懂；\
* 支持在浏览器中开启Source-maps功能调试编译后代码；\
* 即刻运行，无须等待；\
\
### WebAssembly目前的进展情况\
\
[WebAssembly Community Group](https://w3.org/community/webassembly/)已经有了后续MVP版本的一个候选 — 浏览器预览版，部分浏览器已经实现了相应的API，在Chrome Canary(金丝雀)、Firefox中已经可以尝鲜了。目前CG正在从社区收集反馈。\
\
**里程碑事件**\
\
- 2015.4， [WebAssembly Community Group](https://w3.org/community/webassembly/)成立；\
* 2015.6，发布了首次公告，https://github.com/WebAssembly/design/issues/150；\
* 2016.3，定义和实现了核心能力；\
* 2016.10，发布了浏览器预览版；\
\
**其它**\
\
各浏览器目前对该功能的支持还处于实验性阶段，距离真正使用还有较长的时间周期；\
\
另一方面，这项新技术对实际能够产生什么样的效果，无法预知。这种方法能带来的好处是，我们从头开始设计，没有历史包袱，或许会得到一个更优雅的解决方案。这种想法很吸引人，而且一般说来优雅的方案会带来更好的结果，但以前也争论过，在这一特定情况下，优雅的方案如果没有明显的技术优势，那就是为了优雅而优雅了。\
\
JavaScript已经有20多年的历史了，Brendan Eich当时绝没料到这种小语言在今天竟然有了如此重要的地位。目前JavaScript广泛应用于所有主流浏览器，而且随着Node.js的流行，它还进入了服务器端。这并不是因为JavaScript设计得好，而是因为我们很难把所有的主要参与者聚到一起做出一个更好的方案，软件上的各种东西也很难切换了。和HTTP和HTML一样，尽管存在各种缺点，尽管我们都知道如果能够达成一致，我们可以做得更好，JavaScript还是会走向繁荣。\
\
JavaScript上存在着缺点，WebAssembly是未来的解决方案吗？\
\
\
### WebAssembly演示示例\
\
> 一切都是演示性的，如果没有达到理想的效果，请保持冷静(PLEASE KEEP CALM)。  \
\
查看官方DEMO，请访问：[Angry Bots Demo](http://webassembly.org/demo/)；官网的案例编译的是C代码，安装时请耐心。\
\
本演示示例在Mac上进行，需要的环境有：\
\
- Git；\
* CMake，可使用brew安装；\
* Xcode；\
* Python 2.7+；\
\
**准备工作**\
\
正式开始之前，先写一段asm.js代码，例如下面这段：\
\
```js\
// my-math-module.asm.js\
function MyMathModule(global) {\
    "use asm";\
    var exp = global.Math.exp;\
    function doubleExp(value) {\
        value = +value;\
        return +(+exp(+value) * 2.0);\
    }\
    return { doubleExp: doubleExp };\
}\
```\
\
注：这不是一个特别有用的函数，但符合规范，如果你觉得这很烂，但基本上每一个字符都是必须的。\
\
在上面代码中，一元运算符 `+` 的作用是类型注解，这样编译器会知道那些变量是 double 类型的，运行时就不必再次分辨它们是什么。\
\
在浏览器中运行，结果如下图所示：\
\
![result.png](https://dn-woerwosi.qbox.me/blog/images/2017/01/11/result.png)\
\
**尝试 WebAssembly**\
\
使用[GitHub - WebAssembly/binaryen: Compiler infrastructure and toolchain library for WebAssembly, in C++](https://github.com/WebAssembly/binaryen) 提供的工具，将asm.js 代码片段编译为wasm；\
\
```\
git clone https://github.com/WebAssembly/binaryen.git\
cd binaryen\
// binaryen 目录下会有一个 bin 文件夹\
cmake . & make\
// 使用asm2wasm生成wast文件\
./binaryen/bin/asm2wasm my-math-module.asm.js -o my-math-module.wast\
```\
\
生成后的内容如下：\
\
```\
(module\
  (type $FUNCSIG$dd (func (param f64) (result f64)))\
  (import "global.Math" "exp" (func $exp (param f64) (result f64)))\
  (import "env" "memory" (memory $0 256 256))\
  (import "env" "table" (table 0 0 anyfunc))\
  (import "env" "memoryBase" (global $memoryBase i32))\
  (import "env" "tableBase" (global $tableBase i32))\
  (export "doubleExp" (func $doubleExp))\
  (func $doubleExp (param $value f64) (result f64)\
    (return\
      (f64.mul\
        (call $exp\
          (get_local $value)\
        )\
        (f64.const 2)\
      )\
    )\
  )\
)\
```\
\
利用wasm-as将wast格式的代码转换为 wasm 二进制码；\
\
```\
./binaryen/bin/wasm-as my-math-module.wast -o my-math-module.wasm\
```\
\
如下图所示：\
\
```\
0061 736d 0d00 0000 0186 8080 8000 0160\
017c 017c 02d6 8080 8000 050b 676c 6f62\
616c 2e4d 6174 6803 6578 7000 0003 656e\
7606 6d65 6d6f 7279 0201 8002 8002 0365\
6e76 0574 6162 6c65 0170 0100 0003 656e\
760a 6d65 6d6f 7279 4261 7365 037f 0003\
656e 7609 7461 626c 6542 6173 6503 7f00\
0382 8080 8000 0100 078d 8080 8000 0109\
646f 7562 6c65 4578 7000 0109 8180 8080\
0000 0a97 8080 8000 0191 8080 8000 0020\
0010 0044 0000 0000 0000 0040 a20f 0b\
```\
\
下图演示了如何最低限度地加载模块：\
\
```js\
<script>\
fetch("my-math-module.wasm")\
.then(function(response) {\
    return response.arrayBuffer();\
})\
.then(function(buffer) {\
    var dependencies = {\
        "global": {},\
        "env": {}\
    };\
    dependencies["global.Math"] = window.Math;\
    var moduleBufferView = new Uint8Array(buffer);\
    var myMathModule = Wasm.instantiateModule(moduleBufferView, dependencies);\
    console.log(myMathModule.exports.doubleExp);\
    for(var i = 0; i < 5; i++) {\
        console.log(myMathModule.exports.doubleExp(i));\
    }\
});\
</script>\
```\
\
把代码放到 html 文件中，启动本地文件服务器，在浏览器中加载页面（注意：浏览器要开启WebAssembly功能），就可以在控制台中查看了！\
\
### 参考链接\
\
- [WebAssembly](http://webassembly.org/)\
- [讨论：我们是否需要一种通用的Web字节码？](http://www.infoq.com/cn/news/2013/05/javascript-browser-bytecode)\
* [WebAssembly：面向Web的通用二进制和文本格式](http://www.infoq.com/cn/news/2015/06/webassembly-wasm)\
* [关于WebAssembly你需要了解的7件事](http://www.infoq.com/cn/news/2015/10/webassembly-7-things)\
* [Build Your First Thing With WebAssembly - Culture of Development](http://cultureofdevelopment.com/blog/build-your-first-thing-with-web-assembly)\
* [如何评论浏览器最新的 WebAssembly 字节码技术？](https://www.zhihu.com/question/31415286)\
                
39	0	RainDon	NodeJS之Buffer	node-buffer	1	1		0	ImShengli	Node				<div class="md-section-divider"></div>\
\
<p>本文从以下几个方面去梳理NodeJS中关于Buffer的内容 [文章中所涉及到的API为NodeJS<code>v7.4.0</code>版本] ：</p>\
\
<ul>\
<li>为什么要引入Buffer？</li>\
<li>Buffer是什么？</li>\
<li>如何使用？</li>\
<li>性能问题；</li>\
<li>底层知识；</li>\
</ul>\
\
<div class="md-section-divider"></div>\
\
<h3 id="为什么要引入buffer">为什么要引入Buffer？</h3>\
\
<p>在计算机中，编码的概念由来已久，是用于将计算机存储的内容以大家可以看懂的形式进行展示。不同的编码，用不同的规则解释计算机存储的二进制数据，比如：英文字符可以用一个字节表示，一个汉字可能需要三个字节。</p>\
\
<p><code>JavaScript</code>为浏览器而设计，能够很好的处理Unicode编码的字符串，但对于二进制或非Unicode编码的数据显得无能无力。在NodeJS中，对于需要处理的网络数据、文件内容等，都是以二进制格式存在。因此，NodeJS扩展了JavaScript语言，为二进制数据的处理提供了<code>Buffer</code>类。</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="buffer是什么">Buffer是什么？</h3>\
\
<p>Buffer是一个类似Array的对象，主要用于操作字节。元素为16进制的两位数，即0~255的值。</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-js"><span class="kwd">const</span><span class="pln"> str </span><span class="pun">=</span><span class="pln"> </span><span class="str">"深入浅出node.js"</span><span class="pun">;</span></code></li><li class="L1"><code class="language-js"><span class="kwd">const</span><span class="pln"> buf </span><span class="pun">=</span><span class="pln"> </span><span class="typ">Buffer</span><span class="pun">.</span><span class="pln">from</span><span class="pun">(</span><span class="pln">str</span><span class="pun">,</span><span class="pln"> </span><span class="str">'utf8'</span><span class="pun">);</span></code></li><li class="L2"><code class="language-js"><span class="pln">console</span><span class="pun">.</span><span class="pln">log</span><span class="pun">(</span><span class="pln">buf</span><span class="pun">);</span></code></li><li class="L3"><code class="language-js"><span class="com">// UTF-8编码下，中文占3个元素；</span></code></li><li class="L4"><code class="language-js"><span class="com">// &lt;Buffer e6 b7 b1 e5 85 a5 e6 b5 85 e5 87 ba 6e 6f 64 65 2e 6a 73&gt;</span></code></li></ol></pre>\
\
<p>Buffer常驻内存，挂载在全局对象[global]上；</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="如何使用">如何使用？</h3>\
\
<p><strong>构建Buffer对象</strong></p>\
\
<ul>\
<li><code>Buffer.alloc(length);</code>形式，用0填充；</li>\
<li><code>Buffer.from(str, [encoding]);</code>形式；</li>\
</ul>\
\
<p><strong>length属性</strong></p>\
\
<ul>\
<li>可以通过length得到长度；</li>\
<li>元素可以通过下标访问，也可以通过下标赋值[每个元素值在0~255之间]；</li>\
</ul>\
\
<p><strong>Buffer转换</strong></p>\
\
<p>Buffer可以和字符串相互转换，是否支持字符串编码可通过<code>Buffer.isEncoding(encoding)</code>进行判断；</p>\
\
<p>字符串转Buffer</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-js"><span class="com">// 只能一种编码类型，默认UTF-8；</span></code></li><li class="L1"><code class="language-js"><span class="typ">Buffer</span><span class="pun">.</span><span class="pln">from</span><span class="pun">(</span><span class="pln">string</span><span class="pun">,</span><span class="pln"> </span><span class="pun">[</span><span class="pln">encoding</span><span class="pun">]);</span></code></li><li class="L2"><code class="language-js"><span class="com">// 存储不同编码类型的字符串转码的值；</span></code></li><li class="L3"><code class="language-js"><span class="pln">buf</span><span class="pun">.</span><span class="pln">write</span><span class="pun">(</span><span class="pln">string</span><span class="pun">,</span><span class="pln"> </span><span class="pun">[</span><span class="pln">offset</span><span class="pun">],</span><span class="pln"> </span><span class="pun">[</span><span class="pln">length</span><span class="pun">],</span><span class="pln"> </span><span class="pun">[</span><span class="pln">encoding</span><span class="pun">]);</span></code></li></ol></pre>\
\
<p>Buffer转字符串</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-js"><span class="com">// 编码默认UTF-8；</span></code></li><li class="L1"><code class="language-js"><span class="pln">buf</span><span class="pun">.</span><span class="pln">toString</span><span class="pun">([</span><span class="pln">encoding</span><span class="pun">],</span><span class="pln"> </span><span class="pun">[</span><span class="pln">start</span><span class="pun">],</span><span class="pln"> </span><span class="pun">[</span><span class="pln">end</span><span class="pun">]);</span></code></li></ol></pre>\
\
<p>对于不支持的编码类型，可以通过相关模块来进行实现，如<code>iconv</code>和<code>iconv-lite</code>；例如：</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-js"><span class="kwd">const</span><span class="pln"> iconv </span><span class="pun">=</span><span class="pln"> require</span><span class="pun">(</span><span class="str">'iconv-lite'</span><span class="pun">);</span></code></li><li class="L1"><code class="language-js"><span class="com">// Buffer转字符串</span></code></li><li class="L2"><code class="language-js"><span class="kwd">const</span><span class="pln"> str </span><span class="pun">=</span><span class="pln"> iconv</span><span class="pun">.</span><span class="pln">decode</span><span class="pun">(</span><span class="pln">buf</span><span class="pun">,</span><span class="pln"> </span><span class="str">'win1251'</span><span class="pun">);</span></code></li><li class="L3"><code class="language-js"><span class="com">// 字符串转Buffer</span></code></li><li class="L4"><code class="language-js"><span class="kwd">const</span><span class="pln"> buf </span><span class="pun">=</span><span class="pln"> iconv</span><span class="pun">.</span><span class="pln">encode</span><span class="pun">(</span><span class="str">'String'</span><span class="pun">,</span><span class="pln"> </span><span class="str">'win1251'</span><span class="pun">);</span></code></li></ol></pre>\
\
<p><strong>Buffer的拼接</strong></p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-js"><span class="com">// 错误示例：</span></code></li><li class="L1"><code class="language-js"><span class="pln">rs</span><span class="pun">.</span><span class="pln">on</span><span class="pun">(</span><span class="str">'data'</span><span class="pun">,</span><span class="pln"> </span><span class="pun">(</span><span class="pln">trunk</span><span class="pun">)</span><span class="pln"> </span><span class="pun">=&gt;</span><span class="pln"> </span><span class="pun">{</span></code></li><li class="L2"><code class="language-js"><span class="pln">    </span><span class="com">// data = data.toString() + trunk.toString();</span></code></li><li class="L3"><code class="language-js"><span class="pln">    </span><span class="com">// 如果有宽字符，可能会出现乱码；</span></code></li><li class="L4"><code class="language-js"><span class="pln">      data </span><span class="pun">+=</span><span class="pln"> trunk</span><span class="pun">;</span><span class="pln"> </span></code></li><li class="L5"><code class="language-js"><span class="pun">});</span></code></li><li class="L6"><code class="language-js"></code></li><li class="L7"><code class="language-js"><span class="com">// 恰当的做法如下：</span></code></li><li class="L8"><code class="language-js"><span class="com">// 把输入流中的Buffer存储到List中，利用concat()拼接；</span></code></li><li class="L9"><code class="language-js"><span class="com">// 这样处理，也有助于提供性能；</span></code></li><li class="L0"><code class="language-js"><span class="typ">Buffer</span><span class="pun">.</span><span class="pln">concat</span><span class="pun">(</span><span class="typ">List</span><span class="pun">,</span><span class="pln"> size</span><span class="pun">):</span></code></li><li class="L1"><code class="language-js"></code></li><li class="L2"><code class="language-js"><span class="com">// 问题：如果数据流非常大，大到内存爆，怎么办？ </span></code></li><li class="L3"><code class="language-js"><span class="com">// 答：单个NodeJS进程是有最大内存限制的，Buffer对象占用的内存空间是不计算在NodeJS进程内存空间限制上的，因此，可以用Buffer存储需要占用较大内存的数据，最大值与Buffer.kMaxLength有关；</span></code></li><li class="L4"><code class="language-js"><span class="kwd">const</span><span class="pln"> buf </span><span class="pun">=</span><span class="pln"> </span><span class="typ">Buffer</span><span class="pun">.</span><span class="pln">alloc</span><span class="pun">(</span><span class="lit">1024</span><span class="pln"> </span><span class="pun">*</span><span class="pln"> </span><span class="lit">1024</span><span class="pln"> </span><span class="pun">*</span><span class="pln"> </span><span class="lit">1024</span><span class="pln"> </span><span class="pun">-</span><span class="pln"> </span><span class="lit">1</span><span class="pun">);</span></code></li></ol></pre>\
\
<p>可以通过<code>bufferhelper</code>简化地处理Buffer对象；</p>\
\
<p><strong>乱码问题</strong></p>\
\
<p>乱码的原因归根结底就是：<strong>Buffer没有被按照正确的编码类型来进行转换</strong>，导致字符显示乱码；</p>\
\
<p>没有被正确的编码，可能会有以下几种情况：</p>\
\
<ul>\
<li>字节不足，无法编码；</li>\
<li>编码类型不同；</li>\
<li>不支持或不知道数据流中的编码类型；</li>\
</ul>\
\
<p>解决乱码的方式：</p>\
\
<ul>\
<li>数据流读取完成后，拼接；[见上面Buffer的拼接示例]</li>\
<li>指定转换时的编码类型，如<code>rs.setEncoding(‘utf8’)</code>，该方法在data事件中传递的不再是Buffer对象，而是编码中的字符串，通过<code>string_decoder</code>；再比如<code>iconv.decode(buf, ‘utf8’)</code>方法；</li>\
</ul>\
\
<div class="md-section-divider"></div>\
\
<h3 id="性能">性能</h3>\
\
<p><strong>Buffer数据传输</strong></p>\
\
<p>在网络中传输的数据，需要转换为Buffer，以二进制数据传输；提高字符串到Buffer的转换效率，可以提高网络吞吐量。</p>\
\
<p>在《深入浅出NodeJS》作者的实验中，通过预先转换静态内容为Buffer对象，QPS提升近一倍。因此，对于<strong>静态内容</strong>，它以二进制数据存在，在<strong>传输时预先转换为Buffer类型</strong>即可。</p>\
\
<p>在文件读取时，通过设置<code>highWaterMark</code>调节每次读取的内容大小，来提高处理速度。理论上，处理大文件时，<code>highWaterMark</code>越大，处理速度越快。</p>\
\
<p><strong>字符串拼接 对比 Buffer拼接</strong></p>\
\
<p>在 <a href="http://blog.fens.me/nodejs-buffer/" target="_blank">Node.js缓冲模块Buffer | 粉丝日志</a> 的实验中，对于字符串连接，循环30万次，String对字符串的连接操作，要远快于Buffer的连接操作。</p>\
\
<p>因此，我们在保存字符串的时候，该用string还是要用string；只有在保存非UTF-8的字符串以及二进制数据的情况下，我们才用Buffer。</p>\
\
<p><strong>数据存储</strong></p>\
\
<p>对于一个时间戳如<code>1447656645380</code>，我们应该怎么样存储呢？如果当做字符串，需要占用11个字节；而我们把它转换为二进制数据，仅需6个字节。</p>\
\
<div class="md-section-divider"></div>\
\
<pre class="prettyprint linenums prettyprinted"><ol class="linenums"><li class="L0"><code class="language-js"><span class="kwd">const</span><span class="pln"> buf </span><span class="pun">=</span><span class="pln"> </span><span class="typ">Buffer</span><span class="pun">.</span><span class="pln">allocUnsafe</span><span class="pun">(</span><span class="lit">6</span><span class="pun">);</span></code></li><li class="L1"><code class="language-js"><span class="pln">buf</span><span class="pun">.</span><span class="pln">writeUIntBE</span><span class="pun">(</span><span class="lit">1447656645380</span><span class="pun">,</span><span class="pln"> </span><span class="lit">0</span><span class="pun">,</span><span class="pln"> </span><span class="lit">6</span><span class="pun">);</span><span class="pln"> </span><span class="com">// &lt;Buffer 01 51 0f 0f 63 04&gt;</span></code></li><li class="L2"><code class="language-js"><span class="pln">buf</span><span class="pun">.</span><span class="pln">readUIntBE</span><span class="pun">(</span><span class="lit">0</span><span class="pun">,</span><span class="pln"> </span><span class="lit">6</span><span class="pun">);</span><span class="pln"> </span><span class="com">// 1447656645380</span></code></li></ol></pre>\
\
<p>所以，请留意Buffer文档中的<code>readXXX()</code>和<code>writeXXX()</code>方法。</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="底层知识">底层知识</h3>\
\
<p>为了更好的了解的Buffer，您还需要了解的有：</p>\
\
<ul>\
<li>NodeJS中Buffer的实现；</li>\
<li>Buffer的内存分配策略；[<strong>可了解8KB界限</strong>]</li>\
</ul>\
\
<p>防止误人子弟，本文中暂不涉及。</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="参考链接">参考链接</h3>\
\
<ul>\
<li><a href="https://nodejs.org/api/buffer.html" target="_blank">Buffer API</a></li>\
<li><a href="http://blog.fens.me/nodejs-buffer/" target="_blank">Node.js缓冲模块Buffer | 粉丝日志</a></li>\
<li><a href="https://cnodejs.org/topic/5189ff4f63e9f8a54207f60c" target="_blank">浅析nodejs的buffer类 - CNode技术社区</a></li>\
<li><a href="http://morning.work/page/2015-11/nodejs_buffer.html" target="_blank">Node.js 的 Buffer 那些你可能不知道的用法 - 早起搬砖 morning.work</a></li>\
</ul>	在JavaScript的世界中，能够很好的处理字符串，而不必设计二进制数据的处理，但在NodeJS中，我们要进行文件处理、网络数据处理，这些数据都是以二进制数据存在，故NodeJS中增加了Buffer类。本文将总结梳理Buffer的相关知识点。	9	0	2017-01-15 00:02:42	2017-01-14 17:01:42	本文从以下几个方面去梳理NodeJS中关于Buffer的内容 [文章中所涉及到的API为NodeJS`v7.4.0`版本] ：\
\
* 为什么要引入Buffer？\
* Buffer是什么？\
* 如何使用？\
* 性能问题；\
* 底层知识；\
\
### 为什么要引入Buffer？\
\
在计算机中，编码的概念由来已久，是用于将计算机存储的内容以大家可以看懂的形式进行展示。不同的编码，用不同的规则解释计算机存储的二进制数据，比如：英文字符可以用一个字节表示，一个汉字可能需要三个字节。\
\
`JavaScript`为浏览器而设计，能够很好的处理Unicode编码的字符串，但对于二进制或非Unicode编码的数据显得无能无力。在NodeJS中，对于需要处理的网络数据、文件内容等，都是以二进制格式存在。因此，NodeJS扩展了JavaScript语言，为二进制数据的处理提供了`Buffer`类。\
\
### Buffer是什么？\
\
Buffer是一个类似Array的对象，主要用于操作字节。元素为16进制的两位数，即0~255的值。\
\
```js\
const str = "深入浅出node.js";\
const buf = Buffer.from(str, 'utf8');\
console.log(buf);\
// UTF-8编码下，中文占3个元素；\
// <Buffer e6 b7 b1 e5 85 a5 e6 b5 85 e5 87 ba 6e 6f 64 65 2e 6a 73>\
```\
\
Buffer常驻内存，挂载在全局对象[global]上；\
\
### 如何使用？\
\
**构建Buffer对象**\
\
- `Buffer.alloc(length);`形式，用0填充；\
* `Buffer.from(str, [encoding]);`形式；\
\
**length属性**\
\
- 可以通过length得到长度；\
* 元素可以通过下标访问，也可以通过下标赋值[每个元素值在0~255之间]；\
\
**Buffer转换**\
\
Buffer可以和字符串相互转换，是否支持字符串编码可通过`Buffer.isEncoding(encoding)`进行判断；\
\
字符串转Buffer\
\
```js\
// 只能一种编码类型，默认UTF-8；\
Buffer.from(string, [encoding]);\
// 存储不同编码类型的字符串转码的值；\
buf.write(string, [offset], [length], [encoding]);\
```\
\
Buffer转字符串\
\
```js\
// 编码默认UTF-8；\
buf.toString([encoding], [start], [end]);\
```\
\
对于不支持的编码类型，可以通过相关模块来进行实现，如`iconv`和`iconv-lite`；例如：\
\
```js\
const iconv = require('iconv-lite');\
// Buffer转字符串\
const str = iconv.decode(buf, 'win1251');\
// 字符串转Buffer\
const buf = iconv.encode('String', 'win1251');\
```\
\
**Buffer的拼接**\
\
```js\
// 错误示例：\
rs.on('data', (trunk) => {\
    // data = data.toString() + trunk.toString();\
    // 如果有宽字符，可能会出现乱码；\
\	  data += trunk; \
});\
\
// 恰当的做法如下：\
// 把输入流中的Buffer存储到List中，利用concat()拼接；\
// 这样处理，也有助于提供性能；\
Buffer.concat(List, size):\
\
// 问题：如果数据流非常大，大到内存爆，怎么办？ \
// 答：单个NodeJS进程是有最大内存限制的，Buffer对象占用的内存空间是不计算在NodeJS进程内存空间限制上的，因此，可以用Buffer存储需要占用较大内存的数据，最大值与Buffer.kMaxLength有关；\
const buf = Buffer.alloc(1024 * 1024 * 1024 - 1);\
```\
\
可以通过`bufferhelper`简化地处理Buffer对象；\
\
**乱码问题**\
\
乱码的原因归根结底就是：**Buffer没有被按照正确的编码类型来进行转换**，导致字符显示乱码；\
\
没有被正确的编码，可能会有以下几种情况：\
\
* 字节不足，无法编码；\
* 编码类型不同；\
* 不支持或不知道数据流中的编码类型；\
\
解决乱码的方式：\
\
* 数据流读取完成后，拼接；[见上面Buffer的拼接示例]\
* 指定转换时的编码类型，如`rs.setEncoding(‘utf8’)`，该方法在data事件中传递的不再是Buffer对象，而是编码中的字符串，通过`string_decoder`；再比如`iconv.decode(buf, ‘utf8’)`方法；\
\
### 性能\
\
**Buffer数据传输**\
\
在网络中传输的数据，需要转换为Buffer，以二进制数据传输；提高字符串到Buffer的转换效率，可以提高网络吞吐量。\
\
在《深入浅出NodeJS》作者的实验中，通过预先转换静态内容为Buffer对象，QPS提升近一倍。因此，对于**静态内容**，它以二进制数据存在，在**传输时预先转换为Buffer类型**即可。\
\
在文件读取时，通过设置`highWaterMark`调节每次读取的内容大小，来提高处理速度。理论上，处理大文件时，`highWaterMark`越大，处理速度越快。\
\
**字符串拼接 对比 Buffer拼接**\
\
在 [Node.js缓冲模块Buffer | 粉丝日志](http://blog.fens.me/nodejs-buffer/) 的实验中，对于字符串连接，循环30万次，String对字符串的连接操作，要远快于Buffer的连接操作。\
\
因此，我们在保存字符串的时候，该用string还是要用string；只有在保存非UTF-8的字符串以及二进制数据的情况下，我们才用Buffer。\
\
**数据存储**\
\
对于一个时间戳如`1447656645380`，我们应该怎么样存储呢？如果当做字符串，需要占用11个字节；而我们把它转换为二进制数据，仅需6个字节。\
\
```js\
const buf = Buffer.allocUnsafe(6);\
buf.writeUIntBE(1447656645380, 0, 6); // <Buffer 01 51 0f 0f 63 04>\
buf.readUIntBE(0, 6); // 1447656645380\
```\
\
所以，请留意Buffer文档中的`readXXX()`和`writeXXX()`方法。\
\
### 底层知识\
\
为了更好的了解的Buffer，您还需要了解的有：\
\
* NodeJS中Buffer的实现；\
* Buffer的内存分配策略；[**可了解8KB界限**]\
\
防止误人子弟，本文中暂不涉及。\
\
\
### 参考链接\
\
* [Buffer API](https://nodejs.org/api/buffer.html)\
* [Node.js缓冲模块Buffer | 粉丝日志](http://blog.fens.me/nodejs-buffer/)\
* [浅析nodejs的buffer类 - CNode技术社区](https://cnodejs.org/topic/5189ff4f63e9f8a54207f60c)\
* [Node.js 的 Buffer 那些你可能不知道的用法 - 早起搬砖 morning.work](http://morning.work/page/2015-11/nodejs_buffer.html)\
                
40	0	RainDon	NodeJS之异步I/O	node-async-io	1	1		0	ImShengli	Node				<div class="md-section-divider"></div>\
\
<p>本文介绍Node中的<code>异步I/O</code>，将围绕着以下几个方面：</p>\
\
<ul>\
<li>什么是异步I/O？</li>\
<li>为什么要选择异步I/O？</li>\
<li>Node中是如何实现的？</li>\
</ul>\
\
<div class="md-section-divider"></div>\
\
<h3 id="什么是异步io">什么是异步I/O？</h3>\
\
<p>首先介绍几个概念，异步和I/O：</p>\
\
<ul>\
<li>异步：与同步相对，同步是等待上个任务执行完成后下个任务再执行；异步是则不必等待上个任务的执行结束就可以执行；</li>\
<li>I/O：输入输出流，这里包括网络请求、文件处理、数据库操作等；</li>\
</ul>\
\
<p>异步I/O是：在处理I/O操作时，发出相应的I/O请求后，不必等待请求结果，在得到相应的处理结果后，再调用后续的操作。</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="为什么要选择异步io">为什么要选择异步I/O？</h3>\
\
<p>简单点说，就是：选择异步I/O后，对于当前的任务，在请求I/O的过程中，可以并发处理其他的任务，更高效地利用计算资源。</p>\
\
<p><strong>多线程</strong></p>\
\
<p>Node的特点是：单线程、事件驱动、异步I/O。</p>\
\
<p>选择单线程的原因是：多线程面临锁、状态同步、切换上下文开销等问题，单线程更符合编程习惯，异步I/O可以更好发挥Node在单线程上的价值。[多线程可以有效利用多核CPU，值得说明的是：Node也提供多线程处理方式]</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="node中是如何实现的">Node中是如何实现的？</h3>\
\
<p><strong>同步异步I/O和阻塞非阻塞I/O</strong></p>\
\
<p>同异步I/O是针对任务来说的，如果有多个任务，异步I/O中上一个任务不会阻塞下一步任务的执行；</p>\
\
<p>阻塞和非阻塞I/O是应用程序读取系统内核中I/O的方式；单线程中，阻塞I/O是等待返回数据，这个时间片内的CPU处于等待状态；非阻塞I/O是调用之后立即返回， ~CPU的时间片可以处理其他事务？~ ，再采用轮询的方式来判断I/O操作是否完成。</p>\
\
<p><strong>现实中的异步I/O</strong></p>\
\
<p>通过多线程的方式来实现，部分线程进行阻塞I/O或非阻塞I/O+轮询完成数据获取，通过线程通信，实现异步I/O；</p>\
\
<p><strong>Node的异步I/O</strong></p>\
\
<ul>\
<li>事件循环：Node自身的执行模型；启动进程时，会有一个类似<code>while(true)</code>的循环，每执行一次循环体，称为一个Tick；每个Tick就是从观察者那里查看是否还有事件待处理，如果没有，退出进程；</li>\
<li>观察者：向事件循环反馈是否有要处理的时间；有网络I/O观察者、文件I/O观察者等；</li>\
<li>请求对象：每一次异步I/O的中间产物，所有状态都在这个对象中，包括请求参数、执行结果、回调函数；</li>\
<li>I/O线程池：操作系统层面的异步I/O实现方式；</li>\
</ul>\
\
<p>整体流程如下图所示 [图片来源于《深入浅出NodeJS》]： <br>\
<img src="https://dn-woerwosi.qbox.me/blog/images/2017/01/14/node-async-io.png" alt="async-io" title=""></p>\
\
<p>Node底层也是通过线程池的方式来实现的异步I/O；[上文说的Node是单线程的，指的是JavaScript代码执行在单线程中]</p>\
\
<div class="md-section-divider"></div>\
\
<h3 id="非io的异步api">非I/O的异步API</h3>\
\
<p><strong>定时器</strong></p>\
\
<p>setTimeout() 和 setInterval() ：通过这两个方法创建的定时器会被插入到定时器观察者内部的<code>红黑树</code>中，每次Tick执行时，检查定时器对象是否超过定时时间，如果是，执行回调；</p>\
\
<p>存在的问题：执行时间并非精确；</p>\
\
<p><strong>process.nextTick()</strong></p>\
\
<p><code>nextTick()</code>指定回调在下一次事件循环中执行，比setTimeout(fn, 0)精确、轻量、高效；</p>\
\
<p><strong>setImmediate()</strong></p>\
\
<p>也是在下一次事件循环中执行，与nextTick()不同的是：</p>\
\
<ul>\
<li>nextTick()执行顺序先于setImmediate()，因为对应的观察者不一样；</li>\
<li>setImmediate()一次事件循环执行一个，而nextTick()不限个数；</li>\
</ul>\
\
<div class="md-section-divider"></div>\
\
<h3 id="参考链接">参考链接</h3>\
\
<ul>\
<li><a href="http://tech.meituan.com/redblack-tree.html" target="_blank">红黑树深入剖析及Java实现 -</a></li>\
</ul>	单线程、事件驱动、异步I/O是NodeJS的三大特征，其中异步I/O使得NodeJS高性能的Web服务器。本文主要是梳理异步I/O在NodeJS中的基本概念、处理方式等。	5	0	2017-01-23 21:29:16	2017-01-14 23:33:11	                \
本文介绍Node中的`异步I/O`，将围绕着以下几个方面：\
\
* 什么是异步I/O？\
* 为什么要选择异步I/O？\
* Node中是如何实现的？\
\
### 什么是异步I/O？\
\
首先介绍几个概念，异步和I/O：\
\
* 异步：与同步相对，同步是等待上个任务执行完成后下个任务再执行；异步是则不必等待上个任务的执行结束就可以执行；\
* I/O：输入输出流，这里包括网络请求、文件处理、数据库操作等；\
\
异步I/O是：在处理I/O操作时，发出相应的I/O请求后，不必等待请求结果，在得到相应的处理结果后，再调用后续的操作。\
\
### 为什么要选择异步I/O？\
\
简单点说，就是：选择异步I/O后，对于当前的任务，在请求I/O的过程中，可以并发处理其他的任务，更高效地利用计算资源。\
\
**多线程**\
\
Node的特点是：单线程、事件驱动、异步I/O。\
\
选择单线程的原因是：多线程面临锁、状态同步、切换上下文开销等问题，单线程更符合编程习惯，异步I/O可以更好发挥Node在单线程上的价值。[多线程可以有效利用多核CPU，值得说明的是：Node也提供多线程处理方式]\
\
### Node中是如何实现的？\
\
**同步异步I/O和阻塞非阻塞I/O**\
\
同异步I/O是针对任务来说的，如果有多个任务，异步I/O中上一个任务不会阻塞下一步任务的执行；\
\
阻塞和非阻塞I/O是应用程序读取系统内核中I/O的方式；单线程中，阻塞I/O是等待返回数据，这个时间片内的CPU处于等待状态；非阻塞I/O是调用之后立即返回， ~CPU的时间片可以处理其他事务？~ ，再采用轮询的方式来判断I/O操作是否完成。\
\
**现实中的异步I/O**\
\
通过多线程的方式来实现，部分线程进行阻塞I/O或非阻塞I/O+轮询完成数据获取，通过线程通信，实现异步I/O；\
\
**Node的异步I/O**\
\
* 事件循环：Node自身的执行模型；启动进程时，会有一个类似`while(true)`的循环，每执行一次循环体，称为一个Tick；每个Tick就是从观察者那里查看是否还有事件待处理，如果没有，退出进程；\
* 观察者：向事件循环反馈是否有要处理的时间；有网络I/O观察者、文件I/O观察者等；\
* 请求对象：每一次异步I/O的中间产物，所有状态都在这个对象中，包括请求参数、执行结果、回调函数；\
* I/O线程池：操作系统层面的异步I/O实现方式；\
\
整体流程如下图所示 [图片来源于《深入浅出NodeJS》]：\
![async-io](https://dn-woerwosi.qbox.me/blog/images/2017/01/14/node-async-io.png)\
\
Node底层也是通过线程池的方式来实现的异步I/O；[上文说的Node是单线程的，指的是JavaScript代码执行在单线程中]\
\
### 非I/O的异步API\
\
**定时器**\
\
setTimeout() 和 setInterval() ：通过这两个方法创建的定时器会被插入到定时器观察者内部的`红黑树`中，每次Tick执行时，检查定时器对象是否超过定时时间，如果是，执行回调；\
\
存在的问题：执行时间并非精确；\
\
**process.nextTick()**\
\
`nextTick()`指定回调在下一次事件循环中执行，比setTimeout(fn, 0)精确、轻量、高效；\
\
**setImmediate()**\
\
也是在下一次事件循环中执行，与nextTick()不同的是：\
\
* nextTick()执行顺序先于setImmediate()，因为对应的观察者不一样；\
* setImmediate()一次事件循环执行一个，而nextTick()不限个数；\
\
\
### 参考链接\
\
* [红黑树深入剖析及Java实现 -](http://tech.meituan.com/redblack-tree.html)\
\
                
41	0	RainDon	雷军的梦想与孤独	leijun-dream-and-lonely	5	1		0	ImShengli	Life				<div class="md-section-divider"></div>\
\
<blockquote class="white-blockquote">\
  <p>“在几乎所有的人都劝我把小米产品卖得贵一些的时候，我感到孤独，因为他们不了解我的梦想和追求。” ——雷军</p>\
</blockquote>\
\
<p><img src="https://dn-woerwosi.qbox.me/blog/images/2017/02/11/14F01954202910-325G.jpg" alt="LeiJun" title=""></p>\
\
<p>最近，雷总（指雷军，下同）的此番言论在网络上又激起了一波涟漪，这是其在亚布力中国企业家论坛提问环节，针对主持人宋立新问“雷军的孤独时刻”所做出的回答。自认为还算理性的小米用户的我，虽不能感受雷总的孤独，但相信他的梦想。</p>\
\
<p><strong>雷军的梦想</strong></p>\
\
<p>2015年11月24日，小米压轴好戏新品发布会上，雷总以“我所有的向往”的深情告白作为结尾，台下的小米高管们眼角也泛起了泪花。告白中，“我们的目标，也绝不是去抢什么市场第一，而是老老实实日复一日，做出感动人心的优质产品”，我相信，这是雷总过去、现在、未来所坚持的梦想。</p>\
\
<p>小米以“极致性价比”开启手机发烧友新的时代，本应为他们的时代却迎来了小米手机爆发式的增长，或许此时市场份额在小米人的心中占有重要的地位。直至2014年，小米一直保持高速增长。手机单品也从单一的爆款战略发展成了各价位全覆盖。2015年第四季度，小米市场份额下降至第三位，全年手机销量不及预期，小米人好像意识到了什么。不论市场份额心里预期如何变化，在这之间，不变的是小米一直打造“极致性价比”的优质产品，并由此发起了“新国货”运动，向世界展示中国智造。</p>\
\
<p>2016年，小米回归初心，认真做产品，发布小米MIX重量级产品。小米和米家产品，作为本行业内的鲶鱼，搅动搅和整个行业，“无需考虑价格、直接买”已成为越来越多人的共识。当然，就单品而言，可能小米和米家产品和本行业内的翘楚存在差距，在满足个人需求的前提下，小米和米家产品成为了最大可能性的选择。</p>\
\
<p><strong>雷军的孤独</strong></p>\
\
<p>2016年10月25日，小米MIX发布，3499元起。针对小米MIX这样一款设计元素突破性的产品，米粉、媒体、手机测评界、小米员工、甚至友商等几乎所有人都认为定价偏低。在小米“杂货铺”里，这样定价偏低的产品比比皆是。为什么如此高性价比的产品，却导致了雷总的孤独？</p>\
\
<p>时至今日，网络上，饥饿营销、市场份额下降、品牌稀释、屌丝、ADUI等消息一直萦绕在小米或小米产品的头上，虽然日复一日的解释，但这样的消息还是源源不断的出现；生活中，物美价廉的商品在老百姓的心目中还是觉得会不太可靠，百姓心中商人还是一次性逐利的“吸血鬼”；认知上，更多的用户还是不了解、不相信小米的理念，甚至对小米、米家的品牌知之甚少。“不清楚、不相信雷总的梦想和追求”，致使雷总在似娱乐业的手机业，每一步迈出的都是寂寞，每一脚跨出的都是孤独。</p>\
\
<p>吾等小辈在宣传、品牌、战略上提供不了什么建议，来改善小米在大家中的形象，但希望小米对自己梦想的坚持、“小米之家”新零售的尝试、米家品牌的生态链计划、2017五大战略的实施，能够照亮小米前行的路，希望小米越来越好。</p>\
\
<p><strong>写在最后</strong></p>\
\
<p>对于梦想，雷总说：“如果大家认为这是错的，我愿意错一辈子”，这是一个直男癌对梦想的最大坚持。</p>\
\
<p>（本文纯个人观点，不涉及任何利益）</p>	“在几乎所有的人都劝我把小米产品卖得贵一些的时候，我感到孤独，因为他们不了解我的梦想和追求”。这是雷军在亚布力中国企业家论坛提问环节，针对主持人宋立新问“雷军的孤独时刻”所做出的回答。雷军的梦想是什么？为什么当大家不了解他的梦想时感到孤独呢？本文试着讲述一下小米的梦想。	4	0	2017-02-11 12:14:14	2017-02-11 12:09:13	\
> “在几乎所有的人都劝我把小米产品卖得贵一些的时候，我感到孤独，因为他们不了解我的梦想和追求。” ——雷军\
\
![LeiJun](https://dn-woerwosi.qbox.me/blog/images/2017/02/11/14F01954202910-325G.jpg)\
\
最近，雷总（指雷军，下同）的此番言论在网络上又激起了一波涟漪，这是其在亚布力中国企业家论坛提问环节，针对主持人宋立新问“雷军的孤独时刻”所做出的回答。自认为还算理性的小米用户的我，虽不能感受雷总的孤独，但相信他的梦想。\
\
**雷军的梦想**\
\
2015年11月24日，小米压轴好戏新品发布会上，雷总以“我所有的向往”的深情告白作为结尾，台下的小米高管们眼角也泛起了泪花。告白中，“我们的目标，也绝不是去抢什么市场第一，而是老老实实日复一日，做出感动人心的优质产品”，我相信，这是雷总过去、现在、未来所坚持的梦想。\
\
小米以“极致性价比”开启手机发烧友新的时代，本应为他们的时代却迎来了小米手机爆发式的增长，或许此时市场份额在小米人的心中占有重要的地位。直至2014年，小米一直保持高速增长。手机单品也从单一的爆款战略发展成了各价位全覆盖。2015年第四季度，小米市场份额下降至第三位，全年手机销量不及预期，小米人好像意识到了什么。不论市场份额心里预期如何变化，在这之间，不变的是小米一直打造“极致性价比”的优质产品，并由此发起了“新国货”运动，向世界展示中国智造。\
\
2016年，小米回归初心，认真做产品，发布小米MIX重量级产品。小米和米家产品，作为本行业内的鲶鱼，搅动搅和整个行业，“无需考虑价格、直接买”已成为越来越多人的共识。当然，就单品而言，可能小米和米家产品和本行业内的翘楚存在差距，在满足个人需求的前提下，小米和米家产品成为了最大可能性的选择。\
\
**雷军的孤独**\
\
2016年10月25日，小米MIX发布，3499元起。针对小米MIX这样一款设计元素突破性的产品，米粉、媒体、手机测评界、小米员工、甚至友商等几乎所有人都认为定价偏低。在小米“杂货铺”里，这样定价偏低的产品比比皆是。为什么如此高性价比的产品，却导致了雷总的孤独？\
\
时至今日，网络上，饥饿营销、市场份额下降、品牌稀释、屌丝、ADUI等消息一直萦绕在小米或小米产品的头上，虽然日复一日的解释，但这样的消息还是源源不断的出现；生活中，物美价廉的商品在老百姓的心目中还是觉得会不太可靠，百姓心中商人还是一次性逐利的“吸血鬼”；认知上，更多的用户还是不了解、不相信小米的理念，甚至对小米、米家的品牌知之甚少。“不清楚、不相信雷总的梦想和追求”，致使雷总在似娱乐业的手机业，每一步迈出的都是寂寞，每一脚跨出的都是孤独。\
\
吾等小辈在宣传、品牌、战略上提供不了什么建议，来改善小米在大家中的形象，但希望小米对自己梦想的坚持、“小米之家”新零售的尝试、米家品牌的生态链计划、2017五大战略的实施，能够照亮小米前行的路，希望小米越来越好。\
\
**写在最后**\
\
对于梦想，雷总说：“如果大家认为这是错的，我愿意错一辈子”，这是一个直男癌对梦想的最大坚持。\
\
（本文纯个人观点，不涉及任何利益）
