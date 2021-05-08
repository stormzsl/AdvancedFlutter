//自定义颜色

import 'dart:ui';

class RooColors {
  RooColors._(); //私有构造函数

  //全局颜色
  static const Color white = Color(0xFFFFFFFF);

  static const Color black = Color(0xFF000000);

  static const Color primary = Color(0xFFFECB2E);

  static const Color primaryDark = const Color(0x0fFFFFA0000);

  static const Color success = Color(0xFF6ABF47);

  static const Color warning = const Color(0xFFFF8C28);

  static const Color danger = const Color(0xFFF4333c);

  static const Color info = Color(0xFF4B88EB);

  static const Color text = Color(0xFF4E73FF);

  //正文
  static const Color grayBase = Color(0xFF111111);

  //副标题
  static const Color grayDarker = Color(0xFF333333);

  ///提示信息
  static const Color grayDark = const Color(0xFF555555);

  //取消按钮
  static const Color gray = Color(0xFF888888);

  static const Color grayLight = const Color(0xFFAAAAAA);

  static const Color grayLighter = Color(0xFFCCCCCC);

  static const Color grayLightNegative = Color(0xFFE5E5E5);

  static const Color grayLightest = Color(0xFFebebeb);

  ///分割线
  static const Color diverColor = Color(0xFFF5F5F5F5);

  static const Color diverColorDeep = Color(0xFFEEEEEE);

  //主题色
  static const Color themeColor = Color(0xFFFFD161);

  //高亮主题色
  static const Color hightlightThemeColor = Color(0xFFFDE90);
  //暗主题色
  static const Color darkOrangeColor = Color(0xFFF89800);

  // 中性色相关
  /// 100% grey，主字色、标题色 0x36394D
  static const Color greyColor = Color(0xFF36394D);

  /// 85% grey 0x545766
  static const Color grey85Color = Color(0xFF545766);

  /// 75% grey，正文、次要级信息颜色 0x676A78
  static const Color grey75Color = Color(0xFF676A78);

  /// 55% grey，辅助类信息说明颜色 0x91949E
  static const Color grey55Color = Color(0xFF91949E);

  /// 25% grey，辅助说明等最次要信息、不可点击颜色 0xCBCCD1
  static const Color grey25Color = Color(0xFFCBCCD1);

  /// 12% grey，全局分割线颜色 0xE6E6E8
  static const Color grey12Color = Color(0xFFE6E6E8);

  /// 6% grey，页面背景色、列表分割线 0xF4F4F5
  static const Color grey6Color = Color(0xFFF4F4F5);

  /// 3% grey，白卡片内的页面背景色 0xFAFAFA
  static const Color grey3Color = Color(0xFFFAFAFA);
}
