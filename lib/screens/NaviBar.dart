import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:placementapp/screens/Profile.dart';
import 'package:placementapp/screens/Status.dart';
import 'Adminhome.dart';

class NaviBar extends StatefulWidget {
  final FirebaseUser user;

  const NaviBar({Key key, this.user}) : super(key: key);

  @override
  _NaviBarState createState() => _NaviBarState(user);
}

class _NaviBarState extends State<NaviBar> {
  final PageController _pageController = PageController();
  int currentIndex = 0;
  final FirebaseUser user;
  _NaviBarState(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          Adminhome(),
          Status(),
          Profile(),
        ],
        onPageChanged: (pageIndex) {
          setState(() {
            currentIndex = pageIndex;
          });
        },
      ),
      bottomNavigationBar: BottomNavyBar(
        animationDuration: Duration(milliseconds: 200),
        backgroundColor: Colors.white,
        curve: Curves.easeInCubic,
        selectedIndex: currentIndex,
        onItemSelected: (index) {
          setState(() {
            currentIndex = index;
            _pageController.jumpToPage(index);
          });
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.add_box),
            title: Text("add"),
            activeColor: Colors.blueAccent,
            inactiveColor: Colors.black,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.timer),
            title: Text("status"),
            activeColor: Colors.blueAccent,
            inactiveColor: Colors.black,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.account_box),
            title: Text("profile"),
            activeColor: Colors.blueAccent,
            inactiveColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
