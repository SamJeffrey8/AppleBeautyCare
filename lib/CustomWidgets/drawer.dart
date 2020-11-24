import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/AboutPage.dart';
import 'package:flutter_app/pages/BridalPage.dart';
import 'package:flutter_app/pages/CheckPage.dart';
import 'package:flutter_app/pages/ContactPage.dart';
import 'package:flutter_app/pages/Gallery.dart';
import 'package:flutter_app/pages/HomePage.dart';
import 'package:flutter_app/pages/ServicePage.dart';
import 'package:flutter_app/pages/Training.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0.0),
        children: [
          Container(
            padding: EdgeInsets.only(top: 50.0, bottom: 10.0),
            decoration: new BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.blue[900]],
                begin: Alignment.topLeft,
                end: Alignment(
                    0.8, 0.0), // 10% of the width, so there are ten blinds.
                stops: [0.0, 1.0],
                tileMode:
                    TileMode.mirror, // repeats the gradient over the canvas
              ),
            ),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset("images/logo.png")),
                  height: 90.0,
                  width: 90.0,
                ),
                SizedBox(
                  height: 1.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7.0),
                  child: Text("Apple Beauty Care",
                      style: TextStyle(
                        color: Colors.lightGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                ),
              ],
            ),
          ),
          Column(
            children: [
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.green,
                ),
                title: Text(
                  "HOME",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                onTap: () {
                  Route route = MaterialPageRoute(builder: (c) => HomePage());
                  Navigator.pushReplacement(context, route);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.fact_check_rounded,
                  color: Colors.green,
                ),
                title: Text(
                  "Free Beauty Check Up",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                onTap: () {
                  Route route = MaterialPageRoute(builder: (c) => MLpage());
                  Navigator.push(context, route);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.design_services,
                  color: Colors.green,
                ),
                title: Text(
                  "SERVICES",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                onTap: () {
                  Route route =
                      MaterialPageRoute(builder: (c) => ServicePage());
                  Navigator.push(context, route);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.green,
                ),
                title: Text(
                  "BRIDAL MAKEUP",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                onTap: () {
                  Route route = MaterialPageRoute(builder: (c) => BridalPage());
                  Navigator.push(context, route);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.photo_album_rounded,
                  color: Colors.green,
                ),
                title: Text(
                  "GALLERY",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                onTap: () {
                  Route route =
                      MaterialPageRoute(builder: (c) => GalleryPage());
                  Navigator.push(context, route);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.school_rounded,
                  color: Colors.green,
                ),
                title: Text(
                  "TRAINING CLASSES",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                onTap: () {
                  Route route = MaterialPageRoute(builder: (c) => Training());
                  Navigator.push(context, route);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.contact_mail_rounded,
                  color: Colors.green,
                ),
                title: Text(
                  "CONTACT US",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                onTap: () {
                  Route route =
                      MaterialPageRoute(builder: (c) => ContactPage());
                  Navigator.push(context, route);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.emoji_events_rounded,
                  color: Colors.green,
                ),
                title: Text(
                  "ABOUT US",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                onTap: () {
                  Route route = MaterialPageRoute(builder: (c) => AboutPage());
                  Navigator.push(context, route);
                },
              ),
              Divider(),
            ],
          ),
        ],
      ),
    );
  }
}
