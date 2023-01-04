import 'dart:convert';
import 'package:flutter/material.dart';
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
  String? StudentId =""; 

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
      collageId=  shef.getString("collageId");
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
  final  applicant_bank_ifsc_code = TextEditingController();
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
  "PRN_NUMBER": prnnumber,
  "TASK": "ADD",
  "COLLAGE_ID": collageId,
  "STUDENT_ID": token,
  "APPLICANT_FULL_NAME":applicantFullName.text,
  "APPLICANT_FULL_ADDRESS": applicantFullAddress.text,
  "APPLICANT_MOBILE_NO": applicantMobileNumber.text,
  "APPLICANT_OCCUPATION": applicantOcupation.text,
  "APPLICANT_STUDENT_CONNECTION": applicantFStudentConnectionController.text,
  "APPLICANTS_FULL_NAMEBANK": applicantFullNameBankController.text,
  "APPLICANT_BANKNAME_ADDRESS":applicantsBankAddressController.text,
  "APPLICANT_BANK_ACC_NO": applicantBankAccNoController.text,
  "PASSPORT_IMAGE": "",
  "APPLICANT_BANK_IFSC_CODE": applicant_bank_ifsc_code.text,
  "STUDENT_FULL_NAME": studentFullNameController.text,
  "STUDENT_COLLAGE_NAME": studentCollageNameController.text,
  "ADMISSION_DATE": collageOpenDateBacundDevloper.toString(),
  "CURRENT_YEAR_PATTERN": currentYearPatternController.text,
  "ACCIDENT_SPOT_TIME_DATE":accidentSpotTimeDateController.text,
  "ACCIDENT_CURRENT_SITUATION": accidentCurrentSituationController.text,
  "FIR_DETAILS": firDetailsController.text,
  "CIVIL_HOSPITAL_NAME": civilHospitalNameController.text,
  "WITNESS_NAME_MOBILENO": witnessNameMobileNoController.text,
  "VARSAHAKKA_PRAMANPATR_NAME": varsahakkaPramanpatrNameController.text,
  "VARSAHAKKA_PRAMANPATR_ADDRESS": varsahakkaPramanpatrAddressController.text,
  "CONFIRMATION_DATE": confirmationDateController.text,
  "CONFIRMATION_SPOT": confirmationSpotController.text,
  "ADDMITED_HOSPITAL_NAME": addmitedHospitalController.text,
  "TOTAL_HOSPITAL_EXPENCES": totalHospitalController.text,
  "HANDICAP_BODYPART": handicapBodyPart.text,
  "HANDICAP_PERMANENT_TEMP":handicapPermaentTemp.text,
  "ABSENT_FROM_DATE": salectedDatebackundDevloper.toString(),
  "ABSENT_TO_DATE": endsalectedDatebackundDevloper.toString(),
 "TOTAL_ABSENT_DAYS":"4",
  "HOSPITAL_NAME":hospitalNameController.text,
  "CERT_STUDENT_FULL_NAME": certStudentFullNameController.text,
  "CERT_STUDENT_AGE": certStudentAgeController.text,
  "CERT_HANDICAP_DESCRIPTION": certHandicapDescriptionController.text,
  "CERT_SCRATCH_BRFORE_ACCIDENT": certScratchBrforeAccident.text,
  "CERT_CHECKUP_DATE": datetimeBackandDevloper,
  "CERT_ANY_OTHER_ISSUE_BACCIDENT": certAnyOtherIssueBaccidentController.text,
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

      // ignore: use_build_context_synchronously
     
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
              "महाराष्ट्र आरोग्य विज्ञान विद्यापीठ, नाशिक",
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
                    "संजीवनी विद्यार्थी सुरक्षा योजना\n क्लेम फॉर्म (CLAIM FORM)",
                    style: TextStyle(color: Colors.black, fontSize: 15))),
            SizedBox(
              height: 22,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text(
                      "विद्यार्थ्याचा प्राणघातक अपघात झाला किंवा अपघातात अपंगत्व\n आल्यास किंवा अपघातात/नैसर्गिक/गंभीर आजाराने मृत पावल्यास/\n आजारी असल्यास प्रस्तावासोबत क्लेम फॉर्म जोडावा.")
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "१) दावा धारकाची माहिती :",
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
                "अ) संपुर्ण नाव :",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
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
                          controller: applicantFullName,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: '',
                            hintStyle:
                                TextStyle(color: Colors.black26, fontSize: 16),
                            border: InputBorder.none,
                          ),
                        ),
                      ))),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "ब) पुर्ण पत्ता :",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
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
                          controller: applicantFullAddress,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: '',
                            hintStyle:
                                TextStyle(color: Colors.black26, fontSize: 16),
                            border: InputBorder.none,
                          ),
                        ),
                      ))),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "क) दूरध्वनी क्र. :",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
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
                          controller: applicantMobileNumber,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: '',
                            hintStyle:
                                TextStyle(color: Colors.black26, fontSize: 16),
                            border: InputBorder.none,
                          ),
                        ),
                      ))),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "ड) व्यवसाय :",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
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
                          controller: applicantOcupation,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: '',
                            hintStyle:
                                TextStyle(color: Colors.black26, fontSize: 16),
                            border: InputBorder.none,
                          ),
                        ),
                      ))),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "ड) विद्यार्थी मृत पावला असेल तर विद्यार्थ्या सोबतचे नाते\n(आई, वडील, भाऊ, बहिण इ. ) :",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
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
                        controller: applicantFStudentConnectionController,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: '',
                            hintStyle:
                                TextStyle(color: Colors.black26, fontSize: 16),
                            border: InputBorder.none,
                          ),
                        ),
                      ))),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "इ) दावा धारकाचे बँक खातेवरील नाव :",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
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
                          controller: applicantFullNameBankController,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: '',
                            hintStyle:
                                TextStyle(color: Colors.black26, fontSize: 16),
                            border: InputBorder.none,
                          ),
                        ),
                      ))),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "बँकेच्या शाखेचे नाव व पत्ताः",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
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
                          controller: applicantBankNameController,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: '',
                            hintStyle:
                                TextStyle(color: Colors.black26, fontSize: 16),
                            border: InputBorder.none,
                          ),
                        ),
                      ))),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "बँक खाते क्र",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
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
                          controller: applicantBankAccNoController,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: '',
                            hintStyle:
                                TextStyle(color: Colors.black26, fontSize: 16),
                            border: InputBorder.none,
                          ),
                        ),
                      ))),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "बँक आय.एफ.सी. कोड.",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
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
                          controller: applicant_bank_ifsc_code,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: '',
                            hintStyle:
                                TextStyle(color: Colors.black26, fontSize: 16),
                            border: InputBorder.none,
                          ),
                        ),
                      ))),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "२) गंभीर आजाराने मृत पावलेल्या/अपघातात मृत पावलेल्या/\nगंभीर आजार झालेला विद्यार्थ्याची माहिती",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
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
                          controller: studentFullNameController,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: '',
                            hintStyle:
                                TextStyle(color: Colors.black26, fontSize: 16),
                            border: InputBorder.none,
                          ),
                        ),
                      ))),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "अ) विद्यार्थ्याचे संपुर्ण नाव :",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
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
                          controller: studentFullNameController,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: '',
                            hintStyle:
                                TextStyle(color: Colors.black26, fontSize: 16),
                            border: InputBorder.none,
                          ),
                        ),
                      ))),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "ब) महाविद्यालयाचे नाव :",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
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
                          controller: studentCollageNameController,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: '',
                            hintStyle:
                                TextStyle(color: Colors.black26, fontSize: 16),
                            border: InputBorder.none,
                          ),
                        ),
                      ))),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "क) महाविद्यालयात प्रवेश घेतल्याचा दिनांक :",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
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
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [ 
                              SizedBox(width:20 ,), collageOpenDate== null ? Text("") : Text("$collageOpenDateBacundDevloper",style: TextStyle(color: Colors.black, fontSize:15),),
                            
                            Icon(Icons.calendar_month)
                            ],
                          )
                        )),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "ड) सध्या शिकत असलेला अभ्यासक्रम व वर्ष :",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
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
                          controller: currentYearPatternController,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: '',
                            hintStyle:
                                TextStyle(color: Colors.black26, fontSize: 16),
                            border: InputBorder.none,
                          ),
                        ),
                      ))),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "३) अपघाताबद्दलचा/आजाराबद्दलचा तपशिल",
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
                "अ) अपघात/आजारी केंव्हा व कोणत्या ठिकाणी झाला (तारीख,\nवेळ व ठिकाण नमूद करावे) :",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
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
                          controller: accidentSpotTimeDateController,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: '',
                            hintStyle:
                                TextStyle(color: Colors.black26, fontSize: 16),
                            border: InputBorder.none,
                          ),
                        ),
                      ))),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "ब) अपघाताचे/आजाराचे कारण आणि अपघातात झालेली\nदुखापत :",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
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
                          controller: accidentCurrentSituationController,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: '',
                            hintStyle:
                                TextStyle(color: Colors.black26, fontSize: 16),
                            border: InputBorder.none,
                          ),
                        ),
                      ))),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "क) अपघात झाल्याबाबतची सुचना पोलिस स्टेशनला दिली होती\n काघ्दिली असल्यास पोलिस स्टेशनचे नाव नमूद करावे व FIR ची\n साक्षांकित प्रत जोडावी :",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
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
                          controller: firDetailsController,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: '',
                            hintStyle:
                                TextStyle(color: Colors.black26, fontSize: 16),
                            border: InputBorder.none,
                          ),
                        ),
                      ))),
            ),
             SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "ड) विद्यार्थी अपघातात मृत्यु पावला असेल तर, मृत विद्यार्थ्याचे शव विच्छेदन करण्यात आलेल्या शासकीय रुग्णालयाचे नाव (शव विच्छेदन अहवालाची साक्षांकित प्रत व मृत्यु प्रमाणपत्राची मुळ प्रत जोडावी) :",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            SizedBox(height: 2,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
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
                          controller: civilHospitalNameController,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: '',
                            hintStyle:
                                TextStyle(color: Colors.black26, fontSize: 16),
                            border: InputBorder.none,
                          ),
                        ),
                      ))),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "इ) साक्षीदाराचे नाव व संपर्क क्रं. :",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
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
                          controller: witnessNameMobileNoController,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: '',
                            hintStyle:
                                TextStyle(color: Colors.black26, fontSize: 16),
                            border: InputBorder.none,
                          ),
                        ),
                      ))),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "४) वारसाहक्क प्रमाणपत्र :",
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
                "अपघाताने/गंभीर आजाराने मृत्यु झालेल्या विद्यार्थ्याचे/विद्यार्थीनीचे\n वडील/आई/पालक असून संजीवनी विद्यार्थी सुरक्षा योजनेनुसार\n मिळणाऱ्या अर्थसहाय्य रक्कमेचा धनादेश/डी. डी. माझे नावे",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 2),
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
                          controller: varsahakkaPramanpatrNameController,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: '',
                            hintStyle:
                                TextStyle(color: Colors.black26, fontSize: 16),
                            border: InputBorder.none,
                          ),
                        ),
                      ))),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "पत्ता",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 2),
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
                          controller:varsahakkaPramanpatrAddressController ,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: '',
                            hintStyle:
                                TextStyle(color: Colors.black26, fontSize: 16),
                            border: InputBorder.none,
                          ),
                        ),
                      ))),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text("काढून वरील पत्त्यावर पाठविण्यास विनंती."),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
                child: Text(
                    "मी असे प्रमाणित करतो की, वर नमूद केलेली माहिती सत्य आहे.")),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    "दिनांक :",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  height: 40,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: HexColor('#074372'),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: TextFormField(
                      controller: confirmationDateController,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: '',
                        hintStyle:
                            TextStyle(color: Colors.black26, fontSize: 16),
                        border: InputBorder.none,
                      ),
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
                    "ठिकाण :",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  height: 40,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: HexColor('#074372'),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: TextFormField(
                      controller: confirmationSpotController,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: '',
                        hintStyle:
                            TextStyle(color: Colors.black26, fontSize: 16),
                        border: InputBorder.none,
                      ),
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
                "५) वैद्यकीय उपचाराची माहिती",
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
                "अ) रुग्णालयात उपचार घेत असलेल्या रुग्णालयाचे नाव व पत्ता,\nसंपर्क क्रमांक व वैद्यकीय अधिकाऱ्याचे/वैद्यकीय व्यावसायिकाचे\nनाव :",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 2),
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
                          controller: addmitedHospitalController,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: '',
                            hintStyle:
                                TextStyle(color: Colors.black26, fontSize: 16),
                            border: InputBorder.none,
                          ),
                        ),
                      ))),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "ब) उपचारासाठी झालेला खर्च (खर्चाची मुळ देयके क्रमवार सोबत जोडावी) :",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 2),
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
                          controller: totalHospitalController,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: '',
                            hintStyle:
                                TextStyle(color: Colors.black26, fontSize: 16),
                            border: InputBorder.none,
                          ),
                        ),
                      ))),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "६) अपंगत्व आल्याची माहिती",
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
                "अ) निकामी झालेले अवयव (उदा. हात, पाय, डोळा इ.) :",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 2),
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
                          controller: handicapBodyPart,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: '',
                            hintStyle:
                                TextStyle(color: Colors.black26, fontSize: 16),
                            border: InputBorder.none,
                          ),
                        ),
                      ))),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "इ) साक्षीदाराचे नाव व संपर्क क्रं. :",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 2),
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
                          controller: handicapPermaentTemp,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: '',
                            hintStyle:
                                TextStyle(color: Colors.black26, fontSize: 16),
                            border: InputBorder.none,
                          ),
                        ),
                      ))),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
                child: Text(
              "अपघात/कायमचे अपंगत्व/गंभीर आजार\nदाव्यासोबत महाविद्यालयाने दयावयाचे प्रमाणपत्र",
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
                "मी असे प्रमाणित करतो की",
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
                          ? Text("दि. / /",
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
                    "ते ",
                    style: TextStyle(fontSize: 15),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  InkWell(
                      onTap: _endDate,
                      child: enduserSelectedDate == null
                          ? Text("दि. / /",
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
                  Text("असे एकुण",
                      style: TextStyle(color: Colors.black, fontSize: 15)),
                  const SizedBox(width: 50.0, height: 10, child: 
                  TextField( 
                 
                    )),
                  Text(
                    "दिवस अपघातामुळे/कायमचे अपंगत्व \n आल्यामुळे/गंभीर आजारामुळे",
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
                  controller: hospitalNameController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: '',
                    hintStyle: TextStyle(color: Colors.black26, fontSize: 16),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Center(
                child: Text(
              "या रुग्णालयात उपचार घेत असल्याने, महाविद्यालयात गैरहजर होता/",
              style: TextStyle(color: Colors.black, fontSize: 15),
            )),
            SizedBox(
              height: 15,
            ),
            Center(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "प्रस्तावासोबत जोडलेले सर्व वैद्यकीय कागदपत्रे तपासले असुन, सर्व\n/कागदपत्रे साक्षांकित व बरोबर असल्याचे खात्री केली. सदर विद्यार्थी/विद्यार्थीनीस विद्यापीठ नियमानुसार झालेल्या वैद्यकीय खर्चाची प्रतीपुर्ती मिळणेकरीता शिफारस करत आहे.",
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
                        "महाविद्यालयाचा शिक्का",
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
                          "अधिष्ठाता / प्राचार्य सही व शिक्का",
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
              "महाराष्ट्र आरोग्य विज्ञान विद्यापीठ, नाशिक",
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
              "संजीवनी विद्यार्थी सुरक्षा योजना",
              style: TextStyle(color: Colors.black, fontSize: 15),
            )),
            SizedBox(
              height: 10,
            ),
            Center(
                child: Text(
              "वैद्यकीय प्रमाणपत्र",
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
              "सदर प्रमाणपत्रासोबत आजारी/अपघात झाल्याबाबतचे पुरावे\nजोडावे.",
              style: TextStyle(color: Colors.black, fontSize: 17),
            )),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "१) आजारी / अपघातग्रस्त विद्यार्थ्याची माहिती",
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
                "अ) संपुर्ण नाव :",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
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
                          controller: certStudentFullNameController,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: '',
                            hintStyle:
                                TextStyle(color: Colors.black26, fontSize: 16),
                            border: InputBorder.none,
                          ),
                        ),
                      ))),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "ब) वय :",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
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
                        controller: certStudentAgeController,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: '',
                            hintStyle:
                                TextStyle(color: Colors.black26, fontSize: 16),
                            border: InputBorder.none,
                          ),
                        ),
                      ))),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "२) आजाराचा / अपघाताचा प्रकार व कारण",
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
                "अ) अपघातात जखमी / अपंगत्व आल्याचे पुर्ण वर्णन :",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
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
                          controller: certScratchBrforeAccident,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: '',
                            hintStyle:
                                TextStyle(color: Colors.black26, fontSize: 16),
                            border: InputBorder.none,
                          ),
                        ),
                      ))),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "ब) शरीरावर झालेल्या जखमा अपघातापूर्वी होत्या का ? :",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
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
                          controller: certCheckupDateController,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: '',
                            hintStyle:
                                TextStyle(color: Colors.black26, fontSize: 16),
                            border: InputBorder.none,
                          ),
                        ),
                      ))),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "३) आजाराअंतर्गत / अपघाताअंतर्गत उपचारासाठी प्रथम\nकोणत्या तारखेला तपासणी केली ?",
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
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
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
                           SizedBox(width: 20,) , dateTiming == null  ?   Text("vvcv") : Text("$datetimeBackandDevloper") , Icon(Icons.calendar_month),
                              ],
                            ))),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "५) आजारग्रस्त/अपघातग्रस्त विद्यार्थी अपघात होण्यापुर्वी एखादया रोगाने आजारी होता का ? अशा परीस्थीतीत    रुग्णालाबरा होण्यासाठी काही अडथळे आले काघ् असल्यास तपशिल नमुद करावा ?",
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
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
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
                          controller: certAnyOtherIssueBaccidentController,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: '',
                            hintStyle:
                                TextStyle(color: Colors.black26, fontSize: 16),
                            border: InputBorder.none,
                          ),
                        ),
                      ))),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "६) रुग्णाची सध्याची परीस्थिती ?",
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
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
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
                          controller: certCurrentConditionController,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: '',
                            hintStyle:
                                TextStyle(color: Colors.black26, fontSize: 16),
                            border: InputBorder.none,
                          ),
                        ),
                      ))),
            ),
         
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "७) कायमचे अपंगत्व आले आहे का घ् आले असल्यास अपंगत्वाचे प्रमाण (%) किती आहे.",
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
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
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
                          controller: certHadicapCerTificateIfyes,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: '',
                            hintStyle:
                                TextStyle(color: Colors.black26, fontSize: 16),
                            border: InputBorder.none,
                          ),
                        ),
                      ))),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "८) अपंगत्वामध्ये शरीराचे कोणते अवयव निकामी झाले आहेत",
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
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
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
                          controller: cartHandiCapBodyPartController,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: '',
                            hintStyle:
                                TextStyle(color: Colors.black26, fontSize: 16),
                            border: InputBorder.none,
                          ),
                        ),
                      ))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
              child: Center(
                  child: Text(
                "मी असे प्रमाणित करतो की, सदर रुग्णास मी वैयक्तीक तपासले असून वर नमुद केलेली माहिती खरी आहे.",
                style: TextStyle(
                  fontSize: 15,
                ),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: InkWell(
                onTap: () {
                  print("hello");
                  sanjivaniVidhyarthiSurakshaYojna();
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
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
