import 'package:flutter/material.dart';
import 'package:haak/app_constants/colors.dart';

class HaakButton extends StatelessWidget {
  HaakButton({Key? key,required this.size,required this.onPressed, required this.text,this.color,this.textColor}) : super(key: key);

  Size size;
  String text;
  Function onPressed;
  Color? color;
  Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10)
      ),
      child: TextButton(
        onPressed: (){onPressed();},
        child: Text(text,style: TextStyle(color: textColor,fontWeight: FontWeight.bold,fontSize: 18),),

      ),
    );
  }
}
