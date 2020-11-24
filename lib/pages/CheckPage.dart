import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/CustomWidgets/drawer.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class MLpage extends StatefulWidget {
  @override
  _MLpageState createState() => _MLpageState();
}

class _MLpageState extends State<MLpage> {
  List _outputs;
  File _image;
  bool _loading = false;
  @override
  void initState() {
    super.initState();
    _loading = true;

    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

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
              "Free Beauty Checkup",
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
                        "We use Advanced Machine Learning Framework Call TensorFlow For This Beauty Checkup",
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
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: Text(
                    "Choose Image...",
                    style: GoogleFonts.dancingScript(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700],
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: RaisedButton(
                        color: Colors.blue,
                        onPressed: () {
                          takeImage();
                        },
                        child: Row(children: [
                          Icon(
                            Icons.add_photo_alternate_rounded,
                            color: Colors.limeAccent,
                          ),
                          Text('  Choose Gallery',
                              style: TextStyle(
                                  color: Colors.limeAccent,
                                  fontWeight: FontWeight.bold)),
                        ]),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .47,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: RaisedButton(
                        color: Colors.blue,
                        onPressed: () {
                          pickImage();
                        },
                        child: Row(children: [
                          Icon(
                            Icons.add_photo_alternate_rounded,
                            color: Colors.limeAccent,
                          ),
                          Text('    Take Photo',
                              style: TextStyle(
                                  color: Colors.limeAccent,
                                  fontWeight: FontWeight.bold)),
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
              _loading
                  ? Container(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _outputs != null
                                  ? Column(
                                      children: [
                                        Text(
                                          "Recommended Service: ",
                                          style: GoogleFonts.dancingScript(
                                            color: Colors.green,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            background: Paint()
                                              ..color = Colors.white,
                                          ),
                                        ),
                                        Text(
                                          "${_outputs[0]["label"]}",
                                          style: GoogleFonts.dancingScript(
                                            color: Colors.green,
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            background: Paint()
                                              ..color = Colors.white,
                                          ),
                                        ),
                                      ],
                                    )
                                  : Container(),
                              _image == null
                                  ? Container()
                                  : Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: 300,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .5,
                                        child: Image.file(
                                          _image,
                                        ),
                                      ),
                                    ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
            ]),
          ),
        ],
      ),
    );
  }

  pickImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image == null) return null;
    setState(() {
      _loading = true;
      _image = image;
    });
    classifyImage(image);
  }

  takeImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    setState(() {
      _loading = true;
      _image = image;
    });
    classifyImage(image);
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _loading = false;
      _outputs = output;
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
    );
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }
}
