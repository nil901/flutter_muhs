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
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: GridView.count( 
           crossAxisCount: 2, childAspectRatio: 3/2, crossAxisSpacing: 2,  mainAxisSpacing: 2, 
           children: [ 
            InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AboutUniversity()),
                          );
                        },
                        child: Container(
                height: 130,
                width: 175,
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
                      "About University",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ), ), 

              InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MuhsRegionalCenters()),
                          );
                        },
                        child: Container(
                height: 130,
                width: 175,
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
                      "MUHS Regional Center",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ), ),  

                 InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const StatutoryOfficer()),
                          );
                        },
                        child: Container(
                height: 130,
                width: 175,
                color: HexColor('#074372'),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/images/c_satuory.png",
                        height: 60,
                      ),
                    ),
                    Text(
                      "Statutory Offcer",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
              ), ), 
           ],
          
        ),
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
