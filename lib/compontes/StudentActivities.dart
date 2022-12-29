import 'package:flutter/material.dart';
import 'package:flutter_muhs/compontes/StudentActivitySub.dart';
import 'package:hexcolor/hexcolor.dart';

class StudentActivities extends StatelessWidget {
  const StudentActivities({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#074372'),
        leading: Icon(
          Icons.arrow_back,
        ),
        centerTitle: true,
        title: Text(
          "Student Activities",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                InkWell(
                  onTap: (() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const StudentActivityPdf()),
                    );
                  }),
                  child: PdfView(
                    text: "PRO-RATA",
                  ),
                ),
                PdfView(
                  text: "CULTURAL",
                ),
                PdfView(
                  text: "AVISHKAR",
                ),
                PdfView(
                  text: "NSS",
                ),
                PdfView(
                  text: "SPORTS",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PdfView extends StatelessWidget {
  final String text;
  const PdfView({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical:3),
      child: Container(
        height: 130,
        width: 200,
        color: HexColor('#074372'),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
              width: 60,
              child: Image.asset("assets/images/pdf.png"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
