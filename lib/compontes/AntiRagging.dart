import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;

import 'PDF/pdfView.dart';

class AntiRagging extends StatefulWidget {
  const AntiRagging({super.key});

  @override
  State<AntiRagging> createState() => _AntiRaggingState();
}

late Map mapresponse;
List? listresponse;

class _AntiRaggingState extends State<AntiRagging> {
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
          "GET_DATA": "GetAntiRaggingTitlePdfList",
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
            "Circular",
            style: TextStyle(fontSize: 22),
          ),
          centerTitle: true,
        ),
        body: Visibility(
            visible: true,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  childAspectRatio: 1.40,
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 3),
              itemBuilder: (context, index) {
                return InkWell( 
                   onTap: (() {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return PdfView(
                                  name: listresponse![index]["ART_TITLE"].toString(),
                                  pathPDF: listresponse![index]["ARP_URL"].toString(),
                                );
                              }));
                            }),
                  child: Container(
                    color: HexColor('#074372'),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/pdf.png",
                          height: 50,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          listresponse![index]["ART_TITLE"].toString(),
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: listresponse == null ? 0 : listresponse!.length,
            ),
            replacement: const Center(
              child: CircularProgressIndicator(),
            )));
  }
}
