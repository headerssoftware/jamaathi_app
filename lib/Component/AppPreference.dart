import 'package:get_storage/get_storage.dart';

class AppPreference {
  static const STORAGE_NAME = 'Jamaathi';

  static const _userId = 'userId';

  static const leadEvaluationStatusLabel = "feature_permission_lead_evaluation";

  final _storage = GetStorage(STORAGE_NAME);

  Future<void> init() async {
    await _storage.initStorage;
  }

  updateUserId(String userId) {
    _storage.write(_userId, userId);
  }

  String get getUserId {
    try {
      return _storage.read(_userId);
    } catch (e) {
      return "";
    }
  }

  clearData() {
    _storage.erase();
  }
}
