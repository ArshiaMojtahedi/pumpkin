import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pumpkin/Presentation/login/ui/login.dart';
import 'package:pumpkin/Presentation/mainScreen.dart';
import 'package:pumpkin/Presentation/test/ui/test.dart';

import 'App/dependency_injection.dart';
import 'App/colors.dart';
import 'Data/local/hive_client.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initModule();
  // await initHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pumpkin',
      theme: ThemeData(
        fontFamily: 'Gilroy',
        primarySwatch: Colors.blue,
        primaryColor: Appcolors().green,
        accentColor: Appcolors().darkOrange,
        scaffoldBackgroundColor: Color(0xffFFFFFF),
        disabledColor: Color(0xffC4C4C4),
        canvasColor: Colors.transparent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
          headline2: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          headline3: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          headline4: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          headline5: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          headline6: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
          overline: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          subtitle1: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          bodyText1: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          bodyText2: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          subtitle2: TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
        ).apply(fontFamily: 'Montserrat'),
      ),
      home: MainScreen(),
    );
  }
}
