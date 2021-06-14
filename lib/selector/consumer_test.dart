import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class _CounsumerCounterNotifier with ChangeNotifier {
  int _count = 0;
  int _count1 = 0;
  int _buildCount = 0;

  int get count => _count;

  int get count1 => _count1;

  int get buildCount => _buildCount;

  increment() {
    _count++;
    notifyListeners();
  }

  increment1() {
    _count1++;
    notifyListeners();
  }
}

class ConsumerTestPage extends StatefulWidget{
  final String title="测试Consumer";
  @override
  _ConsumerState createState() {
    return _ConsumerState();

  }
}
class _ConsumerState extends State<ConsumerTestPage> {
  _CounsumerCounterNotifier _counter = _CounsumerCounterNotifier();

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ChangeNotifierProvider.value(
          value: _counter,
          child: Column(
            children: <Widget>[
              Consumer<_CounsumerCounterNotifier>(
                builder: (context, v, child) {
                  return Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Increment1 build ${_counter.count}  count => You have pushed the button this many times:',
                        ),
                        Text(
                          '${_counter.count}',
                          style: Theme.of(context).textTheme.display1,
                        ),
                        FlatButton(
                            onPressed: () {
                              _counter.increment();
                            },
                            child: Text('Increment'))
                      ],
                    ),
                  );
                },
              ),
              Consumer<_CounsumerCounterNotifier>(
                builder: (context, v, child) {
                  return Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Increment build ${_counter.count1}  count => You have pushed the button this many times:',
                        ),
                        Text(
                          '${_counter.count1}',
                          style: Theme.of(context).textTheme.display1,
                        ),
                        FlatButton(
                            onPressed: () {
                              _counter.increment1();
                            },
                            child: Text('Increment1'))
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

