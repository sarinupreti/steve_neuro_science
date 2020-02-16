import 'package:steve_beaudoin/models/sub_topics.dart';
import 'package:steve_beaudoin/routes/routes.dart';
import 'package:steve_beaudoin/screens/details_page.dart';

final String homeScreen = "homeScreen";
final String notificationScreen = "notificationScreen";
final String searchScreen = "searchScreen";
final String topicInformationScreen = "topicInformationScreen";

void navigateToHome() {
  Routes.sailor.navigate(homeScreen);
}

void navigateToNotificationScreen() {
  Routes.sailor.navigate(notificationScreen);
}

// void navigateToSearchScreen() {
//   Routes.sailor(searchScreen);
// }

void navigateToTopicDetailsScreen(SubTopics subTopics) {
  Routes.sailor.navigate(topicInformationScreen,
      args: DetailsPageArguments(subTopics: subTopics));
}
