import 'package:flutter/material.dart';
import 'package:flutter_muhs/compontes/examinationurl/PracticalExamTimeTable.dart';
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
        body: Padding(
          padding: const EdgeInsets.all(2.0),
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            children: [
              InkWell( 
                  onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ThoreyExamTimeTable()),
                      );
                    },
                child: Container(
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
                          "Theory Exam Time Table",
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
              InkWell( 
                  onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ThoreyExamCenterList()),
                      );
                    },
                child: Container(
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
                          "Theory Exam Centre List \n            (courseWise)",
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
              InkWell( 
                 onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HallTcket()),
                      );
                    },
                child: Container(
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
                          "Hall ticket",
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
              InkWell(
                   onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Result()),
                      );
                    },
                child: InkWell( 
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Result()),
                      );
                    },
                  child: Container(
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
                            "Results",
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
                  onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PraticalExamTimeTable()),
                      );
                    },
                
                child: Container(
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
                          "Practical Exam TimeTable",
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
            ],
          ),
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
