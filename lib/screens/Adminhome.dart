import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:placementapp/pages/Loginscreen.dart';

class Adminhome extends StatefulWidget {
  final FirebaseUser user;

  const Adminhome({Key key, this.user}) : super(key: key);
  @override
  _AdminhomeState createState() => _AdminhomeState(user);
}

class _AdminhomeState extends State<Adminhome> {
  final FirebaseUser user;
  _AdminhomeState(this.user);
  String name, email;
  final db = Firestore.instance;
  Future<DocumentSnapshot> document;

  final PageController _pageController = PageController();
  int currentIndex = 0;

  /* Future getdata() async {
    final Future<DocumentSnapshot> document =
        Firestore.instance.collection('users').document(user.uid).get();

    await document.then<dynamic>((DocumentSnapshot snapshot) async {
      setState(() {
        name = snapshot.data['name'];
        email = snapshot.data['email'];
      });
    });
  } */

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
    /*  setState(() {
      db.collection('users').document(user.uid).updateData({'name': name});
    }); */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //automaticallyImplyLeading: false,
          backgroundColor: Colors.blue[300],
          title: Text(
            "Placement App-Admin",
            style: GoogleFonts.pattaya(fontSize: 30),
          ),
          centerTitle: true,
          elevation: 10,
        ),
        drawer: Drawer(
            child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                '$name',
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              accountEmail: Text(
                '$email',
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "S",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text(
                "About",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              trailing: Icon(
                Icons.info,
                color: Colors.blueAccent,
              ),
              onTap: () {},
            ),
            ListTile(
                title: Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                trailing: Icon(
                  Icons.exit_to_app,
                  color: Colors.blueAccent,
                ),
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Loginscreen()));
                }),
            InkWell(
              borderRadius: BorderRadius.circular(500),
              onTap: () {
                Navigator.of(context).pop();
              },
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                child: Icon(Icons.arrow_back, color: Colors.redAccent),
              ),
            ),
          ],
        )),
        body: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 260.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("Assets/tcs.png"),
                ),
              ),
            ),
            ExpansionTile(
              title: Text(
                'Tata Consultancy Services',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 25.0,
                ),
              ),
              children: <Widget>[
                Text(
                  'TCS and its 67 subsidiaries provide a wide range of information technology-related products and services including application development, business process outsourcing, capacity planning, consulting, enterprise software, hardware sizing, payment processing, software management, and technology education services.',
                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                )
              ],
            )
          ],
        ));
  }
}
