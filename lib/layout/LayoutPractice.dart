import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LayoutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget image = _buildImage();
    return image;
  }

  Widget _buildImage() {
    return Image.asset(
      'assets/images/lake.jpeg',
      scale: 1.0,
      height: 400.0,
    );
  }
}
