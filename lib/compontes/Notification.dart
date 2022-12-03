import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor('#074372'),
          title: Text(
            "Notification",
            style: TextStyle(fontSize: 22),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              height: 85,
              color: HexColor("#a7d5f9"),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: Image.asset("assets/images/pdf.png"),
                        ), 
                        SizedBox(width: 10,),
                        Text(
                          "sdadas ",
                          style: TextStyle(
                              color: HexColor("#000e27"), fontSize: 15),
                        ),
                      ],
                    ),
                    Container(
                      height: 23,
                      width: 80,
                      decoration: BoxDecoration(
                          color: HexColor("#dbdbdb"),
                          borderRadius: BorderRadius.circular(17)),
                      child: Center(
                          child: Text(
                        "View",
                        style: TextStyle(color: Colors.black, fontSize: 13),
                      )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
