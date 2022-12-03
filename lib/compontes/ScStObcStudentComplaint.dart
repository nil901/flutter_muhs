import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart'; 


class ScStStudentComplaint extends StatefulWidget {
  const ScStStudentComplaint({super.key});

  @override
  State<ScStStudentComplaint> createState() => _ScStStudentComplaintState();
}

class _ScStStudentComplaintState extends State<ScStStudentComplaint> {
  List<String> items = <String>['SC', 'ST','OBC'];
 
  String dropdownvalue = 'OBC';
  final _fromkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
       appBar: AppBar( 
          
          backgroundColor: HexColor('#074372'),
          title: Text(
            "SC/ST/OBC Complaint Box",
            style: TextStyle(fontSize: 22),
          ),
          centerTitle: true,
        ), 
        body: SingleChildScrollView(
          child: Form(
            key: _fromkey, 
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column( 
                children: [ 
                   SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Text(
                          "Complainant Name",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                          // color: Colors.blue,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.black, width: 1)), 
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: TextField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: 'Enter Your Name',
                      hintStyle: TextStyle(color: Colors.black26, fontSize: 16),
                      border: InputBorder.none,
                    ),
                  ),
                          ),
                    ),
                      SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text(
                        "Complainant Address",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                        // color: Colors.blue,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black, width: 1)), 
                        child:  Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: 'Enter Address',
                    hintStyle: TextStyle(color: Colors.black26, fontSize: 16),
                    border: InputBorder.none,
                  ),
                ),
                        ),
                  ),
                                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "Mobile Number",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                        // color: Colors.blue,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black, width: 1)), 
                        child:  Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: 'Enter 10 Digit Mobile No',
                    hintStyle: TextStyle(color: Colors.black26, fontSize: 16),
                    border: InputBorder.none,
                  ),
                ),
                        ),
                  ), 
                  SizedBox(height: 20,),
                   Row(
                    children: [
                      Text(
                        "Category of the Complainant",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
        
                        // color: Colors.blue,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black, width: 1)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        iconSize: 34, 
                        
                        value: dropdownvalue,
                        items:
                            items.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                              value: value, child: Text(value));
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue ?? '';
                          });
                        },
                      ),
                    ),
                  ), 
                  SizedBox(height: 20,),
                   Row(
                    children: [
                      Text(
                        "Detailed Complaint / feedback",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 90,
                    decoration: BoxDecoration(
                        // color: Colors.blue,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black, width: 1)), 
                        child:  Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Complaint /Feedback',
                    hintStyle: TextStyle(color: Colors.black26, fontSize: 16),
                    border: InputBorder.none,
                  ),
                ),
                        ),
                  ),
                   SizedBox(height: 40,), 
                  Stack( 
                    children: [ 
                      Container(
                    height: 50, 
                    
                    decoration: BoxDecoration(
                       color:  HexColor('#074372'), 
                      borderRadius: BorderRadius.circular(6)),
                    
                  ), 
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text("Submit" ,style: TextStyle(color: Colors.white, fontSize: 25 ,fontWeight: FontWeight.bold),)),
                  )
                    ],
                  ),
                 
                  
                ], 
              ),
            )
            ),
        ) ,
    );
  }
}