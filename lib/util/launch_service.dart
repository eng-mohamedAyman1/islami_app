
import 'package:shared_preferences/shared_preferences.dart';

class AppLaunchService {
  static Future<bool> isFirstLaunch() async {
    final preference = await SharedPreferences.getInstance();
    return preference.getBool("isFirstLaunch") ?? true;
  }

  static Future<void> setFirstLaunch() async {
    final preference = await SharedPreferences.getInstance();
    preference.setBool("isFirstLaunch", false);
  }
}