import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SavitribaiPhuleGirlsScolarship extends StatelessWidget {
  const SavitribaiPhuleGirlsScolarship({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#074372'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "महाराष्ट्र आरोग्य विज्ञान विद्यापीठ , नाशिक ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "नमुना अर्ज ",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                SizedBox(
                  height: 13,
                ),
                Text(
                  "सावित्रीबाई  फुले मुलींकरीता शिष्यवृत्ती योजना ",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 160,
                  width: 160,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Color.fromARGB(255, 180, 177, 177), width: 1),
                      borderRadius: BorderRadius.circular(5)),
                  child: Image.asset(
                    "assets/images/ph-m.png",
                    height: 20,
                    width: 20,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      Text(
                        "प्रति\nमा. सांचालक विद्यार्थी कल्याण\n महाराष्ट्र' आरोग्य विज्ञान विद्यापीठ,नाशिक.  ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  child: Stack(
                    children: [
                      Container(
                        height: 1400,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "अ.क्र.",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "तपशिले ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(width: 12),
                                      Text(
                                        "माहिती",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "१",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      "विद्यार्थांनीचे संपूर्ण नाव ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(width: 12),
                                    Text(
                                      "माहिती",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "२ ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      "वजन्म  तारीख व वय ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(width: 12),
                                    Text(
                                      "माहिती",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "३",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      "मोबाईल नं. व मूउंपस क",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(width: 12),
                                    Text(
                                      "माहिती",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "४",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      "मागासवर्गीय  असल्यास  प्रकार ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(width: 12),
                                    Text(
                                      "हो/नाही ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "५",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "सध्याचा पत्ता व  दूरध्वनी / मोबाईल \nक्रमांक ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(width: 30),
                                    Text(
                                      "",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "६",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      "कायम निवासी पत्ता ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(width: 80),
                                    Text(
                                      "",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "७",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(width: 18),
                                    Text(
                                      "वडिलांचे / पालकाचे संपूर्ण नाव \nव पत्ता ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(width: 12),
                                    Container(
                                      height: 30,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1)),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "८ ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    Text(
                                      " पालकाचे विद्यार्थांनीशी  नाते ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(width: 12),
                                    Container(
                                      height: 30,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1)),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "९",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    Text(
                                      " घरचा दूरध्वनी व मोबाईल क्र  ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(width: 12),
                                    Container(
                                      height: 30,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1)),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "१० ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      "पालकांचा व्यवसाय /नोकरी ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1)),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "११  ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    Text(
                                      " व्यवसाय  नोकरीचा पत्ता ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(width: 12),
                                    Container(
                                      height: 30,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1)),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "१२",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    Text(
                                      " वार्षिक उत्पन्न (तहसीलदार यांनी\nदिलेल्या दाखल्याची स्वसाक्षांकीत\nछायाप्रत सोबत जोडावी)",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(width: 12),
                                    Container(
                                      height: 30,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1)),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "१३",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      "कार्यालय दूरध्वनी क्र. (ऐस .टी डी \nकोडसहित )",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1)),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "१४",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      "गतवर्षी उत्तीर्ण वर्ग व श्रेणी\n(स्वसाक्षांकीत गुणपत्रकाची छायाप्रत \nसोबत जोडावी)",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1)),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "१५ ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      "सध्या शिकत असलेला वर्ग",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1)),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "१७",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      "कोर्ससाठी प्रवेश घेतल्याचा दिनांक",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1)),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "१८ ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      "कोर्स उत्तीर्ण होण्याचा संभाव्य दिनांक",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1)),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "१९ ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      "महाविद्यालयाचे नाव",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1)),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "२० ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      "महाविद्यालयाचा पत्ता",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1)),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "२१ ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      "प्राचार्यांचे नाव",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1)),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 80,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "२२ ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      "शुल्क परतावा किंवा फी सवलत\nरक्कम, शिष्यवृत्ती / फेलोशिप रक्कम, \nशिक्षण सहाय्य योजना रक्कम,भारत \nसरकार / महाराष्ट्र शासन अथवा\nइतर संस्था यांच्याकडुन मिळणाऱ्या \nसवलतीबाबत तपशील नमुद करण्यात\nयावा.",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1)),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        " २३ ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      "विद्यार्थीनीचे बॅकखाते वरील नाव",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1)),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "२४",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "बॅकेच्या शाखेचे नाव व पत्ता",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1)),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "२५",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      "बँक खाते क्रमांक",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1)),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "२६",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      "बॅक आय एफ एस संकेतांक",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 35,
                        left: 50,
                        bottom: 35,
                        child: Container(
                          height: 1310,
                          width: 1,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Positioned(
                        top: 35,
                        left: 210,
                        bottom: 35,
                        child: Container(
                          height: 1310,
                          width: 1,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
