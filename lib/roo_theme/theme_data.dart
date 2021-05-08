import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:myapp/common/colors.dart';
import '../roo_common_themes/common/roo_theme_colors.dart';

class RooThemeData with Diagnosticable {
  factory RooThemeData({
    Color primaryColor,
    Color assistColor,
    Color dividerColor,
    Color disabledColor,
    Color gradientStartColor,
    Color gradientEndColor,
    RooThemeColor themeColor,
    ThemeData themeData,
    RooTextTheme textTheme,
  }) {
    themeColor = themeColor ?? RooThemeColor();
    themeData = themeData ?? defaultThemeData;
    return RooThemeData.raw(
        primaryColor: primaryColor,
        assistColor: assistColor,
        dividerColor: dividerColor,
        disabledColor: disabledColor,
        gradientStartColor: gradientStartColor,
        gradientEndColor: gradientEndColor,
        themeColor: themeColor,
        themeData: themeData,
        textTheme: textTheme);
  }

  RooThemeData copyWith(
      {Color primaryColor,
      Color assistColor,
      Color dividerColor,
      Color disabledColor,
      Color gradientStartColor,
      Color gradientEndColor,
      RooThemeColor themeColor,
      ThemeData themeData,
      RooTextTheme textTheme}) {
    return RooThemeData(
        primaryColor: primaryColor,
        assistColor: assistColor,
        dividerColor: dividerColor,
        disabledColor: disabledColor,
        gradientStartColor: gradientStartColor,
        gradientEndColor: gradientEndColor,
        themeColor: themeColor,
        themeData: themeData,
        textTheme: textTheme);
  }

  @protected
  const RooThemeData.raw(
      {this.primaryColor,
      this.assistColor,
      this.dividerColor,
      this.disabledColor,
      this.gradientStartColor,
      this.gradientEndColor,
      this.themeColor,
      this.themeData,
      this.textTheme});
  final Color primaryColor;
  final Color assistColor;
  final Color dividerColor;
  final Color disabledColor;
  final Color gradientStartColor;
  final Color gradientEndColor;
  final RooThemeColor themeColor;
  final ThemeData themeData;
  final RooTextTheme textTheme;
}

/// 用于预定义 Roo Theme 的各种组件的默认主题
final defaultThemeData = ThemeData(
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.normal,
    minWidth: 90.0,
    height: 34.0,
    layoutBehavior: ButtonBarLayoutBehavior.padded,
    alignedDropdown: false,
    buttonColor: RooColors.white,
    disabledColor: RooColors.white.withOpacity(0.3),
    splashColor: RooColors.white.withOpacity(0.3),
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: RooColors.grayLighter,
        width: 0.5,
      ),
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
  ),
);

final defaultRooThemeData = RooThemeData(
    primaryColor: RooThemeColors.brandPrimary,
    assistColor: RooThemeColors.grayAssist,
    gradientStartColor: RooThemeColors.brandGradientStart,
    gradientEndColor: RooThemeColors.brandGradientEnd,
    textTheme: RooTextTheme(
      title1: const TextStyle(
          color: Color(0xff222222), fontSize: 14, fontWeight: FontWeight.w400),
      title2: const TextStyle(
          color: Color(0xff222222), fontSize: 16, fontWeight: FontWeight.w500),
      title3: const TextStyle(
          color: Color(0xff222222), fontSize: 12, fontWeight: FontWeight.w500),
      subTitle1: const TextStyle(
        color: Color(0xff666666),
        fontSize: 14,
      ),
    ));

//文本主题
class RooTextTheme with Diagnosticable {
  RooTextTheme(
      {this.title1, this.title2, this.title3, this.subTitle1, this.subTitle2});
  final TextStyle title1;
  final TextStyle title2;
  final TextStyle title3;
  final TextStyle subTitle1;
  final TextStyle subTitle2;
}

/// [RooThemeColor] 用于获取 roo-flutter ui 组件的相关颜色
class RooThemeColor {
  const RooThemeColor({
    Color themeColor,
    Color primaryColor,
    Color infoColor,
    Color successColor,
    Color dangerColor,
    Color warningColor,
    Color defaultColor,
    Color negativeColor,
    Color cancelTextColor,
    Color confirmTextColor,
    Color titleColor,
    Color secondaryColor,
    Color primaryGradualColor,
  })  : themeColor = themeColor ?? RooColors.themeColor,
        primaryColor = primaryColor ?? RooColors.primary,
        infoColor = infoColor ?? RooColors.info,
        successColor = successColor ?? RooColors.success,
        dangerColor = dangerColor ?? RooColors.danger,
        warningColor = warningColor ?? RooColors.warning,
        defaultColor = defaultColor ?? RooColors.white,
        negativeColor = negativeColor ?? RooColors.grayLightNegative,
        cancelTextColor = cancelTextColor ?? RooColors.gray,
        confirmTextColor = confirmTextColor ?? RooColors.darkOrangeColor,
        titleColor = titleColor ?? RooColors.greyColor,
        primaryGradualColor = primaryGradualColor ?? RooColors.black,
        secondaryColor = secondaryColor ?? RooColors.black;

  final Color themeColor;
  final Color primaryColor;
  final Color infoColor;
  final Color successColor;
  final Color dangerColor;
  final Color warningColor;
  final Color defaultColor;
  final Color negativeColor;
  final Color cancelTextColor;
  final Color confirmTextColor;
  final Color titleColor;
  final Color secondaryColor;
  final Color primaryGradualColor;
}
