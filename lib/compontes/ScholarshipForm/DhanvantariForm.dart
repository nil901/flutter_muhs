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
                    "(?????????????????? '???')",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                )
              ],
            ),
            Center(
              child: Text(
                "?????????????????????????????? ?????????????????? ????????????????????? ???????????????????????????, ???????????????",
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
              "??????????????? ????????????",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            Text("???????????????????????? ???????????????????????? ???????????????",
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
                    "???????????????,\n??????. ??????????????????, ?????????????????????????????? ??????????????????\n ?????????????????????????????? ?????????????????? ????????????????????? ???????????????????????????, ???????????????..",
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
                height: 1580,
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
                            '???.?????????',
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
                            '??????????????????',
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
                            '?????????????????? ',
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
                            '   ???',
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
                            '?????????????????????????????????????????? ????????? ??? ???????????????',
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
                            '   ???',
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
                            '?????????????????????????????????????????? ????????????????????? ????????? ??? ???????????????',
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
                            '   ???',
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
                            '?????????????????? ???????????? / ???????????????????????? ?????????. (STD) ???????????????',
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
                            '   ???',
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
                            '???????????? ???????????? (???????????????)',
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
                            '   ???',
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
                            '?????????????????????????????????????????? ???????????? ?????????????????? ???????????????',
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
                            '   ???',
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
                            '???????????? ??????????????? ??? ??????',
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
                            '   ???',
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
                            '??????????????? ???????????? ?????????????????? ???????????? ????????? ???????????????',
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
                            '   ???',
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
                            '??????????????? ???????????? ?????????????????? ???????????? ????????? ??????????????? ??????????????????????????????????????? ???????????? ???????????????????????? ????????????????????? ??????????????????????????? ??????????????? ???????????????????????? ???????????????',
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
                            '   ???',
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
                            '????????????????????? ???????????????????????? ???????????? ??? ????????? (?????????????????????????????? ???????????? ??????????????????)',
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
                            '   ??????',
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
                            '????????????????????????????????? ????????????????????? ?????????????????? (????????? ????????????????????? ???????????????????????? ??????????????????????????? ???????????? ??????????????????)',
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
                                    "??????/????????????",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 15),
                                  )
                                ],
                              ),
                              Text(
                                "???????????????????????? : ",
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
                            '   ??????',
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
                            '????????????????????? ????????????????????? ?????????????????????(????????? ????????????????????? ???????????????????????????????????? ??????????????????????????????????????? ???????????? ??????????????????)',
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
                                "??????/????????????",
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
                            '   ??????',
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
                            '(????????? ????????????????????? ???????????????????????????????????? ??????????????????????????????????????? ???????????? ??????????????????) ?????????????????????????????? ??????????????????????????????????????? ????????????????????? ????????? ????????? ?',
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
                                "??????/????????????",
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
                            '   ??????',
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
                            '???????????????????????? ????????????????????? ?????????',
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
                            '   ??????',
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
                            '???????????????????????? ????????????????????????????????????????????? ????????????',
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
                            '   ??????',
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
                            '???????????????????????? ????????????????????? ??????????????? ??? ???????????????????????? ?????????. (STD) ??????????????? / ?????????????????? ????????????????????? :',
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
                            '   ??????',
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
                            '???????????????????????? ????????????????????? / ???????????????',
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
                            '   ??????',
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
                            '???????????????????????? ????????????????????? ????????????????????? (???????????????????????? ??????????????? ?????????????????? ?????????????????????????????? ??????????????????????????????????????? ??????????????? ???????????? ??????????????????.)',
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
                            '   ??????',
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
                            '???????????????????????? ??????????????? / ?????????????????????????????? ???????????????',
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
                            '??????',
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
                            '???????????????????????????????????????????????? ????????????????????????????????? ???????????? ???????????? ??????????????? (????????????????????????????????? ??????????????????????????????????????? ???????????? ??????????????? ????????????????????????)',
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
                            '??????',
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
                            '?????????????????????????????? ?????????????????????????????? ??????????????????????????? ????????? ?????????????????? (Education Loan Subsidy Scheme) sterfuch ???????????? ??????????????? ?????????????????? ???????????? ????????????-?????? ????????????????????????????????????????????? ???????????????-?????? ????????????????????? ??????????????? ???????????? ????????????????????? ????????????.',
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
                "?????????????????????????????????????????? ???????????????????????? ???????????????????????? ?????????????????????????????? ?????????????????? ???????????????????????? ???????????????????????? ??????????????????????????? ??????????????? ?????????????????? ?????????????????? ?????????????????? ?????????????????? ?????? ?????????????????? ???????????? ??????????????? ????????? ????????????????????? ????????? ????????? ??????????????????. ??????????????? ????????? ??????",
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
                    "(???????????? ???????????? ???????????????) ?????? ???????????????????????? ?????????????????????????????? ??????\n  ????????????????????? ????????? ???????????????????????? ????????? / ????????????.",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "             ???????????????????????? ???????????????????????? ??????????????????????????? ???????????? ????????? ??? ??????????????? ??????????????? ????????????????????? ???????????? ??? ????????????????????? ???????????? ???????????? ?????????????????? ???????????????????????? ??????????????? ?????? ?????? ??????????????? ???????????? / ????????????..",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "????????? ????????????????????? ????????? ??????????????????????????????, ??????????????????????????? ???????????????????????? ???????????? ???????????????????????? ?????? ???????????? ????????????. ?????? ???????????????????????? ?????????????????? ????????? ???????????????????????? ???????????? ???????????? ??????????????????????????????????????? ??????????????? ???????????? ????????? ?????????????????? ?????? ??????????????????????????? ????????????????????? ???????????? ???????????? ?????? ???????????? ????????????",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "      ???????????? ???????????? ????????? ??????????????? ?????????. ?????? ????????? ??????????????? ???????????? / ???????????? ??????, ????????? ?????????????????? ???????????? ?????????????????? ?????????????????? ????????? ?????????. ???????????? ?????????????????? ?????????????????? ???????????? ????????????????????? / ??????????????? ???????????????????????? ?????? ??????????????? ???????????? ??????????????????????????????????????? ?????????????????????????????? ??????????????? ????????????.",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "?????? ????????? ???????????????????????? ???????????? / ???????????? ??????, ????????? ?????????????????????????????????????????? ?????????????????????????????? ??????????????????????????? ??????????????? ?????????????????? ???????????? ???????????? ????????????/?????????????????? ????????????.",
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
