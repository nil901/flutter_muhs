import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_muhs/compontes/ScholarshipForm/DhanvantariForm.dart';
import 'package:get/get.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:path/path.dart';

import 'PDF/pdfView.dart';
import 'ScholarshipForm/EarnWhilelearn.dart';
import 'ScholarshipForm/SanjivaniVidhyarthiSurakshaYojna.dart';
import 'ScholarshipForm/SvitribaiPhuleGirlsScholarship.dart';
import 'StudentWelfareFrom/SavitribaiPhuleGirlsScolarship.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:path_provider_ex/path_provider_ex.dart';

class StudentWelfareSchemes extends StatefulWidget {
  const StudentWelfareSchemes({super.key});
  @override
  State<StudentWelfareSchemes> createState() => _StudentWelfareSchemesState();
}

final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
late Map mapresponse;
List? listresponse;

class _StudentWelfareSchemesState extends State<StudentWelfareSchemes> {
  String stringresponse = "";
  String value = "";
  var isLoaded = false;
  Future apicall() async {
    http.Response response;
    response = await http.post(
        Uri.parse("https://muhsappapi.greemgoldfpc.com/api/Get_Data"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(<String, String>{
          "START": "",
          "END": "",
          "WORD": "",
          "GET_DATA": "Get_StudentWalfareTitleList",
          "ID1": "",
          "ID2": "",
          "ID3": "",
          "STATUS": "",
          "START_DATE": "",
          "END_DATE": "",
          "EXTRA1": "",
          "EXTRA2": "",
          "EXTRA3": "",
          "LANG_ID": "",
        }));
    if (response.statusCode == 200) {
      setState(() {
        mapresponse = json.decode(response.body);
        listresponse = mapresponse["DATA"];
        isLoaded = true;
      });
    }
  }

  void equalOrator() {
    if (listresponse![0]['SWT_TITLE']
        .equals("Savitribai Phule Girls scholarship")) ;
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

  void lisnae() {}
  @override
  Widget build(BuildContext context) {
    final james;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#074372'),
        leading: Icon(
          Icons.arrow_back,
        ),
        centerTitle: true,
        title: Text(
          "Student Welfare",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
      body: Visibility(
        visible: isLoaded,
        // ignore: sort_child_properties_last
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: 85,
                  color: HexColor("#a7d5f9"),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: Image.asset("assets/images/pdf.png"),
                        ),
                        Text(
                          listresponse![index]["SWT_TITLE"].toString(),
                          style: TextStyle(
                              color: HexColor("#000e27"), fontSize: 13),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return PdfView(
                                      name: listresponse![index]["SWT_TITLE"]
                                          .toString(),
                                      pathPDF: listresponse![index]["SWP_URL"]
                                          .toString(),
                                    );
                                    // open viewPDF page on click
                                  }));
                                },
                                child: Container(
                                  height: 23,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      color: HexColor("#dbdbdb"),
                                      borderRadius: BorderRadius.circular(17)),
                                  // ignore: prefer_const_constructors
                                  child: Center(
                                      // ignore: prefer_const_constructors
                                      child: Text(
                                    "View",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 13),
                                  )),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            if (listresponse![index]["SWT_TITLE"] ==
                                ("Savitribai Phule Girls scholarship"))
                              listresponse![index]["SWT_TITLE"] ==
                                      ("Savitribai Phule Girls scholarship")
                                  ? InkWell(
                                      onTap: (() {
                                        Get.to(
                                            SvitribaiPhuleGirlsScholarshipForm());
                                      }),
                                      child: Container(
                                        height: 23,
                                        width: 70,
                                        decoration: BoxDecoration(
                                            color: HexColor('#074372'),
                                            borderRadius:
                                                BorderRadius.circular(17)),
                                        // ignore: prefer_const_constructors
                                        child: Center(
                                            // ignore: prefer_const_constructors
                                            child: Text(
                                          "Apply",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        )),
                                      ),
                                    )
                                  : null!,
                            if (listresponse![index]["SWT_TITLE"] ==
                                ("Earn while learn"))
                              listresponse![index]["SWT_TITLE"] ==
                                      ("Earn while learn")
                                  ? InkWell(
                                      onTap: () {
                                        Get.to(EarnWhileLearn());
                                      },
                                      child: Container(
                                        height: 23,
                                        width: 70,
                                        decoration: BoxDecoration(
                                            color: HexColor('#074372'),
                                            borderRadius:
                                                BorderRadius.circular(17)),
                                        // ignore: prefer_const_constructors
                                        child: Center(
                                            // ignore: prefer_const_constructors
                                            child: Text(
                                          "Apply",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        )),
                                      ),
                                    )
                                  : null!,
                            if (listresponse![index]["SWT_TITLE"] ==
                                ("Dhanvantari Yojana"))
                              listresponse![index]["SWT_TITLE"] ==
                                      ("Dhanvantari Yojana")
                                  ? InkWell(
                                      onTap: (() {
                                        Get.to(DhanvantariYojna());
                                      }),
                                      child: Container(
                                        height: 23,
                                        width: 70,
                                        decoration: BoxDecoration(
                                            color: HexColor('#074372'),
                                            borderRadius:
                                                BorderRadius.circular(17)),
                                        // ignore: prefer_const_constructors
                                        child: Center(
                                            // ignore: prefer_const_constructors
                                            child: Text(
                                          "Apply",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        )),
                                      ),
                                    )
                                  : null!,
                            if (listresponse![index]["SWT_TITLE"] ==
                                ("Sanjivani Vidhyarthi Suraksha Yojana"))
                              listresponse![index]["SWT_TITLE"] ==
                                      ("Sanjivani Vidhyarthi Suraksha Yojana")
                                  ? InkWell(
                                      onTap: () {
                                        Get.to(
                                            SanjivaniVidhyarthiSurakshaYojna());
                                      },
                                      child: Container(
                                        height: 23,
                                        width: 70,
                                        decoration: BoxDecoration(
                                            color: HexColor('#074372'),
                                            borderRadius:
                                                BorderRadius.circular(17)),
                                        // ignore: prefer_const_constructors
                                        child: Center(
                                            // ignore: prefer_const_constructors
                                            child: Text(
                                          "Apply",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        )),
                                      ),
                                    )
                                  : null!,
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
              ],
            );
          },
          itemCount: listresponse == null ? 0 : listresponse?.length,
        ),
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
