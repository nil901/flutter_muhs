import 'dart:convert';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_muhs/pages/LoginPage.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../Services/LoginApiServices.dart';
import '../Services/RegisterServices.dart';

class StudentRegistratin extends StatefulWidget {
  const StudentRegistratin({super.key});

  @override
  State<StudentRegistratin> createState() => _StudentRegistratinState();
}

late Map mapresponse;
List? listresponse;

class _StudentRegistratinState extends State<StudentRegistratin> {
  String imagepath = "";
  String base64String = "";
  String imageData = "";

  final prnController = TextEditingController();
  final firstNameController = TextEditingController();
  final middlenameController = TextEditingController();
  final LastNameController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final collageNameController = TextEditingController();
  final facultyController = TextEditingController();
  final yearController = TextEditingController();
  final enterController = TextEditingController();
  final confemPassworldContoller = TextEditingController();

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
          "GET_DATA": "Get_Data_PRNNumberWise",
          "ID1": "",
          "ID2": "",
          "ID3": "",
          "STATUS": "",
          "START_DATE": "",
          "END_DATE": "",
          "EXTRA1": "",
          "EXTRA2": "",
          "EXTRA3": "",
          "LANG_ID": ""
        }));
    print(response.body);
    if (response.statusCode == 200) {
      setState(() {
        mapresponse = json.decode(response.body);
        listresponse = mapresponse["DATA"];
        firstNameController.text = listresponse![0]['FIRST_NAME'];
        isLoaded = true;
      });
    }
  }

  selectImageFromGallery() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 10);
    if (file != null) {
      File imagefile = File(file.path);

      imageData = base64Encode(imagefile.readAsBytesSync());
      return imageData;
    } else {
      return '';
    }
  }

//
  selectImageFromCamera() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 10);
    if (file != null) {
      imagepath = file.path;

      File imagefile = File(file.path);

      imageData = base64Encode(imagefile.readAsBytesSync());
      return imageData;
    } else {
      return '';
    }
  }

  ShowImage(String image) {
    return Image.memory(
      base64Decode(image),
      height: 20,
    );
  }

  void _getImageBase64() async {}
  @override
  Widget build(BuildContext context) {
    Future selectImage() {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)), //this right here
              child: Container(
                height: 150,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Text(
                        'Select Image From !',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              imageData = await selectImageFromGallery();
                              print('Image_Path:-');
                              print(imageData);
                              if (imageData != '') {
                                Navigator.pop(context);
                                setState(() {});
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text("No Image Selected !"),
                                ));
                              }
                            },
                            child: Card(
                                elevation: 5,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/images/gallery.png',
                                        height: 50,
                                        width: 60,
                                      ),
                                      Text('Gallery'),
                                    ],
                                  ),
                                )),
                          ),
                          GestureDetector(
                            onTap: () async {
                              imageData = await selectImageFromCamera();
                              print('Image_Path:-');
                              print(imageData);

                              if (imageData != '') {
                                Navigator.pop(context);
                                setState(() {});
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text("No Image Captured !"),
                                ));
                              }
                            },
                            child: Card(
                                elevation: 5,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/images/cameraa.png',
                                        height: 60,
                                        width: 60,
                                      ),
                                      Text('Camera'),
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: HexColor('#074372'),
          leading: Icon(Icons.arrow_back),
          centerTitle: true,
          title: Text(
            "Student Registration",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          )),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      height: 160,
                      width: 180,
                      decoration: BoxDecoration(
                          // color: Colors.black,
                          // borderRadius: BorderRadius.circular(100)
                          ),
                    ),
                    imageData == ''
                        ? Image.asset(
                            'assets/images/c_grivance.png',
                            fit: BoxFit.cover,
                          )
                        : Container(
                            height: 140,
                            width: 140,
                            child: ShowImage(imageData),
                          ),
                    Positioned(
                      top: 90,
                      left: 90,
                      child: InkWell(
                        onTap: (() {
                          selectImage();
                          setState(() {});
                        }),
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: HexColor('#074372'),
                              borderRadius: BorderRadius.circular(6)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/images/camera.png",
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              StudentRegisterLabel(
                textlabel: "PRN NO*",
              ),
              SizedBox(
                height: 5,
              ),
              studentRegisterfroms(
                hintlabel: "Enter 12 Digit PRN Number",
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: firstNameController,
              ),
              ElevatedButton(
                  onPressed: () {
                    apicall();
                  },
                  child: Text("c")),
              StudentRegisterLabel(
                textlabel: "First Name *",
              ),
              SizedBox(
                height: 5,
              ),
              studentRegisterfroms(
                hintlabel: "",
              ),
              SizedBox(
                height: 20,
              ),
              StudentRegisterLabel(
                textlabel: "Middle Name *",
              ),
              SizedBox(
                height: 5,
              ),
              studentRegisterfroms(
                hintlabel: "",
              ),
              SizedBox(
                height: 20,
              ),
              StudentRegisterLabel(
                textlabel: "Last Name *",
              ),
              SizedBox(
                height: 5,
              ),
              studentRegisterfroms(
                hintlabel: "",
              ),
              SizedBox(
                height: 20,
              ),
              StudentRegisterLabel(
                textlabel: "Mobile No *",
              ),
              SizedBox(
                height: 5,
              ),
              studentRegisterfroms(
                hintlabel: "",
              ),
              SizedBox(
                height: 20,
              ),
              StudentRegisterLabel(
                textlabel: "Collage Name *",
              ),
              SizedBox(
                height: 5,
              ),
              studentRegisterfroms(
                hintlabel: "",
              ),
              SizedBox(
                height: 20,
              ),
              StudentRegisterLabel(
                textlabel: "Faculty *",
              ),
              SizedBox(
                height: 5,
              ),
              studentRegisterfroms(
                hintlabel: "",
              ),
              SizedBox(
                height: 20,
              ),
              StudentRegisterLabel(
                textlabel: "Year *",
              ),
              SizedBox(
                height: 5,
              ),
              studentRegisterfroms(
                hintlabel: "",
              ),
              SizedBox(
                height: 20,
              ),
              StudentRegisterLabel(
                textlabel: "Enter Passworld *",
              ),
              SizedBox(
                height: 5,
              ),
              studentRegisterfroms(
                hintlabel: "",
              ),
              SizedBox(
                height: 20,
              ),
              StudentRegisterLabel(
                textlabel: "Confrm Passworld *",
              ),
              SizedBox(
                height: 5,
              ),
              studentRegisterfroms(
                hintlabel: "",
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: (() {
                  apicall();
                }),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: HexColor('#074372'),
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          "Register",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class studentRegisterfroms extends StatefulWidget {
  final String hintlabel;

  const studentRegisterfroms({
    Key? key,
    required this.hintlabel,
  }) : super(key: key);

  @override
  State<studentRegisterfroms> createState() => _studentRegisterfromsState();
}

class _studentRegisterfromsState extends State<studentRegisterfroms> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Form(
        key: _formKey,
        child: Container(
          height: 45,
          //width: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
              border: Border.all(color: HexColor('#074372'), width: 1)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField( 
              
              validator: (text) {
                if (text!.isEmpty) {
                  return 'please add this field';
                } else {
                  return null;
                }
              },
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: widget.hintlabel,
                hintStyle: TextStyle(color: Colors.black26, fontSize: 16),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class StudentRegisterLabel extends StatelessWidget {
  final String textlabel;
  const StudentRegisterLabel({
    Key? key,
    required this.textlabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Text(
            textlabel,
            style: TextStyle(
                color: HexColor('#074372'),
                fontSize: 13,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
