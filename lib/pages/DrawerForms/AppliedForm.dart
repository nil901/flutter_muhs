import 'dart:convert';
import 'package:flutter_muhs/compontes/UniversityAtAUrl/webView.dart';
import 'package:http/http.dart' as http;
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AppliedForms extends StatefulWidget {
  const AppliedForms({super.key});

  @override
  State<AppliedForms> createState() => _AppliedFormsState();
}

class _AppliedFormsState extends State<AppliedForms> {
  late Map mapresponse;
  List? listresponse;

  String stringresponse = "";
  var isLoaded = false;
  Future appliedForms() async {
    http.Response response;
    response = await http.post(
        Uri.parse("https://muhsappapi.greemgoldfpc.com/api/Get_Data"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(<String, String>{
          "START": "",
          "END": "",
          "WORD": "",
          "GET_DATA": "AppliedFormList",
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
    appliedForms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor('#074372'),
          // ignore: prefer_const_constructors
          title: Text(
            "My Applied Form",
            // ignore: prefer_const_constructors
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
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onTap: (() {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return WebViewAppliedForms(
                                  webViewName: listresponse![index]["URL_NAME"].toString(),
                                );
                              }));
                            }),
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                        boxShadow: [
                          new BoxShadow(
                            color: Color.fromARGB(255, 182, 179, 179),
                            blurRadius: 1.0,
                          ),
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                listresponse![index]["FORM_NAME"].toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                              if (listresponse![index]["COLLAGE_STATUS"] == ("Pending"))   
                                listresponse![index]["COLLAGE_STATUS"] ==
                                      ("Pending")
                                  ? 
                            Image.asset(
                              "assets/images/status_pending.png",
                              height: 40,
                            ) :null! , 
                              if (listresponse![index]["UNIVERSITY_STATUS"] == ("University Approved"))   
                                listresponse![index]["UNIVERSITY_STATUS"] ==
                                      ("University Approved")
                                  ? 
                            Image.asset(
                              "assets/images/completed.png",
                              height: 50,
                            ) :null! 


                            
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DottedLine(
                            dashColor: Color.fromARGB(115, 66, 66, 66),
                            lineThickness: 2,
                            dashLength: 8,
                            dashGapLength: 5,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Current milestone",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                              Text("Submitted",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  listresponse![index]["COLLAGE_STATUS"]
                                      .toString(),
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 12,
                                  )),
                              Column(
                                children: [
                                  Text("Date",
                                      style: TextStyle(
                                          color: Colors.black54, fontSize: 12)),
                                  Text(
                                      listresponse![index]["REG_DATE"]
                                          .toString(),
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 12,
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
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
        ));
  }
}
