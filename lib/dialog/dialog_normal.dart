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
   int temp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dialog normal collections"),
      ),
      body:
      Center(
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () async {
                final result = await showAlertDialog(context);
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
                showSimpleDialog(context);
              },
              child: Text("show SimpleDialog"),
            ),
            RaisedButton(
              onPressed: () {
                showListDialog(context);
              },
              child: Text("showListDialog"),
            ),
            RaisedButton(
              onPressed: () {
                showMyCustomDialog(context);
              },
              child: Text("showCustomDialog"),
            ),
            RaisedButton(onPressed: (){
              showDeleteConfirmDialog3(context);
            },child: Text("showDeleteConfirmDialog3"),),
            RaisedButton(onPressed: (){
              showDeleteConfirmDialog4(context);
            },child: Text("showDeleteConfirmDialog4"),),
            RaisedButton(onPressed: (){
              showDeleteConfirmDialog5(context);
            },child: Text("showDeleteConfirmDialog5"),),
            RaisedButton(onPressed: (){
              showDeleteConfirmDialog6(context);
            },child: Text("showDeleteConfirmDialog6"),),
            RaisedButton(onPressed: (){
              showMyModalBottomSheet(context);
            },child: Text("showMyModalBottomSheet"),),


            RaisedButton(onPressed: (){
              showLoadingDialog(context);
            },child: Text("showLoadingDialog"),),


            RaisedButton(onPressed: (){
              showDatePicker1(context);
            },child: Text("showDatePicker1"),),


            RaisedButton(onPressed: (){
              showDatePicker2(context);
            },child: Text("showDatePicker2"),),


            RaisedButton(onPressed: (){
              print(">>>>> temp:$temp");
            },child: Text("print"),),
            Container(
              constraints: BoxConstraints(maxWidth: 80),
              child:Text("如果我们嫌Loading框太宽，想自定义对话框宽度，这时只使用SizedBox或ConstrainedBox是不行的，原因是showDialog中已经给对话框设置了宽度限制，根据我们在第五章“尺寸限制类容器”一节中所述，我们可以使用UnconstrainedBox先抵消showDialog对宽度的限制，然后再使用SizedBox指定宽度，代码如下：",
              softWrap: true,),

            ),
          ],
        ),
      ),
    );
  }
}
