import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dialog_util.dart';

//todo https://book.flutterchina.club/chapter7/dailog.html#_7-6-1-使用对话框
class DialogNormalPage extends StatefulWidget {
  const DialogNormalPage({Key key}) : super(key: key);

  @override
  _DialogNormalPageState createState() => _DialogNormalPageState();
}

class _DialogNormalPageState extends State<DialogNormalPage> {
  Future<bool> showDialog1(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            title: Text("标题"),
            content: Text("this is content"),
            actions: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("取消"),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text("确认"),
              )
            ],
          );
        });
  }

  Future<void> changeLanguage() async {
    int i = await showDialog<int>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('请选择语言'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  // 返回1
                  Navigator.pop(context, 1);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('中文简体'),
                ),
              ),
              SimpleDialogOption(
                onPressed: () {
                  // 返回2
                  Navigator.pop(context, 2);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: const Text('美国英语'),
                ),
              ),
            ],
          );
        });

    if (i != null) {
      print("选择了：${i == 1 ? "中文简体" : "美国英语"}");
    }
  }

  Future<void> showListDialog() async {
    int index = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        var child = Column(
          children: <Widget>[
            ListTile(title: Text("请选择")),
            Expanded(
                child: ListView.builder(
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text("$index"),
                  onTap: () => Navigator.of(context).pop(index),
                );
              },
            )),
          ],
        );
        //使用AlertDialog会报错
        //return AlertDialog(content: child);

        // return Dialog(child: child);与下面效果相同
        return UnconstrainedBox(
          constrainedAxis: Axis.vertical,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 280),
            child: Material(
              child: child,
              type: MaterialType.card,
            ),
          ),
        );
      },
    );
    if (index != null) {
      print("点击了：$index");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dialog normal collections"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () async {
                final result = await showDialog1(context);
                if (result == null) {
                  print(">>>> click cancel");
                } else {
                  print(">>>> click confirm $result");
                }
              },
              child: Text("show AlertDialog"),
            ),
            RaisedButton(
              onPressed: () {
                changeLanguage();
              },
              child: Text("show SimpleDialog"),
            ),
            RaisedButton(
              onPressed: () {
                showListDialog();
              },
              child: Text("showListDialog"),
            ),
            RaisedButton(
              onPressed: () {
                showCustomDialog<bool>(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("提示"),
                      content: Text("您确定要删除当前文件吗?"),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("取消"),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        FlatButton(
                          child: Text("删除"),
                          onPressed: () {
                            // 执行删除操作
                            Navigator.of(context).pop(true);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text("showCustomDialog"),
            )
          ],
        ),
      ),
    );
  }
}
