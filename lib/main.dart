import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:haak/app_constants/app_preferences.dart';
import 'package:haak/views/Home/home.dart';
import 'package:haak/views/authentication/login.dart';
import 'package:haak/views/on_boarding/on_boarding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreferences.init();
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isOnBoardingComplete = AppPreferences.getOnBoardingComplete();
    var isLoggedIn = AppPreferences.getLoggedIn();
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: "inter"
      ),
      home: Scaffold(
        body: isOnBoardingComplete ? isLoggedIn ? const Home() : const LoginPage() : OnBoarding(),
      ),
    );
  }
}
