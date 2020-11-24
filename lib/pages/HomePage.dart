import 'package:carousel_pro/carousel_pro.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/CustomWidgets/drawer.dart';
import 'package:flutter_app/pages/CheckPage.dart';
import 'package:flutter_app/pages/ContactPage.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'ServicePage.dart';

launchURL() async {
  const url = 'https://www.instagram.com/apple_beauty_care_madurai/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

callNumber() async {
  const number = '+91 9843219776'; //set the number here
  bool res = await FlutterPhoneDirectCaller.callNumber(number);
} //call

launchURLYT() async {
  const url =
      'https://www.youtube.com/channel/UCy7V6xB0BfKwLDG2cSsaZPw/featured';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _firebaseMessaging = FirebaseMessaging();
  String _message = 'Generating Message...';
  String _token = 'Generating Token...';

  void initState() {
    super.initState();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        setState(() {
          _message = '$message';
        });
      },
      onLaunch: (Map<String, dynamic> message) async {
        setState(() {
          _message = '$message';
        });
      },
      onResume: (Map<String, dynamic> message) async {
        setState(() {
          _message = '$message';
        });
      },
    );

    _firebaseMessaging.getToken().then((String token) {
      assert(token != null);
      setState(() {
        _token = '$token';
      });
    });
  }

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
            FlutterOpenWhatsapp.sendSingleMessage("+91 9843219776", '''
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
              "Apple Beauty Care",
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
              img_caro,
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
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.lightBlueAccent,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "We Bring to You a Bouquet of Services to remain Worry Free about Your Looks. We have Excellent Beauty Care Services and the Equipment and Products we use are of Premium",
                      style: GoogleFonts.dancingScript(
                          fontSize: 20,
                          color: Colors.blue[900],
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
                    child: Container(
                      height: 135,
                      width: MediaQuery.of(context).size.width * .47,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.lightBlueAccent,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              "Our Mission",
                              style: GoogleFonts.dancingScript(
                                  fontSize: 25,
                                  color: Colors.lime,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "To craft latest trends into effortless beauty.",
                              style: GoogleFonts.dancingScript(
                                  fontSize: 20,
                                  color: Colors.blue[900],
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * .46,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.lightBlueAccent,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              "Our Vision",
                              style: GoogleFonts.dancingScript(
                                  fontSize: 25,
                                  color: Colors.lime,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "To be a renowned name for quality beauty and hair solutions.",
                              style: GoogleFonts.dancingScript(
                                  fontSize: 20,
                                  color: Colors.blue[900],
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width * .5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    color: Colors.blue,
                    onPressed: () {
                      Route route = MaterialPageRoute(builder: (c) => MLpage());
                      Navigator.push(context, route);
                    },
                    child: Row(children: [
                      Icon(
                        Icons.fact_check,
                        color: Colors.limeAccent,
                      ),
                      Center(
                        child: Text('                    Free Beauty Checkup',
                            style: TextStyle(
                                color: Colors.limeAccent,
                                fontWeight: FontWeight.bold)),
                      ),
                    ]),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 20.0),
                child: Container(
                  child: Image(
                    height: 200,
                    image: AssetImage("images/welcome.jpg"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 0.0),
                child: Container(
                  child: Image(
                    image: AssetImage("images/proc.jpg"),
                  ),
                ),
              ),
              Image(
                image: AssetImage("images/thread.jpg"),
              ),
              Image(
                image: AssetImage("images/fac.jpg"),
              ),
              Image(
                image: AssetImage("images/nail.jpg"),
              ),
              Image(
                image: AssetImage("images/ped.jpeg"),
              ),
              Image(
                height: 55,
                image: AssetImage("images/serve.jpg"),
              ),
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
              Center(
                child: InkWell(
                  onTap: () {
                    Route route =
                        MaterialPageRoute(builder: (c) => ServicePage());
                    Navigator.push(context, route);
                  },
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
                child: RichText(
                  text: TextSpan(
                      text:
                          "Massage therapy is an excellent way to improve your health and wellness. An effective way to treat stress, headaches, sports injuries, fibromyalgia",
                      style: GoogleFonts.dancingScript(
                          fontSize: 18,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                            text: " Know More...",
                            style: GoogleFonts.dancingScript(
                                fontSize: 18,
                                color: Colors.lightGreen,
                                fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Route route = MaterialPageRoute(
                                    builder: (c) => ServicePage());
                                Navigator.push(context, route);
                              })
                      ]),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Image(
                      height: 50,
                      image: AssetImage("images/crev.jpg"),
                    ),
                  ),
                ],
              ),
              Image(
                height: 100,
                image: AssetImage("images/preethi.png"),
              ),
              Center(
                child: Text(
                  "Apple Beauty is outstanding!",
                  style: GoogleFonts.dancingScript(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '''Head massages have done wonders. For the first time in five years it feels completely relaxed and I can enjoy my life again.''',
                    style: GoogleFonts.dancingScript(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700],
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Preethi",
                    style: GoogleFonts.dancingScript(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.green,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                  height: 100,
                  image: AssetImage("images/sara.png"),
                ),
              ),
              Center(
                child: Text(
                  "Always a gentle and renewed.",
                  style: GoogleFonts.dancingScript(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '''I love this salon. They provide great customer service. When they give you an appointment they make sure they are ready when you arrive.''',
                    style: GoogleFonts.dancingScript(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700],
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Sara",
                    style: GoogleFonts.dancingScript(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.green,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                  height: 100,
                  image: AssetImage("images/divya.png"),
                ),
              ),
              Center(
                child: Text(
                  "Comfortable and clean",
                  style: GoogleFonts.dancingScript(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "LOVED my hair and makeup! You guys made me look like a queen. thank you so much. my husband was speechless. will come back again for other occasions.",
                    style: GoogleFonts.dancingScript(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700],
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Divya",
                    style: GoogleFonts.dancingScript(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.green,
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
              Image(
                height: 350,
                image: AssetImage("images/xp.jpg"),
              ),
              _formAP(),
            ]),
          )
        ],
      ),
      drawer: MyDrawer(),
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

Widget img_caro = Container(
  height: 200,
  child: Carousel(
    dotSize: 4.0,
    dotSpacing: 15.0,
    dotColor: Colors.lightGreenAccent,
    indicatorBgPadding: 5.0,
    dotBgColor: Colors.blue.withOpacity(0.5),
    boxFit: BoxFit.cover,
    images: [
      AssetImage("images/c1.jpg"),
      AssetImage("images/c2.jpg"),
      AssetImage("images/c4.jpg"),
      AssetImage("images/c5.jpg"),
      AssetImage("images/c3.jpg"),
      AssetImage("images/c6.jpg"),
    ],
    autoplay: true,
    animationCurve: Curves.fastOutSlowIn,
    animationDuration: Duration(milliseconds: 1000),
  ),
);
