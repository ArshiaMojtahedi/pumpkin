import 'package:flutter/material.dart';

import '../../../App/colors.dart';
import '../../Widgets/common/appbar.dart';
import '../../Widgets/common/appbarLayout.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBarLayout(
              child: MainAppbar(
            title: "Acccount",
          )),
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                          child: Image.asset(
                            "assets/images/profile_photo.jpg",
                            height: 64,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Arshia Mojtahedi",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "test@test.com",
                              style: TextStyle(
                                  fontSize: 16, color: Appcolors().textColor2),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        AccountMenuItem(
                          icon: "assets/images/mydetails_icon.png",
                          title: "My Details",
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        AccountMenuItem(
                          icon: "assets/images/addresses_icon.png",
                          title: "My Details",
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        AccountMenuItem(
                          icon: "assets/images/payment_icon.png",
                          title: "Payment Methods",
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        AccountMenuItem(
                          icon: "assets/images/promo_icon.png",
                          title: "Promo Codes",
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        AccountMenuItem(
                          icon: "assets/images/notification_icon.png",
                          title: "Notifications",
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        AccountMenuItem(
                          icon: "assets/images/help_icon.png",
                          title: "Help",
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        AccountMenuItem(
                          icon: "assets/images/about_icon.png",
                          title: "About",
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        Container(
                          height: 67,
                          width: double.infinity,
                          child: ElevatedButton(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    "assets/images/logout_icon.png",
                                    height: 18,
                                  ),
                                  Text(
                                    "Log Out",
                                    style: TextStyle(
                                      color: Appcolors().green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  )
                                ],
                              ),
                            ),
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffF2F3F2),
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(25.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AccountMenuItem extends StatelessWidget {
  String title;
  String icon;
  AccountMenuItem({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    icon,
                    width: 20,
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Image.asset(
                "assets/images/right_arrow_icon.png",
                height: 14,
                width: 20,
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
