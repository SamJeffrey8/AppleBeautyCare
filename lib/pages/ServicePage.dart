import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/CustomWidgets/drawer.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'ContactPage.dart';
import 'HomePage.dart';

class ServicePage extends StatefulWidget {
  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
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
      backgroundColor: Colors.white,
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            iconTheme:
                new IconThemeData(color: Colors.lightGreenAccent, size: 20),
            title: Text(
              "Services",
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
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Image(
                    width: 50,
                    image: AssetImage("images/salf.jpg"),
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
                padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                        text: "Salt And Oil Bath",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Massage therapy is an excellent way to improve your health and wellness. An effective way to treat stress, headaches, sports injuries, fibromyalgia, anxiety and other painful symptoms arising due to muscle tension, massage can alleviate a wide range of pains, stretch weakened muscles and improve joint flexibility. In addition to this, it has been shown to improve circulation, a benefit that has wide-reaching implications on overall health.",
                      style: GoogleFonts.dancingScript(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Contact Details",
                    style: GoogleFonts.dancingScript(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700],
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  ListTile(
                    trailing: InkWell(
                      onTap: callNumber,
                      child: Icon(
                        Icons.phone,
                        color: Colors.green,
                      ),
                    ),
                    title: InkWell(
                        onTap: callNumber,
                        child: Text(
                          "Phone: +91 9843219776",
                          style: GoogleFonts.roboto(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.green[700],
                          ),
                        )),
                  ),
                  ListTile(
                    trailing: InkWell(
                      onTap: () {
                        Route route =
                            MaterialPageRoute(builder: (c) => ContactPage());
                        Navigator.push(context, route);
                      },
                      child: Icon(
                        Icons.location_on,
                        color: Colors.green,
                      ),
                    ),
                    title: InkWell(
                        child: Text(
                      "Address: No 4, Ansari Nagar, West Cross Street, Opposite To Royal School, Mahaboobpalayam, Madurai -10",
                      style: GoogleFonts.roboto(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.green[700],
                      ),
                    )),
                  ),
                  ListTile(
                    trailing: InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.mail,
                        color: Colors.green,
                      ),
                    ),
                    title: InkWell(
                        child: Text(
                      "Email: applebeautycare2003@gmail.com",
                      style: GoogleFonts.roboto(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.green[700],
                      ),
                    )),
                  ),
                ],
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
  } //appointment form
}
