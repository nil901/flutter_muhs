import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class MyDrawar extends StatefulWidget {
  @override
  State<MyDrawar> createState() => _MyDrawarState();
}

var currentpage = drawerSection.home;

class _MyDrawarState extends State<MyDrawar> {
  @override
  Widget build(BuildContext) {
    return Drawer(
      child: Container(
        child: Column(
          children: [
            DrawarHader(),
            MyDrawerList(),
          ],
        ),
      ),
    );
  }
}

Widget MyDrawerList() {
  return Container(
    padding: EdgeInsets.only(top: 15),
    child: Column(
      children: [
        menuItem(1, "Home", Icons.home,
            currentpage == drawerSection.home ? true : false),
        menuItem(2, "MyProfile", Icons.people,
            currentpage == drawerSection.myProfile ? true : false),
        menuItem(3, "Applied Form", Icons.pages,
            currentpage == drawerSection.appliedForm ? true : false),
        menuItem(4, "Share", Icons.share,
            currentpage == drawerSection.share ? true : false),
        menuItem(5, "Rate Us", Icons.star_rate_outlined,
            currentpage == drawerSection.rateus ? true : false),
        menuItem(6, "Privacy Policy", Icons.privacy_tip,
            currentpage == drawerSection.privacypolicy ? true : false),
        menuItem(7, "Terms & Conditions", Icons.polyline_sharp,
            currentpage == drawerSection.termsandcondions ? true : false),
        menuItem(8, "Share", Icons.logout,
            currentpage == drawerSection.logout ? true : false),
      ],
    ),
  );
}

Widget menuItem(int id, String title, IconData icon, bool selected) => Builder(
  builder: (context) {
    return     Material(
    
          child: InkWell(
    
            onTap: (() {
    
              Navigator.pop(context); 
              
    
            }),
    
            child: Padding(
    
              padding: EdgeInsets.all(15.0),
    
              child: Row(
    
                children: [
    
                  Expanded(
    
                      child: Icon(
    
                    icon,
    
                    size: 25,
    
                    color: HexColor('#074372'),
    
                  )),
    
                  Expanded(
    
                    flex: 3,
    
                    child: Text(
    
                      title,
    
                      style: TextStyle(
    
                        color: HexColor('#074372'),
    
                        fontSize: 15,
    
                      ),
    
                    ),
    
                  )
    
                ],
    
              ),
    
            ),
    
          ),
    
        );
  }
);

class DrawarHader extends StatelessWidget {
  const DrawarHader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor('#074372'),
      width: double.infinity,
      height: 210,
      padding: EdgeInsets.only(top: 28.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
          height: 100,
          child: Image.asset(
            "assets/images/logo.png",
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          "Welcome, UserName",
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        )
      ]),
    );
  }
}

enum drawerSection {
  home,
  myProfile,
  appliedForm,
  share,
  rateus,
  privacypolicy,
  termsandcondions,
  logout
}
