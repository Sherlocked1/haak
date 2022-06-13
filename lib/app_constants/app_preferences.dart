
import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences{
  static late SharedPreferences prefs;

  static Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static String onBoarding_key = "onBoardingComplete";



  static void setOnBoardingComplete(bool value) {
    prefs.setBool(onBoarding_key, value);
  }

  static bool getOnBoardingComplete() {
    bool? isComplete = prefs.getBool(onBoarding_key);
    return isComplete ?? false;
 }
}