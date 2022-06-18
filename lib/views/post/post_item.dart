import 'package:flutter/material.dart';
import 'package:haak/app_constants/colors.dart';
import 'package:haak/custom_widgets/HaakButton.dart';
import 'package:haak/custom_widgets/StepIndicator.dart';

class PostItem extends StatefulWidget {
  const PostItem({Key? key}) : super(key: key);

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  var currentStep = 0;
  final numberOfSteps = 3;
  PageController pageController = PageController();

  void nextClicked(){
    if (currentStep < numberOfSteps){
      setState((){
        currentStep++;
      });
      pageController.animateToPage(currentStep, duration: Duration(milliseconds: 100), curve: Curves.easeIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.accent,
        centerTitle: true,
        title: Text("New Post",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10,5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StepIndicator(numberOfSteps: numberOfSteps, currentStep: currentStep, selectedColor: MyColors.accent, unselectedColor: MyColors.disabledColor),
            Container(
              height: size.height * 0.6,
              child: PageView(
                controller: pageController,
                children: [
                  Container(color:Colors.red),
                  Container(color:Colors.blue),
                  Container(color:Colors.teal),
                ],
              ),
            ),
            HaakButton(size: Size(size.width- 20,60),color: MyColors.accent,textColor: MyColors.primary, onPressed: nextClicked, text: "Next")
          ],
        ),
      ),
    );
  }
}
