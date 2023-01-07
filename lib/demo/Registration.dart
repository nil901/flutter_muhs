import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_muhs/pages/LoginPage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

late Map mapresponse;
List? listresponse;

bool _isLoading = false;
String StudentID = "";
String CollegeID = "";
String StudAddress = "";
String imagepath = "";
String base64String = "";
String imageData = "";

class _RegistrationState extends State<Registration> {
  final _fromkey = GlobalKey<FormState>();
  final studentIdController = TextEditingController();
  final collageIdconntroller = TextEditingController();
  final prnController = TextEditingController();
  final firstNameController = TextEditingController();
  final middlenameController = TextEditingController();
  final LastNameController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final emailIdController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final collageNameController = TextEditingController();
  final facultyController = TextEditingController();
  final yearController = TextEditingController();
  final enterController = TextEditingController();
  final newpassworld = TextEditingController();
  final confemPassworldContoller = TextEditingController();
  final _confirmPassController = TextEditingController();

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
          "WORD": prnController.text,
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
        if (listresponse![0]['PASSWORD'].length > 0) {
          Get.to(LoginPage());
          Fluttertoast.showToast(
            msg: "Already registered",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            fontSize: 13.0,
          );
        }
        firstNameController.text = listresponse![0]['FIRST_NAME'];
        middlenameController.text = listresponse![0]['MIDDEL_NAME'];
        LastNameController.text = listresponse![0]['LAST_NAME'];
        dateOfBirthController.text = listresponse![0]['DOB'];
        emailIdController.text = listresponse![0]['EMAIL_ID'];
        mobileNumberController.text = listresponse![0]['MOBILE_NUMBER'];
        collageNameController.text = listresponse![0]['COLLAGE_NAME'];
        facultyController.text = listresponse![0]['FACULTY'];
        yearController.text = listresponse![0]['BATCH_YEAR'];
        studentIdController.text = listresponse![0]["STUDENT_ID"].toString();
        collageIdconntroller.text = listresponse![0]["COLLAGE_ID"].toString();

        imageData.toString();

