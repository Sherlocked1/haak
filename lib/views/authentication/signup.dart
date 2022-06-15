import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:haak/app_constants/colors.dart';
import 'package:haak/custom_widgets/HaakButton.dart';
import 'package:haak/custom_widgets/HaakPasswordField.dart';
import 'package:haak/custom_widgets/HaakTextField.dart';
import 'package:haak/views/authentication/otp.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  void signInClicked(){
    Get.back();
  }

  void signUpClicked(){
    Get.to(Otp());
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,height: size.height,
          color: MyColors.primary,
          child: Column(
            children: [
              const Expanded(child: SizedBox()),
              SvgPicture.asset(
                "assets/icons/recycle.svg",
                width: size.width,
                height: size.height * 0.20,
                fit: BoxFit.fitHeight,
                color: MyColors.accent,
              ),
              const Text("Haak",style: TextStyle(fontWeight: FontWeight.w700,color: MyColors.accent),),
              const SizedBox(height: 20,),
              HaakTextField(placeHolder: "Full Name", icon: const Icon(Icons.person)),
              SizedBox(height: 15,),
              HaakTextField(placeHolder: "Phone number", icon: const Icon(Icons.phone)),
              SizedBox(height: 15,),
              HaakTextField(placeHolder: "Email", icon: const Icon(Icons.mail)),
              SizedBox(height: 15,),
              HaakPasswordField(placeHolder: "Password", icon: const Icon(Icons.lock)),
              SizedBox(height: 15,),
              HaakPasswordField(placeHolder: "Confirm Password", icon: const Icon(Icons.lock)),
              SizedBox(height: 15,),
              RichText(text: TextSpan(
                  text: "Already have an account ? " ,
                  style: TextStyle(fontSize: 14,color: MyColors.accent, fontWeight: FontWeight.w300),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()..onTap = signInClicked,
                      text: "Sign in",
                      style: TextStyle(fontWeight: FontWeight.w700, decoration: TextDecoration.underline)),
                  ]
              )),
              Expanded(child: SizedBox()),
              HaakButton(size: Size(size.width - 100,60), onPressed: signUpClicked, text: "Sign up",color: MyColors.accent,textColor: MyColors.primary,)

              ,Expanded(child: SizedBox())
            ],
          ),
        ),
      ),
    );
  }
}
