import 'dart:convert';
import 'dart:io';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DhanvantariYojna extends StatefulWidget {
  const DhanvantariYojna({super.key});

  @override
  State<DhanvantariYojna> createState() => _DhanvantariYojnaState();
}

class _DhanvantariYojnaState extends State<DhanvantariYojna> {
  bool _isLoading = false;
  String imagepath = "";
  String base64String = "";
  String imageData = "";
  File? image;
  String? token = "";
  String? prnnumber = "";
  String? email = "";
  String? collageId = "";
  String? StudentId = "";
  DateTime _dateTime = DateTime.now();
  DateTime? dateTiming;
  String? salectedDatebackundDevloper;
  bool isChecked = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  String yes1 = "";
  String yes2 = "";
  String yes3 = "";

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
      collageId = shef.getString("collageId");
    });
  }

  Future PickImageImag(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);

      if (image == null) return;
      final imageTemporary = File(image.path);
      imageData = base64Encode(imageTemporary.readAsBytesSync());
      print(imageData);
      setState(() {});
      this.image = imageTemporary;
    } on PlatformException catch (e) {
      print('Failed to pick image $e');
    }
  }

  void datetiming() async {
    dateTiming = await showDatePicker(
        context: context,
        initialDate: _dateTime,
        firstDate: DateTime(1800),
        lastDate: DateTime(2025));
    if (dateTiming == null) {
      return;
    } else {
      setState(() {
        _dateTime = dateTiming!;
        salectedDatebackundDevloper =
            "${_dateTime.day}/${_dateTime.month}/${_dateTime.year}";
        print("Date $salectedDatebackundDevloper");
      });
    }
  }

  final _fromkey = GlobalKey<FormState>();
  final collageNameController = TextEditingController();
  final fullNameController = TextEditingController();
  final MobileNumberController = TextEditingController();
  final emailIdController = TextEditingController();
  final fullAddressController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final currentClassCourceController = TextEditingController();
  final totalFeesPaidController = TextEditingController();
  final lastyearPercentageController = TextEditingController();
  final ParentsFullNameController = TextEditingController();
  final ParentsStudentRealtionController = TextEditingController();
  final parentsMobileNoController = TextEditingController();
  final parentsOccupationController = TextEditingController();
  final parentsYearlyIncomeController = TextEditingController();
  final ParentsOccupationController = TextEditingController();
  final StudentAdharNumberController = TextEditingController();
  final EducationLoanSchemeController = TextEditingController();
  final EducationLoanScheamYearController = TextEditingController();

  dhanvantariYojna() async {
    Map<String, dynamic> data = {
      "PRN_NUMBER": token,
      "TASK": "ADD",
      "COLLAGE_ID": collageId,
      "STUDENT_ID": prnnumber,
      "COLLAGE_NAME": collageNameController.text,
      "FULL_NAME": fullNameController.text,
      "MOBILE_NO": MobileNumberController.text,
      "EMAIL_ID": emailIdController.text,
      "FULL_ADDRESS": fullAddressController.text,
      "DATE_OF_BIRTH": salectedDatebackundDevloper.toString(),
      "CURRENT_CLASS_COURCE": currentClassCourceController.text,
      "TOTAL_FEES_PAID": totalFeesPaidController.text,
      "LASTYEAR_PERCENTAGE": lastyearPercentageController.text,
      "BELONGTO_BACKWARD_CLASS": yes1,
      "HANDICAP_YES_NO": yes2,
      "MAHARASHTRIAN_YES_NO": yes3,
      "PARENTS_FULL_NAME": ParentsFullNameController.text,
      "PARENTS_STUDENT_REALTION": ParentsStudentRealtionController.text,
      "PARENTS_MOBILE_NO": parentsMobileNoController.text,
      "PROFILE_IMAGE": imageData,
      "PARENTS_OCCUPATION": parentsOccupationController.text,
      "PARENTS_YEARLY_INCOME": parentsYearlyIncomeController.text,
      "PARENTS_OCCUPATION_ADDRESS": parentsOccupationController.text,
      "STUDENT_ADHAR_NUMBER": StudentAdharNumberController.text,
      "EDUCATION_LOAN_SCHEME": EducationLoanSchemeController.text,
      "EDUCATION_LOAN_SCHEAM_YEAR": EducationLoanScheamYearController.text,
      "EXTRA1": "sample string 24",
      "EXTRA2": "sample string 25"
    };

    // var jsonResponse = null;
    var response = await http.post(
        Uri.parse("https://muhsappapi.greemgoldfpc.com/api/DhanvantariYojana"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data));

    // print(response.body);
    var jsonResponse = json.decode(response.body);
    print(response.body);
    if (jsonResponse["ResponseCode"] == "0") {
      print("Student Prn Number : - $token");
      print("inputParamiters : --" + data.toString());

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("${jsonResponse["ResponseMessage"]}")));
      print(response.body);

