import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_muhs/demo/marathi_Froms.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

class SvitribaiPhuleGirlsScholarshipForm extends StatefulWidget {
  const SvitribaiPhuleGirlsScholarshipForm({super.key});

  @override
  State<SvitribaiPhuleGirlsScholarshipForm> createState() =>
      _SvitribaiPhuleGirlsScholarshipFormState();
}

class _SvitribaiPhuleGirlsScholarshipFormState
    extends State<SvitribaiPhuleGirlsScholarshipForm> {
  FilePickerResult? result;
  bool isChecked = false;
  bool _isLoading = false;
  File? image;
  Future PickImageImag(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {});
      this.image = imageTemporary;
    } on PlatformException catch (e) {
      print('Failed to pick image $e');
    }
  }

  Future PdfUpload() async {
    result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
    );
  }

  girlsScholarshipFrom() async {
    Map<String, dynamic> data = {
      "PRN_NUMBER": "BAB0120220030",
      "TASK": "  ADD ",
      "COLLAGE_ID": "1",
      "STUDENT_ID": "38",
      "MOBILE_NO": "1233456",
      "FULL_NAME": "raj",
      "BIRTH_DATE": "02/05/1998",
      "BACKWARD_CLASS": "bca",
      "RECENT_ADDRESS_MOBILE": "nashik",
      "PERMENT_ADDRESS": "nashik",
      "PASSPORT_IMAGE": "",
      "PARENTS_FULL_NAME": "mukund",
      "REALTION_STUDENT_PARENT": "no",
      "MOBILE_NO_HOME": "2665646656",
      "PARENTS_OCCUPATION": "farmer",
      "OCCUPATION_ADDRESS": "nashik road",
      "YEARLY_INCOME": "300",
      "OFFICE_NUMBER": "4652",
      "REC_PASSOUT_CLASSGRADE": "5",
      "CURRENT_CLASS": "bca",
      "CURRENT_CLASS_NAME": "bca",
      "INROLL_DATE_COURCE": "02/05/2018",
      "COURCE_PASSOUT_DATE": "02/05/2018",
      "COLLAGE_NAME": "k.k.w",
      "COLLAGE_ADDRESS": "sarswati nager",
      "PRINCIPLE_NAME": "no",
      "ANY_OTHER_SCHOLERSHIP": "no",
      "STUDENT_NAME_BANK": "raj",
      "BANK_BRANCHNAME_ADDRESS": "nashik road",
      "BACK_ACCOUNT_NUMBER": "64446444",
      "BANK_IFSC_NUMBER": "012458",
      "INCOME_CERTIFICATE_PDF": "n",
      "RESULT_PDF": result.toString(),
      "ADHARCARD_PDF": "",
      //  byte[] SR_IMAGE { get; set; }
    };

    // var jsonResponse = null;
    var response = await http.post(
        Uri.parse(
            "https://muhsappapi.greemgoldfpc.com/api/GirlScholarshipform"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data));
    // print(response.body);
    var jsonResponse = json.decode(response.body);
    print(data);
    print(response.body);
    if (jsonResponse["ResponseCode"] == "0") {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("${jsonResponse["ResponseMessage"]}")));
      print(response.body);
      print("Pdf view Path : $result");
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
            Text("सावित्रीबाई फुले मुलींकरीता शिष्यवृत्ती योजना",
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
                height: 1580,
                color: Colors.transparent,
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
                            'विद्यार्थीनीचे संपुर्ण नाव',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.black26, fontSize: 16),
                              border: InputBorder.none,
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
                            'वजन्म तारीख व वय',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.black26,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              border: InputBorder.none,
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
                            'मोबाईल नं. व म्उंपस प्क',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.black26,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              border: InputBorder.none,
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
                            '   ४',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 7),
                          child: Text(
                            'मागासवर्गीय असल्यास प्रकार',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                    value: isChecked,
                                    onChanged: (bool? newValue) {
                                      setState(() {
                                        isChecked = newValue!;
                                      });
                                    }),
                                Text("हो / नाही ")
                              ],
                            ),
                            Text(
                              "वर्गवारी (अनिवार्य) :",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        )
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 9),
                          child: Text(
                            '   ५',
                            style: TextStyle(color: Colors.black, fontSize: 13),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 7),
                          child: Text(
                            'सध्याचा पत्ता व दुरध्वनी / मोबाईल क्रमांक',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.black26, fontSize: 15),
                              border: InputBorder.none,
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
                            '   ६',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 7),
                          child: Text(
                            'कायम निवासी पत्ता',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.black26, fontSize: 15),
                              border: InputBorder.none,
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
                            '   ७',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 7),
                          child: Text(
                            'वडीलांचे / पालकांचे संपूर्ण नाव व पत्ता',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.black26, fontSize: 15),
                              border: InputBorder.none,
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
                            '   ८',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 7),
                          child: Text(
                            'पालकांचे विद्यार्थीनीशी नाते',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.black26, fontSize: 15),
                              border: InputBorder.none,
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
                            '   ९',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 7),
                          child: Text(
                            'घरचा दुरध्वनी व मोबाईल क्र',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.black26, fontSize: 15),
                              border: InputBorder.none,
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
                            '   ९',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 7),
                          child: Text(
                            'घरचा दुरध्वनी व मोबाईल क्र',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.black26, fontSize: 15),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 9),
                          child: Text(
                            '      १०',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 7),
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
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.black26, fontSize: 15),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 9),
                          child: Text(
                            '      ११',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 7),
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
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.black26, fontSize: 15),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 9),
                          child: Text(
                            '      १२',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 7),
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
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.black26, fontSize: 15),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 9),
                          child: Text(
                            '      १३',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 7),
                          child: Text(
                            'कार्यालय दुरध्वनी क्र. (एस.टी.डी कोडसहित)',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.black26, fontSize: 15),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 9),
                          child: Text(
                            '      १४',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 7),
                          child: Text(
                            'गतवर्षी उत्तीर्ण वर्ग व श्रेणी\n(स्वसाक्षांकीत गुणपत्रकाची छायाप्रत सोबत जोडावी',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.black26, fontSize: 15),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 9),
                          child: Text(
                            '      १५',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 7),
                          child: Text(
                            'सध्या शिकत असलेला वर्ग',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.black26, fontSize: 15),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 9),
                          child: Text(
                            '      १६',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 7),
                          child: Text(
                            'कोर्सचे नांव व कालावधी',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.black26, fontSize: 15),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 9),
                          child: Text(
                            '      १७',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 7),
                          child: Text(
                            'कोर्ससाठी प्रवेश घेतल्याचा दिनांक',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.black26, fontSize: 15),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 9),
                          child: Text(
                            '      १८',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 7),
                          child: Text(
                            'कोर्स उत्तीर्ण होण्याचा संभाव्य दिनांक',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.black26, fontSize: 15),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 9),
                          child: Text(
                            '      १९',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 7),
                          child: Text(
                            'महाविद्यालयाचे नाव',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.black26, fontSize: 15),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 9),
                          child: Text(
                            '      २०',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 7),
                          child: Text(
                            'महाविद्यालयाचा पत्ता',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.black26, fontSize: 15),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 9),
                          child: Text(
                            '      २१',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 7),
                          child: Text(
                            'प्राचार्यांचे नाव',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.black26, fontSize: 15),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 9),
                          child: Text(
                            '      २२',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 7),
                          child: Text(
                            'शुल्क परतावा किंवा फी सवलत रक्कम, शिष्यवृत्ती / फेलोशिप रक्कम, शिक्षण सहाय्य योजना रक्कम, भारत सरकार / महाराष्ट्र शासन अथवा इतर संस्था यांच्याकडुन मिळणाऱ्या सवलतीबाबत तपशील नमुद करण्यात यावा.',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.black26, fontSize: 15),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 9),
                          child: Text(
                            '      २३',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 7),
                          child: Text(
                            'विद्यार्थीनीचे बँकखाते वरील नाव',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.black26, fontSize: 15),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 9),
                          child: Text(
                            '      २४',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 7),
                          child: Text(
                            'बॅकेच्या शाखेचे नाव व पत्ता',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.black26, fontSize: 15),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 9),
                          child: Text(
                            '      २५',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 7),
                          child: Text(
                            'बँक खाते क्रमांक',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.black26, fontSize: 15),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 9),
                          child: Text(
                            '      २५',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 7),
                          child: Text(
                            'बॅक आय एफ एस संकेतांक',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: Colors.black26, fontSize: 15),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Text(
              "सदर योजनेचा लाभ घेण्यासाठी, योजनेबाबत असलेल्या सर्व नियमांचे\nमी पालन करीन. या संदर्भात नियमात बदल करण्याचे सर्व हक्क\nविद्यापीठाकडे असतील तसेच सदर अनुदान हे विद्यापीठ निधीतून\nसवलतीच्या स्वरुपात मिळत असुन तो माझा हक्क नाही याची मला \nजाणीव आहे. मी असेही जाहीर करते की, सदर अर्जात नमुद केलेली\nसर्व माहिती खरी आहे. ही माहिती खोटी असल्यास / तफावत\nआढळल्यास मी योग्य त्या शिस्तभंगाच्या कार्यवाहीस पात्र असेन.",
              style: TextStyle(fontSize: 15),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () {
                  girlsScholarshipFrom();
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                height: 40,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Result',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      InkWell(
                        onTap: () => PdfUpload(),
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              "Choose file",
                              style: TextStyle(color: Colors.black45),
                            ),
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
