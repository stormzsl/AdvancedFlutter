

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

/*
 *Selector({
    Key key,
    //  Widget Function(BuildContext context, T value, Widget child)
    // 用于构建 Widget
    @required ValueWidgetBuilder<S> builder,
    // S Function(BuildContext, A)
    // 用于指定使用哪个值作为重重建判断依据
    @required S Function(BuildContext, A) selector,
    // bool Function(T previous, T next)
    // 是否重建，一般情况下不用我们实现
    ShouldRebuild<S> shouldRebuild,
    Widget child,
  })
 */
class _SelectorCounterNotifier with ChangeNotifier {
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

class SelectorTestPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _SelectorTestPageState();
  }
}
class _SelectorTestPageState extends State<SelectorTestPage> {
  _SelectorCounterNotifier _counter = _SelectorCounterNotifier();

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text("测试Selector"),
      ),
      body: Center(
        child: ChangeNotifierProvider.value(
          value: _counter,
          child: Column(
            children: <Widget>[
              Selector<_SelectorCounterNotifier, int>(
                selector: (_, notifier) => notifier.count,
//                shouldRebuild:(previous,next)=> false,
                builder: (context, value, child) {
                  return Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Increment1 build ${_counter.count1}  count => You have pushed the button this many times:',
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
              Selector<_SelectorCounterNotifier, int>(
                selector: (_, notifier) => notifier.count1,
                builder: (context, value, child) {
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
                              const t = Tuple2<String, int>('a', 10);
                              debugPrint(t.item1); // prints 'a'
                              print(t.item2); // prints '10'
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
