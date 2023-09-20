import 'package:jamaathi/Component/AppPreference.dart';

class ApiUrl {
  static String login = "UserMaster";
  static String mosquesList =
      "GetMasjidWithUserSubscribeFlag/" + AppPreference().getUserId.toString();
  static String subscribedUrl = "UserMasjid";
  static String subscribeDelete =
      "UserMasjid/" + AppPreference().getUserId.toString() + ",";
}
