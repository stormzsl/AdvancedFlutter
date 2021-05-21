import 'package:flutter/cupertino.dart';

class ChildWidget extends StatefulWidget {

  /*
   * 该函数为 StatefulWidget 中创建 State 的方法，当 StatefulWidget 被调用时会立即执行 createState
   * 关于组件生命周期的介绍:https://www.jianshu.com/p/6ed6f7de01ff
   */
  @override
  _ChildWidgetState createState() {
    print("child createState >>>>>");
    return _ChildWidgetState();
  }
}

class _ChildWidgetState extends State<ChildWidget> {

  /*
   * 该函数为 State 初始化调用，因此可以在此期间执行 State 各变量的初始赋值，同时也可以在此期间与服务端交互，获取服务端数据后调用 setState 来设置 State。
   * 注意：这个方法是重写父类的方法，必须调用super，因为父类中会进行一些其他操作；
   * 并且如果你阅读源码，你会发现这里有一个注解（annotation）：@mustCallSuper
   */
  @override
  void initState() {
    print("child initState >>>>>");
    super.initState();
  }
  /*
  * 该函数主要是在组件重新构建，比如说热重载，父组件发生 build 的情况下，
  * 子组件该方法才会被调用，其次该方法调用之后一定会再调用本组件中的 build 方法。
  *
   */
  @override
  void didUpdateWidget(ChildWidget oldWidget) {
    print("child didUpdateWidget >>>>>");
    super.didUpdateWidget(oldWidget);
  }

  /*
  * 主要是提供开发阶段使用，在 debug 模式下，每次热重载都会调用该函数，
  * 因此在 debug 阶段可以在此期间增加一些 debug 代码，来检查代码问题。
   */
  @override
  void reassemble() {
    super.reassemble();
    print("child reassemble >>>>>");
  }

  /*
  * 该函数是在该组件依赖的 State 发生变化时，这里说的 State 为全局 State ，例如语言或者主题等，
  * 类似于前端 Redux 存储的 State 。这个方法在两种情况下会调用：
    情况一：调用initState会调用；
    情况二：从其他对象中依赖一些数据发生改变时，比如前面我们提到的InheritedWidget；
    *
    * 这就说明了父组件的变化会引发子组件的 build ，虽然子组件没有任何的改动。
    * 这点如果是在前端的话，是需要使用 shouldUpdateComponent ，来介绍重新构建，不过在 Flutter 中是没有该功能来减少重新 build 的。
   */
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("child didChangeDependencies >>>>>");
  }

  /*
   * 在组件被移除节点后会被调用，如果该组件被移除节点，然后未被插入到其他节点时，则会继续调用 dispose 永久移除
   */
  @override
  void deactivate() {
    super.deactivate();
    print("child deactivate >>>>>");
  }

  /*
   * 永久移除组件，并释放组件资源。
   */
  @override
  void dispose() {
    super.dispose();
    print("child dispose >>>>>");
  }

  /*
   * 主要是返回需要渲染的 Widget ，由于 build 会被调用多次，
   * 因此在该函数中只能做返回 Widget 相关逻辑，避免因为执行多次导致状态异常
   *
   * 触发组件再次 build 有三种方式: 一个是 setState ，另一个是 didChangeDependencies ，再一个是 didUpdateWidget 。
   */
  @override
  Widget build(BuildContext context) {
    print("child build >>>>>");
    return Container(
      child: Text("这是child widget"),
    );
  }
}
