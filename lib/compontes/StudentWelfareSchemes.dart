import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class StudentWelfareSchemes extends StatelessWidget {
  const StudentWelfareSchemes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor('#074372'),
          leading: Icon(
            Icons.arrow_back,
          ),
          centerTitle: true,
          title: Text(
            "Student Welfare",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 85,
              color: HexColor("#a7d5f9"),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset("assets/images/pdf.png"),
                    ),
                    Text(
                      "Savitribai Phule Girls\nScholarship",
                      style:
                          TextStyle(color: HexColor("#000e27"), fontSize: 15),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 23,
                          width: 80,
                          decoration: BoxDecoration(
                              color: HexColor("#dbdbdb"),
                              borderRadius: BorderRadius.circular(17)),
                          child: Center(
                              child: Text(
                            "View",
                            style: TextStyle(color: Colors.black, fontSize: 13),
                          )),
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Container(
                          height: 28,
                          width: 90,
                          decoration: BoxDecoration(
                              color: HexColor('#074372'),
                              borderRadius: BorderRadius.circular(17)),
                          child: Center(
                              child: Text(
                            "Apply",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 3,),
            Container(
              height: 85,
              color: HexColor("#a7d5f9"),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: Image.asset("assets/images/pdf.png"),
                    ),
                    Text(
                      "Savitribai Phule Girls\nScholarship",
                      style:
                          TextStyle(color: HexColor("#000e27"), fontSize: 15),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 28,
                          width: 90,
                          decoration: BoxDecoration(
                              color: HexColor("#dbdbdb"),
                              borderRadius: BorderRadius.circular(17)),
                          child: Center(
                              child: Text(
                            "View",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          )),
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Container(
                          height: 28,
                          width: 90,
                          decoration: BoxDecoration(
                              color: HexColor('#074372'),
                              borderRadius: BorderRadius.circular(17)),
                          child: Center(
                              child: Text(
                            "Apply",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
