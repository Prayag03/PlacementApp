import 'package:flutter/material.dart';
import 'package:placementapp/screens/admin/Adminpost.dart';

class AdminPortal extends StatefulWidget {
  const AdminPortal({Key key}) : super(key: key);

  @override
  _AdminPortalState createState() => _AdminPortalState();
}

class _AdminPortalState extends State<AdminPortal> {
  showAlertDialog(BuildContext context) {
    // set up the button

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.amber,
      title: Text(""),
      content: Text("This is my message."),
      actions: [
        FlatButton(
          child: Text("OK"),
          onPressed: () {},
        ),
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Tooltip(
          message: 'add Task',
          textStyle: TextStyle(fontSize: 15, color: Colors.white),
          child: new FloatingActionButton(
            backgroundColor: Colors.blueAccent,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminPost()),
              );
            },
            child: const Icon(Icons.add),
          ),
        ),
        bottomNavigationBar: new BottomAppBar(
          color: Colors.white,
        ),
        body: Container());
  }
}