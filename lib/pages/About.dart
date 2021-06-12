import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_gradients/flutter_gradients.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[300],
        title: Text(
          "About",
          style: GoogleFonts.pattaya(fontSize: 30),
        ),
        centerTitle: true,
        elevation: 10,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                child: Card(
                  child: Text(
                    'Placement App is an application which eliminates the problem of notifying the students individually regarding the Campus Placement in a certain university.It will make the entire placement process seamless and the application is eay to use as well. We, as a team strive to make things better with the application of our knowledge which can help making things better and smooth.',
                    style: GoogleFonts.titilliumWeb(
                      textStyle: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    gradient: FlutterGradients.leCocktail(),//flyingLemon(),
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.90,
                    height: MediaQuery.of(context).size.width * 0.15, 
                    child: Text(
                      "\t\t\t\t\t\tMEET THE TEAM",
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: Container(
                        decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        gradient: FlutterGradients.newYork(),
                        ),
                        child: Card(
                        elevation: 10.0,
                        child: Column(children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                            child:ClipOval(
                            child:CircleAvatar(
                              backgroundColor: Colors.white,
                            child: Image.asset(
                              'assets/Shiladitya.jpeg',
                            ),
                            radius: 100.0,
                          ),
                          ),
                          ),
                          Text(
                            "Shiladityasinh Gohil",
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Mobile Application Developer",
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.white,
                            ),
                          ),
                         ]
                        ),
                      ),
                      ),                   
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: Container(
                        decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        gradient: FlutterGradients.newYork(),
                        ),
                        child: Card(
                        elevation: 10.0,
                        child: Column(children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                          child: ClipOval(
                            child:CircleAvatar(
                              backgroundColor: Colors.white,
                            child: Image.asset(
                              'assets/tcs.png',
                            ),
                            radius: 100.0,
                          ),
                          ),
                          ),
                          Text(
                            "Mitul Gelani",
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Mobile Application Developer",
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.white,
                            ),
                          ),
                         ]
                        ),
                      ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: Container(
                        decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        gradient: FlutterGradients.newYork(),
                        ),
                        child: Card(
                          elevation: 10.0,
                          child: Column(children: <Widget>[
                            Padding(
                              padding:EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0), 
                              child:ClipOval(
                                child:CircleAvatar(
                                  backgroundColor: Colors.white,
                                    child: Image.asset(
                                      'assets/Prayag.jpeg',
                                    ),
                                    radius: 100.0,
                                  ),
                                ),
                              ),
                          Text(
                            "Prayag Bhayani",
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Mobile Application Developer",
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.white,
                            ),
                          ),
                         ]
                        ),
                      ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
