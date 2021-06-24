import 'package:flutter/material.dart';
import 'package:myapp/lifecycle/lifecycle.dart';
import 'json_convert/photo_show_widget.dart';
import 'roo_flutter.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'roo_flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      home: MyHomePage(
        title: 'roo_flutter',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({this.title});

  final String title;
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _buildBottom() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Text('更多精彩内容请访问', style: kDefalutNormalTitleStyle),
          Text(
            'https://pub.dev',
            style: kDefaultNormalTextStyle,
          )
        ],
      ),
    );
  }

  Widget _buildListTitle(String title, String subTitle, Widget nextPage) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.fromLTRB(12, 8, 12, 8),
        padding: EdgeInsets.fromLTRB(24, 12, 24, 12),
        decoration: BoxDecoration(
          color: RooColors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Row(
                children: <Widget>[
                  Text(
                    title,
                    style: kDefalutNormalTitleStyle,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    subTitle,
                    style: kDefaultNormalTextStyle,
                  )
                ],
              ),
            ),
            Image(
              image: AssetImage("images/right_arrows.png"),
              width: 13,
              height: 13,
            )
          ],
        ),
      ),
      onTap: () {
        if (nextPage != null) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return nextPage;
          }));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: RooColors.white,
      ),
      body: Container(
        color: Color(0xFFEBEBEB),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 120,
              alignment: Alignment.center,
              child: Text(
                "欢迎来到roo_flutter的世界",
                style: kDefalutNormalTitleStyle,
              ),
            ),
            _buildListTitle("小提示", "RooToast", null),
            _buildListTitle("基础布局", "LayoutPractice", LayoutWidget()),
            _buildListTitle("路由跳转", "route", RouteWidget()),
            _buildListTitle("网络请求", "Net", NetWidget()),
            _buildListTitle("网络图片", "PhotoShow", PhotoShow()),
            _buildListTitle("互操", "Channel", PlatformChannel()),
            _buildListTitle("widget生命周期", "lifeCycle", LifeCycleWidget()),
            _buildListTitle("动画", "LogoWidget", CureveAnimateWidget()),
            _buildListTitle("Hero动画", "StaggedAnimation", StaggerDemo()),
            _buildListTitle("滑动效果", "SliverDemo", SliverDemo()),
            _buildListTitle("吸顶效果", "StickyDemo", StickyDemo()),
            _buildListTitle("状态变化1", "CounterNotifierPage", CounterNotifierPage()),
            _buildListTitle("状态变化2", "MultiProviderWidget", MultiProviderWidget()),
            _buildListTitle("状态变化3", "ConsumerTestPage", ConsumerTestPage()),
            _buildListTitle("状态变化4", "SelectorTestPage", SelectorTestPage()),
            _buildBottom(),
          ],
        ),
      ),
    );
  }
}
