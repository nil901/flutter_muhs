import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class StudentActivityPdf extends StatelessWidget {
  const StudentActivityPdf({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#074372'),
        leading: Icon(Icons.arrow_back),
        centerTitle: true,
        title: Text(
          "Student Sub Activities",
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
                    "CRCULAR",
                    style: TextStyle(color: HexColor("#000e27"), fontSize: 15),
                  ),
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
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
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
