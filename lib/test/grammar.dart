//语法练习 mixin with:https://www.jianshu.com/p/6b6d75062758
import 'dart:ffi';

import 'package:flutter/material.dart';

class RunMan {
  void run() {
    print("RunMan can run");
  }
}

///with 相当于
class Man with RunMan {
  void testWith() {
    run();
  }
}

///future的用法:https://book.flutterchina.club/chapter1/dart.html#_1-4-3-%E5%BC%82%E6%AD%A5%E6%94%AF%E6%8C%81
class FuturePratice {
  void method1() {
    Future.delayed(Duration(seconds: 3), () {
      return "";
    }).then((value) => {print(value)}).catchError((onError) {
      print(onError.toString());
    });
  }

  void method2() {
    Future.delayed(new Duration(seconds: 2), () {
      //return "hi world!";
      throw AssertionError("Error");
    }).then((data) {
      //执行成功会走到这里
      print(data);
    }).catchError((e) {
      //执行失败会走到这里
      print(e);
    }).whenComplete(() {
      //无论成功或失败都会走到这里
    });
  }

  void method3() {
    Future.wait([
      // 2秒后返回结果
      Future.delayed(new Duration(seconds: 2), () {
        return "hello";
      }),
      // 4秒后返回结果
      Future.delayed(new Duration(seconds: 4), () {
        return " world";
      })
    ]).then((results) {
      print(results[0] + results[1]);
    }).catchError((e) {
      print(e);
    });
  }

  ///使用future解决回调地狱的问题
  //先分别定义各个异步任务
  Future<String> login(String userName, String pwd) {
    //用户登录
  }
  Future<String> getUserInfo(String id) {
    //获取用户信息
  }
  Future saveUserInfo(String userInfo) {
    // 保存用户信息
  }
  void method4() {
    ///使用Future虽然可以解决回调多层嵌套的问题，但是还是有一层嵌套，这里推荐使用async/wait彻底解决嵌套问题,参见method5
    login("alice", "******").then((id) {
      return getUserInfo(id);
    }).then((userInfo) {
      return saveUserInfo(userInfo);
    }).then((e) {
      //执行接下来的操作
    }).catchError((e) {
      //错误处理
      print(e);
    });
  }

  /// async用来表示函数是异步的，定义的函数会返回一个Future对象，可以使用then方法添加回调函数。
  /// await 后面是一个Future，表示等待该异步任务完成，异步完成后才会往下走；await必须出现在 async 函数内部
  Future method5() async {
    String id = await login("userName", "pwd");
    String info = await getUserInfo(id);
    await saveUserInfo(info);
  }
}

/*
Stream 也是用于接收异步事件数据，和Future 不同的是，它可以接收多个异步操作的结果（成功或失败）。 
也就是说，在执行异步任务时，可以通过多次触发成功或失败事件来传递结果数据或错误异常。
 Stream 常用于会多次读取数据的异步任务场景，如网络内容下载、文件读写等。举个例子：
 I/flutter (17666): hello 1
I/flutter (17666): Error
I/flutter (17666): hello 3
*/
class streamPratcie {
  void method() {
    Stream.fromFutures([
      // 1秒后返回结果
      Future.delayed(new Duration(seconds: 1), () {
        return "hello 1";
      }),
      // 抛出一个异常
      Future.delayed(new Duration(seconds: 2), () {
        throw AssertionError("Error");
      }),
      // 3秒后返回结果
      Future.delayed(new Duration(seconds: 3), () {
        return "hello 3";
      })
    ]).listen((data) {
      print(data);
    }, onError: (e) {
      print(e.message);
    }, onDone: () {});
  }
}
