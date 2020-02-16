import 'package:flutter/material.dart';
import 'package:sailor/sailor.dart';
import 'package:steve_beaudoin/routes/route.dart';
import 'package:steve_beaudoin/screens/details_page.dart';
import 'package:steve_beaudoin/screens/home.dart';
import 'package:steve_beaudoin/screens/notifications/notification_screen.dart';

class Routes {
  static final sailor = Sailor();

  static void createRoutes() {
    sailor.addRoutes([
      // Just for good measure, we won't explicitly navigate to the InitialPage.
      SailorRoute(
        name: homeScreen,
        builder: (context, args, params) {
          return HomePage();
        },
      ),
      SailorRoute(
        name: notificationScreen,
        builder: (context, args, params) {
          return NotificationScreen();
        },
      ),
      SailorRoute(
        name: topicInformationScreen,
        builder: (context, args, params) {
          return DetailsPage(
            subTopics: args,
          );
        },
      ),
    ]);
    SailorOptions(
      defaultTransitions: [
        SailorTransition.slide_from_bottom,
        SailorTransition.zoom_in,
      ],
      defaultTransitionCurve: Curves.decelerate,
      defaultTransitionDuration: Duration(milliseconds: 100),
    );
  }
}
