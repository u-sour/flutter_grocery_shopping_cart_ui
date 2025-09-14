import 'package:flutter/widgets.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileScaffold;
  final Widget tabletScaffold;
  final Widget laptopScaffold;
  final Widget desktopScaffold;

  const ResponsiveLayout({
    super.key,
    required this.mobileScaffold,
    required this.tabletScaffold,
    required this.laptopScaffold,
    required this.desktopScaffold,
  });

  // Breakpoint values
  static const double _mobileBreakPoint = 600.0;
  static const double _tabletBreakPoint = 768.0;
  static const double _laptopBreakPoint = 1024.0;
  static const double _desktopBreakPoint = 1440.0;

  // Helpers with orientation
  static bool isMobile(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final orientation = MediaQuery.orientationOf(context);

    return (orientation == Orientation.portrait &&
            size.width < _tabletBreakPoint) ||
        (orientation == Orientation.landscape &&
            size.height < _mobileBreakPoint);
  }

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return width >= _tabletBreakPoint && width < _laptopBreakPoint;
  }

  static bool isLaptop(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return width >= _laptopBreakPoint && width < _desktopBreakPoint;
  }

  static bool isDesktop(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return width >= _desktopBreakPoint;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final orientation = MediaQuery.orientationOf(context);

    if ((orientation == Orientation.portrait &&
            size.width < _tabletBreakPoint) ||
        (orientation == Orientation.landscape &&
            size.height < _mobileBreakPoint)) {
      return mobileScaffold;
    } else if (size.width >= _tabletBreakPoint &&
        size.width < _laptopBreakPoint) {
      return tabletScaffold;
    } else if (size.width >= _laptopBreakPoint &&
        size.width < _desktopBreakPoint) {
      return laptopScaffold;
    } else {
      return desktopScaffold;
    }
  }
}
