import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_muhs/compontes/GrievanceRedressal.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SanjivaniVidhyarthiSurakshaYojna extends StatefulWidget {
  const SanjivaniVidhyarthiSurakshaYojna({super.key});

  @override
  State<SanjivaniVidhyarthiSurakshaYojna> createState() =>
      _SanjivaniVidhyarthiSurakshaYojnaState();
}

class _SanjivaniVidhyarthiSurakshaYojnaState
    extends State<SanjivaniVidhyarthiSurakshaYojna> {
  bool _isLoading = false;
  String? token = "";
  String? prnnumber = "";
  String? email = "";
  String? collageId = "";
  String? StudentId = "";

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

  final _fromkey = GlobalKey<FormState>();
  final prnController = TextEditingController();
  final applicantFullName = TextEditingController();
  final applicantFullAddress = TextEditingController();
  final applicantMobileNumber = TextEditingController();
  final applicantOcupation = TextEditingController();
  final applicantFStudentConnectionController = TextEditingController();
  final applicantFullNameBankController = TextEditingController();
  final applicantBankNameController = TextEditingController();
  final applicantsBankAddressController = TextEditingController();
  final applicantBankAccNoController = TextEditingController();
  final studentFullNameController = TextEditingController();
  final applicant_bank_ifsc_code = TextEditingController();
  final studentCollageNameController = TextEditingController();
  final currentYearPatternController = TextEditingController();
  final accidentSpotTimeDateController = TextEditingController();
  final accidentCurrentSituationController = TextEditingController();
  final firDetailsController = TextEditingController();
  final civilHospitalNameController = TextEditingController();
  final witnessNameMobileNoController = TextEditingController();
  final varsahakkaPramanpatrNameController = TextEditingController();
  final varsahakkaPramanpatrAddressController = TextEditingController();
  final confirmationDateController = TextEditingController();
  final confirmationSpotController = TextEditingController();
  final addmitedHospitalController = TextEditingController();
  final totalHospitalController = TextEditingController();
  final HospitalNameController = TextEditingController();
  final handicapBodyPart = TextEditingController();
  final handicapPermaentTemp = TextEditingController();
  final totalAbsentDaysController = TextEditingController();
  final hospitalNameController = TextEditingController();
  final certStudentFullNameController = TextEditingController();
  final certStudentAgeController = TextEditingController();
  final certHandicapDescriptionController = TextEditingController();
  final certScratchBrforeAccident = TextEditingController();
  final certCheckupDateController = TextEditingController();
  final certAnyOtherIssueBaccidentController = TextEditingController();
  final certCurrentConditionController = TextEditingController();
  final certHadicapCerTificateIfyes = TextEditingController();
  final cartHandiCapBodyPartController = TextEditingController();

  sanjivaniVidhyarthiSurakshaYojna() async {
    Map<String, dynamic> data = {
      "PRN_NUMBER": prnController,
      "TASK": "ADD",
      "COLLAGE_ID": collageId,
      "STUDENT_ID": StudentId,
      "APPLICANT_FULL_NAME": applicantFullName.text,
      "APPLICANT_FULL_ADDRESS": applicantFullAddress.text,
      "APPLICANT_MOBILE_NO": applicantMobileNumber.text,
      "APPLICANT_OCCUPATION": applicantOcupation.text,
      "APPLICANT_STUDENT_CONNECTION":
          applicantFStudentConnectionController.text,
      "APPLICANTS_FULL_NAMEBANK": applicantFullNameBankController.text,
      "APPLICANT_BANKNAME_ADDRESS": applicantsBankAddressController.text,
      "APPLICANT_BANK_ACC_NO": applicantBankAccNoController.text,
      "PASSPORT_IMAGE": "",
      "APPLICANT_BANK_IFSC_CODE": applicant_bank_ifsc_code.text,
      "STUDENT_FULL_NAME": studentFullNameController.text,
      "STUDENT_COLLAGE_NAME": studentCollageNameController.text,
      "ADMISSION_DATE": collageOpenDateBacundDevloper.toString(),
      "CURRENT_YEAR_PATTERN": currentYearPatternController.text,
      "ACCIDENT_SPOT_TIME_DATE": accidentSpotTimeDateController.text,
      "ACCIDENT_CURRENT_SITUATION": accidentCurrentSituationController.text,
      "FIR_DETAILS": firDetailsController.text,
      "CIVIL_HOSPITAL_NAME": civilHospitalNameController.text,
      "WITNESS_NAME_MOBILENO": witnessNameMobileNoController.text,
      "VARSAHAKKA_PRAMANPATR_NAME": varsahakkaPramanpatrNameController.text,
      "VARSAHAKKA_PRAMANPATR_ADDRESS":
          varsahakkaPramanpatrAddressController.text,
      "CONFIRMATION_DATE": confirmationDateController.text,
      "CONFIRMATION_SPOT": confirmationSpotController.text,
      "ADDMITED_HOSPITAL_NAME": addmitedHospitalController.text,
      "TOTAL_HOSPITAL_EXPENCES": totalHospitalController.text,
      "HANDICAP_BODYPART": handicapBodyPart.text,
      "HANDICAP_PERMANENT_TEMP": handicapPermaentTemp.text,
      "ABSENT_FROM_DATE": salectedDatebackundDevloper.toString(),
      "ABSENT_TO_DATE": endsalectedDatebackundDevloper.toString(),
      "TOTAL_ABSENT_DAYS": totalAbsentDaysController.text,
      "HOSPITAL_NAME": hospitalNameController.text,
      "CERT_STUDENT_FULL_NAME": certStudentFullNameController.text,
      "CERT_STUDENT_AGE": certStudentAgeController.text,
      "CERT_HANDICAP_DESCRIPTION": certHandicapDescriptionController.text,
      "CERT_SCRATCH_BRFORE_ACCIDENT": certScratchBrforeAccident.text,
      "CERT_CHECKUP_DATE": datetimeBackandDevloper.toString(),
      "CERT_ANY_OTHER_ISSUE_BACCIDENT":
          certAnyOtherIssueBaccidentController.text,
      "CERT_CURRENT_CONDIITON": certCurrentConditionController.text,
      "CERT_HADICAP_CERTIFICATE_IFYES": certHadicapCerTificateIfyes.text,
      "CART_HANDICAP_BODYPART": cartHandiCapBodyPartController.text,
      "EXTRA1": "",
      "EXTRA2": ""
    };

    // var jsonResponse = null;
    var response = await http.post(
        Uri.parse("https://muhsappapi.greemgoldfpc.com/api/SanjivaniYojana"),
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
    }
  }

  DateTime _dateTime = DateTime.now();
  String? salectedDatebackundDevloper;
  String? endsalectedDatebackundDevloper;
  String? collageOpenDateBacundDevloper;
  String? datetimeBackandDevloper;
  DateTime? userSelectedDate;
  DateTime? enduserSelectedDate;
  DateTime? collageOpenDate;
  DateTime? dateTiming;

  void _showdate() async {
    userSelectedDate = await showDatePicker(
        context: context,
        initialDate: _dateTime,
        firstDate: DateTime(2000),
        lastDate: DateTime(2025));
    if (userSelectedDate == null) {
      return;
    } else {
      setState(() {
        _dateTime = userSelectedDate!;
        salectedDatebackundDevloper =
            "${_dateTime.day}/${_dateTime.month}/${_dateTime.year}";
        print("Date $salectedDatebackundDevloper");
      });
    }
  }

  void _endDate() async {
    enduserSelectedDate = await showDatePicker(
        context: context,
        initialDate: _dateTime,
        firstDate: DateTime(2000),
        lastDate: DateTime(2025));
    if (enduserSelectedDate == null) {
      return;
    } else {
      setState(() {
        _dateTime = enduserSelectedDate!;
        endsalectedDatebackundDevloper =
            "${_dateTime.day}/${_dateTime.month}/${_dateTime.year}";
        print("Date $endsalectedDatebackundDevloper");
      });
    }
  }

  void CollageOpenDate() async {
    collageOpenDate = await showDatePicker(
        context: context,
        initialDate: _dateTime,
        firstDate: DateTime(2000),
        lastDate: DateTime(2025));
    if (collageOpenDate == null) {
      return;
    } else {
      setState(() {
        _dateTime = collageOpenDate!;
        collageOpenDateBacundDevloper =
            "${_dateTime.day}/${_dateTime.month}/${_dateTime.year}";
        print("Date $collageOpenDateBacundDevloper");
      });
    }
  }

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
        datetimeBackandDevloper =
            "${_dateTime.day}/${_dateTime.month}/${_dateTime.year}";
        print("Date $datetimeBackandDevloper");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#074372'),
        leading: Icon(Icons.arrow_back),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _fromkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables ,
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                "?????????????????????????????? ?????????????????? ????????????????????? ???????????????????????????, ???????????????",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )),
              SizedBox(
                height: 8,
              ),
              Center(
                  child: Text(
                      "????????????????????? ?????????????????????????????? ????????????????????? ???????????????\n ??????????????? ??????????????? (CLAIM FORM)",
                      style: TextStyle(color: Colors.black, fontSize: 15))),
              SizedBox(
                height: 22,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Text(
                        "?????????????????????????????????????????? ??????????????????????????? ??????????????? ???????????? ??????????????? ????????????????????? ?????????????????????\n ?????????????????? ??????????????? ?????????????????????/????????????????????????/??????????????? ????????????????????? ????????? \n????????????????????????/ ???????????????????????????????????? ??????????????????????????????????????? ??????????????? ??????????????? ??????????????????.")
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "???) ???????????? ????????????????????? ?????????????????? :",
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
                // ignore: prefer_const_constructors
                child: Text(
                  "???) ????????????????????? ????????? :",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: applicantFullName,
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
                  "???) ??????????????? ??????????????? :",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: applicantFullAddress,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintText: '',
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
                  "???) ???????????????????????? ?????????. :",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: applicantMobileNumber,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintText: '',
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
                  "???) ????????????????????? :",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: applicantOcupation,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintText: '',
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
                  "???) ?????????????????????????????? ????????? ??????????????? ???????????? ?????? ???????????????????????????????????? ?????????????????? ????????????\n(??????, ????????????, ?????????, ???????????? ???. ):",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: applicantFStudentConnectionController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintText: '',
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
                  "???) ???????????? ????????????????????? ????????? ???????????????????????? ????????? :",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: applicantFullNameBankController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintText: '',
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
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "???????????????????????? ?????????????????? ????????? ??? ??????????????????",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: applicantBankNameController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintText: '',
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
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "????????? ???????????? ?????????",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: applicantBankAccNoController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintText: '',
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
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "????????? ??????.??????.??????. ?????????.",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: applicant_bank_ifsc_code,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintText: '',
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
                  "???) ??????????????? ????????????????????? ????????? ???????????????????????????/????????????????????? ????????? ???????????????????????????/\n??????????????? ???????????? ?????????????????? ?????????????????????????????????????????? ??????????????????",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: studentFullNameController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintText: '',
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
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "???) ?????????????????????????????????????????? ????????????????????? ????????? :",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: studentFullNameController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintText: '',
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
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "???) ?????????????????????????????????????????? ????????? :",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: studentCollageNameController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintText: '',
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
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "???) ??????????????????????????????????????? ?????????????????? ??????????????????????????? ?????????????????? :",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
                child: Center(
                    child: InkWell(
                  onTap: CollageOpenDate,
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
                              collageOpenDate == null
                                  ? Text("")
                                  : Text(
                                      "$collageOpenDateBacundDevloper",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15),
                                    ),
                              Icon(Icons.calendar_month)
                            ],
                          ))),
                )),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "???) ??????????????? ???????????? ?????????????????? ?????????????????????????????? ??? ???????????? :",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: currentYearPatternController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintText: '',
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
                  "???) ???????????????????????????????????????/???????????????????????????????????? ???????????????",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "???) ???????????????/??????????????? ????????????????????? ??? ????????????????????? ?????????????????? ???????????? (???????????????,\n????????? ??? ??????????????? ???????????? ???????????????) :",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: accidentSpotTimeDateController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintText: '',
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
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "???) ????????????????????????/????????????????????? ???????????? ????????? ????????????????????? ??????????????????\n?????????????????? :",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: accidentCurrentSituationController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintText: '',
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
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "???) ??????????????? ???????????????????????????????????? ??????????????? ??????????????? ???????????????????????? ???????????? ????????????\n ???????????????????????? ????????????????????? ??????????????? ???????????????????????? ????????? ???????????? ??????????????? ??? FIR ??????\n ?????????????????????????????? ???????????? ?????????????????? :",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: firDetailsController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintText: '',
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
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "???) ?????????????????????????????? ????????????????????? ?????????????????? ??????????????? ???????????? ??????, ????????? ?????????????????????????????????????????? ?????? ???????????????????????? ????????????????????? ????????????????????? ?????????????????? ????????????????????????????????? ????????? (?????? ???????????????????????? ???????????????????????? ?????????????????????????????? ???????????? ??? ?????????????????? ??????????????????????????????????????? ????????? ???????????? ??????????????????) :",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              SizedBox(
                height: 2,
              ),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: civilHospitalNameController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintText: '',
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
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "???) ???????????????????????????????????? ????????? ??? ?????????????????? ????????????. :",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: witnessNameMobileNoController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintText: '',
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
                  "???) ??????????????????????????? ?????????????????????????????? :",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "????????????????????????/??????????????? ????????????????????? ?????????????????? ???????????????????????? ??????????????????????????????????????????/??????????????????????????????????????????\n ????????????/??????/???????????? ???????????? ????????????????????? ?????????????????????????????? ????????????????????? ??????????????????????????????\n ??????????????????????????? ?????????????????????????????? ???????????????????????? ??????????????????/??????. ??????. ???????????? ????????????",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 2),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: varsahakkaPramanpatrNameController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintText: '',
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
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "???????????????",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 2),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: varsahakkaPramanpatrAddressController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintText: '',
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
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text("??????????????? ???????????? ??????????????????????????? ?????????????????????????????? ??????????????????."),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                      "?????? ????????? ???????????????????????? ???????????? ??????, ?????? ???????????? ?????????????????? ?????????????????? ???????????? ?????????.")),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "?????????????????? :",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 40,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: HexColor('#074372'),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: confirmationDateController,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(2.0),
                          hintText: '',
                          hintStyle:
                              TextStyle(color: Colors.black26, fontSize: 16),
                          border: InputBorder.none,
                        ),
                        validator: MultiValidator([
                          RequiredValidator(errorText: "Required *"),
                        ]),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "??????????????? :",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 40,
                    width: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: HexColor('#074372'),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: confirmationSpotController,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(2.0),
                          hintText: '',
                          hintStyle:
                              TextStyle(color: Colors.black26, fontSize: 16),
                          border: InputBorder.none,
                        ),
                        validator: MultiValidator([
                          RequiredValidator(errorText: "Required *"),
                        ]),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "???) ???????????????????????? ???????????????????????? ??????????????????",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "???) ?????????????????????????????? ??????????????? ????????? ???????????????????????? ????????????????????????????????? ????????? ??? ???????????????,\n?????????????????? ????????????????????? ??? ???????????????????????? ?????????????????????????????????/???????????????????????? ???????????????????????????????????????\n????????? :",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 2),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: addmitedHospitalController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintText: '',
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
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "???) ?????????????????????????????? ?????????????????? ???????????? (????????????????????? ????????? ??????????????? ????????????????????? ???????????? ??????????????????) :",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 2),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: totalHospitalController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintText: '',
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
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "???) ????????????????????? ????????????????????? ??????????????????",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "???) ?????????????????? ?????????????????? ???????????? (?????????. ?????????, ?????????, ???????????? ???.) :",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 2),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: handicapBodyPart,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintText: '',
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
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  "???) ???????????????????????????????????? ????????? ??? ?????????????????? ????????????. :",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 2),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: handicapPermaentTemp,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintText: '',
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
              Center(
                  child: Text(
                "???????????????/?????????????????? ?????????????????????/??????????????? ????????????\n?????????????????????????????? ?????????????????????????????????????????? ???????????????????????? ??????????????????????????????",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "?????? ????????? ???????????????????????? ???????????? ??????",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Row(
                  children: [
                    InkWell(
                        onTap: _showdate,
                        child: userSelectedDate == null
                            ? Text("??????. / /",
                                style: TextStyle(
                                    color: HexColor('#074372'), fontSize: 15))
                            : Text(
                                "$salectedDatebackundDevloper",
                                style: TextStyle(
                                    color: HexColor('#074372'), fontSize: 15),
                              )),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "?????? ",
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    InkWell(
                        onTap: _endDate,
                        child: enduserSelectedDate == null
                            ? Text("??????. / /",
                                style: TextStyle(
                                    color: HexColor('#074372'), fontSize: 15))
                            : Text(
                                "$endsalectedDatebackundDevloper",
                                style: TextStyle(
                                    color: HexColor('#074372'), fontSize: 15),
                              )),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text("????????? ????????????",
                        style: TextStyle(color: Colors.black, fontSize: 15)),
                    SizedBox(
                      width: 50.0,
                      height: 10,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: totalAbsentDaysController,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(1.0),
                          hintText: '',
                          hintStyle:
                              TextStyle(color: Colors.black26, fontSize: 16),
                        ),
                        validator: MultiValidator([
                          RequiredValidator(errorText: "Required *"),
                        ]),
                      ),
                    ),
                    Text(
                      "???????????? ??????????????????????????????/?????????????????? ????????????????????? \n ???????????????????????????/??????????????? ???????????????????????????",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: HexColor('#074372'),
                    ),
                  ),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: hospitalNameController,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(2.0),
                      hintText: '',
                      hintStyle: TextStyle(color: Colors.black26, fontSize: 16),
                      border: InputBorder.none,
                    ),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "Required *"),
                    ]),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Center(
                  child: Text(
                "?????? ?????????????????????????????? ??????????????? ????????? ????????????????????????, ??????????????????????????????????????? ?????????????????? ????????????/",
                style: TextStyle(color: Colors.black, fontSize: 15),
              )),
              SizedBox(
                height: 15,
              ),
              Center(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "??????????????????????????????????????? ????????????????????? ???????????? ???????????????????????? ??????????????????????????? ?????????????????? ????????????, ????????????\n/??????????????????????????? ?????????????????????????????? ??? ??????????????? ???????????????????????? ?????????????????? ????????????. ????????? ??????????????????????????????/??????????????????????????????????????? ??????????????????????????? ?????????????????????????????? ???????????????????????? ???????????????????????? ????????????????????? ????????????????????????????????? ?????????????????????????????? ?????????????????? ????????? ?????????.",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          child: Image.asset("assets/images/stamp.png"),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "?????????????????????????????????????????? ??????????????????",
                          style: TextStyle(color: Colors.black, fontSize: 13),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 55,
                            width: 55,
                            child: Image.asset("assets/images/signhere.jpg"),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "??????????????????????????? / ??????????????????????????? ????????? ??? ??????????????????",
                            style: TextStyle(color: Colors.black, fontSize: 13),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Text(
                "?????????????????????????????? ?????????????????? ????????????????????? ???????????????????????????, ???????????????",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              )),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                "????????????????????? ?????????????????????????????? ????????????????????? ???????????????",
                style: TextStyle(color: Colors.black, fontSize: 15),
              )),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                "???????????????????????? ??????????????????????????????",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              )),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                "????????? ????????????????????????????????????????????? ???????????????/??????????????? ???????????????????????????????????? ??????????????????\n??????????????????.",
                style: TextStyle(color: Colors.black, fontSize: 17),
              )),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "???) ??????????????? / ????????????????????????????????? ?????????????????????????????????????????? ??????????????????",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "???) ????????????????????? ????????? :",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              SizedBox(
                height: 5,
              ),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: certStudentFullNameController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintText: '',
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "???) ?????? :",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              SizedBox(
                height: 5,
              ),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: certStudentAgeController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintText: '',
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
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "???) ????????????????????? / ???????????????????????? ?????????????????? ??? ????????????",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "???) ????????????????????? ???????????? / ????????????????????? ????????????????????? ??????????????? ??????????????? :",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              SizedBox(
                height: 5,
              ),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: certScratchBrforeAccident,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintText: '',
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "???) ????????????????????? ???????????????????????? ???????????? ???????????????????????????????????? ?????????????????? ?????? ? :",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              SizedBox(
                height: 5,
              ),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: certCheckupDateController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintText: '',
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "???) ???????????????????????????????????? / ??????????????????????????????????????? ?????????????????????????????? ???????????????\n????????????????????? ????????????????????? ?????????????????? ???????????? ?",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 5,
              ),
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
                              : Text("$datetimeBackandDevloper"),
                          Icon(Icons.calendar_month),
                        ],
                      ),
                    ),
                  ),
                )),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "???) ??????????????????????????????/????????????????????????????????? ?????????????????????????????? ??????????????? ???????????????????????????????????? ?????????????????? ?????????????????? ??????????????? ???????????? ?????? ? ????????? ??????????????????????????????    ????????????????????????????????? ?????????????????????????????? ???????????? ??????????????? ????????? ???????????? ????????????????????? ??????????????? ???????????? ??????????????? ?",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 5,
              ),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: certAnyOtherIssueBaccidentController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintText: '',
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "???) ???????????????????????? ????????????????????? ??????????????????????????? ?",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 5,
              ),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: certCurrentConditionController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintText: '',
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "???) ?????????????????? ????????????????????? ????????? ????????? ?????? ?????? ????????? ????????????????????? ?????????????????????????????? ?????????????????? (%) ???????????? ?????????.",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 5,
              ),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: certHadicapCerTificateIfyes,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintText: '',
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "???) ??????????????????????????????????????? ????????????????????? ??????????????? ???????????? ?????????????????? ???????????? ????????????",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 5,
              ),
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: cartHandiCapBodyPartController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(2.0),
                              hintText: '',
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
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
                child: Center(
                    child: Text(
                  "?????? ????????? ???????????????????????? ???????????? ??????, ????????? ????????????????????? ?????? ???????????????????????? ?????????????????? ???????????? ?????? ???????????? ?????????????????? ?????????????????? ????????? ?????????.",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                )),
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: InkWell(
                  onTap: () {
                    if (_fromkey.currentState!.validate()) {
                      sanjivaniVidhyarthiSurakshaYojna();
                      Get.to(GrievanceRedressal());
                    } else {
                      print("not submitted");
                    }
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: HexColor('#074372'),
                    ),
                    child: Center(
                      child: Text(
                        "Continue",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
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
    );
  }
}
