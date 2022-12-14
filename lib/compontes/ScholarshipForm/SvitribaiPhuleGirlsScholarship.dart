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
            Text("????????????????????????????????? ???????????? ?????????????????????????????? ????????????????????????????????? ???????????????",
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
                height: 1590,
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
                            '?????????????????????????????????????????? ????????????????????? ?????????',
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
                            '??????????????? ??????????????? ??? ??????',
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
                            '?????????????????? ??????. ??? ?????????????????? ?????????',
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
                            '   ???',
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
                            '????????????????????????????????? ????????????????????? ??????????????????',
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
                                Text("?????? / ???????????? ")
                              ],
                            ),
                            Text(
                              "???????????????????????? (????????????????????????) :",
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
                            '   ???',
                            style: TextStyle(color: Colors.black, fontSize: 13),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 7),
                          child: Text(
                            '????????????????????? ??????????????? ??? ???????????????????????? / ?????????????????? ?????????????????????',
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
                            '   ???',
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
                            '???????????? ?????????????????? ???????????????',
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
                            '   ???',
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
                            '???????????????????????? / ???????????????????????? ????????????????????? ????????? ??? ???????????????',
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
                            '   ???',
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
                            '???????????????????????? ?????????????????????????????????????????? ????????????',
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
                            '   ???',
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
                            '???????????? ???????????????????????? ??? ?????????????????? ?????????',
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
                            '   ???',
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
                            '???????????? ???????????????????????? ??? ?????????????????? ?????????',
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
                            '      ??????',
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
                            '      ??????',
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
                            '      ??????',
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
                            '      ??????',
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
                            '???????????????????????? ???????????????????????? ?????????. (??????.??????.?????? ?????????????????????)',
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
                            '      ??????',
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
                            '????????????????????? ???????????????????????? ???????????? ??? ??????????????????\n(??????????????????????????????????????? ????????????????????????????????? ???????????????????????? ???????????? ??????????????????',
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
                            '      ??????',
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
                            '??????????????? ???????????? ?????????????????? ????????????',
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
                            '      ??????',
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
                            '????????????????????? ???????????? ??? ?????????????????????',
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
                            '      ??????',
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
                            '??????????????????????????? ?????????????????? ??????????????????????????? ??????????????????',
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
                            '      ??????',
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
                            '??????????????? ???????????????????????? ???????????????????????? ????????????????????? ??????????????????',
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
                            '      ??????',
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
                            '?????????????????????????????????????????? ?????????',
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
                            '      ??????',
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
                            '?????????????????????????????????????????? ???????????????',
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
                            '      ??????',
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
                            '??????????????????????????????????????? ?????????',
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
                            '      ??????',
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
                            '??????????????? ?????????????????? ??????????????? ?????? ???????????? ???????????????, ????????????????????????????????? / ????????????????????? ???????????????, ?????????????????? ?????????????????? ??????????????? ???????????????, ???????????? ??????????????? / ?????????????????????????????? ???????????? ???????????? ????????? ?????????????????? ????????????????????????????????? ??????????????????????????? ??????????????????????????? ??????????????? ???????????? ????????????????????? ????????????.',
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
                            '      ??????',
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
                            '?????????????????????????????????????????? ????????????????????? ???????????? ?????????',
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
                            '      ??????',
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
                            '???????????????????????? ?????????????????? ????????? ??? ???????????????',
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
                            '      ??????',
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
                            '????????? ???????????? ?????????????????????',
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
                            '      ??????',
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
                            '????????? ?????? ?????? ?????? ????????????????????????',
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
              "????????? ????????????????????? ????????? ??????????????????????????????, ??????????????????????????? ???????????????????????? ???????????? ????????????????????????\n?????? ???????????? ????????????. ?????? ???????????????????????? ?????????????????? ????????? ???????????????????????? ???????????? ????????????\n??????????????????????????????????????? ??????????????? ???????????? ????????? ?????????????????? ?????? ??????????????????????????? ?????????????????????\n??????????????????????????? ???????????????????????? ???????????? ???????????? ?????? ???????????? ???????????? ???????????? ???????????? ????????? \n??????????????? ?????????. ?????? ??????????????? ??????????????? ???????????? ??????, ????????? ?????????????????? ???????????? ??????????????????\n???????????? ?????????????????? ????????? ?????????. ?????? ?????????????????? ???????????? ????????????????????? / ???????????????\n???????????????????????? ?????? ??????????????? ???????????? ??????????????????????????????????????? ?????????????????????????????? ??????????????? ????????????.",
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
