import 'package:flutter/material.dart';
import 'package:flutter_muhs/compontes/UniversityAtAUrl/AboutUniversity.dart';
import 'package:flutter_muhs/compontes/UniversityAtAUrl/MuhsRegionalCenters.dart';
import 'package:hexcolor/hexcolor.dart';

import 'UniversityAtAUrl/StatutoryOfficer.dart';

class UniversityAtAGlance extends StatelessWidget {
  const UniversityAtAGlance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#074372'),
        title: Text(
          "University At A Glance",
          style: TextStyle(fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AboutUniversity()),
                      );
                    },
                    child: ExaminationCard(
                      image: "assets/images/c_university.png",
                      text: "About University",
                    )),
                InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MuhsRegionalCenters()),
                      );
                    },
                    child: ExaminationCard(
                      image: "assets/images/c_university.png",
                      text: "MUHS Regional Center",
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StatutoryOfficer()),
                      );
                    },
                    child: ExaminationCard(
                      image: "assets/images/c_satuory.png",
                      text: "Statutory Offcer",
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ExaminationCard extends StatelessWidget {
  final String text;
  final String image;
  const ExaminationCard({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(1.0),
          child: Expanded(
            child: Container(
              height: 130,
              width: 175,
              color: HexColor('#074372'),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      image,
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
        ),
      ],
    );
  }
}
