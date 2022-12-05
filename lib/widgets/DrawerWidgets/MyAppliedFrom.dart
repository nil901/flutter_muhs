import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class MyAppliedFrom extends StatelessWidget {
  const MyAppliedFrom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        backgroundColor: HexColor('#074372'),
        title: Text(
          "My Applied Form",
          style: TextStyle(fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber[600],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Sanjivani vidyarthi",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.logo_dev,
                              size: 30,
                            ) ,
                           
                          ],
                        ),
                      ),
                      Text("---------------------------------------------------------------------------------------------------")],
                 ),
              ),
                ) 
              ],
      ),
    );
  }
}
