
import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences{
  static late SharedPreferences prefs;

  static Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static String onBoarding_key = "onBoardingComplete";
  static String loggedIn_key = "loggedIn";


  static void setLoggedIn(bool value){
    prefs.setBool(loggedIn_key, value);
  }

  static bool getLoggedIn(){
    return prefs.getBool(loggedIn_key) ?? false;
  }

  static void setOnBoardingComplete(bool value) {
    prefs.setBool(onBoarding_key, value);
  }

  static bool getOnBoardingComplete() {
    return prefs.getBool(onBoarding_key) ?? false;
 }
}