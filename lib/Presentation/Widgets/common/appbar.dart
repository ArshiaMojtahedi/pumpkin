import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cartIcon.dart';

class SimpleAppBar extends StatelessWidget {
  String title;
  SimpleAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: (GetPlatform.isAndroid)
              ? const EdgeInsets.only(left: 24, right: 24, top: 16)
              : const EdgeInsets.only(left: 24, right: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 25,
                child: IconButton(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerLeft,
                    icon: Image.asset(
                      "assets/images/back_arrow_icon.png",
                      height: 20,
                    ),
                    onPressed: () => Get.back()),
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 21,
                ),
              ),
              CartIcon(),
            ],
          ),
        ),
        Divider(
          thickness: 1.5,
        ),
      ],
    );
  }
}

class MainAppbar extends StatelessWidget {
  String title;
  MainAppbar({required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: (GetPlatform.isAndroid)
          ? EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 16)
          : const EdgeInsets.only(left: 24, right: 24, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 25,
            height: 40,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 21,
            ),
          ),
          CartIcon(),
        ],
      ),
    );
  }
}

class HomeAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: (GetPlatform.isAndroid)
          ? EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 16)
          : const EdgeInsets.only(left: 24, right: 24, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 25,
            height: 40,
          ),
          Row(
            children: [
              Image.asset(
                "assets/images/logo.png",
                // height: 30,
                width: 40,
              ),
              // SizedBox(
              //   width: 8,
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 4.0),
              //   child: Text(
              //     "Havij",
              //     style: TextStyle(
              //       fontSize: 21,
              //       color: Colors.orange[900],
              //     ),
              //   ),
              // ),
            ],
          ),
          CartIcon(),
        ],
      ),
    );
  }
}

class CartAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(
        //   height: 8,
        // ),
        Padding(
          padding: (GetPlatform.isAndroid)
              ? const EdgeInsets.only(left: 24, right: 24, top: 16)
              : const EdgeInsets.only(left: 24, right: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 25,
                child: IconButton(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerLeft,
                    icon: Image.asset(
                      "assets/images/back_arrow_icon.png",
                      height: 20,
                    ),
                    onPressed: () => Get.back()),
              ),
              Text(
                "My Cart",
                style: TextStyle(fontSize: 21),
              ),
              SizedBox(
                width: 25,
              ),
            ],
          ),
        ),
        Divider(
          thickness: 1.5,
        ),
      ],
    );
  }
}

class ProductDetailAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: (GetPlatform.isAndroid)
          ? const EdgeInsets.only(left: 24, top: 16)
          : const EdgeInsets.only(
              left: 24,
            ),
      color: Colors.white,
      width: double.infinity,
      child: Container(
        alignment: Alignment.centerLeft,
        width: 25,
        child: IconButton(
            padding: EdgeInsets.zero,
            alignment: Alignment.centerLeft,
            icon: Image.asset(
              "assets/images/back_arrow_icon.png",
              height: 20,
            ),
            onPressed: () => Get.back()),
      ),
    );
  }
}
