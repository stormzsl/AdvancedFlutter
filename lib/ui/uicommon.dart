import 'package:flutter/material.dart';

class RooButtonWidget extends StatelessWidget {
  RooButtonWidget({this.title = 'hello'});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
              onPressed: () {
                print("flatButton click");
              },
              child: Text("flatButton")),
          RaisedButton(
            onPressed: () {
              print("RaisedButton click");
            },
            child: Text("RaisedButton"),
          ),
          SizedBox(
            height: 20,
            width: double.infinity,
            child: Container(
              color: Colors.red,
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              print("FloatingActionButton click");
            },
            child: Text("FloatingActionButton"),
          )
        ],
      ),
    );
  }
}

class RooTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
