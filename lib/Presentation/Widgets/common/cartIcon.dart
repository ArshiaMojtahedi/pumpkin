import 'package:badges/badges.dart' as badge;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../App/colors.dart';

class CartIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return badge.Badge(
        showBadge: true,
        badgeAnimation: badge.BadgeAnimation.slide(),
        badgeContent: Text(
          '0',
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
        badgeStyle: badge.BadgeStyle(
          badgeColor: Appcolors().darkOrange,
          padding: EdgeInsets.only(top: 7, right: 6, left: 6, bottom: 6),
        ),
        position: badge.BadgePosition.custom(bottom: 10, start: 18),
        // position: badge.BadgePosition(),
        child: GestureDetector(
          onTap: () => Get.toNamed("/cart"),
          child: Image.asset(
            "assets/images/tab_cart_off.png",
            height: 25,
          ),
        ));
  }
}
