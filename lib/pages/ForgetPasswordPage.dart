import 'package:flutter/material.dart';
import 'package:flutter_muhs/pages/LoginPage.dart';
import 'package:hexcolor/hexcolor.dart';

class ForgetPassworld extends StatelessWidget {
  const ForgetPassworld({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: HexColor('#074372'),
        leading: Icon(Icons.arrow_back),
        centerTitle: true,
        title: Text(
          "Forget Passworld",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          forgetltext(
            text: "PRN Number *",
          ),
          SizedBox(
            height: 5,
          ),
          forgetTextFild(hinttext: "Enter PRN Number",),
            SizedBox(height: 16,),
           forgetltext(
            text: "New Passworld *",
          ),
          SizedBox(
            height: 5,
          ),
          forgetTextFild(hinttext: "Enter New Passworld",),
          SizedBox(height: 16,),
           forgetltext(
            text: "Enter Confirm Passworld *",
          ),
          SizedBox(
            height: 5,
          ),
          forgetTextFild(hinttext: "Enter PRN Number",),
           SizedBox(
          height: 30,
        ),
        InkWell( 
  //         onTap: () {
  //             Navigator.push(
  //   context,
  //   MaterialPageRoute(builder: (context) => const LoginPage()),
  // );
         // },
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: HexColor('#074372'),
                      borderRadius: BorderRadius.circular(7)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    "Confirm",
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
        ],
      ),
    );
  }
}

class forgetTextFild extends StatelessWidget {
  final String hinttext;
  const forgetTextFild({
    Key? key, required this.hinttext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 40,
        //width: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            border: Border.all(color: HexColor('#074372'), width: 1)),
        child: Padding(
          padding: const EdgeInsets.only(top: 12, left: 12),
          child: TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: hinttext,
              hintStyle: TextStyle(color: Colors.black26, fontSize: 16),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}

class forgetltext extends StatelessWidget {
  final String text;
  const forgetltext({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: Row(
        children: [
          Text(
            text,
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
