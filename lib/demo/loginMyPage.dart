// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_muhs/pages/MuhsHomePage.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   bool _isLoading = false;

//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
//         .copyWith(statusBarColor: Colors.transparent));
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//               colors: [Colors.blue, Colors.teal],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter),
//         ),
//         child: _isLoading
//             ? Center(child: CircularProgressIndicator())
//             : ListView(
//                 children: <Widget>[
//                   headerSection(),
//                   textSection(),
//                   buttonSection(),
//                 ],
//               ),
//       ),
//     );
//   }

//   signIn(String email, pass) async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     Map<String, dynamic> data = {
//       "STUDENT_ID": "",
//       "PRN_NUMBER": email,
//       "PASSWORD": pass
//     };
//     // var jsonResponse = null;
//     var response = await http.post(
//         Uri.parse("https://muhsappapi.greemgoldfpc.com/api/Login"),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode(data));
//     // print(response.body);
//     var jsonResponse = json.decode(response.body);

//     if (jsonResponse['ResponseCode'] == "0") {
//       var listresponse = jsonResponse["DATA"];
//       //listresponse![0]['FIRST_NAME'];
//       // sharedPreferences.setString("Firstname", listresponse![0]['STUDENT_ID']);
//       // sharedPreferences.getString("Firstname");

//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (context) => MuhsHomePage())); 
//           ScaffoldMessenger.of(context)
//               .showSnackBar(SnackBar(content: Text("${jsonResponse["ResponseMessage"]}")));


//       setState(() {
//         _isLoading = false;
//       });
//     } else if (jsonResponse['ResponseCode'] == "1") { 
//          setState(() {
//         _isLoading = false;
//       }); 

//  ScaffoldMessenger.of(context)
//               .showSnackBar(SnackBar(content: Text("${jsonResponse["ResponseMessage"]}")));
//    //int(response.body);
//     }
//   }

//   Container buttonSection() {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       height: 40.0,
//       padding: EdgeInsets.symmetric(horizontal: 15.0),
//       margin: EdgeInsets.only(top: 15.0),
//       child: Container(
//         child: TextButton(
//           onPressed: emailController.text == "" || passwordController.text == ""
//               ? null
//               : () {
//                   setState(() {
//                     _isLoading = false;
//                   });
//                   signIn(emailController.text, passwordController.text);
//                 },
//           child: Text("Sign In", style: TextStyle(color: Colors.white70)),
//         ),
//       ),
//     );
//   }

//   final TextEditingController emailController = new TextEditingController();
//   final TextEditingController passwordController = new TextEditingController();

//   Container textSection() {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
//       child: Column(
//         children: <Widget>[
//           TextFormField(
//             controller: emailController,
//             cursorColor: Colors.white,
//             style: TextStyle(color: Colors.white70),
//             decoration: InputDecoration(
//               icon: Icon(Icons.email, color: Colors.white70),
//               hintText: "Email",
//               border: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.white70)),
//               hintStyle: TextStyle(color: Colors.white70),
//             ),
//           ),
//           SizedBox(height: 30.0),
//           TextFormField(
//             controller: passwordController,
//             cursorColor: Colors.white,
//             obscureText: true,
//             style: TextStyle(color: Colors.white70),
//             decoration: InputDecoration(
//               icon: Icon(Icons.lock, color: Colors.white70),
//               hintText: "Password",
//               border: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.white70)),
//               hintStyle: TextStyle(color: Colors.white70),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Container headerSection() {
//     return Container(
//       margin: EdgeInsets.only(top: 50.0),
//       padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
//       child: Text("Code Login",
//           style: TextStyle(
//               color: Colors.white70,
//               fontSize: 40.0,
//               fontWeight: FontWeight.bold)),
//     );
//   }
// }
