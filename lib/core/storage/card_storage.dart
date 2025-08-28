import 'package:shared_preferences/shared_preferences.dart';

class CardStorage {
  static Future<void> saveDismissState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('dismiss', value);
  }

  static Future<bool> loadDismissState() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('dismiss') ?? false;
  }
}
