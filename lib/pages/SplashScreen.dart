import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_muhs/Services/SharedPreferences.dart';
import 'package:flutter_muhs/pages/LoginPage.dart';
import 'package:flutter_muhs/pages/MuhsHomePage.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PrefService _prefService = PrefService();

  @override
  void initState() {
    _prefService.readCache("passworld").then(((value) {
      if (value != null) {
        return Timer(
            Duration(seconds: 1),
            () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                ));
      }else { 
        return  Timer(
            Duration(seconds: 1),
            () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MuhsHomePage()),
                ));
      }
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            "assets/images/SplashScreen.jpg",
            fit: BoxFit.cover,
          )),
    );
  }
}
