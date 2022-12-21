import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;

import 'PDF/pdfView.dart';

class StudentFaq extends StatefulWidget {
  const StudentFaq({super.key});

  @override
  State<StudentFaq> createState() => _StudentFaqState();
}

late Map mapresponse;
List? listresponse;

class _StudentFaqState extends State<StudentFaq> {
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
          "GET_DATA": "Get_FAQ",
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
    if (response.statusCode == 200) {
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
        title: Text(
          "Student FAQ",
          style: TextStyle(fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1),
              child: InkWell(
                onTap: (() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PdfView(
                      name: listresponse![index]["PDF_TITLE"].toString(),
                      pathPDF: listresponse![index]["PDF_URL"].toString(),
                    );
                    // open viewPDF page on click
                  }));
                }),
                child: Container(
                  height: 80,
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
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            listresponse![index]["PDF_TITLE"].toString(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: HexColor("#000e27"), fontSize: 14),
                          ),
                        ),
                        InkWell(
                          onTap: (() {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return PdfView(
                                name: listresponse![index]["PDF_TITLE"].toString(),
                                pathPDF:listresponse![index]["PDF_URL"].toString(),
                              );
                              // open viewPDF page on click
                            }));
                          }),
                          child: Container(
                            height: 23,
                            width: 73,
                            decoration: BoxDecoration(
                                color: HexColor("#dbdbdb"),
                                borderRadius: BorderRadius.circular(17)),
                            child: Center(
                                child: Text(
                              "View",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 13),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
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
