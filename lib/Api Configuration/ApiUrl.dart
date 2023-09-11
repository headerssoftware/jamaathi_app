import 'package:jamaathi/Component/AppPreference.dart';

class ApiUrl {
  static String login = "UserMaster";
  static String mosquesList =
      "GetMasjidWithUserSubscribeFlag/" + AppPreference().getUserId.toString();
}
