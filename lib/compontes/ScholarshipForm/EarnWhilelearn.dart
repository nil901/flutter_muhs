import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EarnWhileLearn extends StatefulWidget {
  const EarnWhileLearn({super.key});

  @override
  State<EarnWhileLearn> createState() => _EarnWhileLearnState();
}

class _EarnWhileLearnState extends State<EarnWhileLearn> {
  bool _isLoading = false;
  String imagepath = "";
  String base64String = "";
  String imageData = "";
  String? token = "";
  String? prnnumber = "";
  String? email = "";
  String? collageId = "";
  String? StudentId = "";
  bool isChecked = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  String yes1 = "";
  String yes2 = "";
  String yes3 = "";
  String yes4 = "";

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

  DateTime _dateTime = DateTime.now();
  DateTime? dateTiming;
  String? salectedDatebackundDevloper;
  final _fromkey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final CollageNameController = TextEditingController();
  final fullAddressController = TextEditingController();
  final mobilNoController = TextEditingController();
  final emailController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final currentClassCourceController = TextEditingController();
  final lastpercentageController = TextEditingController();
  final parentsFullNameController = TextEditingController();
  final parentsOccupationController = TextEditingController();
  final totalYearIncomeController = TextEditingController();
  final choiseWork1Controller = TextEditingController();
  final choiseWork2Controller = TextEditingController();
  final choiseWork3Controller = TextEditingController();
  final totalHourestimeStudyController = TextEditingController();
  final castController = TextEditingController();
  final subCastController = TextEditingController();
  final studentAdharcardNumberController = TextEditingController();
  final namunaApplicationYesNoController = TextEditingController();
  final namunaApplicationPnumberController = TextEditingController();
  final lastYearMarsheetYesNoController = TextEditingController();
  final incomeCertificateYesController = TextEditingController();
  final adharCardYesNoController = TextEditingController();
  final adharCardmubberController = TextEditingController();
  final lastyearMarksheetPnumberController = TextEditingController();
  final incomeCertificatePnumberController = TextEditingController();
  final adharcardPnumberController = TextEditingController();

