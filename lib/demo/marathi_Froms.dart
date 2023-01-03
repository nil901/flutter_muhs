import 'package:flutter/material.dart';

class MrathiFrom extends StatefulWidget {
  const MrathiFrom({super.key});

  @override
  State<MrathiFrom> createState() => _MrathiFromState();
}

class _MrathiFromState extends State<MrathiFrom> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: 1800,
        color: Colors.white,
        padding: EdgeInsets.all(20.0),
        child: Table(
          columnWidths: {
            0: FlexColumnWidth(1.5),
            1: FlexColumnWidth(5),
            2: FlexColumnWidth(4),
          },
          border: TableBorder.all(
              color: Colors.black, borderRadius: BorderRadius.circular(6)),
          children: [
            TableRow(children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 9),
                  child: Text(
                    '   १',
                    style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 9),
                  child: Text(
                    'विद्यार्थीनीचे संपुर्ण नाव',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.black26, fontSize: 16),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 9),
                  child: Text(
                    '   २',
                    style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 9),
                  child: Text(
                    'वजन्म तारीख व वय',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.black26, fontSize: 16,fontWeight: FontWeight.bold),
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 9),
                  child: Text(
                    '   ३',
                    // ignore: prefer_const_constructors
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 7),
                  child: Text(
                    'मोबाईल नं. व म्उंपस प्क',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.black26, fontSize: 16,fontWeight: FontWeight.bold),
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 9),
                  child: Text(
                    '   ४',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 7),
                  child: Text(
                    'मागासवर्गीय असल्यास प्रकार',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
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
                    Text("वर्गवारी (अनिवार्य) :" ,style: TextStyle(color: Colors.grey),)
                  ],
                )
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 9),
                  child: Text(
                    '   ५',
                    style: TextStyle(color: Colors.black, fontSize: 13),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 7),
                  child: Text(
                    'सध्याचा पत्ता व दुरध्वनी / मोबाईल क्रमांक',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.black26, fontSize: 15),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 9),
                  child: Text(
                    '   ६',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 7),
                  child: Text(
                    'कायम निवासी पत्ता',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.black26, fontSize: 15),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 9),
                  child: Text(
                    '   ७',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 7),
                  child: Text(
                    'वडीलांचे / पालकांचे संपूर्ण नाव व पत्ता',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.black26, fontSize: 15),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 9),
                  child: Text(
                    '   ८',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 7),
                  child: Text(
                    'पालकांचे विद्यार्थीनीशी नाते',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.black26, fontSize: 15),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 9),
                  child: Text(
                    '   ९',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 7),
                  child: Text(
                    'घरचा दुरध्वनी व मोबाईल क्र',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.black26, fontSize: 15),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 9),
                  child: Text(
                    '   ९',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 7),
                  child: Text(
                    'घरचा दुरध्वनी व मोबाईल क्र',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.black26, fontSize: 15),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 9),
                  child: Text(
                    '      १०',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 7),
                  child: Text(
                    'पालकांचा व्यवसाय / नोकरी',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.black26, fontSize: 15),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 9),
                  child: Text(
                    '      ११',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 7),
                  child: Text(
                    'पालकांचा व्यवसाय / नोकरी',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.black26, fontSize: 15),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 9),
                  child: Text(
                    '      १२',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 7),
                  child: Text(
                    'पालकांचा व्यवसाय / नोकरी',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.black26, fontSize: 15),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 9),
                  child: Text(
                    '      १३',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 7),
                  child: Text(
                    'कार्यालय दुरध्वनी क्र. (एस.टी.डी कोडसहित)',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.black26, fontSize: 15),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 9),
                  child: Text(
                    '      १४',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 7),
                  child: Text(
                    'गतवर्षी उत्तीर्ण वर्ग व श्रेणी\n(स्वसाक्षांकीत गुणपत्रकाची छायाप्रत सोबत जोडावी',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.black26, fontSize: 15),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 9),
                  child: Text(
                    '      १५',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 7),
                  child: Text(
                    'सध्या शिकत असलेला वर्ग',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.black26, fontSize: 15),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 9),
                  child: Text(
                    '      १६',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 7),
                  child: Text(
                    'कोर्सचे नांव व कालावधी',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.black26, fontSize: 15),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 9),
                  child: Text(
                    '      १७',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 7),
                  child: Text(
                    'कोर्ससाठी प्रवेश घेतल्याचा दिनांक',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.black26, fontSize: 15),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 9),
                  child: Text(
                    '      १८',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 7),
                  child: Text(
                    'कोर्स उत्तीर्ण होण्याचा संभाव्य दिनांक',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.black26, fontSize: 15),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 9),
                  child: Text(
                    '      १९',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 7),
                  child: Text(
                    'महाविद्यालयाचे नाव',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.black26, fontSize: 15),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 9),
                  child: Text(
                    '      २०',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 7),
                  child: Text(
                    'महाविद्यालयाचा पत्ता',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.black26, fontSize: 15),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 9),
                  child: Text(
                    '      २१',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 7),
                  child: Text(
                    'प्राचार्यांचे नाव',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.black26, fontSize: 15),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 9),
                  child: Text(
                    '      २२',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 7),
                  child: Text(
                    'शुल्क परतावा किंवा फी सवलत रक्कम, शिष्यवृत्ती / फेलोशिप रक्कम, शिक्षण सहाय्य योजना रक्कम, भारत सरकार / महाराष्ट्र शासन अथवा इतर संस्था यांच्याकडुन मिळणाऱ्या सवलतीबाबत तपशील नमुद करण्यात यावा.',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.black26, fontSize: 15),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 9),
                  child: Text(
                    '      २३',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 7),
                  child: Text(
                    'विद्यार्थीनीचे बँकखाते वरील नाव',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.black26, fontSize: 15),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 9),
                  child: Text(
                    '      २४',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 7),
                  child: Text(
                    'बॅकेच्या शाखेचे नाव व पत्ता',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.black26, fontSize: 15),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 9),
                  child: Text(
                    '      २५',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 7),
                  child: Text(
                    'बँक खाते क्रमांक',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.black26, fontSize: 15),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            TableRow(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 9),
                  child: Text(
                    '      २५',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 7),
                  child: Text(
                    'बॅक आय एफ एस संकेतांक',
                    style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.black26, fontSize: 15),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
