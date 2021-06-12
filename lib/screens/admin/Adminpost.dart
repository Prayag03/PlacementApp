import 'dart:collection';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class AdminPost extends StatefulWidget {
  const AdminPost({Key key}) : super(key: key);

  @override
  _AdminPostState createState() => _AdminPostState();
}

class _AdminPostState extends State<AdminPost> {
  int i;
  Map<String, String> bl = HashMap<String, String>();
  Map<String, String> sl = HashMap<String, String>();
  TextEditingController cn = TextEditingController();
  TextEditingController packc = TextEditingController();
  TextEditingController rolec = TextEditingController();
  int tap = 0;
  File _image1;

  List<Map<String, double>> rolepackage = List<HashMap<String, double>>();

  Future getImage1() async {
    // ignore: deprecated_member_use
    final Image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 75);
    setState(() {
      _image1 = Image;
      tap++;
    });
  }

  Widget Sem() {
    return Container(
        width: MediaQuery.of(context).size.width * 0.90,
        child: Column(children: <Widget>[
          Text(" Semester ",
              style: TextStyle(
                fontSize: 23,
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.left),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: double.infinity,
                  decoration: new BoxDecoration(
                    //color: Colors.blue[100],
                    border: Border.all(
                      width: 0.3,
                      color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(0),
                    shadowColor: Colors.blue,
                    child: Column(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(
                                left: 10.0, right: 5.0, top: 5.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    DropdownButton(
                                      items: [
                                        DropdownMenuItem(
                                            value: "5",
                                            child: Center(
                                              child: Text("5",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25,
                                                  )),
                                            )),
                                        DropdownMenuItem(
                                            value: "6",
                                            child: Center(
                                              child: Text("6",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25,
                                                  )),
                                            )),
                                        DropdownMenuItem(
                                            value: "7",
                                            child: Center(
                                              child: Text("7",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25,
                                                  )),
                                            )),
                                        DropdownMenuItem(
                                            value: "8",
                                            child: Center(
                                              child: Text("8",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25,
                                                  )),
                                            )),
                                      ],
                                      onChanged: (_value) {
                                        setState(() {
                                          if (sl[_value] == _value) {
                                            sl.remove(_value);
                                          } else {
                                            sl[_value] = _value;
                                          }
                                          //csc.text = _value;
                                        });
                                      },
                                      hint: Text(" Select Semester ",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                          )),
                                      // enabled: !_status,
                                      // autofocus: !_status,
                                    )
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 5.0, right: 5.0, top: 2.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Flexible(
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 5.0,
                                        right: 5.0,
                                      ),
                                      child: new Text(
                                        '${sl.values}',
                                        style: TextStyle(
                                            fontSize: 25, color: Colors.white),
                                      )),
                                ),
                              ],
                            )),
                      ],
                    ),
                  )))
        ]));
  }

  initState() {
    super.initState();
    i = 0;
  }

  Widget Branch() {
    return Container(
        width: MediaQuery.of(context).size.width * 0.90,
        child: Column(children: <Widget>[
          Text(" Branch ",
              style: TextStyle(
                fontSize: 23,
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.left),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: double.infinity,
                  decoration: new BoxDecoration(
                    //color: Colors.blue[100],
                    border: Border.all(
                      width: 0.3,
                      color: Colors.blue,
                    ),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(0),
                    shadowColor: Colors.blue,
                    child: Column(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(
                                left: 10.0, right: 5.0, top: 5.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    DropdownButton(
                                      items: [
                                        DropdownMenuItem(
                                            value:
                                                "Electronics and Communication",
                                            child: Center(
                                              child: Text(
                                                  "Electronics and Communication",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25,
                                                  )),
                                            )),
                                        DropdownMenuItem(
                                            value:
                                                "Instrumentation and Control",
                                            child: Center(
                                              child: Text(
                                                  "Instrumentation and Control",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25,
                                                  )),
                                            )),
                                        DropdownMenuItem(
                                            value: "Civil Engineering",
                                            child: Center(
                                              child: Text("Civil Engineering",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25,
                                                  )),
                                            )),
                                        DropdownMenuItem(
                                            value: "Chemical Engineering",
                                            child: Center(
                                              child:
                                                  Text("Chemical Engineering",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 25,
                                                      )),
                                            )),
                                        DropdownMenuItem(
                                            value: "Mechanical Engineering",
                                            child: Center(
                                              child:
                                                  Text("Mechanical Engineering",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 25,
                                                      )),
                                            )),
                                        DropdownMenuItem(
                                            value: "Information Technology",
                                            child: Center(
                                              child:
                                                  Text("Information Technology",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 25,
                                                      )),
                                            )),
                                        DropdownMenuItem(
                                            value: "Computer Engineering",
                                            child: Center(
                                              child:
                                                  Text("Computer Engineering",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 25,
                                                      )),
                                            )),
                                      ],
                                      onChanged: (_value) {
                                        setState(() {
                                          if (bl[_value] == _value) {
                                            bl.remove(_value);
                                          } else {
                                            bl[_value] = _value;
                                          }
                                          //csc.text = _value;
                                        });
                                      },
                                      hint: Text(" Select Branch ",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                          )),
                                      // enabled: !_status,
                                      // autofocus: !_status,
                                    )
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 5.0, right: 5.0, top: 2.0),
                            child: new Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Flexible(
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 5.0,
                                        right: 5.0,
                                      ),
                                      child: new Text(
                                        '${bl.values}',
                                        style: TextStyle(
                                            fontSize: 25, color: Colors.white),
                                      )),
                                ),
                              ],
                            )),
                      ],
                    ),
                  )))
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          floatingActionButton: Tooltip(
            message: 'add image',
            textStyle: TextStyle(fontSize: 15, color: Colors.white),
            child: new FloatingActionButton(
              onPressed: () {
                if (tap == 0) {
                  getImage1();
                } else {
                  Fluttertoast.showToast(
                    msg: "only one image allowed",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                  );
                }
              },
              child: const Icon(Icons.image),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniEndFloat,
          bottomNavigationBar: new BottomAppBar(
            color: Colors.white,
          ),
          appBar: AppBar(
            //automaticallyImplyLeading: false,
            backgroundColor: Colors.blue[300],
            title: Text(
              "Company Details",
              style: GoogleFonts.pattaya(fontSize: 30),
            ),
            centerTitle: true,
            elevation: 10,
          ),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 30),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    child: TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Enter Company Name",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(),
                        ),
                        //fillColor: Colors.green
                      ),
                      validator: (val) {
                        if (val.length == 0) {
                          return "Email cannot be empty";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    child: TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Company Details",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(),
                        ),
                        //fillColor: Colors.green
                      ),
                      validator: (val) {
                        if (val.length == 0) {
                          return "Email cannot be empty";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),

                  /////////////////////////////////
                  Container(
                      child: _image1 == null
                          ? Container()
                          : Column(children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(
                                      left: 5.0, right: 5.0, top: 5.0),
                                  child: new Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      new Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          new Text(
                                            ' Image',
                                            style: TextStyle(
                                              fontSize: 23.0,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                              // SizedBox(height: 5),
                              Container(
                                  padding: EdgeInsets.all(8),
                                  height: 350,
                                  width: MediaQuery.of(context).size.width,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 1,
                                      itemBuilder: (context, index) {
                                        return Container(
                                            child: Padding(
                                          padding: const EdgeInsets.all(0.0),
                                          child: Image.file(
                                            _image1,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.91,
                                            height: 350,
                                          ),
                                        ));
                                      })),
                            ])),

                  SizedBox(height: 30),
                  Branch(),
                  Sem(),
                  Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: TextFormField(
                            controller: rolec,
                            style: TextStyle(fontSize: 25, color: Colors.white),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: ' \t\t\t\t Role',
                            )),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          height: 50,
                          width: 20,
                          // ignore: deprecated_member_use
                          child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(80.0)),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text(
                                          'Package for the Role',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25.0,
                                          ),
                                        ),
                                        content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              TextFormField(
                                                controller: packc,
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration: new InputDecoration(
                                                  labelText: "Package",
                                                  fillColor: Colors.white,
                                                  border:
                                                      new OutlineInputBorder(
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(25.0),
                                                    borderSide:
                                                        new BorderSide(),
                                                  ),
                                                  //fillColor: Colors.green
                                                ),
                                                validator: (val) {
                                                  if (val.length == 0) {
                                                    return "Email cannot be empty";
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                              ),
                                              RaisedButton(
                                                  child: Text('SUBMIT'),
                                                  onPressed: () {
                                                    Map<String, double> tmp =
                                                        HashMap<String,
                                                            double>();

                                                    tmp['${rolec.text}'] =
                                                        double.parse(
                                                            packc.text);

                                                    rolepackage.add(tmp);
                                                    print(rolepackage);
                                                    rolec.clear();
                                                    packc.clear();
                                                    Navigator.of(context).pop();
                                                  }),
                                            ]),
                                      );
                                    });
                              },
                              child: Icon(Icons.add)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: RaisedButton(
                      onPressed: () {},
                      color: Colors.blue,
                      child: Text(
                        "POST",
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
