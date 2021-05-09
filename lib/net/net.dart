import 'package:flutter/material.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:myapp/common/colors.dart';

//整行删除快捷键:command+shift+k
class NetWidget extends StatefulWidget {
  @override
  _NetWidgetState createState() => _NetWidgetState();
}

class _NetWidgetState extends State<NetWidget> {
  var items = List();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _showProgressDialog() {
    return items.length == 0 ? true : false;
  }

  _getProgressDialog() {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: RooColors.grayLighter,
      ),
    );
  }

  _getItemTails() {
    var itemTails = List<Widget>();
    items.forEach((element) {
      var tail = Container(
        margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: ListTile(
          title: Text(
            element['title'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
          ),
          trailing: Icon(Icons.arrow_right),
        ),
      );
      itemTails.add(tail);
    });
    return itemTails;
  }

  _showContent() {
    if (_showProgressDialog()) {
      return _getProgressDialog();
    } else {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: ListView(
          children: _getItemTails(),
        ),
      );
    }
  }

  void _loadData() async {
    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    var respones = await http.get(dataURL);
    try {
      if (respones.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(respones.body) as List;
        setState(() {
          items.addAll(jsonResponse);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("网络加载"),
        ),
        backgroundColor: Colors.grey,
        body: _showContent());
  }
}
