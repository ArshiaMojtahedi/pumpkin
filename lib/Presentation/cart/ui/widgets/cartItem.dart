import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../App/colors.dart';

class CartRowItem extends StatelessWidget {
  int id;
  String title;
  String description;
  int amount;
  double price;
  Uint8List image;
  CartRowItem(
      {required this.id,
      required this.title,
      required this.description,
      required this.amount,
      required this.price,
      required this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.toNamed("/productDetail", arguments: id),
                    child: Image.memory(
                      image,
                      height: 70,
                      width: 70,
                    ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 160,
                        child: Text(
                          title,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        description,
                        style: TextStyle(
                            fontSize: 12, color: Appcolors().textColor2),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 45,
                            width: 45,
                            child: ElevatedButton(
                                child: Image.asset(
                                  "assets/images/decrease_icon.png",
                                  color: Colors.white,
                                ),
                                onPressed: () => null,
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Appcolors().red,
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(17.0)))),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Container(
                            child: Text(
                              amount.toString(),
                              style: TextStyle(
                                  fontSize: 16, color: Appcolors().textColor2),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Container(
                            height: 45,
                            width: 45,
                            child: ElevatedButton(
                              child: Image.asset(
                                "assets/images/increase_icon.png",
                                color: Colors.white,
                              ),
                              onPressed: () => null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Appcolors().green,
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(17.0)),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  // SizedBox(
                  //   width: 32,
                  // ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    child: Image.asset(
                      "assets/images/close_icon.png",
                      height: 14,
                    ),
                    onTap: () => null,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text("\$" + (amount * price).toString(),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Divider(
            thickness: 1,
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
