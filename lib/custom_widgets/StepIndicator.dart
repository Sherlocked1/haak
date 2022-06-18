import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haak/app_constants/colors.dart';

class StepIndicator extends StatefulWidget {
  StepIndicator({Key? key,required this.numberOfSteps,required this.currentStep,required this.selectedColor,required this.unselectedColor}) : super(key: key);

  int numberOfSteps;
  int currentStep;

  Color selectedColor;
  Color unselectedColor;

  @override
  State<StepIndicator> createState() => _StepIndicatorState(this.numberOfSteps,this.currentStep,this.selectedColor,this.unselectedColor);
}

class _StepIndicatorState extends State<StepIndicator> {

  _StepIndicatorState(this.numberOfSteps,this.currentStep,this.selectedColor,this.unselectedColor);

  int numberOfSteps;
  int currentStep;

  Color selectedColor;
  Color unselectedColor;


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      children: getSteps(),
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }

  List<Widget> getSteps(){
    final width = (Get.size.width/numberOfSteps) - 20;
    List<Widget> widgets = [];
    for(int i=0;i<numberOfSteps;i++){
      widgets.add(
        Container(
          decoration: BoxDecoration(
              color: i < currentStep ? selectedColor : unselectedColor,
            borderRadius: BorderRadius.circular(3)
          ),
          height: 10,width: width,
        )
      );
    }
    return widgets;
  }

}
