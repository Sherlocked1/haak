import 'package:flutter/material.dart';
import 'package:haak/app_constants/colors.dart';

class CategoryItem extends StatefulWidget {
  String name;
  CategoryItem({Key? key,required this.name}) : super(key: key);

  @override
  State<CategoryItem> createState() => _CategoryItemState(this.name);
}

class _CategoryItemState extends State<CategoryItem> {
  _CategoryItemState(this.name);

  Color textColor = MyColors.darkGray;
  Color color = Colors.transparent;

  String name;

  Color disabledTextColor = MyColors.darkGray;
  Color activeTextColor = MyColors.primary;

  Color disabledColor = Colors.transparent;
  Color activeColor = MyColors.accent;

  var isActive = false;

  void active(){
    isActive = !isActive;
    print("here");
    setState((){
      if (isActive) {

      }else{

      }
      isActive ? {textColor = activeTextColor , color = activeColor} : {textColor = disabledTextColor , color = disabledColor};
    });
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: active,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0,horizontal: 15),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(width: 1,color: MyColors.disabledColor)
        ),
        child: Center(
          child: Text(name,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: textColor),),
        ),
      ),
    );
  }
}

