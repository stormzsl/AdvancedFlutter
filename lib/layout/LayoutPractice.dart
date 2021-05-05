import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LayoutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget image = _buildImage();
    Widget favoriteRow = _buildFavoriteRow(context);
    Widget buttonRow = _buildButtonContainer(context);
    Widget textSection = _buildTextSection();
    return new ListView(
      children: [image, favoriteRow, buttonRow, textSection],
    );
  }

  Widget _buildImage() {
    return Image.asset(
      'assets/images/lake.jpeg',
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
              ),
              Text(
                'Kandersteg, Switzerland',
                style: TextStyle(color: Colors.grey[500], fontSize: 16.0),
              )
            ],
          )),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Container(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              '41',
              style: TextStyle(fontSize: 16.0),
            ),
          )
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
}
