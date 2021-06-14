import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'count_notifier.dart';

class CounterNotifierPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 创建 Widget 持有 CounterNotifier 数据
    return ChangeNotifierProvider.value(
      value: CounterNotifier(),
      child: MaterialApp(
        title: 'Privoder Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ProvidePage(title: 'Provider Demo Home Page'),
      ),
    );
  }
}

class ProvidePage extends StatelessWidget {
  final String title;

  ProvidePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 获取 CounterNotifier 数据
    final counter = Provider.of<CounterNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${counter.count}',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
