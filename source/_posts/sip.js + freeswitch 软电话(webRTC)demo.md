---
title: sip.js + freeswitch 软电话(webRTC)demo
tags: []
id: '24'
categories:
  - - web软电话
date: 2021-10-08 20:30:00
permalink: /archives/24/
---

```html
<!DOCTYPE html>
<html>
<head>
    <title>SIP + WebRTC + freeSWITCH</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="./assets/js/jquery-1.10.2.min.js"></script>
    <script src="./assets/js/sip-0.7.7.js" type="text/javascript"></script>
    <script src="./assets/js/discard.js?v=1"></script>
</head>


<body>
    <div id="app">
      <audio id="remoteAudio"></audio>
      <audio id="localAudio"></audio>
      <button class="login" data-action="logout">登陆</button>
      <button class="logout" data-action="logout">登出</button>
      <button class="register" data-action="register">就绪</button>
      <button class="unregister" data-action="unregister" style="margin-right: 10px;">取消就绪</button>
      <button class="call" data-action="call">拨打</button>
      <button class="hang-up" data-action="hangup">挂断</button>
      <button class="answer" data-action="answer">接听</button>
    </div>
</body>
</html>
```
<!--more-->
```js
'use strict';
var softPhoneUA = null;
var currentSession = null;

const options = {
  wsAddress: 'xxxxx',   // 即时通讯地址
  wsPort: 'xxxx',  // 即时通讯端口
  number: 'xxxx',  // 分机号
  password: 'xxx',  // 密码
  displayName: 'xx',  // 显示名
  convrsationOptions: {
    media: {
      constraints: {
        audio: true,
        video: false
      },
      render: {
        remote: document.getElementById('remoteAudio'),
        // local: document.getElementById('localAudio')
      }
    }
  }
}

const softPhone = {
  /**
   * 登陆软电话
   */
  start() {
    var config = {
      uri: `${options.number}@${options.wsAddress}`,
      wsServers: `wss://${options.wsAddress}:${options.wsPort}`,
      authorizationUser: options.number,  // 授权号
      displayName: options.displayName,   // 显示名称
      password: options.password,     // 登陆密码
      allowLegacyNotifications:true,
      autostart: true,   // 自动连接
      register: false,   // 自动就绪
      rel100: SIP.C.supported.SUPPORTED, // 该选项开启接收早期媒体(采坑记录)
    };

    softPhoneUA = new SIP.UA(config);

    softPhone.UAEvent(softPhoneUA);

    // 有电话呼入
    softPhoneUA.on('invite', function (session) {
      console.log('invite')
      currentSession = session;

      softPhone.sessionEvent(session);
    })
  },

  /** 就绪 */
  register() {
    softPhoneUA.register({  // 注册
      register:true
    });
  },

  /** 取消就绪 */
  unregister() {
    softPhoneUA.unregister();
  },

  /**
   * 绑定ua事件
   * @param {*} ua 
   */
  UAEvent(ua) {
    // 开始尝试连接
    ua.on('connecting', function (args) {
      console.log('%c connecting', 'color: #f00');
    });
    // 连接完毕
    ua.on('connected', function () {
      console.log('%c connected', 'color: #f00');
    });
    // 主动取消注册或注册后定期重新注册失败
    ua.on('unregistered', function (response, cause) {
      console.log('%c unregistered', 'color: #f00');
    });
    // 注册成功
    ua.on('registered', function () {
      console.log('%c registered', 'color: #f00');
    })
    // websocket 连接失败
    ua.on('disconnected', function () {
      console.log('%c disconnected', 'color: #f00');
    })
  },

  /**
   * 绑定session事件
   * @param {} session 
   */
  sessionEvent(session) {
    session.on("rejected" , function (response, cause){
      console.log('%c invite-rejected', 'color: #f00');
    });
    session.on("bye" , function (response, cause){
      console.log('%c invite-bye', 'color: #f00');
    });
    session.on("accepted" , function (response, cause){
      console.log('%c invite-accepted', 'color: #f00');
    });
    session.on("cancel" , function (response, cause){
      console.log('%c invite-cancel', 'color: #f00');
    });
  },

  /**
   * 拨打
   */
  call() {
    console.log('callOut')
    const telNumber = 'xxxx';

    currentSession = softPhoneUA.invite(`${telNumber}@${options.wsAddress}`, options.convrsationOptions)

    currentSession.on("rejected" , function (response, cause) {
      console.log('%c rejected', 'color: #f00');
    });
    currentSession.on("bye" , function (response, cause) {
      // 本次通话结束
      console.log('%c bye', 'color: #f00');
    });
    currentSession.on("accepted" , function (response, cause) {
      // 对方接听
      console.log('%c accepted', 'color: #f00');
    });
    currentSession.on("cancel" , function (response, cause) {
      // 取消通话
      console.log('%c cancel', 'color: #f00');
    });
  },

  /**
   * 挂断
   */
  hangUp() {
    if (currentSession instanceof Object) {
      if (currentSession.hasAnswer) {
        currentSession.bye();
      } else if (currentSession.isCanceled == false) {
        currentSession.cancel();
      } else {
        currentSession.reject();
      }
    }
  },
  
  /**
   * 接听
   */
  answer() {
    currentSession.accept(options.convrsationOptions)
  },

  /**
   * 登出
   */
  logout() {
    if (softPhoneUA instanceof Object) {
      softPhoneUA.unregister(); // 注销
      softPhoneUA.stop({
        register:true
      });
    }
  },
}

