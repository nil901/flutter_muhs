import 'package:flutter/material.dart';
import 'package:flutter_muhs/compontes/ComplaintAndSuggestions.dart';
import 'package:flutter_muhs/compontes/ScStObcStudentComplaint.dart';
import 'package:hexcolor/hexcolor.dart';

class GrievanceRedressal extends StatelessWidget {
  const GrievanceRedressal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor('#074372'),
          title: Text(
            "Grevance Redressal",
            style: TextStyle(fontSize: 22),
          ),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: InkWell(
                      onTap: (() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ComplaintAndSuggestions()),
                        );
                      }),
                      child: Expanded(
                        child: Container(
                          height: 130,
                          width: 170,
                          color: HexColor('#074372'),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  "assets/images/c_university.png",
                                  height: 60,
                                ),
                              ),
                              Text(
                                "Complaint and\n Suggestions",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ScStStudentComplaint()),
                      );
                    }),
                    child: Expanded(
                      child: Container(
                        height: 130,
                        width: 170,
                        color: HexColor('#074372'),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/images/c_university.png",
                                height: 60,
                              ),
                            ),
                            Text(
                              "SC/ST/OBC Student\n         Complaint Box",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
