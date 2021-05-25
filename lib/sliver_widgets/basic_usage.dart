import 'package:flutter/material.dart';
import 'dart:math';

///sliver的用法: https://www.jianshu.com/p/5aeeb7ea776b
///
///

final List<Color> colorsList = [
  Colors.red,
  Colors.orange,
  Colors.green,
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.pink,
  Colors.teal,
  Colors.deepPurpleAccent
];

///Sliver的基础使用
class SliverDemo extends StatelessWidget {
  SliverDemo({Key key, @required this.text}) : super(key: key);
  final String text;
  /*
   * 标题组件放在了SliverToBoxAdapter内，因为CustomScrollView只接受Sliver系列的组件。
   */
  Widget _renderTitle(String title) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sliver页面"),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          _renderTitle("SliverGrid"),
          SliverGrid.count(
              crossAxisCount: 3,
              children: colorsList
                  .map((color) => Container(
                        color: color,
                      ))
                  .toList()),
          _renderTitle("SliverList"),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => Container(color: colorsList[index]),
                childCount: colorsList.length),
            itemExtent: 100,
          ),
        ],
      ),
    );
  }
}

///吸顶效果实现:更多炫酷用法参考:https://www.jianshu.com/p/5aeeb7ea776b
class StickyDemo extends StatefulWidget {
  final String title;

  StickyDemo({Key key, this.title="吸顶"}) : super(key: key);

  @override
  _StickyDemoState createState() => _StickyDemoState();
}

class _StickyDemoState extends State<StickyDemo> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    this.tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,///不同于float效果，当SliverAppBar内容滑出屏幕时，将始终渲染一个固定在顶部的收起状态组件。
            elevation: 0,
            expandedHeight: 250,//展开状态下appBar的高度，即图中图片所占空间；
            flexibleSpace: FlexibleSpaceBar(///空间大小可变的组件，Flutter给我们提供了一个现成的FlexibleSpaceBar组件，给我们处理好了title过渡的效果。
              title: Text(this.widget.title),
              background: Image.network(
                'http://img1.mukewang.com/5c18cf540001ac8206000338.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: StickyTabBarDelegate(
              child: TabBar(
                labelColor: Colors.black,
                controller: this.tabController,
                tabs: <Widget>[
                  Tab(text: 'Home'),
                  Tab(text: 'Profile'),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: this.tabController,
              children: <Widget>[
                Center(child: Text('Content of Home')),
                Center(child: Text('Content of Profile')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({@required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {//构建渲染的内容。
    return this.child;
  }

  @override
  double get maxExtent => this.child.preferredSize.height;//展开状态下组件的高度；

  @override
  double get minExtent => this.child.preferredSize.height;//收起状态下组件的高度；

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {//类似于react中的shouldComponentUpdate；
    return true;
  }
}
