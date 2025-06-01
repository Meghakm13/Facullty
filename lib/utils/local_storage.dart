import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<void> setFirstLaunch(bool isFirst) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstLaunch', isFirst);
  }

  static Future<bool> getFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isFirstLaunch') ?? true; // true by default
  }

  static Future<void> setLastFacultyName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('lastFacultyName', name);
  }

  static Future<String?> getLastFacultyName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('lastFacultyName');
  }
}
