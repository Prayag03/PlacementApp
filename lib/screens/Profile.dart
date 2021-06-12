import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/src/painting/border_radius.dart';

class Profile extends StatefulWidget {
  final FirebaseUser user;

  const Profile({Key key, this.user}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState(user);
}

class _ProfileState extends State<Profile> {
  File _image1;
  String url1;
  String name, email;
  final FirebaseUser user;
  bool dialog = true;

  Future<DocumentSnapshot> document;

  _ProfileState(this.user);

  Future<void> getdata() async {
    document = Firestore.instance.collection('users').document(user.uid).get();
    document.then<dynamic>((DocumentSnapshot snapshot) async {
      if (mounted) {
        setState(() {
          name = snapshot.data['name'];
          email = user.email;
        });
      }
    });
    return;
  }

  @override
  void initState() {
    super.initState();
    getdata();
  }

  Future ImageFC() async {
    final Image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 60);
    setState(() {
      _image1 = Image;
    });
  }

  Future ImageFG() async {
    final Image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 60);
    setState(() {
      _image1 = Image;
    });
  }

  Future<String> uploadImage() async {
    final StorageReference postImageRef = FirebaseStorage.instance
        .ref()
        .child('gs://placementapp-b2e98.appspot.com');
    var timeKey = new DateTime.now();
    final StorageUploadTask uploadTask =
        postImageRef.child(timeKey.toString() + ".jpg").putFile(_image1);
    // ignore: non_constant_identifier_names
    var ImageUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
    url1 = ImageUrl.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile",
            style: TextStyle(
              color: Colors.white,
            )),
        centerTitle: true,
        backgroundColor: Colors.blue[300],
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: new Stack(
              fit: StackFit.loose,
              children: <Widget>[
                new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      width: 140.0,
                      height: 140.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: _image1 == null
                                  ? AssetImage("Assets/profile.png")
                                  : FileImage(
                                      _image1,
                                    ), // picked file

                              fit: BoxFit.cover)),
                    ),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(top: 90.0, right: 100.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            // getImage1();
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                  content: Container(
                                height: 95,
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Select Option for Profile Image",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        RaisedButton(
                                          elevation: 15,
                                          child: new Text(
                                            "Camera",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          textColor: Colors.white,
                                          color: Colors.blue[500],
                                          onPressed: () {
                                            ImageFC();
                                          },
                                        ),
                                        RaisedButton(
                                          elevation: 15,
                                          child: new Text(
                                            "Gallery",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          textColor: Colors.white,
                                          color: Colors.blue[500],
                                          onPressed: () {
                                            ImageFG();
                                          },
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )),
                            );
                          },
                          child: new CircleAvatar(
                            backgroundColor: Colors.blue[400],
                            radius: 25.0,
                            child: new Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
