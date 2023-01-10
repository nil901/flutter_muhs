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
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "'कमवा व शिका' योजनेतंर्गत प्रवेश",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
              Center(
                child: Text("मिळविण्यासाठी विद्यार्थ्यांने करावयाचा नमुना अर्ज",
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
                  "१. विद्यार्थ्याचे संपूर्ण नाव",
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
                  "२. शिकत असलेल्या महाविद्यालयाचे नाव",
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
                  "३. विद्यार्थ्याचा कायम निवासी पत्ता:",
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
                  "४. मोबाईल नंबर / दुरध्वनी क्र. (STD) कोडसहः",
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
                  "५. ईमेल आयडी:",
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
                  "६. जन्म तारीख:",
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
                  "७. सध्या शिकत असलेला वर्ग आणि कोर्स:",
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
                  "८. मागीलवर्षी झालेल्या परीक्षेत मिळालेले एकूण गुण व टक्केवारी (%)",
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
                  "(गतवर्षीच्या गुणपत्रिकेची स्वसाक्षांकित प्रत सोबत जोडावी.)",
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
                  "९. वडीलांचे/पालकांचे संपूर्ण नाव श्री / श्रीमतीः",
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
                  "१०. नोकरी / व्यवसाय",
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
                  "११. एकत्रित वार्षिक उत्पन्न रु",
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
                  "(तहसिलदारांनी दिलेल्या उत्पन्नाचा दाखला स्वसाक्षांकित\n करुन जोडावा.)",
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
                  "१२. कोणते काम निवडले आहे",
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
                        "१)",
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
                        "२)",
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
                        "३)",
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
                  "१३. अध्ययन तासिका कालावधी",
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
                  "१४. मागास वर्गीय असल्यास प्रकार",
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
                        "प्रवर्ग",
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
                  "१५. विद्यार्थ्यांचा आधारकार्ड नंबर",
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
                  "((आधारकार्ड स्वसाक्षांकीत प्रत सोबत जोडणे अनिवार्य ))",
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
                  "१६. योजनेच्या अटी, शर्ती, हिशोब, आर्थिक व्यवहार याबाबत सर्व   नियमांचे मी पालन करीन व माझ्या शैक्षिणक अध्ययनात खंड पडू देणार नाही अशी मी हमी देतो/देते.",
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
                  "वर नमूद केलेली सर्व माहिती खरी आहे.",
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
                  "विभाग प्रमुखाचे नाव व स्वाक्षरी",
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
                  "(सदर विद्यार्थी गरीब व गरजु असून योजनेसाठी दिलेली माहिती\n                                     खरी आहे. ))",
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
                    "महाविद्यालयाचा शिक्का",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  Text(
                    "अधिष्ठाता / प्राचार्याची सही",
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
                      "(सहपत्र 'अ')",
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
                              'सादर करावयाची कागदपत्रे',
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
                              'होय / नाही ',
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
                              'पृष्ठ क्र ',
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
                              'विद्यापीठाने उपलब्ध करुन दिलेला सहपत्र अश् (नमुना अर्ज ) परिपुर्ण भरला आहे काय ?',
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
                              'गतवर्षात उत्तीर्ण झाल्याचे गुणपत्रकाची स्वसाक्षांकीत प्रत जोडली आहे काय ?',
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
                              '   ३',
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
                              'गतवर्षाचा उत्पन्नाच्या दाखल्याची स्वसाक्षांकीत प्रत (आर्थिक वर्ष २०२१-२२) जोडली आहे काय ? (फक्त तहसिलदार कार्यालयाचा दाखला)',
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
                              '   ४',
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
                              'आधार कार्ड ची स्वसाक्षांकीत प्रत',
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
                    "टिप :- महाविद्यालयाने प्रस्तावांची पुर्तता करतांना तपासणी सूची प्रमाणे दस्तावेज तपासून अनुक्रमाप्रमाणे पृष्ठांकीत करुन सादर करावेत.",
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
