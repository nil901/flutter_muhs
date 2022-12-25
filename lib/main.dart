import 'package:flutter/material.dart';
import 'package:flutter_muhs/pages/LoginPage.dart';
import 'package:flutter_muhs/pages/MuhsHomePage.dart';
import 'package:flutter_muhs/pages/SplashScreen.dart';
import 'package:flutter_muhs/pages/StudentRegistration.dart';
import 'package:get/get.dart';
import 'demo/demofilelist.dart';
import 'demo/loginMyPage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MUHS app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/": (context) => SplashScreen(),
      },
    );
  }
}
