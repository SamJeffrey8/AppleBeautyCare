import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/CustomWidgets/drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GalleryPage extends StatefulWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  TextEditingController _nameTextEditingController = TextEditingController();
  TextEditingController _emailTextEditingController = TextEditingController();
  TextEditingController _mobileTextEditingController = TextEditingController();
  TextEditingController _msgTextEditingController = TextEditingController();
  TextEditingController dateCtl = TextEditingController();
  bool get wantKeepAlive => true;
  String currentMainImage = "images/c1.jpg";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme:
              new IconThemeData(color: Colors.lightGreenAccent, size: 20),
          title: Text(
            "Gallery",
            style: GoogleFonts.dancingScript(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.lightGreenAccent,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
          brightness: Brightness.light,
          flexibleSpace: Container(
            decoration: new BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.blue[800]],
                begin: Alignment.bottomLeft,
                end: Alignment(
                    0.8, 0.0), // 10% of the width, so there are ten blinds.
                stops: [0.0, 1.0],
                tileMode:
                    TileMode.clamp, // repeats the gradient over the canvas
              ),
            ),
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  MdiIcons.youtubeTv,
                  color: Colors.lightGreenAccent,
                ),
                child: Text(
                  "Pictures",
                  style: GoogleFonts.dancingScript(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.lightGreenAccent,
                  ),
                ),
              ),
              Tab(
                icon: Icon(
                  MdiIcons.instagram,
                  color: Colors.lightGreenAccent,
                ),
                child: Text(
                  "Pictures",
                  style: GoogleFonts.dancingScript(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.lightGreenAccent,
                  ),
                ),
              )
            ],
            indicatorColor: Colors.white24,
            indicatorWeight: 5.0,
          ),
        ),
        drawer: MyDrawer(),
        body: TabBarView(
          children: [
            WebView(
              initialUrl:
                  'https://www.youtube.com/channel/UCy7V6xB0BfKwLDG2cSsaZPw/featured',
              javascriptMode: JavascriptMode.unrestricted,
            ),
            WebView(
              initialUrl:
                  'https://www.instagram.com/apple_beauty_care_madurai/',
              javascriptMode: JavascriptMode.unrestricted,
            ),
          ],
        ),
      ),
    );
  }
}

_callNumber() async {
  const number = '08592119XXXX'; //set the number here
} //call
