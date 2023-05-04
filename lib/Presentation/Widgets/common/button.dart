import 'package:flutter/material.dart';

import '../../../App/colors.dart';

class AppRaiseButton extends StatelessWidget {
  VoidCallback? function;
  String label;
  double? height;
  double? width;
  Color? color;
  bool isRound;

  AppRaiseButton(
      {this.function,
      required this.label,
      this.height,
      this.width,
      this.isRound = true,
      this.color});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        onPressed: function,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Appcolors().green,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(isRound ? 25.0 : 4)),
        ),
      ),
    );
  }
}

class CheckoutButton extends StatelessWidget {
  VoidCallback? function;
  String label;
  double? height;
  double? width;
  Color? color;
  String total;

  CheckoutButton(
      {this.function,
      required this.label,
      this.height,
      this.width,
      this.color,
      required this.total});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: ElevatedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xff489E67),
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                child: Text(
                  "\$" + total,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          onPressed: function,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 32),
            backgroundColor: color ?? Appcolors().green,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0)),
          )),
    );
  }
}
