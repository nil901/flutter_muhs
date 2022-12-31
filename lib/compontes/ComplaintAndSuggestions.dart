// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_muhs/compontes/GrievanceRedressal.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ComplaintAndSuggestions extends StatefulWidget {
  const ComplaintAndSuggestions({super.key});

  @override
  State<ComplaintAndSuggestions> createState() =>
      _ComplaintAndSuggestionsState();
}

class _ComplaintAndSuggestionsState extends State<ComplaintAndSuggestions> {
  List<String> items = <String>['Complaint', 'Feedback'];
  List<String> itemss = <String>[
    'Student Related Complaint ',
    'Examination Related Complaint ',
    'Academic Related complaint',
    'Eligibility Related Complaint',
    'Administration Related Complaint',
    'Online/IT/Computer Related',
    'Guest House/Vehicle Related Complaint',
    'University Employee Related Complaint',
    'Teacher Grivance Related Complaint',
    'Suggestion for Website Imrovement',
    'Suggestion for App Imrovement',
    'General Complaint'
  ];
  String dropdownvalue = 'Complaint';
  String Feddback = 'Student Related Complaint ';
  final _fromkey = GlobalKey<FormState>();
  bool _isLoading = false;
  String? token = "";
  String? prnnumber = "";
  String? email = "";
  final prnController = TextEditingController();
  final complaintNameController = TextEditingController();
  final complaintAddresssController = TextEditingController();
  final complaintCategoryController = TextEditingController();
  final mobileNoController = TextEditingController();
  final addressController = TextEditingController();
  final complaintDetailsController = TextEditingController();
  final emailController = TextEditingController();
  final complanintFeedbackController = TextEditingController();
  final complaintRelatedToController = TextEditingController();
  final complaintTypeController = TextEditingController();

  complaintAndSuggestions() async {
    // ignore: unused_local_variable

    Map<String, dynamic> data = {
      "STUDENT_ID": prnnumber,
      "PRN_NUMBER": token,
      "COMPLAINT_NAME": complaintNameController.text,
      "COMPLAINT_ADDRESS": complaintAddresssController.text,
      "COMPLAINT_CATEGORY": dropdownvalue,
      "MOBILE_NO": mobileNoController.text,
      "ADDRESS": addressController.text,
      "COMPLAINT_DETAILS": complaintDetailsController.text,
      "EMAIL": emailController.text,
      "COMPLAINT_FEEDBACK": "",
      "COMPLAINT_RELATED_TO": Feddback,
      "COMPLAINT_TYPE": "OPEN",
      "EXTRA1": "",
      "EXTRA2": "",
      "EXTRA3": "",
      "TASK": "ADD"
    };

    // var jsonResponse = null;
    var response = await http.post(
        Uri.parse("https://muhsappapi.greemgoldfpc.com/api/Complaint"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data));
    // print(response.body);
    var jsonResponse = json.decode(response.body);
    print(response.body);
    if (jsonResponse["ResponseCode"] == "0") {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("${jsonResponse["ResponseMessage"]}")));
      print(response.body);
//

      setState(() {
        _isLoading = true;
      });
    } else {
      print("error");

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("${jsonResponse["ResponseMessage"]} ${prnnumber}")));
    }
  }

  @override
  void initState() {
    getCard();
    // TODO: implement initState
    super.initState();
  }

  void getCard() async {
    SharedPreferences shef = await SharedPreferences.getInstance();
    setState(() {
      token = shef.getString("Login");
      prnnumber = shef.getString("PRN");
      email = shef.getString("email");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#074372'),
        title: Text(
          "Complaint And Suggestions",
          style: TextStyle(fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _fromkey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Text(
                      "Complainant Name",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      // color: Colors.blue,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: complaintNameController,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(2.0),
                        hintText: 'Enter Your Name',
                        hintStyle:
                            TextStyle(color: Colors.black26, fontSize: 16),
                        border: InputBorder.none,
                      ),
                      validator: MultiValidator(
                          [RequiredValidator(errorText: "Required*")]),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Complainant Address",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                      // color: Colors.blue,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: complaintAddresssController,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: 'Enter Address',
                        hintStyle:
                            TextStyle(color: Colors.black26, fontSize: 16),
                        border: InputBorder.none,
                      ),
                      validator: MultiValidator(
                          [RequiredValidator(errorText: "Required*")]),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Mobile Number",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      // color: Colors.blue,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: mobileNoController,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(2.0),
                        hintText: 'Enter 10 Digit Mobile No',
                        hintStyle:
                            TextStyle(color: Colors.black26, fontSize: 16),
                        border: InputBorder.none,
                      ),
                      validator: MultiValidator(
                          [RequiredValidator(errorText: "Required*")]),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Email Id",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      // color: Colors.blue,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: emailController,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                         contentPadding: EdgeInsets.all(2.0),
                        hintText: 'Enter Email Id',
                        hintStyle:
                            TextStyle(color: Colors.black26, fontSize: 16),
                        border: InputBorder.none,
                      ),
                       validator: MultiValidator([
                          RequiredValidator(errorText: "Required*"),
                          EmailValidator(
                              errorText: "please enter your valid email")
                        ]),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Complainant of FeedBack",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(

                      // color: Colors.blue,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        iconSize: 34,
                        value: dropdownvalue,
                        items:
                            items.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                              value: value, child: Text(value));
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue ?? '';
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Detailed Complaint / feedback",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 90,
                  decoration: BoxDecoration(
                      // color: Colors.blue,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: TextFormField(
                      controller: complanintFeedbackController,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: 'Enter Your Complaint /Feedback',
                        hintStyle:
                            TextStyle(color: Colors.black26, fontSize: 16),
                        border: InputBorder.none,
                      ),
                      validator: MultiValidator(
                          [RequiredValidator(errorText: "Required*")]),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Complaint/Feedback Related to",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(

                      // color: Colors.blue,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        iconSize: 34,
                        value: Feddback,
                        items: itemss
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                              value: value, child: Text(value));
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            Feddback = newValue ?? '';
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Stack(
                  children: [
                    InkWell(
                      onTap: (() {
                        if (_fromkey.currentState!.validate()) {
                          complaintAndSuggestions(); 
                    
                          Get.to(GrievanceRedressal());
                        } else {
                          print("not submited");
                        }

                        //
                      }),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: HexColor('#074372'),
                            borderRadius: BorderRadius.circular(6)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                        "Submit",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      )),
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
