import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:get/get.dart';
import 'package:pumpkin/Presentation/categories/ui/caregories.dart';

import '../App/colors.dart';
import 'account/ui/accountScreen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController _tabController;

  int _tab = 2;

  @override
  void initState() {
    super.initState();
    _tabController = new PageController(initialPage: 2);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _tabController,
        onPageChanged: onTabChanged,
        children: <Widget>[
          Container(),
          CategoriesScreen(),
          Container(),
          Container(),
          //  OrdersScreen(),
          //  CategoriesScreen(),
          //  HomeScreen(),
          //  FavoritesScreen(),
          AccountScreen(),
        ],
      ),
      bottomNavigationBar: SnakeNavigationBar.color(
        behaviour: SnakeBarBehaviour.pinned,
        backgroundColor: Colors.white,
        snakeShape: SnakeShape.indicator,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18), topRight: Radius.circular(18)),
        ),
        snakeViewColor: Color(0xFF53B175),
        selectedItemColor: Color(0xFF53B175),
        unselectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        showUnselectedLabels: true,
        showSelectedLabels: true,
        currentIndex: _tab,
        onTap: onTap,
        elevation: 1100,
        shadowColor: Colors.black,
        items: [
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4, top: 4),
                child: _tab == 0
                    ? Image.asset(
                        "assets/images/tab_orders_off.png",
                        color: Appcolors().green,
                        height: 24,
                      )
                    : Image.asset(
                        "assets/images/tab_orders_off.png",
                        height: 24,
                      ),
              ),
              label: 'Orders'),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4, top: 4),
                child: _tab == 1
                    ? Image.asset(
                        "assets/images/tab_explore_off.png",
                        color: Appcolors().green,
                        height: 24,
                      )
                    : Image.asset(
                        "assets/images/tab_explore_off.png",
                        height: 24,
                      ),
              ),
              label: 'Explore'),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4, top: 4),
                child: _tab == 2
                    ? Image.asset(
                        "assets/images/tab_shop_off.png",
                        color: Appcolors().green,
                        height: 24,
                      )
                    : Image.asset(
                        "assets/images/tab_shop_off.png",
                        height: 24,
                      ),
              ),
              label: 'Shop'),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4, top: 4),
                child: _tab == 3
                    ? Image.asset(
                        "assets/images/tab_favorites_off.png",
                        color: Appcolors().green,
                        height: 24,
                      )
                    : Image.asset(
                        "assets/images/tab_favorites_off.png",
                        height: 24,
                      ),
              ),
              label: 'Favorites'),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4, top: 4),
                child: _tab == 4
                    ? Image.asset(
                        "assets/images/tab_account_off.png",
                        color: Appcolors().green,
                        height: 24,
                      )
                    : Image.asset(
                        "assets/images/tab_account_off.png",
                        height: 24,
                      ),
              ),
              label: 'Account'),
        ],
      ),
    );
  }

  void onTap(int tab) {
    _tabController.jumpToPage(tab);
  }

  void onTabChanged(int tab) {
    setState(() {
      this._tab = tab;
    });
  }
}
