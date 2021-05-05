import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LayoutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget image = _buildImage();
    Widget favoriteRow = _buildFavoriteRow(context);
    Widget buttonRow = _buildButtonContainer(context);
    return new Container(
      child: new Column(
        children: [image, favoriteRow, buttonRow],
      ),
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
          Text(
            '41',
            style: TextStyle(fontSize: 16.0),
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
}
