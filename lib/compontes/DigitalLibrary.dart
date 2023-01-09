import 'package:flutter/material.dart';
import 'package:flutter_muhs/compontes/DigitalLibraryUrl/Omnicuris.dart';
import 'package:flutter_muhs/compontes/DigitalLibraryUrl/OpenSourcedigital.dart';
import 'package:hexcolor/hexcolor.dart';

import 'DigitalLibraryUrl/Knimbus.dart';
import 'DigitalLibraryUrl/MuhsHealth.dart';
import 'DigitalLibraryUrl/NationalDigitalLabrary.dart';
import 'DigitalLibraryUrl/Shodhganga.dart';

class DigitalLibrary extends StatelessWidget {
  const DigitalLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#074372'),
        title: Text(
          "Digital Library",
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
                          MaterialPageRoute(builder: (context) => const Knimbus()),
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
                      "assets/images/sub_kinbus.png",
                      height: 60,
                    ),
                  ),
                  Text(
                    "Knimbus",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),  
              ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Omnicuris()),
                        );
                      },
                      child:Container(
              height: 130,
              width: 175,
              color: HexColor('#074372'),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/images/sub_omnicuris.webp",
                      height: 60,
                    ),
                  ),
                  Text(
                    "Omnicuris",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),  
                    ),
                     InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Shodhganga()),
                        );
                      },
                      child:  Container(
              height: 130,
              width: 175,
              color: HexColor('#074372'),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/images/sub_shodh.png",
                      height: 60,
                    ),
                  ),
                  Text(
                    "Shodhganga",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ), 
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Shodhganga()),
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
                      "assets/images/sub_swayam.png",
                      height: 60,
                    ),
                  ),
                  Text(
                    "Swayam",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ), 
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OpenSourceDigital()),
                        );
                      },
                      child:Container(
              height: 130,
              width: 175,
              color: HexColor('#074372'),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/images/c_library.png",
                      height: 60,
                    ),
                  ),
                  Text(
                    "Open Source digital\n            library",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),  
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NationalDigitalLabrary()),
                        );
                      },
                      child:Container(
              height: 130,
              width: 175,
              color: HexColor('#074372'),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/images/sub_nationalhealth.png",
                      height: 60,
                    ),
                  ),
                  Text(
                    "National Digital Labrary",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),  
                    ),
                     InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NationalDigitalLabrary()),
                        );
                      },
                      child:Container(
              height: 130,
              width: 175,
              color: HexColor('#074372'),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/images/sub_educationhealth.png",
                      height: 60,
                    ),
                  ),
                  Text(
                    "Education For Health",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),   
                     ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MuhsHealth()),
                        );
                      },
                      child:Container(
              height: 130,
              width: 175,
              color: HexColor('#074372'),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/images/logo.png",
                      height: 60,
                    ),
                  ),
                  Text(
                    "MUHS HEALTH\n SCIENCES REVIEW",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),  )

          ],
         
        ),
      ),
    );
  }
}

