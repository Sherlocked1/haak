
import 'package:flutter/material.dart';
import 'package:haak/app_constants/colors.dart';
import 'package:haak/views/home/pages/browse_page.dart';
import 'package:haak/views/home/pages/home_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var currentPage = 0;

  PageController pageController = PageController();

  List<Widget> pages = [
    const HomePage(),
    const BrowsePage(),
    Container(color: Colors.yellow,),
    Container(color: Colors.green,),
  ];

  void navBarItemClickedWith(int index) {
    setState(() => {this.currentPage = index});
    // pageController.jumpToPage(index);
    pageController.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.easeIn);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:getNavbar(),
      body: Container(
        child: PageView(
          children: pages,
          controller: pageController,
          onPageChanged: (ind){setState(()=>{this.currentPage = ind});},
        ),
      ),
    );
  }

  BottomNavigationBar getNavbar(){
    return BottomNavigationBar(
      unselectedItemColor: MyColors.accent,
      selectedItemColor: MyColors.accentDark,
      elevation: 1,
      iconSize: 30,
      currentIndex: this.currentPage,
      onTap: navBarItemClickedWith,
      selectedLabelStyle: TextStyle(color: MyColors.accentDark,fontWeight: FontWeight.w700,fontSize: 14),
      unselectedLabelStyle: TextStyle(color: MyColors.accent,fontWeight: FontWeight.w500,fontSize: 14),
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.list),label: "Browse"),
        BottomNavigationBarItem(icon: Icon(Icons.manage_history),label: "Manage"),
        BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Settings"),
      ],
    );
  }

}


