import 'package:flutter/material.dart';
import 'package:unnamed_app2/pages/Profile.dart';
import 'package:unnamed_app2/pages/Store.dart';
import 'package:unnamed_app2/pages/Wishlist.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  List<Widget> pages = [
    Store(),
    Wishlist(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.store), label: "Store"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Wishlist"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        backgroundColor: Theme.of(context).brightness==Brightness.light?Colors.orangeAccent:Colors.black,
        onTap: (int x) {
          setState(() {
            currentIndex = x;
          });
        },
        selectedItemColor:  Theme.of(context).brightness==Brightness.light?Colors.white:Colors.orangeAccent,
      ),
      body: pages[currentIndex]
    );
  }
}

