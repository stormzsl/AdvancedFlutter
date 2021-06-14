import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'count_notifier.dart';

class MultiProviderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: 36),
        ChangeNotifierProvider.value(value: CounterNotifier())
      ],
      child: MaterialApp(
        title: 'Privoder Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Page1(),
      ),
    );
  }
}

/*
1.使用 Provider.of(context).toDouble() 获取文字大小
2.使用 Provider.of(context) 获取计数
3.使用 Colum 列表方式展示计数和跳转页面按钮
4.当 build的时候 print('rebuild page 1');
 */

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //获取文字大小
    final size = Provider.of<int>(context).toDouble();
    // 获取计数
    final counter = Provider.of<CounterNotifier>(context);
    // 调用 build 时输出
    print('rebuild page 1');
    return Scaffold(
      appBar: AppBar(
        title: Text('Page1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 显示计数
            Text(
              'Current count: ${counter.count}',
              // 设置文字大小
              style: TextStyle(
                fontSize: size,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            // 跳转 Page2
            RaisedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Page2()),
              ),
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}

/*
 * 构建 Page2
使用 Consumer2 获取计数对象和文字大小
分别使用 print('rebuild page 2') 和 print('rebuild page 2 refresh count') 输出调用相应 build 日志
使用 Consumer 获取计数对象，在点击 button 时调用 CounterNotifier 的 increment 方法
 */

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('rebuild page 2');
    return Scaffold(
      appBar: AppBar(
        title: Text('Page2'),
      ),
      body: Center(
        child: Consumer2<CounterNotifier, int>(
            builder: (context, counter, size, _) {
              print('rebuild page 2 refresh count');

              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${counter.count}',
                    style: TextStyle(
                      fontSize: size.toDouble(),
                    ),
                  ),
                ],
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 不需要监听改变（listen: false 不会重新调用build）
          Provider.of<CounterNotifier>(context, listen: false).increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}