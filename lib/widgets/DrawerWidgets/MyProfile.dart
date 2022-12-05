import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_muhs/pages/LoginPage.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../pages/Drawer.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawar(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: HexColor('#074372'),
        //leading: Icon(Icons.arrow_back),
        centerTitle: true,
        title: Text(
          "MUHS",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Image.asset(
              "assets/images/notification.png",
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Stack(
              children: [
                Container(
                  height: 160,
                  width: 180,
                  decoration: BoxDecoration(
                      //color: Colors.black,
                      //borderRadius: BorderRadius.circular(100)
                      ),
                ),
                Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: HexColor('#074372'), width: 1),
                      borderRadius: BorderRadius.circular(100)),
                ),
                Positioned(
                  top: 90,
                  left: 90,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: HexColor('#074372'),
                        borderRadius: BorderRadius.circular(6)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/images/camera.png",
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          StudentRegisterLabel( 
            textlabel: "PRN NO*",
          ),
          SizedBox(
            height: 5,
          ),
          studentRegisterfroms(
            hintlabel: "",
          ),
          SizedBox(
            height: 20,
          ),
           StudentRegisterLabel( 
            textlabel: "First Name *",
          ),
          SizedBox(
            height: 5,
          ),
          studentRegisterfroms(
            hintlabel: "",
          ),
           SizedBox(
            height: 20,
          ),
           StudentRegisterLabel( 
            textlabel: "Middle Name *",
          ),
          SizedBox(
            height: 5,
          ),
          studentRegisterfroms(
            hintlabel: "",
          ),
           SizedBox(
            height: 20,
          ),
           StudentRegisterLabel( 
            textlabel: "Last Name *",
          ),
          SizedBox(
            height: 5,
          ),
          studentRegisterfroms(
            hintlabel: "",
          ),
           SizedBox(
            height: 20,
          ),
           StudentRegisterLabel( 
            textlabel: "Date of Birth *",
          ),
          SizedBox(
            height: 5,
          ),
          studentRegisterfroms(
            hintlabel: "",
          ),
           SizedBox(
            height: 20,
          ),
           StudentRegisterLabel( 
            textlabel: "Mobile No *",
          ),
          SizedBox(
            height: 5,
          ),
          studentRegisterfroms(
            hintlabel: "",
          ),
           SizedBox(
            height: 20,
          ),
         
           StudentRegisterLabel( 
            textlabel: "Email-Id *",
          ),
          SizedBox(
            height: 5,
          ),
          studentRegisterfroms(
            hintlabel: "",
          ),
           StudentRegisterLabel( 
            textlabel: "Collage Name *",
          ),
          SizedBox(
            height: 5,
          ),
          studentRegisterfroms(
            hintlabel: "",
          ),
           SizedBox(
            height: 20,
          ),
           StudentRegisterLabel( 
            textlabel: "Faculty *",
          ),
          SizedBox(
            height: 5,
          ),
          studentRegisterfroms(
            hintlabel: "",
          ), 
           SizedBox(
            height: 20,
          ),
           StudentRegisterLabel( 
            textlabel: "Year *",
          ),
          SizedBox(
            height: 5,
          ),
          studentRegisterfroms(
            hintlabel: "",
          ),
           SizedBox(
            height: 20,
          ),
           StudentRegisterLabel( 
            textlabel: "Enter Passworld *",
          ),
          SizedBox(
            height: 5,
          ),
          studentRegisterfroms(
            hintlabel: "",
          ), 
           SizedBox(
            height: 20,
          ),
           StudentRegisterLabel( 
            textlabel: "Confrm Passworld *",
          ),
          SizedBox(
            height: 5,
          ),
          studentRegisterfroms(
            hintlabel: "",
          ), 
 SizedBox(height: 30,),
         InkWell( 
          onTap: (() {
             Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const LoginPage()),
  );
          }),
           child: Stack(
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
                    "Register",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
                 ),
         ),
        SizedBox(height: 50,)
        ], 
        
        ),
      ),
    );
  }
}

class studentRegisterfroms extends StatelessWidget {
  final String hintlabel;
  const studentRegisterfroms({
    Key? key, required this.hintlabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        height: 45,
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
              hintText: hintlabel,
              hintStyle: TextStyle(color: Colors.black26, fontSize: 16),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}

class StudentRegisterLabel extends StatelessWidget {
  final String textlabel;
  const StudentRegisterLabel({
    Key? key,
    required this.textlabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Text(
            textlabel,
            style: TextStyle(
                color: HexColor('#074372'),
                fontSize: 13,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
