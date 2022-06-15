import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haak/app_constants/app_preferences.dart';
import 'package:haak/app_constants/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:haak/custom_widgets/HaakButton.dart';
import 'package:haak/custom_widgets/HaakPasswordField.dart';
import 'package:haak/custom_widgets/HaakTextField.dart';
import 'package:haak/views/authentication/signup.dart';

import '../Home/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  void signUpClicked(){
    Get.to(()=>const SignUp());
  }
  void loginClicked(){
    AppPreferences.setLoggedIn(true);
    Get.to(()=>const Home());
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          color: MyColors.primary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(child: SizedBox()),
              SvgPicture.asset(
                "assets/icons/recycle.svg",
                width: size.width,
                height: size.height * 0.30,
                fit: BoxFit.fitHeight,
                color: MyColors.accent,
              ),
              const Text("Haak",style: TextStyle(fontWeight: FontWeight.w700,color: MyColors.accent),),
              const SizedBox(height: 40,),
              HaakTextField(placeHolder: "Username", icon: const Icon(Icons.person)),
              const SizedBox(
                height: 10,
              ),
              HaakPasswordField(placeHolder: "Password", icon: const Icon(Icons.lock)),
              const SizedBox(
                height: 10,
              ),
              RichText(
                  text: TextSpan(text: "Don't have an account ? ",style: const TextStyle(fontSize:14,color: MyColors.accent), children: [
                TextSpan(
                    text: "Sign up",
                    style: const TextStyle(fontSize:14,color: MyColors.accent,fontWeight: FontWeight.w600,decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()..onTap = signUpClicked)
              ])),
              const SizedBox(height: 20,),
              Row(children: const [Expanded(child: Divider(color: MyColors.accent,)),Text(" OR ",style: TextStyle(color:MyColors.accent),),Expanded(child: Divider(color: MyColors.accent))],),
              const MediaIcons(),
              const Expanded(child: SizedBox()),
              HaakButton(size: Size(size.width - 80, 60), onPressed: loginClicked, text: "Login",color: MyColors.accent,textColor:MyColors.primary),
              const SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }
}

class MediaIcons extends StatelessWidget {
  const MediaIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: 60,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/icons/google.svg",height: 35,width: 35,color: MyColors.accent,),
          const SizedBox(width: 20,),
          SvgPicture.asset("assets/icons/facebook.svg",height: 35,width: 35,color: MyColors.accent,),
          const SizedBox(width: 20,),
          SvgPicture.asset("assets/icons/apple.svg",height: 35,width: 35,color: MyColors.accent,)
        ],
      ),
    );
  }
}

