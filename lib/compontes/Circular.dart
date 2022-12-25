// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;

import 'PDF/pdfView.dart';

class Circular extends StatefulWidget {
  const Circular({super.key});

  @override
  State<Circular> createState() => _CircularState();
}

late Map mapresponse;
List? listresponse;

class _CircularState extends State<Circular> {
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
          "GET_DATA": "CircularList",
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
            visible: isLoaded,
            // ignore: sort_child_properties_last
            child: ListView.builder(
              
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1),
                  child: Container(
                    height: 73,
                    color: HexColor("#a7d5f9"),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 40,
                                width: 40,
                                child: Image.asset("assets/images/pdf.png"),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                listresponse![index]["CIRCULAR_TITLE"]
                                    .toString(),
                                style: TextStyle(
                                    color: HexColor("#000e27"), fontSize: 15),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: (() {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return PdfView(
                                  name: listresponse![index]["CIRCULAR_TITLE"]
                                      .toString(),
                                  pathPDF: listresponse![index]["CIRCULAR_PDF"]
                                      .toString(),
                                );
                              }));
                            }),
                            child: Container(
                              height: 23,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: HexColor("#dbdbdb"),
                                  borderRadius: BorderRadius.circular(17)),
                              child: Center(
                                child: Text(
                                  "View",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 13),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
