import 'package:flutter/material.dart';
import 'package:xcut_frontend/src/app.dart';
import 'package:xcut_frontend/src/models/barberShop.dart';
import 'package:xcut_frontend/src/screens/barbershop_details.dart';
import 'package:xcut_frontend/src/screens/bookmark.dart';
import 'package:xcut_frontend/src/screens/change_password.dart';
import 'package:xcut_frontend/src/screens/home.dart';
import 'package:xcut_frontend/src/screens/login.dart';
import 'package:xcut_frontend/src/screens/signup.dart';
import 'package:xcut_frontend/src/utils/token_handler.dart';

class RouterManager {
  static Route handleRouting(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (context) => App());
    }

    if (settings.name == '/profile') {
      if (!TokenHandler.getToken()) {
        print(TokenHandler.getToken());
      }
    }

    if (settings.name == '/barbershopDetails') {
      BarberShop args = settings.arguments;
      return MaterialPageRoute(builder: (context) => BarberShopDetails(args));
    }

    if (settings.name == '/changePassword') {
      return MaterialPageRoute(builder: (context) => ChangePassword());
    }

    if (settings.name == '/bookmarks') {
      return MaterialPageRoute(builder: (context) => BookMark());
    }

    if (settings.name == '/login') {
      return MaterialPageRoute(builder: (context) => Login());
    }

    if (settings.name == '/signup') {
      return MaterialPageRoute(builder: (context) => Signup());
    }
    return MaterialPageRoute(builder: (context) => Home());
  }
}

class BarberShopDetailsRoute {
  final BarberShop barberShop;
  BarberShopDetailsRoute(this.barberShop);
}
