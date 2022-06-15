import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haak/Models/Item.dart';
import 'package:haak/app_constants/colors.dart';
import 'package:haak/custom_widgets/HaakButton.dart';
import 'package:haak/custom_widgets/cells/HaakItemCell.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Item> newListings = [
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
  ];


  Widget listViewBuilder(BuildContext context, int index) {
    return HaakItemCell(
      item: newListings[index],
    );

  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: size.width,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: const TextSpan(
                        text: "Welcome, ",
                        style:
                            TextStyle(color: MyColors.darkGray, fontSize: 18),
                        children: [
                      TextSpan(
                        text: "mohammed",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ])),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 200,
                  width: size.width - 40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "New Listings",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: MyColors.darkGray),
                      ),
                      Expanded(
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                              itemBuilder: listViewBuilder,
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  width: 10,
                                );
                              },
                              itemCount: newListings.length
                          )
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 200,
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Nearby",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: MyColors.darkGray),
                      ),
                      Expanded(
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: listViewBuilder,
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  width: 10,
                                );
                              },
                              itemCount: newListings.length
                          )
                      )
                    ],
                  ),
                ),
                SizedBox(height: 60,),
                Center(child: HaakButton(size: Size(size.width - 100,60), onPressed: (){}, text: "Post new item",color: MyColors.accent,textColor: MyColors.primary,))
              ],
            ),
          ),
        ),
    );
  }
}
