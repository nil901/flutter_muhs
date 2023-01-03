import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor('#074372'),
          title: Text(
            "Contact Us",
            style: TextStyle(fontSize: 22),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "Hon'ble Vice-Chanceller",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 210,
                  decoration: BoxDecoration(
                    boxShadow: [
                      const BoxShadow(
                        color: Color.fromARGB(255, 109, 106, 106),
                        blurRadius: 1.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Lt Gen Madhuri Kanitkar(Retd)",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 21,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "PVSM, AVSM,VSM",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 21,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Text(
                        "Hon'ble Vice-Chancellor",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 20),
                        child: Row(
                          children: [
                            Text(
                              "Email Id",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 90,
                            ),
                            Text(
                              "VC@muhs.ac.in",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 13),
                        child: Row(
                          children: [
                            Text(
                              "Email Id",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 90,
                            ),
                            Text(
                              "VC@muhs.ac.in",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Row(
                  children: [
                    Text(
                      "Hon'ble Vice-Chancellor Office",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 130,
                  decoration: BoxDecoration(
                    boxShadow: [
                      const BoxShadow(
                        color: Color.fromARGB(255, 109, 106, 106),
                        blurRadius: 1.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Brig Subodh Mulgund (Reted)",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "(OSD Administration)",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                        child: Row(
                          children: [
                            Text(
                              "Email Id",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 90,
                            ),
                            Text(
                              "VC@muhs.ac.in",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 210,
                  decoration: BoxDecoration(
                    boxShadow: [
                      const BoxShadow(
                        color: Color.fromARGB(255, 109, 106, 106),
                        blurRadius: 1.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Y.G.Patil",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 21,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      // ignore: prefer_const_constructors
                      Text(
                        "(OSD to Hon'ble VC",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 21,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 20),
                        child: Row(
                          children: [
                            Text(
                              "Email Id",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 90,
                            ),
                            Text(
                              "osdtovc_hm@muhs.ac.in",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 13),
                        child: Row(
                          children: [
                            Text(
                              "Mobile Number",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Text(
                              "(0253) 2539112 /6659112",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
                            Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 130,
                  decoration: BoxDecoration(
                    boxShadow: [
                      const BoxShadow(
                        color: Color.fromARGB(255, 109, 106, 106),
                        blurRadius: 1.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Brig Subodh Mulgund (Reted)",
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      // ignore: prefer_const_constructors
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "(OSD Administration)",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                        child: Row(
                          children: [
                            Text(
                              "Email Id",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 90,
                            ),
                            Text(
                              "VC@muhs.ac.in",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
