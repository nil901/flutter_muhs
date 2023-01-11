import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../demo/Registration.dart';

class MyProfile2 extends StatefulWidget {
  const MyProfile2({super.key});

  @override
  State<MyProfile2> createState() => _MyProfile2State();
}

class _MyProfile2State extends State<MyProfile2> {
  bool _isLoading = false;
  String StudentID = "";
  String CollegeID = "";
  String StudAddress = "";
  String imagepath = "";
  String base64String = "";
  String imageData = "";
  String? token = "";
  String? prnnumber = "";
  String? email = "";
  String? collageid = "";
  String? firstname = "";
  String? middlename = "";
  String? lastname = "";
  String? dateofbirth = "";
  String? mobilenumber = "";
  String? collagename = "";
  String? faculty = "";
  String? year = "";
  String? images = "";
  String? passworld = "";
  String? address = "";

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
      collageid = shef.getString("collageId");
      firstname = shef.getString("name");
      middlename = shef.getString("middle");
      lastname = shef.getString("lastname");
      dateofbirth = shef.getString("dob");
      mobilenumber = shef.getString("mobilenumber");
      collagename = shef.getString("collagename");
      faculty = shef.getString("faculty");
      year = shef.getString("year");
      address = shef.getString("address");
      passworld = shef.getString("Passworld");
    });
  }

  File? image;
  Future PickImageImag(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      print( "address : + $address"  );
      if (image == null) return;
      final imageTemporary = File(image.path);
      imageData = base64Encode(imageTemporary.readAsBytesSync());

      print(" image path nilesh  " + imageData);

      setState(() {});
      this.image = imageTemporary;
    } on PlatformException catch (e) {
      print('Failed to pick image $e');
    }
  }

  Registeracall() async {
    // ignore: unused_local_variable

    Map<String, dynamic> data = {
      "STUDENT_ID": prnnumber,
      "FIRST_NAME": firstname,
      "MIDDEL_NAME": middlename,
      "LAST_NAME": lastname,
      "PRN_NUMBER": token,
      "PASSWORD": "",
      "COLLAGE_ID": collageid,
      "EMAIL_ID": email,
      "MOBILE_NUMBER": mobilenumber,
      "BATCH_YEAR": "",
      "FACULTY": faculty,
      "DOB": dateofbirth,
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
      Fluttertoast.showToast(
        msg: "${jsonResponse["ResponseMessage"]}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 13.0,
      );
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
                  padding: const EdgeInsets.all(15.0),
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

                              if (imageData != images) {
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      height: 45,
                    ),
                    Textlabels(
                      textlable: "PRN No",
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: HexColor('#074372'), width: 1),
                            //  color: Colors.red,
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Text(
                                  "$token",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 17),
                                ),
                              ],
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Textlabels(
                      textlable: "First Name *",
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: HexColor('#074372'), width: 1),
                            //  color: Colors.red,
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  "$firstname",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 17),
                                ),
                              ],
                            )),
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
                            border: Border.all(
                                color: HexColor('#074372'), width: 1),
                            //  color: Colors.red,
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  "$middlename",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 17),
                                ),
                              ],
                            )),
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
                            border: Border.all(
                                color: HexColor('#074372'), width: 1),
                            //  color: Colors.red,
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  "$lastname",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 17),
                                ),
                              ],
                            )),
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
                            border: Border.all(
                                color: HexColor('#074372'), width: 1),
                            //  color: Colors.red,
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  "$dateofbirth",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 17),
                                ),
                              ],
                            )),
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
                            border: Border.all(
                                color: HexColor('#074372'), width: 1),
                            //  color: Colors.red,
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  "$email",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 17),
                                ),
                              ],
                            )),
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
                            border: Border.all(
                                color: HexColor('#074372'), width: 1),
                            //  color: Colors.red,
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  "$mobilenumber",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 17),
                                ),
                              ],
                            )),
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
                            border: Border.all(
                                color: HexColor('#074372'), width: 1),
                            //  color: Colors.red,
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  "$collagename",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 17),
                                ),
                              ],
                            )),
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
                            border: Border.all(
                                color: HexColor('#074372'), width: 1),
                            //  color: Colors.red,
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                "$faculty",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 17),
                              ),
                            ],
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
                            border: Border.all(
                                color: HexColor('#074372'), width: 1),
                            //  color: Colors.red,
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                "$year",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        print(" prn Number : - $token");
                        print(" student id: - $prnnumber");
                        print(" student id: - $email");
                        print(" collage id: - $collageid");
                        print(" first name: - $firstname");
                        print(" middle name: - $middlename");
                        print(" last name: - $lastname");
                        print(" dateofbirth: - $dateofbirth");
                        print(" mobilenumber: - $mobilenumber");
                        print(" collagename: - $collagename");
                        print(" faculty: - $faculty");
                        print(" Profile - $images");
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
                    SizedBox(
                      height: 10,
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
