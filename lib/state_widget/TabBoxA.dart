import 'package:flutter/material.dart';

/*
自身管理state状态
*/
class TabBoxAFulWidget extends StatefulWidget {
  TabBoxAFulWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new TabBoxAState();
  }
}

class TabBoxAState extends State<TabBoxAFulWidget> {
  bool _isActive = false;

  void _toggleTab() {
    setState(() {
      _isActive = !_isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: GestureDetector(
        onTap: _toggleTab,
        child: Container(
          decoration: BoxDecoration(
            color: _isActive ? Colors.green[400] : Colors.grey[500],
          ),
          width: 400.0,
          height: 300.0,
          child: Center(
            child: Text(
              _isActive ? 'activie' : 'inactivie',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
    );
  }
}
