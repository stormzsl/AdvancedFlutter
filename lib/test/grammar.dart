//语法练习 mixin with:https://www.jianshu.com/p/6b6d75062758
import 'package:flutter/material.dart';

class RunMan {
  void run() {
    print("RunMan can run");
  }
}

class Man with RunMan {
  void testWith() {
    run();
    ThemeData()
  }
}
