import 'package:flutter/material.dart';
import 'package:flutter_muhs/pages/LoginPage.dart';
import 'package:flutter_muhs/widgets/DrawerWidgets/MyAppliedFrom.dart';
import 'package:flutter_muhs/widgets/DrawerWidgets/MyProfile.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MUHS app', 
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
        primarySwatch: Colors.blue, 
        
      ), 
       routes: { 
        "/": (context) => LoginPage(),
       },
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    ); 
    
  }
}

