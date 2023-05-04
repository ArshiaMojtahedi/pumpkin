import 'dart:typed_data';

import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../App/colors.dart';
import '../../product/productDetailScreen.dart';

class ItemBox extends StatelessWidget {
  int id;
  String title;
  String description;
  int? amount;
  double price;
  Uint8List image;
  bool isHorizentalItem;
  ItemBox(
      {required this.id,
      required this.title,
      required this.description,
      this.amount = 0,
      this.isHorizentalItem = false,
      required this.price,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(ProductDetailScreen(), arguments: id),
      child: Stack(
        children: [
          Container(
            height: 249,
            width: isHorizentalItem ? 173 : double.infinity,
            padding: EdgeInsets.only(
              top: 24,
              left: 15,
              right: 15,
              bottom: 16,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffE2E2E2)),
              borderRadius: BorderRadius.all(Radius.circular(18)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Center(
                  child: Image.memory(
                    image,
                    width: 100,
                    height: 80,
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  description,
                  style: TextStyle(fontSize: 12, color: Appcolors().textColor2),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$" + price.toString(),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 45,
                      width: 45,
                      child: ElevatedButton(
                        child: Image.asset("assets/images/increase_icon.png",
                            color: Colors.white),
                        onPressed: () {
                          //todo
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Appcolors().green,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(17.0)),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              height: 25,
              width: 25,
              child: badge.Badge(
                badgeContent: Center(
                  child: Text(
                    amount.toString(),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
                badgeStyle: badge.BadgeStyle(
                  badgeColor: Appcolors().darkOrange,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}