import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

/*
父widget管理子Widget的状态
此外还有混合式状态管理:可以参考官方文档:https://flutterchina.club/tutorials/interactive/
*/
class ParentStatefulWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ParentState();
  }
}

class _ParentState extends State<ParentStatefulWidget> {
  bool _isActive = false;

  void _toggleTab(bool newActive) {
    setState(() {
      _isActive = newActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _TabBoxBWidget(active: _isActive, onChanged: _toggleTab);
  }
}

class _TabBoxBWidget extends StatelessWidget {
  //添加required代表外界调用必须传入对应的参数值
  _TabBoxBWidget({this.active: false, required this.onChanged});
  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTab() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTab,
      child: new Container(
        child: new Center(
          child: new Text(
            active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}
