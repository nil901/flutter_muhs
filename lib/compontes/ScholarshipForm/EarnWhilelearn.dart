import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

class EarnWhileLearn extends StatefulWidget {
  const EarnWhileLearn({super.key});

  @override
  State<EarnWhileLearn> createState() => _EarnWhileLearnState();
}

class _EarnWhileLearnState extends State<EarnWhileLearn> {
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
      body: Column( 
        children: [ 
           Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "(सहपत्र 'अ')",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                )
              ],
            ),
            Center(
              child: Text(
                "महाराष्ट्र आरोग्य विज्ञान विद्यापीठ, नाशिक",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "नमुना अर्ज",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            Text("सावित्रीबाई फुले मुलींकरीता शिष्यवृत्ती योजना",
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
                              onTap: ()=> PickImageImag(ImageSource.camera),
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
                    child:  image != null ? Image.file(image!, width: 120,height: 120,fit: BoxFit.cover,): null
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    "प्रति,\nमा. संचालक, विद्यार्थी कल्याण\n महाराष्ट्र आरोग्य विज्ञान विद्यापीठ, नाशिक..",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                )
              ],
            ),
        ],
      ),
    ); 
  }
}
