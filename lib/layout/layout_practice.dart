import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LayoutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget image = _buildImage();
    Widget favoriteRow = _buildFavoriteRow(context);
    Widget buttonRow = _buildButtonContainer(context);
    Widget textSection = _buildTextSection();
    Widget cardWidget = _buildCard(context);
    Widget stackWidget = _buildStack();
    Widget listview = _buildListView();
    Widget border = _buildBorderWidget();
    Widget rowWidget = _buildRowWidget();
    Widget aniamtionWidget = _buildAnimationWidget();
    Widget fontWidget = _buildCustomFont();
    Widget textInputWidget = _buildTextInputWidget();
    Widget textFiledWidget = textFieldWidget();
    Widget progressIndictorWidget = _buildProgressIndictor();
    Widget progressRouteWidget = _buidlProgressRoute();
    Widget wrapWidget = _buildWrapWidget();
    Widget stackPositionedWidget = _buildStackPositionedWidget();
    Widget customScrollViewWidget = _buildCustomScrollViewWidget();
    Widget cupertinoPickerWidget =_buildCupertinoPicker();

    /*
    * 在最后一步，你将上面这些组装在一起。这些widget放置到ListView中，而不是列中，因为在小设备上运行应用程序时，ListView会自动滚动。
    */
    return new Scaffold(
        appBar: AppBar(
          title: Text('基础布局'),
        ),
        body: Padding(
          padding: EdgeInsets.only(bottom: 100),
          child: ListView(
            children: [
              image,
              favoriteRow,
              buttonRow,
              textSection,
              cardWidget,
              stackWidget,
              border,
              aniamtionWidget,
              fontWidget,
              textInputWidget,
              textFiledWidget,
              progressIndictorWidget,
              progressRouteWidget,
              wrapWidget,
              cupertinoPickerWidget,
            ],
          ),
        ));
  }

  Widget _buildImage() {
    return Image.asset(
      'images/lake.jpeg',
    );
  }

  Widget _buildFavoriteRow(BuildContext context) {
    Widget sectionTitle = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: [
          new Expanded(
              child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start, //左对齐
            children: [
              new Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Oeschinen Lake Campground',
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 16.0),
                ),
              ),
              Text(
                'Kandersteg, Switzerland',
                style: TextStyle(color: Colors.grey[500], fontSize: 16.0),
              )
            ],
          )),
          _FavoriteFulWidget(),
        ],
      ),
    );
    return sectionTitle;
  }

  Widget _buildButtonContainer(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, //行平均分配
      children: [
        _buildButtonColumn(context, Icons.call, "Call"),
        _buildButtonColumn(context, Icons.near_me, "ROUTE"),
        _buildButtonColumn(context, Icons.share, "SHARE")
      ],
    );
  }

  Column _buildButtonColumn(
      BuildContext context, IconData iconData, String label) {
    Color color = Theme.of(context).primaryColor;
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10.0),
          child: Icon(
            iconData,
            color: color,
          ),
        ),
        Text(
          label,
          style: TextStyle(
              color: color, fontSize: 16.0, fontWeight: FontWeight.w500),
        )
      ],
    );
  }

  Widget _buildTextSection() {
    return Container(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true, //softwrap属性表示文本是否应在软换行符（例如句点或逗号）之间断开
      ),
    );
  }

//构建card widget
  Widget _buildCard(BuildContext context) {
    var card = new SizedBox(
      height: 210.0,
      child: new Card(
        child: new Column(
          children: [
            new ListTile(
              title: new Text('1625 Main Street',
                  style: new TextStyle(fontWeight: FontWeight.w500)),
              subtitle: new Text('My City, CA 99984'),
              leading: new Icon(
                Icons.restaurant_menu,
                color: Colors.blue[500],
              ),
            ),
            new Divider(),
            new ListTile(
              title: new Text('(408) 555-1212',
                  style: new TextStyle(fontWeight: FontWeight.w500)),
              leading: new Icon(
                Icons.contact_phone,
                color: Colors.blue[500],
              ),
            ),
            new ListTile(
              title: new Text('costa@example.com'),
              leading: new Icon(
                Icons.contact_mail,
                color: Colors.blue[500],
              ),
            ),
          ],
        ),
      ),
    );

    return card;
  }

