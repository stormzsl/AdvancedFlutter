import 'dart:ui' show Color;

class RooThemeColors {
  RooThemeColors._();

  // 全局品牌色
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color brandPrimary = Color(0xFFFFCC33);
  static const Color brandGradientStart = Color(0xFFFFE14D);
  static const Color brandGradientEnd = Color(0xFFFFC34D);

  /// -- 功能色
  /// 成功提示以及数据下降
  static const Color brandSuccess = Color(0xFF00BF7F);

  /// 价格色/一级提示以及警示色
  static const Color brandWarnning = Color(0xFFFF192D);

  /// -- 中性色
  /// 主字色，标题色
  static const Color grayPrimary = Color(0xFF222222);

  /// 次要级信息颜色
  static const Color graySecond = Color(0xFF666666);

  /// 辅助说明类信息
  static const Color grayAssist = Color(0xFF999999);

  /// 不可点击等信息
  static const Color grayDisabled = Color(0xFFCCCCCC);

  /// 卡片&控件底色（有高斯模糊透明时）
  static const Color grayBackgroundAlpha = Color(0xCCF0F2FA);

  /// 卡片&控件底色页面背景色(无高斯模糊）
  static const Color grayBackground = Color(0xFFF5F6FA);

  /// 分割线颜色
  static const Color graySeparate = Color(0xFFEEEEEE);

  /// --辅助色
  ///橙色辅助色
  static const Color orangeAssist = Color(0xFFFF6A00);

  ///绿色辅助色
  static const Color greenAssist = Color(0xFF00BF7F);

  ///蓝色辅助色
  static const Color blueAssist = Color(0xFF198CFF);

  static const Color cyanAssist = Color(0xFF00A4C4);
}
