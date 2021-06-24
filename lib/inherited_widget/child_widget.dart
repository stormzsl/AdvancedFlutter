import 'package:flutter/cupertino.dart';
import 'package:myapp/inherited_widget/share_data_widget.dart';

class ChildWidget extends StatefulWidget {
  @override
  _ChildWidgetState createState() => new _ChildWidgetState();
}

class _ChildWidgetState extends State<ChildWidget> {
  @override
  Widget build(BuildContext context) {
    print(">>>>>> ChildWidget build");
    //使用InheritedWidget中的共享数据
    return Text(ShareDataWidget
        .of(context)
        .data
        .toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print(">>>>>> ChildWidget Dependencies change");
  }
}