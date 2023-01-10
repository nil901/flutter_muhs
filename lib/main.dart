import 'package:flutter/material.dart';
import 'package:flutter_muhs/demo/marathi_Froms.dart';
import 'package:flutter_muhs/pages/DrawerForms/AppliedForm.dart';
import 'package:flutter_muhs/pages/LoginPage.dart';
import 'package:flutter_muhs/pages/MuhsHomePage.dart';
import 'package:flutter_muhs/pages/SplashScreen.dart';
import 'package:flutter_muhs/pages/StudentRegistration.dart';
import 'package:get/get.dart';
import 'compontes/ScholarshipForm/DhanvantariForm.dart';
import 'compontes/ScholarshipForm/EarnWhilelearn.dart';
import 'compontes/ScholarshipForm/SanjivaniVidhyarthiSurakshaYojna.dart';
import 'compontes/ScholarshipForm/SvitribaiPhuleGirlsScholarship.dart';
import 'demo/MarathiTable.dart';
import 'demo/Registration.dart';
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
        "/": (context) => AppliedForms(),
      },
    );
  }
}
