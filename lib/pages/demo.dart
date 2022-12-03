import 'package:flutter/material.dart';
import 'package:flutter_muhs/pages/Drawer.dart';
import 'package:flutter_muhs/pages/MuhsHomePage.dart'; 


 class DrawerPage extends StatefulWidget {
 

  @override
  State<DrawerPage> createState() => _DrawerPageState();

}

class _DrawerPageState extends State<DrawerPage> {
  var currentPage = DrawerSections.home;
  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.home) {
      container = MuhsHomePage();
    } else if (currentPage == DrawerSections.myProfile) {
     // container = ContactsPage();
    } else if (currentPage == DrawerSections.appliedForm) {
     // container = EventsPage();
    } else if (currentPage == DrawerSections.share) {
      //container = NotesPage();
    } else if (currentPage == DrawerSections.rateus) {
      //container = SettingsPage();
    } else if (currentPage == DrawerSections.privacypolicy) {
     // container = NotificationsPage();
    } else if (currentPage == DrawerSections.termsandcondions) {
      //container = PrivacyPolicyPage();
    } else if (currentPage == DrawerSections.logout) {
      //container = SendFeedbackPage();
    }
    return Scaffold(
       
        body:container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                DrawarHader(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.home;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.home) {
      container = MuhsHomePage();
    } else if (currentPage == DrawerSections.myProfile) {
     // container = ContactsPage();
    } else if (currentPage == DrawerSections.appliedForm) {
     // container = EventsPage();
    } else if (currentPage == DrawerSections.share) {
      //container = NotesPage();
    } else if (currentPage == DrawerSections.rateus) {
      //container = SettingsPage();
    } else if (currentPage == DrawerSections.privacypolicy) {
     // container = NotificationsPage();
    } else if (currentPage == DrawerSections.termsandcondions) {
      //container = PrivacyPolicyPage();
    } else if (currentPage == DrawerSections.logout) {
      //container = SendFeedbackPage();
    }
    return Scaffold(
      
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                DrawarHader(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
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

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
              setState(() {
                if (id == 1) {
                  currentPage = DrawerSections.home;
                } else if (id == 2) {
                  currentPage = DrawerSections.myProfile;
                } else if (id == 3) {
                  currentPage = DrawerSections.appliedForm;
                } else if (id == 4) {
                  currentPage = DrawerSections.share;
                } else if (id == 5) {
                  currentPage = DrawerSections.rateus;
                } else if (id == 6) {
                  currentPage = DrawerSections.privacypolicy;
                } else if (id == 7) {
                  currentPage = DrawerSections.termsandcondions;
                } else if (id == 8) {
                  currentPage = DrawerSections.logout;
                }
              });
            },
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                    child: Icon(
                      icon,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    
  }


enum DrawerSections {
   home,
  myProfile,
  appliedForm,
  share,
  rateus,
  privacypolicy,
  termsandcondions,
  logout
}
