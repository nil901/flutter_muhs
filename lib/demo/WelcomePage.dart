import 'package:flutter/material.dart';
import 'package:flutter_muhs/pages/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  String? token = "";
  String? prnnumber = "";
  String? email = "";
  String? collageid = "";
  @override
  void initState() {
    getCard();
    // TODO: implement initState
    super.initState();
  }

  void getCard() async {
    SharedPreferences shef = await SharedPreferences.getInstance();
    setState(() {
      token = shef.getString("Login");
      prnnumber = shef.getString("PRN");
      email = shef.getString("email");
   collageid=   shef.getString("collageId");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                Text("Welcome Page"),
                SizedBox(
                  height: 15,
                ),
                Text("Your id is :${token}"),
                SizedBox(
                  height: 15,
                ),
                Text("Your id prn :${prnnumber}"),
                Text("Your id prn :${email}"),
                  Text("Your id prn :${collageid}"),
                ElevatedButton(
                    onPressed: () async {
                      SharedPreferences prf =
                          await SharedPreferences.getInstance();
                      await prf.clear();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => LoginPage()),
                          (route) => false);
                    },
                    child: Text("Logout"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
