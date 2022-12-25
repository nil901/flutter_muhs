import 'package:flutter/material.dart';
import 'package:flutter_muhs/Services/SharedPreferences.dart';
import 'package:flutter_muhs/pages/ForgetPasswordPage.dart';
import 'package:flutter_muhs/pages/MuhsHomePage.dart';
import 'package:flutter_muhs/pages/StudentRegistration.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Services/LoginApiServices.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> { 
  
  final prnController = TextEditingController();
  final passworldController = TextEditingController();

  apicallLogin() {
    if (prnController.text.isNotEmpty && passworldController.text.isNotEmpty) {
      final service = apiservice();

      service.apicallLogin(
        <String, String>{
          "PRN_NUMBER": prnController.text,
          "PASSWORD": passworldController.text,
          "STUDENT_ID": ""
        },
      ).then((value) async {
        if (value?.DATA1 != null) {
          print("get data>>>>>" + value!.DATA1!);
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("${value!.DATA1!}")));
          //saveData(value!);
          // SharedPreference
          //s prf = await SharedPreferences.getInstance();
          // await prf.setString("login", "value");
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("${value!.DATA!}")));

          //  print(value!.DATA!);
        }
      });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("blanck value fount")));
    }
  }

  void saveData(String DATA1) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('apicallLogin', DATA1);
  }

  void readData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? savevalue = preferences.getString('apicallLogin');
    if (savevalue != null) {
      prnController.text = savevalue;
      passworldController.text = savevalue;
    }
  }

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
            child: Image.asset(
              "assets/images/logo.png",
              height: 20,
            ),
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
                  controller: prnController,
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
                  controller: passworldController,
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
                child: GestureDetector(
                  onTap: (() {
                    apicallLogin();
                  }),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: HexColor('#074372'),
                        borderRadius: BorderRadius.circular(5)),
                  ),
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
                  apicallLogin();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StudentRegistratin()),
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
                  MaterialPageRoute(
                      builder: (context) => const ForgetPassworld()),
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
              onTap: (() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MuhsHomePage()),
                );
              }),
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
