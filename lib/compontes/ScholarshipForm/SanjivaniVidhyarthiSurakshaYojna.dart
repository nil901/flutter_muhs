
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart'; 

class SanjivaniVidhyarthiSurakshaYojna extends StatelessWidget {
  const SanjivaniVidhyarthiSurakshaYojna({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(  
        backgroundColor:HexColor('#074372'),
        leading: Icon(Icons.arrow_back ), 
      ), 
      body: Column( 
        // ignore: prefer_const_literals_to_create_immutables
        children: [ 
          SizedBox(height: 10,),
          Center(child: Text("महाराष्ट्र आरोग्य विज्ञान विद्यापीठ, नाशिक",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)),
          SizedBox(height: 8,),
          Text("संजीवनी विद्यार्थी सुरक्षा योजना\n क्लेम फॉर्म (CLAIM FORM)",style: TextStyle(color: Colors.black ,fontSize: 15)), 
          SizedBox(height: 22,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(children: [
              Text("विद्यार्थ्याचा प्राणघातक अपघात झाला किंवा अपघातात अपंगत्व\n आल्यास किंवा अपघातात/नैसर्गिक/गंभीर आजाराने मृत पावल्यास/\n आजारी असल्यास प्रस्तावासोबत क्लेम फॉर्म जोडावा.")
            ],),
          )
        ],
      ),
    );
  }
}