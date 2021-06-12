import 'package:flutter/material.dart';

class Status extends StatefulWidget {
  const Status({Key key}) : super(key: key);

  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Status",
            style: TextStyle(
              color: Colors.white,
            )),
        centerTitle: true,
        backgroundColor: Colors.blue[300],
        automaticallyImplyLeading: false,
      ),
    );
  }
}
