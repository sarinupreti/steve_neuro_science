import 'package:flutter/material.dart';
import 'package:steve_beaudoin/screens/details_page.dart';
import 'package:steve_beaudoin/screens/home.dart';
import 'package:steve_beaudoin/screens/notifications/notification_screen.dart';

class NavigationRoutes {
  MaterialPageRoute openHomeScreen(RouteSettings settings) {
    return MaterialPageRoute<dynamic>(
      builder: (BuildContext context) {
        return HomePage();
      },
    );
  }

  MaterialPageRoute openNotificationsScreen(RouteSettings settings) {
    return MaterialPageRoute<dynamic>(
      builder: (BuildContext context) {
        return NotificationScreen();
      },
    );
  }

  MaterialPageRoute openDetailsScreen(RouteSettings settings) {
    return MaterialPageRoute<dynamic>(
      builder: (BuildContext context) {
        return DetailsPage(subTopics: settings.arguments);
      },
    );
  }
}
