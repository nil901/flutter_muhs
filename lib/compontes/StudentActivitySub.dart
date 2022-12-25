import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'PDF/pdfView.dart';

class StudentActivityPdf extends StatefulWidget {
  const StudentActivityPdf({super.key});

  @override
  State<StudentActivityPdf> createState() => _StudentActivityPdfState();
}

late Map mapresponse;
 List? listresponse; 
 

class _StudentActivityPdfState extends State<StudentActivityPdf> {
  String stringresponse = "";
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
          "GET_DATA": "Get_StudentActivityMainTitleList",
          "ID1": "",
          "ID2": "",
          "ID3": "",
          "STATUS": "",
          "START_DATE": "",
          "END_DATE": "",
          "EXTRA1": "22",
          "EXTRA2": "",
          "EXTRA3": "",
          "LANG_ID": ""
        }));
    if (response.statusCode == 0) {
      setState(() {
        mapresponse = json.decode(response.body);
        listresponse = mapresponse["DATA"];
        isLoaded = true;
      });
    }
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#074372'),
        leading: Icon(Icons.arrow_back),
        centerTitle: true,
        title: Text(
          "Student Sub Activities",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
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
                            height: 50,
                            width: 50,
                            child: Image.asset("assets/images/pdf.png"),
                          ),
                          Text(
                            listresponse![index]["SAT_TITLE"].toString(),
                            style:
                                TextStyle(color: HexColor("#000e27"), fontSize: 15),
                          ),
                          Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  height: 28,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      color: HexColor("#dbdbdb"),
                                      borderRadius: BorderRadius.circular(17)),
                                  child: Center(
                                      child: Text(
                                    "View",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  )),
                                ),
                               
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },itemCount: listresponse == null ? 0 : listresponse!.length,
        ), replacement: const Center(
          child: CircularProgressIndicator(),
      ),
      )
    );
  }
}
