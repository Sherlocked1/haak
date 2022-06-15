import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haak/app_constants/colors.dart';
import 'package:haak/custom_widgets/HaakButton.dart';
import 'package:haak/views/authentication/login.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../home/home.dart';

class Otp extends StatefulWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  State<Otp> createState() => _OtpState();
}


class _OtpState extends State<Otp> {

  TextEditingController controller = TextEditingController();
  String currentText = "";

  void signUp(String otpText){
    Get.to(()=>const LoginPage());
  }
  void confirmClicked(){
    signUp(currentText);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;


    return Scaffold(
      backgroundColor: MyColors.accent,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          height: size.height, width: size.width,
          child: Column(
            children: [
              Text("Verification Code",style: TextStyle(fontWeight: FontWeight.w700,color: MyColors.primary,fontSize: 24),),
              SizedBox(height: 20,),
              Text("Please enter the verification code\n sent to your email",maxLines: 2,textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18,color: MyColors.primary,fontWeight: FontWeight.w400),),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: PinCodeTextField(
                  controller: controller,
                  onCompleted: signUp,
                  appContext: context,
                  length: 5,
                  onChanged: (text){
                    setState((){
                      this.currentText = text;
                    });
                  },
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    inactiveColor: MyColors.accentLight,
                    activeColor: MyColors.accentLight,
                    selectedColor: MyColors.accentLight,
                    activeFillColor: MyColors.accentLight,
                    inactiveFillColor: MyColors.accentLight,
                    disabledColor: MyColors.accentLight,
                    selectedFillColor: MyColors.accentLight,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  textStyle: TextStyle(color: MyColors.primary),
                ),
              ),
              Expanded(child: SizedBox()),
              HaakButton(size: Size(size.width - 100,60), onPressed: confirmClicked, text: "Confirm",color: MyColors.accentLight,textColor: MyColors.primary,)

            ],
          ),
        ),
      ),
    );
  }
}
