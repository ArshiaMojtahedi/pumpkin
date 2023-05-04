import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';

import '../../../App/colors.dart';

class TwoButtonAlertDialog extends StatelessWidget {
  String text;
  VoidCallback? yesFunction;
  VoidCallback? noFunction;

  TwoButtonAlertDialog({required this.text, this.noFunction, this.yesFunction});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.only(bottom: 16, left: 32, right: 32),
            child: Material(
              color: Colors.white,
              child: Container(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset('assets/images/lottie/alert.json',
                      fit: BoxFit.fill, repeat: true),
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Appcolors().textColor3,
                        fontWeight: FontWeight.w700,
                        fontSize: 14),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: noFunction,
                        child: Text(
                          "Keep",
                          style: TextStyle(
                            color: Appcolors().green,
                            fontSize: 16,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: EdgeInsets.symmetric(horizontal: 32),
                          backgroundColor: Appcolors().red,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(25.0)),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          child: Text(
                            "Remove",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            padding: EdgeInsets.symmetric(horizontal: 32),
                            backgroundColor: Appcolors().red,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(25.0)),
                          ),
                          onPressed: yesFunction,
                        ),
                      ),
                    ],
                  )
                ],
              )),
            ),
          ),
        ],
      ),
    );
  }
}