  void datetiming() async {
    dateTiming = await showDatePicker(
        context: context,
        initialDate: _dateTime,
        firstDate: DateTime(2000),
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

  File? image;
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

  earnWhileLearn() async {
    Map<String, dynamic> data = {
      "PRN_NUMBER": token,
      "TASK": "ADD",
      "FULL_NAME": fullNameController.text,
      "COLLAGE_ID": collageId,
      "STUDENT_ID": prnnumber,
      "COLLAGE_NAME": CollageNameController.text,
      "FULL_ADDRESS": fullAddressController.text,
      "MOBILE_NO": mobilNoController.text,
      "EMAIL_ID": emailController.text,
      "DATE_OF_BIRTH": salectedDatebackundDevloper.toString(),
      "CURRENT_CLASS_COURCE": currentClassCourceController.text,
      "LASTYEAR_PERCENTAGE": lastpercentageController.text,
      "PASSPORT_IMAGE": imageData,
      "PARENTS_FULL_NAME": parentsFullNameController.text,
      "PARENTS_OCCUPATION": parentsOccupationController.text,
      "TOTAL_YEAR_INCOME": totalYearIncomeController.text,
      "CHOISE_WORK_1": choiseWork1Controller.text,
      "CHOISE_WORK_2": choiseWork2Controller.text,
      "CHOISE_WORK_3": choiseWork3Controller.text,
      "TOTAL_HOUREStIME_STUDY": totalHourestimeStudyController.text,
      "CAST": castController.text,
      "SUBCAST": subCastController.text,
      "STUDENT_ADHARCARD_NUMBER": studentAdharcardNumberController.text,
      "NAMUNA_APPLICATION_YES_NO": yes1,
      "LASTYEAR_MARKSHEET_YES_NO": yes2,
      "INCOME_CERTIFICATE_YES_NO": yes3,
      "ADHARCARD_YES_NO": yes4,
      "NAMUNA_APPLICATION_PNUMBER": namunaApplicationPnumberController.text,
      "LASTYEAR_MARKSHEET_PNUMBER": lastyearMarksheetPnumberController.text,
      "INCOME_CERTIFICATE_PNUMBER": incomeCertificatePnumberController.text,
      "ADHARCARD_PNUMBER": adharcardPnumberController.text,
      "EXTRA1": "sample string 29",
      "EXTRA2": "sample string 30"
    };

    // var jsonResponse = null;
    var response = await http.post(
        Uri.parse("https://muhsappapi.greemgoldfpc.com/api/EarnWhileLearn"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data));

    // print(response.body);
    var jsonResponse = json.decode(response.body);
    print(response.body);
    if (jsonResponse["ResponseCode"] == "0") {
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
        child: Form(
          key: _fromkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "'???????????? ??? ????????????' ????????????????????????????????? ??????????????????",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
              Center(
                child: Text("??????????????????????????????????????? ????????????????????????????????????????????? ???????????????????????? ??????????????? ????????????",
                    style: TextStyle(color: Colors.black, fontSize: 18)),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: InkWell(
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
                                  onTap: () =>
                                      PickImageImag(ImageSource.gallery),
                                  child: Image.asset(
                                    "assets/images/gallary.png",
                                    height: 90,
                                  ),
                                ),
                                InkWell(
                                  onTap: () =>
                                      PickImageImag(ImageSource.camera),
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
                          border:
                              Border.all(color: HexColor('#074372'), width: 1),
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
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "???. ?????????????????????????????????????????? ????????????????????? ?????????",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              SizedBox(height: 3),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
                child: Center(
                    child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: HexColor('#074372'),
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            controller: fullNameController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintText: '',
                              contentPadding: EdgeInsets.all(2.0),
                              hintStyle: TextStyle(
                                  color: Colors.black26, fontSize: 16),
                              border: InputBorder.none,
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required *"),
                            ]),
                          ),
                        ))),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "???. ???????????? ???????????????????????? ?????????????????????????????????????????? ?????????",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              SizedBox(height: 3),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
                child: Center(
                    child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: HexColor('#074372'),
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            controller: CollageNameController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintText: '',
                              contentPadding: EdgeInsets.all(2.0),
                              hintStyle: TextStyle(
                                  color: Colors.black26, fontSize: 16),
                              border: InputBorder.none,
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required *"),
                            ]),
                          ),
                        ))),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "???. ?????????????????????????????????????????? ???????????? ?????????????????? ???????????????:",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              SizedBox(height: 3),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
                child: Center(
                    child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: HexColor('#074372'),
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            controller: fullAddressController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintText: '',
                              contentPadding: EdgeInsets.all(2.0),
                              hintStyle: TextStyle(
                                  color: Colors.black26, fontSize: 16),
                              border: InputBorder.none,
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required *"),
                            ]),
                          ),
                        ))),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "???. ?????????????????? ???????????? / ???????????????????????? ?????????. (STD) ??????????????????",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              SizedBox(height: 3),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
                child: Center(
                    child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: HexColor('#074372'),
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            controller: mobilNoController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintText: '',
                              contentPadding: EdgeInsets.all(2.0),
                              hintStyle: TextStyle(
                                  color: Colors.black26, fontSize: 16),
                              border: InputBorder.none,
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required *"),
                            ]),
                          ),
                        ))),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "???. ???????????? ????????????:",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              SizedBox(height: 3),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
                child: Center(
                    child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: HexColor('#074372'),
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            controller: emailController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintText: '',
                              contentPadding: EdgeInsets.all(2.0),
                              hintStyle: TextStyle(
                                  color: Colors.black26, fontSize: 16),
                              border: InputBorder.none,
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required *"),
                            ]),
                          ),
                        ))),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "???. ???????????? ???????????????:",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              SizedBox(height: 3),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
                child: Center(
                  child: InkWell(
                    onTap: datetiming,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: HexColor('#074372'),
                          ),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
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
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "???. ??????????????? ???????????? ?????????????????? ???????????? ????????? ???????????????:",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              SizedBox(height: 3),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
                child: Center(
                    child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: HexColor('#074372'),
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            controller: currentClassCourceController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintText: '',
                              contentPadding: EdgeInsets.all(2.0),
                              hintStyle: TextStyle(
                                  color: Colors.black26, fontSize: 16),
                              border: InputBorder.none,
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required *"),
                            ]),
                          ),
                        ))),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "???. ?????????????????????????????? ???????????????????????? ???????????????????????? ???????????????????????? ???????????? ????????? ??? ??????????????????????????? (%)",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              SizedBox(height: 3),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
                child: Center(
                    child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: HexColor('#074372'),
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            controller: lastpercentageController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintText: '',
                              contentPadding: EdgeInsets.all(2.0),
                              hintStyle: TextStyle(
                                  color: Colors.black26, fontSize: 16),
                              border: InputBorder.none,
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required *"),
                            ]),
                          ),
                        ))),
              ),
              Center(
                child: Text(
                  "(????????????????????????????????? ???????????????????????????????????? ??????????????????????????????????????? ???????????? ???????????? ??????????????????.)",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "???. ????????????????????????/???????????????????????? ????????????????????? ????????? ???????????? / ????????????????????????",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              SizedBox(height: 3),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
                child: Center(
                    child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: HexColor('#074372'),
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            controller: parentsFullNameController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintText: '',
                              contentPadding: EdgeInsets.all(2.0),
                              hintStyle: TextStyle(
                                  color: Colors.black26, fontSize: 16),
                              border: InputBorder.none,
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required *"),
                            ]),
                          ),
                        ))),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "??????. ??????????????? / ?????????????????????",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              SizedBox(height: 3),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
                child: Center(
                    child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: HexColor('#074372'),
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            controller: parentsOccupationController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintText: '',
                              contentPadding: EdgeInsets.all(2.0),
                              hintStyle: TextStyle(
                                  color: Colors.black26, fontSize: 16),
                              border: InputBorder.none,
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required *"),
                            ]),
                          ),
                        ))),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "??????. ????????????????????? ????????????????????? ????????????????????? ??????",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              SizedBox(height: 3),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
                child: Center(
                    child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: HexColor('#074372'),
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            controller: totalYearIncomeController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintText: '',
                              contentPadding: EdgeInsets.all(2.0),
                              hintStyle: TextStyle(
                                  color: Colors.black26, fontSize: 16),
                              border: InputBorder.none,
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required *"),
                            ]),
                          ),
                        ))),
              ),
              Center(
                child: Text(
                  "(???????????????????????????????????? ???????????????????????? ?????????????????????????????? ??????????????? ???????????????????????????????????????\n ???????????? ??????????????????.)",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "??????. ??????????????? ????????? ?????????????????? ?????????",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              SizedBox(height: 3),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 2),
                child: Center(
                  child: Row(
                    children: [
                      Text(
                        "???)",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 40,
                        width: 250,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: HexColor('#074372'),
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            controller: choiseWork1Controller,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintText: '',
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
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 2),
                child: Center(
                  child: Row(
                    children: [
                      Text(
                        "???)",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 40,
                        width: 250,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: HexColor('#074372'),
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            controller: choiseWork2Controller,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintText: '',
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
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 2),
                child: Center(
                  child: Row(
                    children: [
                      Text(
                        "???)",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 40,
                        width: 250,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: HexColor('#074372'),
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            controller: choiseWork3Controller,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintText: '',
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
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "??????. ?????????????????? ?????????????????? ?????????????????????",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              SizedBox(height: 3),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
                child: Center(
                    child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: HexColor('#074372'),
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            controller: totalHourestimeStudyController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintText: '',
                              contentPadding: EdgeInsets.all(2.0),
                              hintStyle: TextStyle(
                                  color: Colors.black26, fontSize: 16),
                              border: InputBorder.none,
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required *"),
                            ]),
                          ),
                        ))),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "??????. ??????????????? ?????????????????? ????????????????????? ??????????????????",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              SizedBox(height: 3),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
                child: Center(
                    child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: HexColor('#074372'),
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            controller: castController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintText: '',
                              contentPadding: EdgeInsets.all(2.0),
                              hintStyle: TextStyle(
                                  color: Colors.black26, fontSize: 16),
                              border: InputBorder.none,
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required *"),
                            ]),
                          ),
                        ))),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 27, vertical: 2),
                child: Center(
                  child: Row(
                    children: [
                      Text(
                        "?????????????????????",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 40,
                        width: 250,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: HexColor('#074372'),
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            controller: subCastController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintText: '',
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
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "??????. ????????????????????????????????????????????? ??????????????????????????? ????????????",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              SizedBox(height: 3),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
                child: Center(
                    child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: HexColor('#074372'),
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            controller: studentAdharcardNumberController,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintText: '',
                              contentPadding: EdgeInsets.all(2.0),
                              hintStyle: TextStyle(
                                  color: Colors.black26, fontSize: 16),
                              border: InputBorder.none,
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required *"),
                            ]),
                          ),
                        ))),
              ),
              Center(
                child: Text(
                  "((??????????????????????????? ??????????????????????????????????????? ???????????? ???????????? ??????????????? ???????????????????????? ))",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "??????. ??????????????????????????? ?????????, ???????????????, ???????????????, ?????????????????? ????????????????????? ?????????????????? ????????????   ???????????????????????? ?????? ???????????? ???????????? ??? ?????????????????? ???????????????????????? ???????????????????????? ????????? ????????? ??????????????? ???????????? ????????? ?????? ????????? ????????????/????????????.",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "?????? ???????????? ?????????????????? ???????????? ?????????????????? ????????? ?????????.",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "??????????????? ??????????????????????????? ????????? ??? ???????????????????????????",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Text(
                  "(????????? ?????????????????????????????? ???????????? ??? ???????????? ???????????? ??????????????????????????? ?????????????????? ??????????????????\n                                     ????????? ?????????. ))",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "?????????????????????????????????????????? ??????????????????",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  Text(
                    "??????????????????????????? / ???????????????????????????????????? ?????????",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ],
              ),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 420,
                  color: Colors.transparent,
                  padding: EdgeInsets.all(8.0),
                  child: Table(
                    columnWidths: {
                      0: FlexColumnWidth(1.2),
                      1: FlexColumnWidth(3),
                      2: FlexColumnWidth(1),
                      3: FlexColumnWidth(1),
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
                              '???????????? ???????????????????????? ???????????????????????????',
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
                              '????????? / ???????????? ',
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
                              '??????????????? ????????? ',
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
                              '???????????????????????????????????? ?????????????????? ???????????? ?????????????????? ?????????????????? ????????? (??????????????? ???????????? ) ???????????????????????? ???????????? ????????? ????????? ?',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Checkbox(
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
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: SizedBox(
                              height: 50,
                              width: 30,
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: namunaApplicationPnumberController,
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(2.0),
                                  hintStyle: TextStyle(
                                      color: Colors.black26, fontSize: 16),
                                ),
                                validator: MultiValidator([
                                  RequiredValidator(errorText: "Required *"),
                                ]),
                              ),
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
                              '???????????????????????? ???????????????????????? ???????????????????????? ????????????????????????????????? ??????????????????????????????????????? ???????????? ??????????????? ????????? ????????? ?',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Checkbox(
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
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: lastyearMarksheetPnumberController,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(2.0),
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
                              '??????????????????????????? ???????????????????????????????????? ??????????????????????????? ??????????????????????????????????????? ???????????? (?????????????????? ???????????? ????????????-??????) ??????????????? ????????? ????????? ? (???????????? ???????????????????????? ????????????????????????????????? ???????????????)',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Checkbox(
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
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: incomeCertificatePnumberController,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(2.0),
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
                              '???????????? ??????????????? ?????? ??????????????????????????????????????? ????????????',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Checkbox(
                                value: isChecked4,
                                onChanged: (val4) {
                                  setState(() {
                                    isChecked4 = val4!;
                                    if (isChecked4 == true) {
                                      yes4 = "Yes";
                                    } else {
                                      yes4 = "No";
                                    }
                                  });
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: adharcardPnumberController,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(2.0),
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
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Center(
                  child: Text(
                    "????????? :- ?????????????????????????????????????????? ???????????????????????????????????? ????????????????????? ????????????????????? ?????????????????? ???????????? ????????????????????? ???????????????????????? ?????????????????? ????????????????????????????????????????????? ?????????????????????????????? ???????????? ???????????? ??????????????????.",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("College Clerk'\n  Mobile No",
                      style: TextStyle(color: Colors.black, fontSize: 15)),
                  Column(
                    children: [
                      Text("Dean/Principal",
                          style: TextStyle(color: Colors.black, fontSize: 15)),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Text("",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                  Column(
                    children: [
                      Text("(Name, Signature & Stamp)",
                          style: TextStyle(color: Colors.black, fontSize: 15)),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: InkWell(
                  onTap: () {
                    if (_fromkey.currentState!.validate()) {
                      earnWhileLearn();
                      setState(() {});
                    } else {
                      print("not submitted");
                    }
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
          ),
        ),
      ),
    );
  }
}