//构建stack widget
  Widget _buildStack() {
    var stack = new Stack(
      alignment: const Alignment(0.5, 0.6),
      children: [
        new CircleAvatar(
          backgroundImage: new AssetImage('images/pic.jpg'),
          radius: 100.0,
        ),
        new Container(
          decoration: new BoxDecoration(
            color: Colors.black45,
          ),
          child: new Text(
            'Mia B',
            style: new TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );

    return stack;
  }

//构建ListView widget
  Widget _buildListView() {
    List<Widget> list = <Widget>[
      new ListTile(
        title: new Text('CineArts at the Empire',
            style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
        subtitle: new Text('85 W Portal Ave'),
        leading: new Icon(
          Icons.theaters,
          color: Colors.blue[500],
        ),
      ),
      new ListTile(
        title: new Text('The Castro Theater',
            style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
        subtitle: new Text('429 Castro St'),
        leading: new Icon(
          Icons.theaters,
          color: Colors.blue[500],
        ),
      ),
      // ...
      // See the rest of the column defined on GitHub:
      // https://raw.githubusercontent.com/flutter/website/master/_includes/code/layout/listview/main.dart
    ];
    return new ListView(
      children: list,
    );
  }

//构建border widget
  Widget _buildBorderWidget() {
    var container = new Container(
      decoration: new BoxDecoration(
        color: Colors.black26,
      ),
      child: new Column(
        children: [
          new Row(
            children: [
              /*
              * widget被标记为Expanded,这意味着它会填充尚未被其他子项占用的的剩余可用空间。
              Expanded可以拥有多个children， 然后使用flex参数来确定他们占用剩余空间的比例。
              */
              new Expanded(
                child: new Container(
                  decoration: new BoxDecoration(
                    border: new Border.all(width: 10.0, color: Colors.black38),
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(8.0)),
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: new Image.asset('images/pic.jpg'),
                ),
              ),
              new Expanded(
                child: new Container(
                  decoration: new BoxDecoration(
                    border: new Border.all(width: 10.0, color: Colors.black38),
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(8.0)),
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: new Image.asset('images/pic.jpg'),
                ),
              ),
            ],
          ),
          new Row(
            children: [
              new Expanded(
                child: new Container(
                  decoration: new BoxDecoration(
                    border: new Border.all(width: 10.0, color: Colors.black38),
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(8.0)),
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: new Image.asset('images/pic.jpg'),
                ),
              ),
              new Expanded(
                child: new Container(
                  decoration: new BoxDecoration(
                    border: new Border.all(width: 10.0, color: Colors.black38),
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(8.0)),
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: new Image.asset('images/pic.jpg'),
                ),
              ),
            ],
          )
          // ...
          // See the definition for the second row on GitHub:
          // https://raw.githubusercontent.com/flutter/website/master/_includes/code/layout/container/main.dart
        ],
      ),
    );

    return container;
  }
}

class _FavoriteFulWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _FavoriteWidgetState();
  }
}

class _FavoriteWidgetState extends State<_FavoriteFulWidget> {
  bool _isFavorite = true;
  int _favoriteNum = 41;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorite) {
        _favoriteNum -= 1;
        _isFavorite = false;
      } else {
        _favoriteNum += 1;
        _isFavorite = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
            onPressed: _toggleFavorite,
            color: Colors.red[500],
            icon: Icon(_isFavorite ? Icons.favorite : Icons.favorite_border)),
        SizedBox(
          //当文本在40和41之间变化时，将文本放在SizedBox中并设置其宽度可防止出现明显的“跳跃” ，因为这些值具有不同的宽度。
          child: Text(
            '$_favoriteNum',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}

class _buildRowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("row1"),
          Text("row2"),
          Text("row3"),
        ],
      ),
    );
  }
}

class _buildAnimationWidget extends StatefulWidget {
  @override
  __buildAnimationWidgetState createState() => __buildAnimationWidgetState();
}

class __buildAnimationWidgetState extends State<_buildAnimationWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation curve;
  @override
  void initState() {
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    curve = new CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new GestureDetector(
        child: new RotationTransition(
            turns: curve,
            child: new FlutterLogo(
              size: 50.0,
            )),
        onDoubleTap: () {
          if (controller.isCompleted) {
            controller.reverse();
          } else {
            controller.forward();
          }
        },
      ),
    );
  }
}

class _buildCustomFont extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text(
        'This is a custom font text',
        style: new TextStyle(fontFamily: 'san_bold_font'),
      ),
    );
  }
}

class _buildTextInputWidget extends StatefulWidget {
  _buildTextInputWidget({Key key}) : super(key: key);

  @override
  _buildTextInputState createState() => new _buildTextInputState();
}

class _buildTextInputState extends State<_buildTextInputWidget> {
  String _errorText;

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new TextField(
        onSubmitted: (String text) {
          setState(() {
            if (!isEmail(text)) {
              _errorText = 'Error: This is not an email';
            } else {
              _errorText = null;
            }
          });
        },
        decoration: new InputDecoration(
            hintText: "This is a hint", errorText: _getErrorText()),
      ),
    );
  }

  _getErrorText() {
    return _errorText;
  }

  bool isEmail(String em) {
    String emailRegexp =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(emailRegexp);

    return regExp.hasMatch(em);
  }
}

class textFieldWidget extends StatefulWidget {
  @override
  __textFieldWidgetState createState() => __textFieldWidgetState();
}

class __textFieldWidgetState extends State<textFieldWidget> {
  final TextEditingController _controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new TextField(
          controller: _controller,
          decoration: new InputDecoration(
            hintText: 'Type something',
          ),
        ),
        new RaisedButton(
          onPressed: () {
            showDialog(
              context: context,
              child: new AlertDialog(
                title: new Text('What you typed'),
                content: new Text(_controller.text),
              ),
            );
          },
          child: new Text('DONE'),
        ),
      ],
    );
  }
}

