import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haak/app_constants/app_preferences.dart';
import 'package:haak/app_constants/colors.dart';
import 'package:haak/views/authentication/login.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoarding extends StatelessWidget {
  OnBoarding({Key? key}) : super(key: key);

  List<PageViewModel> pages = [
    PageViewModel(
      title: "Introduction title 1",
      body: "lorem ipsum lorem lorem ipsum lorem lorem ipsum lorem lorem ipsum lorem"
    ),
    PageViewModel(
        title: "Introduction title 2",
        body: "lorem ipsum lorem lorem ipsum lorem lorem ipsum lorem lorem ipsum lorem"
    ),
    PageViewModel(
        title: "Introduction title 3",
        body: "lorem ipsum lorem lorem ipsum lorem lorem ipsum lorem lorem ipsum lorem"
    )
  ];

  void onBoardingComplete(){
    AppPreferences.setOnBoardingComplete(true);
    Get.to(LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: MyColors.primary,
      width: size.width,
      height: size.height,
      child: SafeArea(
        child: IntroductionScreen(
          pages: pages,
          showDoneButton: true,
          done: const Text("Done",style: TextStyle(fontWeight: FontWeight.w700),),
          onDone: onBoardingComplete,
          next: const Text("Next"),
          showSkipButton: true,
          skip: const Text("Skip"),
          dotsDecorator: DotsDecorator(
            activeColor: MyColors.accent,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: MyColors.accent,width: 1),
              borderRadius: BorderRadius.circular(25)
            )
          ),
        ),
      )
    );
  }
}