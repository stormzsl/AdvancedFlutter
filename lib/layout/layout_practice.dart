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
              textFiledWidget
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
