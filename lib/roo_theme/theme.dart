import 'package:flutter/material.dart';
import 'theme_data.dart';

class RooTheme extends StatelessWidget {
  const RooTheme({
    Key key,
    @required this.data,
    @required this.child,
  })  : assert(child != null),
        assert(data != null),
        super(key: key);
  final Widget child;
  final RooThemeData data;

  static final RooThemeData _kFallbackTheme = defaultRooThemeData;

  static RooThemeData of(BuildContext context) {
    final _InheritedRooTheme inheritedTheme =
        context.dependOnInheritedWidgetOfExactType<_InheritedRooTheme>();
    return inheritedTheme?.theme?.data ?? _kFallbackTheme;
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedRooTheme(
      theme: this,
      child: child,
    );
  }
}

class _InheritedRooTheme extends InheritedWidget {
  const _InheritedRooTheme({
    Key key,
    @required this.theme,
    @required Widget child,
  })  : assert(theme != null),
        super(key: key, child: child);

  final RooTheme theme;

  @override
  bool updateShouldNotify(_InheritedRooTheme old) =>
      theme.data != old.theme.data;
}
