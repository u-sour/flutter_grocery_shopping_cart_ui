class AppFont {
  AppFont._();
  static const List<String> _fonts = ['Cal Sans', 'Cabin'];
  static String get heading => _fonts[0];
  static String get body => _fonts[1];
}

class AppStyle {
  AppStyle._();
  static const double spacing = 12.0;
  static const double padding = 12.0;
  static const double radius = 14.0;
}

class AppFontSize {
  AppFontSize._();
  static const double heading = 24.0;
  static const double body = 16.0;
}
