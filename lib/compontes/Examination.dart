import 'package:flutter/material.dart';
import 'package:flutter_muhs/compontes/examinationurl/ThoreyExamTimeTable.dart';
import 'package:hexcolor/hexcolor.dart';
import 'examinationurl/HallTicket.dart';
import 'examinationurl/Result.dart';
import 'examinationurl/ThoreyExamCenterList.dart';

class Examination extends StatelessWidget {
  const Examination({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor('#074372'),
          title: Text(
            "Examination",
            style: TextStyle(fontSize: 22),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 4,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ThoreyExamTimeTable()),
                      );
                    },
                    child: ExaminationCard(
                      text: "Theory Exam Time Table",
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ThoreyExamCenterList()),
                      );
                    },
                    child: ExaminationCard(
                      text:
                          "Theory Exam Centre List \n            (courseWise)",
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HallTcket()),
                    );
                  },
                  child: ExaminationCard(
                    text: "Theory Exam Time Table",
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Result()),
                    );
                  },
                  child: ExaminationCard(
                    text: "Theory Exam Centre List \n            (courseWise)",
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 3,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 1),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Result()),
                      );
                    },
                    child: ExaminationCard(
                      text: "Theory Exam Time Table",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class ExaminationCard extends StatelessWidget {
  final String text;
  const ExaminationCard({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 150,
          width: 160,
          color: HexColor('#074372'),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                SizedBox(
                  height: 12,
                ),
                Image.asset(
                  "assets/images/c_university.png",
                  height: 50,
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
} 



