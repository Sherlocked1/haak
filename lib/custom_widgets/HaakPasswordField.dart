
import 'package:flutter/material.dart';
import 'package:haak/app_constants/colors.dart';

class HaakPasswordField extends StatelessWidget {
  String? placeHolder;
  Widget icon;

  HaakPasswordField({Key? key,this.placeHolder,required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 50,width: size.width - 50,
      decoration: BoxDecoration(
        border: Border.all(color: MyColors.disabledColor,width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: TextField(
            obscureText: true,
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(fontWeight: FontWeight.w400,color: MyColors.accent),
            decoration: InputDecoration(
                suffixIcon: icon,
                border: InputBorder.none,
                hintText: (placeHolder ?? ""),
                hintMaxLines: 1,
                hintStyle: TextStyle(fontWeight: FontWeight.w300,fontSize: 14)
            ),
          )
      ),
    );
  }
}
