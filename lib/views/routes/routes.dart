import 'package:flutter/material.dart';
import 'package:tp_alog/views/screens/add_client/add_client_screen.dart';
import 'package:tp_alog/views/screens/add_item/add_item_screen.dart';
import 'package:tp_alog/views/screens/client_list/client_list_screen.dart';
import 'package:tp_alog/views/screens/screens.dart';
import 'package:tp_alog/views/screens/solde_client/slode_client_screen.dart';

class Routes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.id:
        return _createRoute(HomeScreen(), settings);

      case SoldeClientScreen.id:
        return _createRoute(SoldeClientScreen(), settings);

      case ClientListScreen.id:
        return _createRoute(ClientListScreen(), settings);

      case AddClientScreen.id:
        return _createRoute(AddClientScreen(), settings);

      case AddItemScreen.id:
        return _createRoute(AddItemScreen(), settings);

      default:
        return _createRoute(HomeScreen(), settings);
    }
  }

  static Route _createRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
