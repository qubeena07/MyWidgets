import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double dynamicHeight(double value) => MediaQuery.of(this).size.height * value;
  double dynamicWidth(double value) => MediaQuery.of(this).size.width * value;
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  double get statusBarHeight => MediaQuery.of(this).padding.top;
  double get bottomBarHeight => MediaQuery.of(this).padding.bottom;
  double get safeAreaHeight => height - statusBarHeight - bottomBarHeight;
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
}
