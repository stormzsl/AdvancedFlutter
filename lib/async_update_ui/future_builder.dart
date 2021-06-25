import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// todo https://book.flutterchina.club/chapter7/futurebuilder_and_streambuilder.html#_7-5-1-futurebuilder
class FutureBuilderPage extends StatefulWidget {
  const FutureBuilderPage({Key key}) : super(key: key);

  @override
  _FutureBuilderPageState createState() => _FutureBuilderPageState();
}

class _FutureBuilderPageState extends State<FutureBuilderPage> {
  //模拟网络操作
  Future<String> mockFuture() async =>
      Future.delayed(Duration(seconds: 3), () => "this is from net data");

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: FutureBuilder<String>(
          future: mockFuture(),
          builder: (context, snapshot) {
            //请求已结束
            //enum ConnectionState {
            //   /// 当前没有异步任务，比如[FutureBuilder]的[future]为null时
            //   none,
            //
            //   /// 异步任务处于等待状态
            //   waiting,
            //
            //   /// Stream处于激活状态（流上已经有数据传递了），对于FutureBuilder没有该状态。
            //   active,
            //
            //   /// 异步任务已经终止.
            //   done,
            // }
            if (snapshot.connectionState == ConnectionState.done) {
              //请求出错
              if (snapshot.hasError) {
                return Text("occur error:${snapshot.error}");
              } else {
                return Text(
                  "${snapshot.data}",
                  style: TextStyle(fontSize: 14),
                );
              }
            } else {
              //请求未结束，显示加载框
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
