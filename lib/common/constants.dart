import 'package:flutter/painting.dart';
import 'package:myapp/common/colors.dart';

import '../roo_flutter.dart';

//RooButton的默认尺寸
const Size kDefaultRooButtonSize = Size(75.0, 22.0);

//RooButton 按钮禁用颜色
const Color kDefaultRooButtonDisableColor = RooColors.grey25Color;

//RooDialog 按钮默认高度
const double kDefaultRooDialogActionAreaHeight = 44.0;

//RooDialog阴影
const double kDefaultRooDialogElevation = 24.0;

/// RooBottomModal 标题栏默认高度
const double kDefaultRooBottomModalTitleHeight = 48.0;

/// RooBottomModal 默认动画时长
const Duration kRooBottomModalDuration = Duration(milliseconds: 200);

/// RooToast 默认展示时长
const Duration kRooToastDuration = Duration(seconds: 2);

/// RooToast 默认边框圆角
final BorderRadius kRooToastBorderRadius = BorderRadius.circular(7.0);

/// RooToast 默认字体
final TextStyle kDefaultRooToastTextStyle =
    TextStyle(fontSize: 16.0, color: RooColors.white);

/// RooActionSheet 取消按钮默认 padding
const double kDefaultRooActionSheetCancelButtonPadding = 4.0;

/// RooActionSheetAction 默认字体
const TextStyle kRooActionSheetActionStyle = TextStyle(
  inherit: false,
  fontSize: 16.0,
  fontWeight: FontWeight.normal,
  color: RooColors.grayBase,
  textBaseline: TextBaseline.alphabetic,
);

/// RooActionSheet title 默认字体
const TextStyle kActionSheetTitleStyle = TextStyle(
  inherit: false,
  fontSize: 14.0,
  fontWeight: FontWeight.normal,
  color: Color(0xFF999999),
  textBaseline: TextBaseline.alphabetic,
);

/// RooNavigationBar title 默认字体
const TextStyle kRooNavigationBarTitleStyle = TextStyle(
  inherit: true,
  fontSize: 18.0,
  fontWeight: FontWeight.normal,
  color: Color(0xFF0B0D0F),
  textBaseline: TextBaseline.alphabetic,
);

const TextStyle kRooNavigationBarSubTitleStyle = TextStyle(
  inherit: true,
  fontSize: 12.0,
  fontWeight: FontWeight.normal,
  color: RooColors.grayLighter,
  textBaseline: TextBaseline.alphabetic,
);

const TextStyle kRooNavigationBarRightActionStyle = TextStyle(
  inherit: true,
  fontSize: 14.0,
  fontWeight: FontWeight.normal,
  color: RooColors.darkOrangeColor,
  textBaseline: TextBaseline.alphabetic,
);

const TextStyle kRooNavigationBarSearchTextStyle = TextStyle(
  inherit: true,
  fontSize: 14.0,
  fontWeight: FontWeight.normal,
  color: Color(0xFF6D6E6F),
  textBaseline: TextBaseline.alphabetic,
);

/// RooTopTipTitleStyle title 默认字体
const TextStyle kRooTopTipTitleStyle = TextStyle(
  inherit: true,
  fontSize: 14.0,
  fontWeight: FontWeight.normal,
  color: Color(0xFFFF8C28),
  textBaseline: TextBaseline.alphabetic,
);
