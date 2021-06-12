import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:placementapp/pages/Loginscreen.dart';
import 'package:placementapp/screens/admin/Adminhome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'screens/admin/Adminhome.dart';
import 'screens/admin/Adminhome.dart';
import 'screens/student/Studenthome.dart';

const String boxname = '';
Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Placement App",
      theme: ThemeData(
        primaryColor: Colors.blue,
        textTheme: GoogleFonts.darkerGrotesqueTextTheme(
          Theme.of(context).textTheme,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.darkerGrotesqueTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: HomePage(),
    );
    /*AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.red,
        accentColor: Colors.amber,
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
        accentColor: Colors.amber,
      ),
      initial: AdaptiveThemeMode.dark,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'Placement App',
        theme: theme,
        darkTheme: darkTheme,
        home: HomePage(),
      ),
    );*/
  }
}

class HomePage extends StatefulWidget {
  final String uid;
  const HomePage({Key key, this.uid}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState(uid);
}

class _HomePageState extends State<HomePage> {
  final String uid;
  _HomePageState(this.uid);

  StreamSubscription connectivitystream;
  ConnectivityResult oldres;

  @override
  void initState() {
    super.initState();

    connectivitystream = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult resnow) {
      if (resnow == ConnectivityResult.none) {
        Fluttertoast.showToast(
          msg: "Not Connected to Internet",
          toastLength: Toast.LENGTH_SHORT,
        );
      } else if (oldres == ConnectivityResult.none) {
        if (resnow == ConnectivityResult.wifi) {
          Fluttertoast.showToast(
            msg: "Connected to Wifi",
            toastLength: Toast.LENGTH_SHORT,
          );
        } else if (resnow == ConnectivityResult.mobile) {
          Fluttertoast.showToast(
            msg: "Connected to Mobile",
            toastLength: Toast.LENGTH_SHORT,
          );
        }
      }
      oldres = resnow;
    });
  }

  @override
  void dispose() {
    super.dispose();
    connectivitystream.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text(
                      "Warning!!",
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                      ),
                    ),
                    content: Text(
                      "Are you sure you want to exit?",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: Text(
                          "Yes",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Text(
                          "No",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ));
        },
        child: FutureBuilder<FirebaseUser>(
            future: FirebaseAuth.instance.currentUser(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                FirebaseUser user = snapshot.data;
                if (user.email == "admin1@gmail.com") {
                  return Adminhome(user: user);
                } else if (user.email == "admin2@gmail.com") {
                  return Adminhome(user: user);
                } else {
                  return Studenthome(user: user);
                }
              } else {
                return Loginscreen();
              }
            }));
  }
}
