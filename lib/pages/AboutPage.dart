import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/CustomWidgets/drawer.dart';
import 'package:flutter_app/pages/ServicePage.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'ContactPage.dart';
import 'HomePage.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  TextEditingController _nameTextEditingController = TextEditingController();
  TextEditingController _emailTextEditingController = TextEditingController();
  TextEditingController _mobileTextEditingController = TextEditingController();
  TextEditingController _msgTextEditingController = TextEditingController();
  TextEditingController dateCtl = TextEditingController();
  bool get wantKeepAlive => true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      floatingActionButton: Container(
        width: 50.0,
        height: 50.0,
        child: new RawMaterialButton(
          shape: new CircleBorder(),
          elevation: 0.0,
          child: Icon(
            Icons.message,
            color: Colors.lime,
            size: 50,
          ),
          onPressed: () {
            FlutterOpenWhatsapp.sendSingleMessage("+91 8608580574", '''
                                  Hey, I`m here from the Apple Beauty Care`s Mobile App
                                  ''');
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            iconTheme:
                new IconThemeData(color: Colors.lightGreenAccent, size: 20),
            title: Text(
              "About Us",
              style: GoogleFonts.dancingScript(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.lightGreenAccent,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.blueAccent,
            brightness: Brightness.light,
            expandedHeight: 40.0,
            floating: true,
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
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, left: 20.0, bottom: 20),
                child: Container(
                  child: Image(
                    height: 200,
                    image: AssetImage("images/welcome.jpg"),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.blue[100],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Dear Ladies, you are most welcome to visit us at the Apple Beauty Care.",
                        style: GoogleFonts.dancingScript(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[700],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.blue[100],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '''Whether you wish to maintain or update your image, our professionals will gladly assist you and willingly take on board your wishes, suggestions, requirements and needs. Our stylists use the most modern colouring, haircutting and hair extension techniques. We are one of the most affordable beauty service providers in India. Our only aim is to provide awesome beauty services to all women.''',
                        style: GoogleFonts.dancingScript(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[700],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: RaisedButton(
                        color: Colors.blue,
                        onPressed: callNumber,
                        child: Row(children: [
                          Icon(
                            Icons.call,
                            color: Colors.limeAccent,
                          ),
                          // Text('  Call',
                          //     style: TextStyle(
                          //         color: Colors.limeAccent,
                          //         fontWeight: FontWeight.bold)),
                        ]),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .57,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: RaisedButton(
                        color: Colors.blue,
                        onPressed: () {
                          Route route =
                              MaterialPageRoute(builder: (c) => ContactPage());
                          Navigator.push(context, route);
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.book,
                              color: Colors.limeAccent,
                            ),
                            Text(
                              ' Book An Appointment',
                              style: TextStyle(
                                  color: Colors.limeAccent,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: RaisedButton(
                        color: Colors.blue,
                        onPressed: () => MapsLauncher.launchQuery(
                            'Apple Beauty Care ( Beauty Parlour, Beautician institute, Bridal Makeup in Madurai ), No:4A, Ansari Nagar West Cross Street, 7th Street opp to Royal school Mahaboobpalayam, AA Rd, Bismi Manzil, Mahapupalayam, Tamil Nadu 625016'),
                        child: Row(children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.limeAccent,
                          ),
                          // Text('  Call',
                          //     style: TextStyle(
                          //         color: Colors.limeAccent,
                          //         fontWeight: FontWeight.bold)),
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .47,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: RaisedButton(
                        color: Colors.blue,
                        onPressed: launchURL,
                        child: Row(children: [
                          Icon(
                            MdiIcons.instagram,
                            color: Colors.limeAccent,
                          ),
                          Text(
                            '     Instagram',
                            style: TextStyle(
                                color: Colors.limeAccent,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: RaisedButton(
                        color: Colors.blue,
                        onPressed: launchURLYT,
                        child: Row(children: [
                          Icon(
                            MdiIcons.youtube,
                            color: Colors.limeAccent,
                          ),
                          Text(
                            '       Youtube',
                            style: TextStyle(
                                color: Colors.limeAccent,
                                fontWeight: FontWeight.bold),
                          ),
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  color: Colors.blue,
                  child: Text(
                    "Services",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Route route =
                        MaterialPageRoute(builder: (c) => ServicePage());
                    Navigator.push(context, route);
                  },
                ),
              ),
              Image(
                image: AssetImage("images/FaceT.jpg"),
              ),
              Image(
                image: AssetImage("images/HapCT.jpg"),
              ),
              Image(
                image: AssetImage("images/MasT.jpg"),
              ),
              Image(
                image: AssetImage("images/thredT.jpg"),
              ),
              Image(
                image: AssetImage("images/mkap.jpg"),
              ),
              _formAP(),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _formAP() {
    return Form(
      key: _formKey,
      child: SizedBox(
        height: 500,
        child: ListView(
          children: [
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.green,
              ),
              title: Container(
                width: 50.0,
                child: TextFormField(
                  maxLengthEnforced: true,
                  maxLength: 18,
                  showCursor: true,
                  inputFormatters: [
                    new LengthLimitingTextInputFormatter(18),
                  ],
                  textCapitalization: TextCapitalization.words,
                  style: TextStyle(color: Colors.green),
                  controller: _nameTextEditingController,
                  decoration: InputDecoration(
                      hintText: "Please Enter Your Name",
                      hintStyle: TextStyle(color: Colors.green),
                      border: InputBorder.none),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Enter Your Name';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Divider(
              color: Colors.purpleAccent,
            ),
            ListTile(
              leading: Icon(
                Icons.phone,
                color: Colors.green,
              ),
              title: Container(
                width: 50.0,
                child: TextFormField(
                  maxLengthEnforced: true,
                  maxLength: 12,
                  showCursor: true,
                  inputFormatters: [
                    new LengthLimitingTextInputFormatter(12),
                  ],
                  textCapitalization: TextCapitalization.words,
                  style: TextStyle(color: Colors.green),
                  controller: _mobileTextEditingController,
                  decoration: InputDecoration(
                      hintText: "Please Enter Your Mobile Number",
                      hintStyle: TextStyle(color: Colors.green),
                      border: InputBorder.none),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            Divider(
              color: Colors.purpleAccent,
            ),
            ListTile(
              leading: Icon(
                Icons.email,
                color: Colors.green,
              ),
              title: Container(
                width: 50.0,
                child: TextFormField(
                  maxLengthEnforced: true,
                  maxLength: 18,
                  showCursor: true,
                  inputFormatters: [
                    new LengthLimitingTextInputFormatter(18),
                  ],
                  textCapitalization: TextCapitalization.words,
                  style: TextStyle(color: Colors.green),
                  controller: _emailTextEditingController,
                  decoration: InputDecoration(
                      hintText: "Please Enter Your Email",
                      hintStyle: TextStyle(color: Colors.green),
                      border: InputBorder.none),
                ),
              ),
            ),
            Divider(
              color: Colors.purpleAccent,
            ),
            ListTile(
              leading: Icon(
                Icons.messenger_rounded,
                color: Colors.green,
              ),
              title: Container(
                width: 50.0,
                child: TextFormField(
                  maxLengthEnforced: true,
                  maxLength: 50,
                  showCursor: true,
                  inputFormatters: [
                    new LengthLimitingTextInputFormatter(50),
                  ],
                  textCapitalization: TextCapitalization.words,
                  style: TextStyle(color: Colors.green),
                  controller: _msgTextEditingController,
                  decoration: InputDecoration(
                      hintText: "Please Enter Your Message",
                      hintStyle: TextStyle(color: Colors.green),
                      border: InputBorder.none),
                ),
              ),
            ),
            Divider(
              color: Colors.purpleAccent,
            ),
            ListTile(
              leading: Icon(
                Icons.calendar_today,
                color: Colors.green,
              ),
              title: Container(
                width: 50.0,
                child: TextFormField(
                  controller: dateCtl,
                  decoration: InputDecoration(
                    labelText: "Appointment Date",
                    hintText: "Ex. Insert your desired date",
                  ),
                  onTap: () async {
                    DateTime date = DateTime(1900);
                    FocusScope.of(context).requestFocus(new FocusNode());

                    date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100));

                    dateCtl.text = date.toIso8601String();
                  },
                ),
              ),
            ),
            Divider(
              color: Colors.purpleAccent,
            ),
            Container(
              height: 45,
              width: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: RaisedButton(
                color: Colors.green,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    FlutterOpenWhatsapp.sendSingleMessage("+91 9843219776", '''
                                  Name: ${_nameTextEditingController.text.trim()}
                                  Mobile Number: ${_mobileTextEditingController.text.trim()}
                                  Email: ${_emailTextEditingController.text.trim()}
                                  Message: ${_msgTextEditingController.text.trim()}
                                  ''');
                  }
                },
                elevation: 5.0,
                splashColor: Colors.green,
                child: Text(
                  'Book An Appointment',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  } //a
}