        // imageData = listresponse![0]["PROFILE_PHOTO"];
        isLoaded = true;
      });
    }
  }

  File? image;
  Future PickImageImag(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);

      if (image == null) return;
      final imageTemporary = File(image.path);
      imageData = base64Encode(imageTemporary.readAsBytesSync());

      print( " image path nilesh  " + imageData);

      setState(() {});
      this.image = imageTemporary;
    } on PlatformException catch (e) {
      print('Failed to pick image $e');
    }
  }

  String validateMobile(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length != 13)
      return 'Mobile Number must be of 10 digit';
    else
      return 'null';
  }

  ShowImage(String image) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.pink),
        child: Image.memory(
          base64Decode(image),
          height: 60,
        ),
      ),
    );
  }

  Registeracall() async {
    // ignore: unused_local_variable

    Map<String, dynamic> data = {
      "STUDENT_ID": studentIdController.text,
      "FIRST_NAME": firstNameController.text,
      "MIDDEL_NAME": middlenameController.text,
      "LAST_NAME": LastNameController.text,
      "PRN_NUMBER": prnController.text,
      "PASSWORD": newpassworld.text,
      "COLLAGE_ID": collageIdconntroller.text,
      "EMAIL_ID": emailIdController.text,
      "MOBILE_NUMBER": mobileNumberController.text,
      "BATCH_YEAR": yearController.text,
      "FACULTY": facultyController.text,
      "DOB": dateOfBirthController.text,
      "ADDRESS": "",
      "PROFILE_PHOTO": imageData.toString()
    };
    // var jsonResponse = null;
    var response = await http.post(
        Uri.parse("https://muhsappapi.greemgoldfpc.com/api/UserRegistration"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data));
    // print(response.body);
    var jsonResponse = json.decode(response.body);
    print(response.body);
    if (jsonResponse["ResponseCode"] == "0") {
    
      print(data);
      print(response.body);

      Fluttertoast.showToast(
        msg: "${jsonResponse["ResponseMessage"]}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 13.0,
      );
      print(response.body);

      // ignore: use_build_context_synchronously

      setState(() {
        _isLoading = true;
      });
    } else {
      print("error");

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("${jsonResponse["ResponseMessage"]}")));
    }
  }

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
                              imageData =
                                  await PickImageImag(ImageSource.gallery);
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
                              imageData =
                                  await PickImageImag(ImageSource.camera);
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _fromkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: HexColor('#074372'),
                        radius: 72.0,
                        child: CircleAvatar(
                          radius: 70.0,
                          child: ClipOval(
                            child: image != null
                                ? Image.file(
                                    image!,
                                    width: 200,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  )
                                : null,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 3,
                        bottom: 1,
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
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/images/camera.png',
                                height: 50,
                                width: 50,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Textlabels(
                  textlable: "PRN No",
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: HexColor('#074372'), width: 1),
                        //  color: Colors.red,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        controller: prnController,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: "Enter 13 Digit PRN Number",
                          //hintText: widget.hintlabel,
                          hintStyle:
                              TextStyle(color: Colors.black26, fontSize: 16),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                InkWell(
                  onTap: (() {
                    apicall();
                  }),
                  child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                        color: HexColor('#074372'),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        "Validate PRN",
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ),
                  ),
                ),
                Textlabels(
                  textlable: "First Name *",
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: HexColor('#074372'), width: 1),
                        //  color: Colors.red,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        enabled: false,
                        controller: firstNameController,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          //hintText: widget.hintlabel,
                          hintStyle:
                              TextStyle(color: Colors.black26, fontSize: 16),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Textlabels(
                  textlable: "Middle Name *",
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: HexColor('#074372'), width: 1),
                        //  color: Colors.red,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        enabled: false,
                        controller: middlenameController,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          //hintText: widget.hintlabel,
                          hintStyle:
                              TextStyle(color: Colors.black26, fontSize: 16),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Textlabels(
                  textlable: "Last Name *",
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: HexColor('#074372'), width: 1),
                        //  color: Colors.red,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        enabled: false,
                        controller: LastNameController,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          //hintText: widget.hintlabel,
                          hintStyle:
                              TextStyle(color: Colors.black26, fontSize: 16),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Textlabels(
                  textlable: "Date of Birth *",
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: HexColor('#074372'), width: 1),
                        //  color: Colors.red,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        enabled: false,
                        controller: dateOfBirthController,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          //hintText: widget.hintlabel,
                          hintStyle:
                              TextStyle(color: Colors.black26, fontSize: 16),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Textlabels(
                  textlable: "Email-Id *",
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: HexColor('#074372'), width: 1),
                        //  color: Colors.red,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        enabled: false,
                        controller: emailIdController,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          //hintText: widget.hintlabel,
                          hintStyle:
                              TextStyle(color: Colors.black26, fontSize: 16),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Textlabels(
                  textlable: "Mobile No *",
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: HexColor('#074372'), width: 1),
                        //  color: Colors.red,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        enabled: false,
                        controller: mobileNumberController,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          //hintText: widget.hintlabel,
                          hintStyle:
                              TextStyle(color: Colors.black26, fontSize: 16),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Textlabels(
                  textlable: "collage Name *",
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: HexColor('#074372'), width: 1),
                        //  color: Colors.red,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        enabled: false,
                        controller: collageNameController,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          //hintText: widget.hintlabel,
                          hintStyle:
                              TextStyle(color: Colors.black26, fontSize: 16),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Textlabels(
                  textlable: "Faculty *",
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: HexColor('#074372'), width: 1),
                        //  color: Colors.red,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        enabled: false,
                        controller: facultyController,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          //hintText: widget.hintlabel,
                          hintStyle:
                              TextStyle(color: Colors.black26, fontSize: 16),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Textlabels(
                  textlable: "Year *",
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: HexColor('#074372'), width: 1),
                        //  color: Colors.red,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        enabled: false,
                        controller: yearController,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          //hintText: widget.hintlabel,
                          hintStyle:
                              TextStyle(color: Colors.black26, fontSize: 16),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Textlabels(
                  textlable: "Enter Passworld *",
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: HexColor('#074372'), width: 1),
                        //  color: Colors.red,
                        borderRadius: BorderRadius.circular(5)),
                    child: TextFormField(
                        controller: newpassworld,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          //hintText: widget.hintlabel,12
                          hintStyle:
                              TextStyle(color: Colors.black26, fontSize: 16),
                          border: InputBorder.none,
                        ),
                        validator: (val) {
                          if (val!.isEmpty) return 'Empty';
                          return null;
                        }),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Textlabels(
                  textlable: "Confim Passworld *",
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: HexColor('#074372'), width: 1),
                        //  color: Colors.red,
                        borderRadius: BorderRadius.circular(5)),
                    child: TextFormField(
                        controller: _confirmPassController,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          //hintText: widget.hintlabel,
                          hintStyle:
                              TextStyle(color: Colors.black26, fontSize: 16),
                          border: InputBorder.none,
                        ),
                        validator: (val) {
                          if (val!.isEmpty) return 'Empty';
                          if (val != newpassworld.text) return 'Not Match';
                          return null;
                        }),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      if (_fromkey.currentState!.validate()) {
                        setState(() {
                          Registeracall();
                        });
                      }
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: HexColor('#074372'),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          "Submit",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Textlabels extends StatelessWidget {
  final String textlable;
  const Textlabels({
    Key? key,
    required this.textlable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(textlable,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
