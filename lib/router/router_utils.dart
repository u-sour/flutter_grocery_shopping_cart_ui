import 'package:flutter/material.dart';

enum SCREENS { intro, home, cart }

extension ScreenExtension on SCREENS {
  String get path {
    switch (this) {
      case SCREENS.intro:
        return '/';
      case SCREENS.home:
        return '/home';
      case SCREENS.cart:
        return '/cart';
    }
  }

  String get name {
    switch (this) {
      case SCREENS.intro:
        return 'intro';
      case SCREENS.home:
        return 'home';
      case SCREENS.cart:
        return 'cart';
    }
  }

  IconData get icon {
    switch (this) {
      case SCREENS.intro:
        return Icons.info;
      case SCREENS.home:
        return Icons.home;
      case SCREENS.cart:
        return Icons.shopping_cart;
    }
  }
}
