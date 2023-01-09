import 'package:flutter/material.dart';
import 'package:flutter_muhs/compontes/ComplaintAndSuggestions.dart';
import 'package:flutter_muhs/compontes/ScStObcStudentComplaint.dart';
import 'package:hexcolor/hexcolor.dart';

class GrievanceRedressal extends StatelessWidget {
  const GrievanceRedressal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor('#074372'),
          title: Text(
            "Grevance Redressal",
            style: TextStyle(fontSize: 22),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(1.0),
          child: GridView.count(crossAxisCount: 2, childAspectRatio: 3/2, crossAxisSpacing: 2,
          children: [ 
            InkWell( 
               onTap: (() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ComplaintAndSuggestions()),
                        );
                      }),
              child: Container( 
                height: 20, 
                width: 20, 
                color:HexColor('#074372'), 
                child: Column(
                 children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    "assets/images/c_university.png",
                                    height: 60,
                                  ),
                                ),
                                Text(
                                  "Complaint and\n Suggestions",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                )
                              ],
                ),
              ),
            ),
             InkWell( 
               onTap: (() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ScStStudentComplaint()),
                      );
                    }),
               child: Container( 
                height: 20, 
                width: 20, 
                color:HexColor('#074372'), 
                child: Column( 
                  children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    "assets/images/c_university.png",
                                    height: 60,
                                  ),
                                ),
                                Text(
                                  "Complaint and\n Suggestions",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                )
                              ],
                ),
                         ),
             )
          ],
          
          ),
        ) 
           
        );
  }
}
