

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haak/app_constants/colors.dart';
import 'package:haak/custom_widgets/HaakButton.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  void logOutClicked(){
    var size = Get.size;
    Get.dialog(
        Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
            width: size.width - 100,height: 250,
            decoration: BoxDecoration(
              color: MyColors.primary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Are you sure you want to logout ?",maxLines: 2,textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: "inter",fontSize: 20,fontWeight: FontWeight.bold,color: MyColors.accentDark,decoration: TextDecoration.none),),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HaakButton(size: Size(size.width - 120,50), onPressed: (){}, text: "Yes",color: Colors.redAccent,textColor: MyColors.primary),
                    SizedBox(height: 10,),
                    HaakButton(size: Size(size.width - 120,50), onPressed: (){}, text: "No",color: MyColors.accent,textColor: MyColors.primary,),
                  ],
                ),

              ],
            ),
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(75),
                child: Container(
                  decoration: BoxDecoration(
                    color: MyColors.accent,
                    borderRadius: BorderRadius.circular(75)
                  ),
                  height: 150,width: 150,
                  child: Icon(Icons.person,size: 150,color: MyColors.primary,),
                ),
              ),
              SizedBox(height: 20,),
              Text("Mohammed Sayed",style: TextStyle(color: MyColors.accent,fontSize: 18,fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                    color: MyColors.accent,
                    borderRadius: BorderRadius.circular(25)
                ),
                height: 40,
                width: 140,
                // padding: EdgeInsets.all(10),
                child: TextButton(onPressed: (){},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 10,),
                      Text("Edit profile",style: TextStyle(color: MyColors.primary,fontWeight: FontWeight.bold),),
                      Icon(Icons.arrow_right,size: 30,color: MyColors.primary,)
                    ]
                  ),
                )
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                decoration: BoxDecoration(
                  border: Border.symmetric(horizontal: BorderSide(width: 1,color: MyColors.accentLight)),
                ),
                child: Column(
                  children: [
                    SettingsOption(text: "Account",iconData: Icons.person,color: MyColors.accentDark,callBack: (){print("call");},),
                    SettingsOption(text: "Privacy",iconData: Icons.privacy_tip_rounded,color: MyColors.accentDark,),
                    SettingsOption(text: "Appearance",iconData: Icons.color_lens_rounded,color: MyColors.accentDark,),
                    SettingsOption(text: "Notifications",iconData: Icons.notifications,color: MyColors.accentDark,),
                    SettingsOption(text: "About",iconData: Icons.info,color: MyColors.accentDark,),
                    SettingsOption(text: "Sign out",iconData: Icons.logout_rounded,color: MyColors.accentDark,callBack: logOutClicked,),
                  ],
                ),
              )


            ],
          ),
        ),
      ),
    );
  }
}


class SettingsOption extends StatelessWidget {
  SettingsOption({Key? key,required this.iconData,required this.text,this.value,this.color,this.callBack}) : super(key: key);

  IconData iconData;
  String text;
  Widget? value;
  Color? color;
  Function()? callBack;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0,horizontal: 0),
      height: 60,
      decoration: BoxDecoration(
        border: Border.symmetric(horizontal: BorderSide(width: 1,color: MyColors.accentLight)),
      ),
      child: TextButton(
        onPressed: callBack,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(width: 10,),
                Icon(iconData,size: 30,color: color,),
                SizedBox(width: 15,),
                Text(text,style: TextStyle(color: color,fontWeight: FontWeight.w600,fontSize: 16),)
              ],
            ),
            value ?? SizedBox()
          ],
        ),
      ),
    );
  }
}
