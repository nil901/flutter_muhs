import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_muhs/Model/LoginModel.dart';
import 'package:flutter_muhs/demo/validationfrom.dart';
import 'package:http/http.dart' as http;

class DemoLogin extends StatefulWidget {
  const DemoLogin({super.key});

  @override
  State<DemoLogin> createState() => _DemoLoginState();
}

class _DemoLoginState extends State<DemoLogin> {
  List<LoginModel>? getloginmodel;

  TextEditingController emailController = TextEditingController();
  TextEditingController passworldController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(hintText: "email"),
          ),
          SizedBox(height: 15),
          TextFormField(
            controller: passworldController,
            decoration: InputDecoration(hintText: "passworld"),
          ),
          GestureDetector(
            onTap: (() {
              
            }),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Center(child: Text("login")),
            ),
          )
        ],
      ),
    );
  }
}