function addEvent() {
  $('.login').on('click', softPhone.start);
  $('.logout').on('click', softPhone.logout);
  $('.register').on('click', softPhone.register);
  $('.unregister').on('click', softPhone.unregister);
  $('.call').on('click', softPhone.call);
  $('.hang-up').on('click', softPhone.hangUp);
  $('.answer').on('click', softPhone.answer);
}

$(function() {  
  addEvent();
})
```

说明： 基本以上的代码就是一份简略版的demo了，按照参数配置输入即可完成登录后拨打接听功能。

依赖库：

jquery-1.10.2
[sip-0.7.7](https://sipjs.com/download/)

## 软电话使用：

登陆fs服务器：
最繁琐的就是登陆流程，登陆流程接收的参数很多，没有一个好的demo很容易采坑，官方给出的demo都不完整。
 
登陆中的config配置在代码上基本都注释了含义，这里文字说明下登陆后返回的对象和对象所拥有的事件
 
## UA对象：
new SIP.UA(config) 后会返回一个UA对象
主要用途和方法： 就绪软电话、监听软电话连接状态、监听电话呼入、拨打电话、登出软电话系统
 
## session对象(webRTC)：
当前软电话建立一个通话时创建：UA.invite()
主要用途和方法： 接听当前来电、挂断当前通话、监听当前通话状态
 
以上代码亲测有效可以进行简单拨打，更详细的内容可以参考下 [sip.js官方文档](https://sipjs.com/api/0.7.0/ua/)
 
PS: jsSIP 和 SIP.js 是两个插件。起先我们项目使用了jsSIP，因为他官方的文档和demo好理解，但是后面发现一个[早期媒体](https://www.cnblogs.com/moon-lights/p/6911596.html)问题一直无法解决。最终换了sip.js获取到了早期媒体。

## 参考资料：
[sip.js](https://sipjs.com/api/0.7.0/)
[sip github](https://github.com/onsip/SIP.js/tree/master/docs)
[MediaStream](https://developer.mozilla.org/zh-CN/docs/Web/API/MediaStream)
[浏览器（webRTC）如何获取音视频流](https://zhuanlan.zhihu.com/p/336290984)
[视频通讯使用的SIP协议详解](https://baijiahao.baidu.com/s?id=1660500657913249757&wfr=spider&for=pc)
[SDP协议](https://www.jianshu.com/p/94b118b8fd97)
[webRTC入门](https://www.cnblogs.com/cnhk19/p/9473519.html)
[webRTC demo](https://www.cnblogs.com/lotushy/p/3964076.html)
[SIP中的早期媒体和回铃音的产生](https://www.cnblogs.com/moon-lights/p/6911596.html)
