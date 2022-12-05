import 'package:flutter/material.dart';
import 'package:flutter_muhs/pages/ForgetPasswordPage.dart';
import 'package:flutter_muhs/pages/MuhsHomePage.dart';
import 'package:flutter_muhs/pages/SocialNetwork.dart';
import 'package:flutter_muhs/pages/StudentRegistration.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 150,
          ),
          SizedBox( 
            height: 150, 
            width: 140, 
            child:  Image.asset("assets/images/logo.png", height: 20,), 
          ),
           SizedBox(
            height: 25,
          ),
          Center(
            child: Text("STUDENT LOGIN",
                style: TextStyle(
                    color: HexColor('#074372'),
                    fontSize: 22,
                    fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Text(
                  "PRN NUMBER *",
                  style: TextStyle(
                      color: HexColor('#074372'),
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              height: 48,
              //width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  border: Border.all(color: HexColor('#074372'), width: 1)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: 'Enter PRN Number',
                    hintStyle: TextStyle(color: Colors.black26, fontSize: 16),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Text(
                  "PASSWORD*",
                  style: TextStyle(
                      color: HexColor('#074372'),
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              height: 48,
              //width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  border: Border.all(color: HexColor('#074372'), width: 1)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: 'Enter Password',
                    hintStyle: TextStyle(color: Colors.black26, fontSize: 16),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: HexColor('#074372'),
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: (() {
                  Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const StudentRegistratin()),
        );
                }),
                child: Text("Don't Have Account Want to Register YouerSelf",
                    style: TextStyle(
                        color: HexColor('#074372'),
                        fontSize: 14,
                        fontWeight: FontWeight.bold))),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: (() {
                   Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ForgetPassworld()),
        );
                }),
              child: Text("FORGET PASSWORLD",
                  style: TextStyle(
                      color: HexColor('#074372'),
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell( 
              onTap:(() {
               Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MuhsHomePage()),
        );
              }) ,
              child: Text("SKIP NOW",
                  style: TextStyle(
                      color: HexColor('#074372'),
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ]),
      ),
    );
  }
}
