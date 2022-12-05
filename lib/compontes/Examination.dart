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
        body: GestureDetector( 
          
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Row(
                  children: [
                    InkWell( 
                       onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ThoreyExamTimeTable()),
                  );
                       }, 
                      child: ExaminationCard(text: "Theory Exam Time Table",)), 
                     InkWell(  
                       onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ThoreyExamCenterList()),
                  );
                },
                      child: ExaminationCard(text: "Theory Exam Centre List \n            (courseWise)",)),
                    
                  ],
                ),
              ), 
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Row( 
                  children: [ 
                     InkWell( 
                       onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HallTcket()),
                  );
                },
                      child: ExaminationCard(text: "Hall ticket",)),
                      InkWell( 
                         onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Result()),
                  );
                },
                        child: ExaminationCard(text: "Result",)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Row( 
                  children: [ 
                     InkWell(  
                        onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Result()),
                  );
                },
                      
                      child: ExaminationCard(text: "Practical Exam TimeTable",)),
                    
                  ],
                ),
              )
            ],
          ),
        ),
        );
  }
}

class ExaminationCard extends StatelessWidget {
  final String text;
  const ExaminationCard({
    Key? key, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(1.0),
          child: Container(
            height: 130,
            width: 200,
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