//

      setState(() {
        _isLoading = true;
      });
    } else {
      print("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor('#074372'),
          leading: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "(सहपत्र 'अ')",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                )
              ],
            ),
            Center(
              child: Text(
                "महाराष्ट्र आरोग्य विज्ञान विद्यापीठ, नाशिक",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "नमुना अर्ज",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            Text("धन्वंतरी विद्याधन योजना",
                style: TextStyle(color: Colors.black, fontSize: 18)),
            SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            topLeft: Radius.circular(40))),
                    context: context,
                    builder: (BuildContext mContext) {
                      return Container(
                        height: 140,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () => PickImageImag(ImageSource.gallery),
                              child: Image.asset(
                                "assets/images/gallary.png",
                                height: 90,
                              ),
                            ),
                            InkWell(
                              onTap: () => PickImageImag(ImageSource.camera),
                              child: Image.asset(
                                "assets/images/c_Camera.png",
                                height: 45,
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              },
              child: Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                      border: Border.all(color: HexColor('#074372'), width: 1),
                      borderRadius: BorderRadius.circular(8)),
                  child: image != null
                      ? Image.file(
                          image!,
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        )
                      : null),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    "प्रति,\nमा. संचालक, विद्यार्थी कल्याण\n महाराष्ट्र आरोग्य विज्ञान विद्यापीठ, नाशिक..",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 1540,
                padding: EdgeInsets.all(8.0),
                child: Table(
                  columnWidths: {
                    0: FlexColumnWidth(1.5),
                    1: FlexColumnWidth(5),
                    2: FlexColumnWidth(4),
                  },
                  border: TableBorder.all(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(6)),
                  children: [
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 10),
                        child: Expanded(
                          child: Text(
                            'अ.क्र',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 10),
                        child: Center(
                          child: Text(
                            'तपशिले',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 10),
                        child: Center(
                          child: Text(
                            'माहिती ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ]),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 9),
                          child: Text(
                            '   १',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 9),
                          child: Text(
                            'महाविद्यालयाचे नाव व पत्ता',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: collageNameController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintStyle: TextStyle(
                                  color: Colors.black26, fontSize: 16),
                              border: InputBorder.none,
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required *"),
                            ]),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 9),
                          child: Text(
                            '   २',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 9),
                          child: Text(
                            'विद्यार्थ्याचे संपूर्ण नाव व पत्ता',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: fullNameController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintStyle: TextStyle(
                                  color: Colors.black26,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              border: InputBorder.none,
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required *"),
                            ]),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        // ignore: prefer_const_constructors
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 9),
                          child: Text(
                            '   ३',
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 7),
                          child: Text(
                            'मोबाईल नंबर / दुरध्वनी क्र. (STD) कोडसह',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: MobileNumberController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintStyle: TextStyle(
                                  color: Colors.black26,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              border: InputBorder.none,
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required *"),
                            ]),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        // ignore: prefer_const_constructors
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 9),
                          child: Text(
                            '   ४',
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 7),
                          child: Text(
                            'इमेल आयडी (मउंपस)',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: emailIdController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintStyle: TextStyle(
                                  color: Colors.black26,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              border: InputBorder.none,
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required *"),
                            ]),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        // ignore: prefer_const_constructors
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 9),
                          child: Text(
                            '   ५',
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 7),
                          child: Text(
                            'विद्यार्थ्याचा कायम निवासी पत्ता',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: fullAddressController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintStyle: TextStyle(
                                  color: Colors.black26,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              border: InputBorder.none,
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required *"),
                            ]),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        // ignore: prefer_const_constructors
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 9),
                          child: Text(
                            '   ६',
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 7),
                          child: Text(
                            'जन्म तारीख व वय',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 8),
                          child: InkWell(
                            onTap: datetiming,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                dateTiming == null
                                    ? Text("")
                                    : Text("$salectedDatebackundDevloper"),
                                Icon(Icons.calendar_month),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        // ignore: prefer_const_constructors
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 9),
                          child: Text(
                            '   ७',
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 7),
                          child: Text(
                            'सध्या शिकत असलेला वर्ग आणि कोर्स',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: currentClassCourceController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintStyle: TextStyle(
                                  color: Colors.black26,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              border: InputBorder.none,
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required *"),
                            ]),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        // ignore: prefer_const_constructors
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 9),
                          child: Text(
                            '   ८',
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 7),
                          child: Text(
                            'सध्या शिकत असलेला वर्ग आणि कोर्स महाविद्यालयात शिकत असलेल्या वर्गाचे आकारण्यात आलेले शैक्षणिक शुल्क',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: totalFeesPaidController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintStyle: TextStyle(
                                  color: Colors.black26,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              border: InputBorder.none,
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required *"),
                            ]),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        // ignore: prefer_const_constructors
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 9),
                          child: Text(
                            '   ९',
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 7),
                          child: Text(
                            'गतवर्षी उत्तीर्ण वर्ग व गुण (गुणपत्राची प्रत जोडावी)',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: lastyearPercentageController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintStyle: TextStyle(
                                  color: Colors.black26,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              border: InputBorder.none,
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required *"),
                            ]),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        // ignore: prefer_const_constructors
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 9),
                          child: Text(
                            '   १०',
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 7),
                          child: Text(
                            'मागासवर्गीय असल्यास प्रकार (होय असल्यास जातीच्या दाखल्याची प्रत जोडावी)',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                      value: isChecked,
                                      onChanged: (val) {
                                        setState(() {
                                          isChecked = val!;
                                          if (isChecked == true) {
                                            yes1 = "Yes";
                                          } else {
                                            yes1 = "No";
                                          }
                                        });
                                      }),
                                  Text(
                                    "हो/नाही",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 15),
                                  )
                                ],
                              ),
                              Text(
                                "वर्गवारी : ",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        // ignore: prefer_const_constructors
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 9),
                          child: Text(
                            '   ११',
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 7),
                          child: Text(
                            'शारिरीक अपंगत्व असल्यास(होय असल्यास अंपगत्वाच्या प्रमाणपत्राची प्रत जोडावी)',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Checkbox(
                                  focusColor: HexColor('#074372'),
                                  checkColor: Colors.white,
                                  value: isChecked2,
                                  onChanged: (val2) {
                                    setState(() {
                                      isChecked2 = val2!;
                                      if (isChecked2 == true) {
                                        yes2 = "Yes";
                                      } else {
                                        yes2 = "No";
                                      }
                                    });
                                  }),
                              Text(
                                "हो/नाही",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        // ignore: prefer_const_constructors
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 9),
                          child: Text(
                            '   १२',
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 7),
                          child: Text(
                            '(होय असल्यास अंपगत्वाच्या प्रमाणपत्राची प्रत जोडावी) विद्यार्थी महाराष्ट्राचा रहिवासी आहे काय ?',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Checkbox(
                                  focusColor: HexColor('#074372'),
                                  checkColor: Colors.white,
                                  value: isChecked3,
                                  onChanged: (val3) {
                                    setState(() {
                                      isChecked3 = val3!;
                                      if (isChecked3 == true) {
                                        yes3 = "Yes";
                                      } else {
                                        yes3 = "No";
                                      }
                                    });
                                  }),
                              Text(
                                "हो/नाही",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        // ignore: prefer_const_constructors
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 9),
                          child: Text(
                            '   १३',
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 7),
                          child: Text(
                            'पालकांचे संपूर्ण नाव',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: ParentsFullNameController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintStyle: TextStyle(
                                  color: Colors.black26,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              border: InputBorder.none,
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required *"),
                            ]),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        // ignore: prefer_const_constructors
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 9),
                          child: Text(
                            '   १४',
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 7),
                          child: Text(
                            'पालकांशी विद्यार्थ्यांचे नाते',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: ParentsStudentRealtionController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintStyle: TextStyle(
                                  color: Colors.black26,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              border: InputBorder.none,
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required *"),
                            ]),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        // ignore: prefer_const_constructors
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 9),
                          child: Text(
                            '   १५',
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 7),
                          child: Text(
                            'पालकांचा संपूर्ण पत्ता व दुरध्वनी क्र. (STD) कोडसह / मोबाईल क्रमांक :',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: parentsMobileNoController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintStyle: TextStyle(
                                  color: Colors.black26,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              border: InputBorder.none,
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required *"),
                            ]),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        // ignore: prefer_const_constructors
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 9),
                          child: Text(
                            '   १६',
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 7),
                          child: Text(
                            'पालकांचा व्यवसाय / नोकरी',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: parentsOccupationController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintStyle: TextStyle(
                                  color: Colors.black26,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              border: InputBorder.none,
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required *"),
                            ]),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        // ignore: prefer_const_constructors
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 9),
                          child: Text(
                            '   १७',
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 7),
                          child: Text(
                            'पालकांचे वार्षिक उत्पन्न (तहसीलदार यांनी दिलेला उत्पन्नाचा स्वसाक्षांकीत दाखला सोबत जोडावा.)',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: parentsYearlyIncomeController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintStyle: TextStyle(
                                  color: Colors.black26,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              border: InputBorder.none,
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required *"),
                            ]),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        // ignore: prefer_const_constructors
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 9),
                          child: Text(
                            '   १८',
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 7),
                          child: Text(
                            'पालकांची नोकरी / व्यवसायाचा पत्ता',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: parentsOccupationController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintStyle: TextStyle(
                                  color: Colors.black26,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              border: InputBorder.none,
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required *"),
                            ]),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        // ignore: prefer_const_constructors
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 9),
                          child: Text(
                            '१९',
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 7),
                          child: Text(
                            'विद्यार्थ्याच्या आधारकार्डचा नंबर नमूद करावा (आधारकार्डची स्वसाक्षांकीत प्रत जोडणे अनिवार्य)',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: StudentAdharNumberController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintStyle: TextStyle(
                                  color: Colors.black26,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              border: InputBorder.none,
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required *"),
                            ]),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        // ignore: prefer_const_constructors
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 9),
                          child: Text(
                            '२०',
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 7),
                          child: Text(
                            'महाराष्ट्र शासनातर्फे राबविलेली जात असलेली (Education Loan Subsidy Scheme) sterfuch कर्ज व्याज अनुदान सवलत घेणा-या विद्यार्थ्यांना मिळणा-या सवलतीचा तपशिल नमुद करण्यात यावा.',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: EducationLoanSchemeController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintStyle: TextStyle(
                                  color: Colors.black26,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              border: InputBorder.none,
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required *"),
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Center(
                  child: Text(
                "विद्यापीठाच्या धन्वंतरी विद्याधन योजनेनुसार उपलब्ध असलेल्या शैक्षणिक कर्जावरील व्याज रकमेचे अनुदान मिळावे म्हणून मी इच्छुक असून कृपया सदर योजनेचा लाभ मला मिळावा. तथापि मला सन",
                style: TextStyle(color: Colors.black, fontSize: 15),
              )),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
              child: Row(
                children: [
                  SizedBox(
                    height: 12,
                    width: 70,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: EducationLoanScheamYearController,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        //pcontentPadding: EdgeInsets.all(2.0),
                        hintStyle: TextStyle(
                            color: Colors.black26,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      validator: MultiValidator([
                        RequiredValidator(errorText: "Required *"),
                      ]),
                    ),
                  ),
                  Text(
                    "(वर्ष नमुद करावे) या शैक्षणिक वर्षामध्ये या\n  योजनेचा लाभ मिळालेला आहे / नाही.",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "             धन्वंतरी विद्याधन योजनेच्या सर्व अटी व शर्ती जाणून घेतल्या आहेत व त्यांचे पालन करणे माझेवर बंधनकारक राहील हे मी मान्य करतो / करते..",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "सदर योजनेचा लाभ घेण्यासाठी, योजनेबाबत असलेल्या सर्व नियमांचे मी पालन करीन. या संदर्भात नियमात बदल करण्याचे सर्व हक्क विद्यापीठाकडे असतील तसेच सदर अनुदान हे विद्यापीठ निधीतून मिळत असून तो माझा हक्क",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "      नाही याची मला जाणीव आहे. मी असे जाहीर करतो / करते की, सदर अर्जात नमुद केलेली माहीती खरी आहे. नमुद केलेली माहिती खोटी असल्यास / तफावत आढळल्यास मी योग्य त्या शिस्तभंगाच्या कार्यवाहीस पात्र असेन.",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "मी असे प्रमाणित करतो / करते की, सदर विद्यार्थ्यांस महाराष्ट्र शासनाकडून व्याज अनुदान सवलत मिळत नाही/मिळणार नाही.",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () {
                  dhanvantariYojna();
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: HexColor('#074372'),
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                      child: Text(
                    "Continue",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 23),
                  )),
                ),
              ),
            ),
          ],
        )));
  }
}
