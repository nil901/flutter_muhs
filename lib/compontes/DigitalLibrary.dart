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
                      MaterialPageRoute(builder: (context) => const Knimbus()),
                    );
                  },
                  child: DigitalLibrarys(
                    text: "Knimbus",
                    images: "assets/images/sub_kinbus.png",
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
                  child: DigitalLibrarys(
                    images: "assets/images/sub_omnicuris.webp",
                    text: "Omnicuris",
                  ),
                ),
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
                          builder: (context) => const Shodhganga()),
                    );
                  },
                  child: DigitalLibrarys(
                    images: "assets/images/sub_shodh.png",
                    text: "Shodhganga",
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
                  child: DigitalLibrarys(
                    images: "assets/images/sub_swayam.png",
                    text: "Swayam",
                  ),
                ),
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
                          builder: (context) => const OpenSourceDigital()),
                    );
                  },
                  child: DigitalLibrarys(
                    images: "assets/images/c_library.png",
                    text: "Open Source digital\n            library",
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
                  child: DigitalLibrarys(
                    images: "assets/images/sub_nationalhealth.png",
                    text: "National Digital Labrary",
                  ),
                ),
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
                          builder: (context) => const NationalDigitalLabrary()),
                    );
                  },
                  child: DigitalLibrarys(
                    images: "assets/images/sub_educationhealth.png",
                    text: "Education For Health",
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
                  child: DigitalLibrarys(
                    images: "assets/images/logo.png",
                    text: "MUHS HEALTH\n SCIENCES REVIEW",
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DigitalLibrarys extends StatelessWidget {
  final String text;
  final String images;
  const DigitalLibrarys({
    Key? key,
    required this.text,
    required this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(1.0),
          child: Container(
            height: 130,
            width: 175,
            color: HexColor('#074372'),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    images,
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