class _buildProgressIndictor extends StatefulWidget {
  @override
  _buildProgressIndictorState createState() => _buildProgressIndictorState();
}

class _buildProgressIndictorState extends State<_buildProgressIndictor> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 模糊进度条(会执行一个动画)
            LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.orange),
            ),
            SizedBox(
              height: 10,
            ),
            //进度条显示50%
            LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.red),
              value: .5,
            ),
            SizedBox(height: 10),
            // 模糊进度条(会执行一个旋转动画)
            CircularProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
            SizedBox(
              height: 10,
            ),
            //进度条显示50%，会显示一个半圆
            CircularProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
              value: .5,
            ),
            SizedBox(
              height: 20,
            ),
            // 线性进度条高度指定为3
            SizedBox(
              height: 3,
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: .5,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            // 圆形进度条直径指定为100
            SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: .7,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _buidlProgressRoute extends StatefulWidget {
  @override
  _ProgressRouteState createState() => _ProgressRouteState();
}

class _ProgressRouteState extends State<_buidlProgressRoute>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    //动画执行时间3秒
    super.initState();
    _animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animationController.forward();
    _animationController.addListener(() => setState(() => {}));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: ColorTween(begin: Colors.grey, end: Colors.blue)
                  .animate(_animationController), // 从灰色变成蓝色
              value: _animationController.value,
            ),
          )
        ],
      ),
    );
  }
}

class _buildWrapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0, // 主轴(水平)方向间距
      runSpacing: 4.0, // 纵轴（垂直）方向间距
      alignment: WrapAlignment.center, //沿主轴方向居中
      children: <Widget>[
        new Chip(
          avatar:
              new CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
          label: new Text('Hamilton'),
        ),
        new Chip(
          avatar:
              new CircleAvatar(backgroundColor: Colors.blue, child: Text('M')),
          label: new Text('Lafayette'),
        ),
        new Chip(
          avatar:
              new CircleAvatar(backgroundColor: Colors.blue, child: Text('H')),
          label: new Text('Mulligan'),
        ),
        new Chip(
          avatar:
              new CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
          label: new Text('Laurens'),
        ),
      ],
    );
  }
}

//目前显示有问题，原因有待调查,层叠布局:https://book.flutterchina.club/chapter4/stack.html
class _buildStackPositionedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
        //通过ConstrainedBox来确保Stack占满屏幕
        ConstrainedBox(
      constraints: BoxConstraints.expand(
          width: double.infinity, height: double.infinity),
      child: Stack(
        alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
        children: <Widget>[
          Container(
            child: Text("Hello world", style: TextStyle(color: Colors.white)),
            color: Colors.red,
          ),
          Positioned(
            left: 18.0,
            child: Text("I am Jack"),
          ),
          Positioned(
            top: 18.0,
            child: Text("Your friend"),
          )
        ],
      ),
    );
  }
}

///显示有问题，原因待排查
class _buildCustomScrollViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //因为本路由没有使用Scaffold，为了让子级Widget(如Text)使用
    //Material Design 默认的样式风格,我们使用Material作为本路由的根。
    return CustomScrollView(
      slivers: <Widget>[
        //AppBar，包含一个导航栏
        // SliverAppBar(
        //   pinned: true,
        //   expandedHeight: 250.0,
        //   flexibleSpace: FlexibleSpaceBar(
        //     title: const Text('Demo'),
        //     background: Image.asset(
        //       "./images/lake.jpeg",
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),

        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: new SliverGrid(
            //Grid
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, //Grid按两列显示
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: new SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                //创建子widget
                return new Container(
                  alignment: Alignment.center,
                  color: Colors.cyan[100 * (index % 9)],
                  child: new Text('grid item $index'),
                );
              },
              childCount: 20,
            ),
          ),
        ),
        //List
        new SliverFixedExtentList(
          itemExtent: 50.0,
          delegate:
              new SliverChildBuilderDelegate((BuildContext context, int index) {
            //创建列表项
            return new Container(
              alignment: Alignment.center,
              color: Colors.lightBlue[100 * (index % 9)],
              child: new Text('list item $index'),
            );
          }, childCount: 50 //50个列表项
                  ),
        ),
      ],
    );
  }
}

class _buildCupertinoPicker extends StatelessWidget {
  const _buildCupertinoPicker({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
    Container(
      height: 270,
      child: CupertinoPicker(
        itemExtent: 45,
        onSelectedItemChanged: (index){
        },
        children: <Widget>[
          Container(color: Colors.primaries[1],),
          Container(color: Colors.primaries[2],),
          Container(color: Colors.primaries[3],),
          Container(color: Colors.primaries[4],),
          Container(color: Colors.primaries[5],),
          Container(color: Colors.primaries[6],),
        ],
      ) ,
    );

  }
}

