import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class SanjivaniVidhyarthiSurakshaYojna extends StatefulWidget {
  const SanjivaniVidhyarthiSurakshaYojna({super.key});

  @override
  State<SanjivaniVidhyarthiSurakshaYojna> createState() =>
      _SanjivaniVidhyarthiSurakshaYojnaState();
}

class _SanjivaniVidhyarthiSurakshaYojnaState
    extends State<SanjivaniVidhyarthiSurakshaYojna> {
  DateTime _dateTime = DateTime.now();
  String? salectedDatebackundDevloper;

  void _showdate() async {
    DateTime? userSelectedDate = await showDatePicker(
        context: context,
        initialDate: _dateTime,
        firstDate: DateTime(2000),
        lastDate: DateTime(2025));
    if (userSelectedDate == null) {
      return;
    } else {
      setState(() {
        _dateTime = userSelectedDate;
        salectedDatebackundDevloper =
            "${_dateTime.year}/${_dateTime.month}/${_dateTime.day}";
        print("Date $salectedDatebackundDevloper");
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
                      child: Text(
                        " $salectedDatebackundDevloper",
                        style:
                            TextStyle(color: HexColor('#074372'), fontSize: 15),
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
                  Text(
                    "दि. / /",
                    style: TextStyle(color: HexColor('#074372'), fontSize: 15),
                  ),
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
                  const SizedBox(width: 50.0, height: 10, child: TextField()),
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
                       SizedBox(height: 5,),
                      Text("महाविद्यालयाचा शिक्का",style: TextStyle(color: Colors.black ,fontSize: 13),)
                    ],
                  ),
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 12 ,vertical: 12),
                     child: Column(
                      children: [
                       SizedBox(height: 55, width: 55,child: Image.asset("assets/images/signhere.jpg"),),
                       SizedBox(height: 8,),
                        Text("अधिष्ठाता / प्राचार्य सही व शिक्का",style: TextStyle(color: Colors.black ,fontSize: 13),)
                      ],
                  ),
                   )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Center(child: Text("महाराष्ट्र आरोग्य विज्ञान विद्यापीठ, नाशिक",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),)),
             SizedBox(height: 10,),
            Center(child: Text("संजीवनी विद्यार्थी सुरक्षा योजना",style: TextStyle(color: Colors.black, fontSize:15 ),)),
             SizedBox(height: 10,),
             Center(child: Text("वैद्यकीय प्रमाणपत्र",style: TextStyle(color: Colors.black, fontSize:15  , fontWeight: FontWeight.bold),)),
             SizedBox(height: 10,),
              Center(child: Text("सदर प्रमाणपत्रासोबत आजारी/अपघात झाल्याबाबतचे पुरावे\nजोडावे.",style: TextStyle(color: Colors.black, fontSize:17 ),)),
             SizedBox(height: 10,),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 16),
                 child: Text("१) आजारी / अपघातग्रस्त विद्यार्थ्याची माहिती",style: TextStyle(color: Colors.black, fontSize:17 ,fontWeight: FontWeight.bold),),
               ),
                SizedBox(height: 10,),
                Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "अ) संपुर्ण नाव :",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
         SizedBox(height: 5,),
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
                            SizedBox(height: 10,),
                Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "ब) वय :",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
         SizedBox(height: 5,),
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
             SizedBox(height: 10,),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 16),
                 child: Text("१) आजारी / अपघातग्रस्त विद्यार्थ्याची माहिती",style: TextStyle(color: Colors.black, fontSize:17 ,fontWeight: FontWeight.bold),),
               ),
                SizedBox(height: 10,),
                Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "अ) संपुर्ण नाव :",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
         SizedBox(height: 5,),
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
               
          ],
        ),
      ),
    );
  }
}
