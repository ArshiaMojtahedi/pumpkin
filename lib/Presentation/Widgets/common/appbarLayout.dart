import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarLayout extends StatelessWidget with PreferredSizeWidget {
  final Widget child;
  final double height =
      (GetPlatform.isAndroid) ? kToolbarHeight + 16 : kToolbarHeight;

  AppBarLayout({required this.child});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          color: Colors.transparent,
          alignment: Alignment.center,
          child: child,
        ),
      ],
    );
  }
}
