// 一个通用的InheritedWidget，保存任需要跨组件共享的状态

//todo provider的实现原理:https://book.flutterchina.club/chapter7/provider.html#provider
import 'package:flutter/cupertino.dart';

class InheritedProvider<T> extends InheritedWidget {
  InheritedProvider({@required this.data, Widget child}) : super(child: child);

  //共享状态使用泛型
  final T data;

  @override
  bool updateShouldNotify(InheritedProvider<T> old) {
    //在此简单返回true，则每次更新都会调用依赖其的子孙节点的`didChangeDependencies`。
    return true;
  }
}