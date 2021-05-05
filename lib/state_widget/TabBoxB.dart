import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

/*
父widget管理子Widget的状态
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
  _TabBoxBWidget({Key? key, this.active: false, required this.onChanged})
      : super(key: key);

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
