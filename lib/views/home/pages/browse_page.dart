import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haak/custom_widgets/cells/CategoryItem.dart';
import 'package:haak/custom_widgets/cells/HaakItemCell.dart';

import '../../../Models/Item.dart';

class BrowsePage extends StatefulWidget {
  const BrowsePage({Key? key}) : super(key: key);

  @override
  State<BrowsePage> createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage> {

  List<Item> listings = [
    Item("1", "Dress", "lorem ipsum lorem ipsum", "12", "12", "Joseph", 0, [
      "https://flutter.github.io/assets-for-api-docs/assets/widgets/falcon.jpg",
      "https://flutter.github.io/assets-for-api-docs/assets/widgets/falcon.jpg"
    ]),
    Item("2", "Bicycle", "lorem ipsum lorem ipsum", "12", "12", "Joseph", 10, [
      "https://flutter.github.io/assets-for-api-docs/assets/widgets/falcon.jpg",
      "https://flutter.github.io/assets-for-api-docs/assets/widgets/falcon.jpg"
    ]),
    Item("3", "Dress", "lorem ipsum lorem ipsum", "12", "12", "Joseph", 0, [
      "https://flutter.github.io/assets-for-api-docs/assets/widgets/falcon.jpg",
      "https://flutter.github.io/assets-for-api-docs/assets/widgets/falcon.jpg"
    ]),
    Item("4", "Dress", "lorem ipsum lorem ipsum", "12", "12", "Joseph", 0, [
      "https://flutter.github.io/assets-for-api-docs/assets/widgets/falcon.jpg",
      "https://flutter.github.io/assets-for-api-docs/assets/widgets/falcon.jpg"
    ]),
    Item("5", "Dress", "lorem ipsum lorem ipsum", "12", "12", "Joseph", 0, [
      "https://flutter.github.io/assets-for-api-docs/assets/widgets/falcon.jpg",
      "https://flutter.github.io/assets-for-api-docs/assets/widgets/falcon.jpg"
    ]),
    Item("6", "Dress", "lorem ipsum lorem ipsum", "12", "12", "Joseph", 0, [
      "https://flutter.github.io/assets-for-api-docs/assets/widgets/falcon.jpg",
      "https://flutter.github.io/assets-for-api-docs/assets/widgets/falcon.jpg"
    ]),
    Item("7", "Dress", "lorem ipsum lorem ipsum", "12", "12", "Joseph", 0, [
      "https://flutter.github.io/assets-for-api-docs/assets/widgets/falcon.jpg",
      "https://flutter.github.io/assets-for-api-docs/assets/widgets/falcon.jpg"
    ]),
  ];

  List<String> categories = ["Cloths","Electronics","Furniture"];


  Widget categoriesBuilder(BuildContext context,int index){
    return CategoryItem(name: categories[index]);
  }

  Widget listingBuilder(BuildContext context,int index){
    return HaakItemCell(item: listings[index]);
  }


  @override
  Widget build(BuildContext context) {

    final availableHeight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 60,
              child: CupertinoSearchTextField(
                placeholder: "eg. Wood shelves, dress, Xbox… ",
              ),
            ),
            //Categories list
            Container(
              margin: const EdgeInsets.fromLTRB(5, 10, 0, 10),
              height: 50,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: categoriesBuilder,
                  separatorBuilder: (BuildContext context, int ind)=>const SizedBox(width: 20,),
                  itemCount: categories.length
              ),
            ),
            //Items list
            Container(
              padding: EdgeInsets.all(5),
              height: availableHeight - 130,
              child: GridView.builder(
                itemCount: listings.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 10.0
                  ),
                  itemBuilder: listingBuilder),
            )
          ],
        ),
      ),
    );
  }
}
