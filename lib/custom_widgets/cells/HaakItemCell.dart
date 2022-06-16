import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../Models/Item.dart';
import '../../app_constants/colors.dart';

class HaakItemCell extends StatelessWidget {
  HaakItemCell({Key? key,required this.item}) : super(key: key);

  Item item;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
      child: Container(
        // padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
            border: Border.all(color: MyColors.accentLight,width: 1)
        ),
        height: 180,
        width: 140,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: CachedNetworkImage(
                fit: BoxFit.fitHeight,
                placeholder: (context, url) => const Center(child: CircularProgressIndicator(),),
                imageUrl: item.images[0]
            ),),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Text(item.name,maxLines: 1,style: const TextStyle(fontWeight: FontWeight.w600,color: MyColors.darkGray,fontSize: 14),),
                  Text(item.price == 0 ? "free" : item.price.toString(),
                    style: const TextStyle(color: MyColors.darkGray,fontWeight: FontWeight.w400),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
