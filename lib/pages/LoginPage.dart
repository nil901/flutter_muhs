import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_muhs/Services/SharedPreferences.dart';
import 'package:flutter_muhs/demo/Registration.dart';
import 'package:flutter_muhs/demo/WelcomePage.dart';
import 'package:flutter_muhs/demo/demofilelist.dart';
import 'package:flutter_muhs/pages/ForgetPasswordPage.dart';
import 'package:flutter_muhs/pages/MuhsHomePage.dart';
import 'package:flutter_muhs/pages/StudentRegistration.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

final prnController = TextEditingController();
final passworldController = TextEditingController();

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

bool _isLoading = false;
final _fromkey = GlobalKey<FormState>();

class _LoginPageState extends State<LoginPage> {
  signIn(String prn, pass) async {
    // showDialog(
    //     context: context,
    //     builder: (context) {
    //       return Center(child: CircularProgressIndicator());
    //  });
    Map<String, dynamic> data = {
      "STUDENT_ID": "",
      "PRN_NUMBER": prn,
      "PASSWORD": pass
    };
    // var jsonResponse = null;
    var response = await http.post(
        Uri.parse("https://muhsappapi.greemgoldfpc.com/api/Login"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data));
    // print(response.body);
    var jsonResponse = json.decode(response.body);

    if (jsonResponse['ResponseCode'] == "0") {
      print(response.body);
      var listresponse = jsonResponse["DATA"];
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Id :${listresponse![0]['STUDENT_ID']}")));

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("PRNNumber :${listresponse![0]['PRN_NUMBER']}")));

      //  print("name is ${listresponse["ResponseCode"]["STUDENT_ID"].toString()}");

      //listresponse![0]['STUDENT_ID'];
      // SharedPreferences sharedPreferences =
      //     await SharedPreferences.getInstance();
      // sharedPreferences.setInt("Firstname", listresponse![0]['STUDENT_ID']);
      // sharedPreferences.getInt("Firstname");
      //  print("Login");

      // ignore: use_build_context_synchronously
      pageRoute(
          listresponse![0]['PRN_NUMBER'].toString(),
          listresponse![0]['STUDENT_ID'].toString(),
          listresponse![0]['EMAIL_ID'].toString(),
          listresponse![0]['COLLAGE_ID'].toString());

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("${jsonResponse["ResponseMessage"]}")));

      setState(() {
        _isLoading = true;
      });
    } else if (jsonResponse['ResponseCode'] == "1") {
      setState(() {
        _isLoading = false;
      });

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("${jsonResponse["ResponseMessage"]}")));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    checkLogin();
    super.initState();
  }

  void checkLogin() async {
    SharedPreferences prf = await SharedPreferences.getInstance();
    String? val = await prf.getString("Login");
    if (val!.isNotEmpty && val != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => WelcomePage()),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _fromkey,
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
            // ignore: prefer_const_constructors
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    border: Border.all(color: HexColor('#074372'), width: 1)),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: TextFormField(
                      controller: prnController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      cursorColor: Colors.black,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(13),
                      ],
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(2.0),
                        hintText: 'Enter PRN Number',
                        // ignore: prefer_const_constructors
                        hintStyle:
                            TextStyle(color: Colors.black26, fontSize: 16),
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value!.length < 13) {
                          return 'a minimum of 13 characters is required';
                        }
                        validator:
                        MultiValidator([
                          RequiredValidator(errorText: "Required *"),
                        ]);
                      }),
                ),
              ),
            ),
            // ignore: prefer_const_constructors
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
                child: TextFormField(
                  controller: passworldController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(2.0),
                    hintText: 'Enter Password',
                    hintStyle: TextStyle(color: Colors.black26, fontSize: 16),
                    border: InputBorder.none,
                  ),
                  validator: MultiValidator([
                    RequiredValidator(errorText: "Required *"),
                  ]),
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
                  child: InkWell(
                    onTap:

                        // prnController.text == "" || passworldController.text == ""
                        //     ? null
                        //     :
                        () {
                      if (_fromkey.currentState!.validate()) {
                        setState(() {
                          _isLoading = true;
                        });

                        signIn(
                          prnController.text,
                          passworldController.text,
                        );
                      } else {
                        print(("Not Submited"));
                      }
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: HexColor('#074372'),
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Center(
                    child: _isLoading
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 24,
                              ),
                              Text(
                                "Please Wait...",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              )
                            ],
                          )
                        : Text(
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
                  onTap: (() async {
                    if (_isLoading) return;
                    setState(() => true);
                    await Future.delayed(Duration(seconds: 5));
                    setState(() => false);

                    // apicallLogin();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Registration()),
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
                    MaterialPageRoute(
                        builder: (context) => const MuhsHomePage()),
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
      ),
    );
  }

  void pageRoute(String token, prf, String email ,String collageid) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("Login", token);
    pref.setString("PRN", prf);
    pref.setString("email", email);
     pref.setString("collageId", collageid);

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => WelcomePage()),
        (route) => false);
  }
}
