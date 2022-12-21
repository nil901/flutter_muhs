import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart'; 

class AntiRagging extends StatefulWidget {
  const AntiRagging({super.key});

  @override
  State<AntiRagging> createState() => _AntiRaggingState();
}

class _AntiRaggingState extends State<AntiRagging> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
       appBar: AppBar(
        backgroundColor: HexColor('#074372'),
        title: Text(
          "Circular",
          style: TextStyle(fontSize: 22),
        ),
        centerTitle: true,
      ),
    );
  }
}