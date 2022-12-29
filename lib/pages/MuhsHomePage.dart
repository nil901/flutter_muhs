import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_muhs/compontes/Circular.dart';
import 'package:flutter_muhs/compontes/DigitalLibrary.dart';
import 'package:flutter_muhs/compontes/Examination.dart';
import 'package:flutter_muhs/compontes/GrievanceRedressal.dart';
import 'package:flutter_muhs/compontes/Manas.dart';
import 'package:flutter_muhs/compontes/MuhsIeh.dart';
import 'package:flutter_muhs/compontes/MuhsVision.dart';
import 'package:flutter_muhs/compontes/StudentActivities.dart';
import 'package:flutter_muhs/compontes/StudentFaq.dart';
import 'package:flutter_muhs/compontes/StudentWelfareSchemes.dart';
import 'package:flutter_muhs/compontes/UniversityAtAGlance.dart';
import 'package:flutter_muhs/compontes/examinationurl/CollageInfo/CollageInformation.dart';
import 'package:flutter_muhs/compontes/examinationurl/CollageInfo/WorkshopAndConference.dart';
import 'package:flutter_muhs/pages/Drawer.dart';

import 'package:flutter_muhs/pages/demo.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../compontes/AntiRagging.dart';
import '../compontes/CoursesAndSyllabus.dart';
import '../compontes/Notification.dart';

class MuhsHomePage extends StatelessWidget {
  const MuhsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              "assets/images/twitter.png",
              height: 30,
            ),
            Image.asset(
              "assets/images/youtube.png",
              height: 30,
            ),
          ],
        )
      ],
      drawer: MyDrawar(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: HexColor('#074372'),
        //leading: Icon(Icons.arrow_back),
        centerTitle: true,
        title: Text(
          "MUHS",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Image.asset(
              "assets/images/notification.png",
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: MuhsHomeBody(),
    );
  }
}

class MuhsHomeBody extends StatefulWidget {
  @override
  State<MuhsHomeBody> createState() => _MuhsHomeBodyState();
}

class _MuhsHomeBodyState extends State<MuhsHomeBody> {


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Carousel(
              boxFit: BoxFit.cover,
              autoplay: false,
              animationCurve: Curves.fastOutSlowIn,
              animationDuration: Duration(milliseconds: 1000),
              dotSize: 0.0,
              dotIncreasedColor: Color(0xFFFF335C),
              dotBgColor: Colors.transparent,
              dotPosition: DotPosition.topRight,
              dotVerticalPadding: 10.0,
              showIndicator: true,
              indicatorBgPadding: 7.0,
              images: [
                Image.asset(
                  "assets/images/mush2.jpg",
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  "assets/images/mush3.jpg",
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          Column(
            children: [],
          ),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              InkWell(
                onTap: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MuhsVision()),
                  );
                }),
                child: HomeController(
                  text: "MUHS\nVision",
                  images: "assets/images/c_vision.png",
                ),
              ),
              InkWell(
                onTap: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Muhsleh()),
                  );
                }),
                child: HomeController(
                  text: "MUHS IEH",
                  images: "assets/images/light.png",
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StudentWelfareSchemes()),
                  );
                },
                child: HomeController(
                  text: "Student\nWelfare\nSchemes",
                  images: "assets/images/activity.png",
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StudentActivities()),
                  );
                },
                child: HomeController(
                  text: "Student\nActivities",
                  images: "assets/images/scheme.png",
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GrievanceRedressal()),
                  );
                },
                child: HomeController(
                  text: "Grievance\nRedressal For\nStudent",
                  images: "assets/images/c_grivance.png",
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AntiRagging()),
                  );
                },
                child: HomeController(
                  text: "Anti Ragging",
                  images: "assets/images/Ragging.png",
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Examination()),
                  );
                },
                child: HomeController(
                  text: "Examination",
                  images: "assets/images/c_events.png",
                ),
              ),
              InkWell(
                onTap: () {},
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CoursesAndSyllabus()),
                    );
                  },
                  child: HomeController(
                    text: "Courses &\n Syllabus",
                    images: "assets/images/c_courses.png",
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Circular()),
                  );
                },
                child: HomeController(
                  text: "Circular",
                  images: "assets/images/c_news.png",
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Notifications()),
                  );
                },
                child: HomeController(
                  text: "Notifications",
                  images: "assets/images/c_notification.png",
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DigitalLibrary()),
                  );
                },
                child: HomeController(
                  text: "Digital Library",
                  images: "assets/images/c_library.png",
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const StudentFaq()),
                  );
                },
                child: HomeController(
                  text: "Student FAQ",
                  images: "assets/images/c_registratiion.png",
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CollageInformation()),
                  );
                },
                child: HomeController(
                  text: "College\nInformation",
                  images: "assets/images/c_university.png",
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WorkshopAndConference()),
                  );
                },
                child: HomeController(
                  text: "Workshop &\nConference",
                  images: "assets/images/c_workshop.png",
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UniversityAtAGlance()),
                  );
                },
                child: HomeController(
                  text: "University At\n A Glance",
                  images: "assets/images/c_university.png",
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Manas()),
                  );
                },
                child: HomeController(
                  text: "Manas",
                  images: "assets/images/Manas.png",
                ),
              ),
              HomeController(
                text: "Kulguru Katta",
                images: "assets/images/c_leaf.png",
              ),
              HomeController(
                text: "Contact Us",
                images: "assets/images/c_contactus.png",
              ),
            ],
          ),
        ],
      ),
    );
  }

 
}

class HomeController extends StatelessWidget {
  final String text;
  final String images;
  const HomeController({
    Key? key,
    required this.text,
    required this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Container(
        color: HexColor('#074372'),
        width: 150,
        height: 160,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: Image.asset(images),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 12),
              )
            ],
          ),
        ),
      ),
    );
  }
}
