import 'package:flutter/material.dart';
import 'package:steve_beaudoin/routes/navigation_routes.dart';
import 'package:steve_beaudoin/routes/routes_name.dart';

/// [AppRoutes] class is used to handle all routes related stuffs along with setups before launching pages.
class AppRoutes {
  //
  AppRoutes();

  /// Function [routes] used switch case to handle route request.
  Route routes(RouteSettings settings) {
    NavigationRoutes _navigationRoutes;

    switch (settings.name) {
      case homePageRoute:
        return _navigationRoutes.openHomeScreen(settings);
        break;

      case notificationScreenRoute:
        return _navigationRoutes.openNotificationsScreen(settings);
        break;

      case detailsPageRoute:
        return _navigationRoutes.openDetailsScreen(settings);
        break;

      default:
        throw Exception('Invalid route: ${settings.name}');
    }
  }

  //
}
