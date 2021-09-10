import 'package:flutter/material.dart';
import 'package:flutter_iap_project/MasteradminHome_Page.dart';
import 'package:flutter_iap_project/MasteradminHome_Profile.dart';
import 'package:flutter_iap_project/Home_p.dart';
import 'package:flutter_iap_project/Profile_ad.dart';

class Admin_Page extends StatefulWidget {
  const Admin_Page({Key? key}) : super(key: key);

  @override
  _Admin_PageState createState() => _Admin_PageState();
}

class _Admin_PageState extends State<Admin_Page> {

  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);

  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    home_p(),
    profile_ad()
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Scaffold(


        body: _widgetOptions[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: backred,
          currentIndex: _selectedIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.contacts),
              title: Text('Profile'),
            ),

          ],
          type: BottomNavigationBarType.fixed,
          selectedItemColor: lred,
          iconSize: 40,
          elevation: 5,
          onTap: (index)
          {
            setState(() {
              _selectedIndex=index;

            });
          },
        ),
      ),
    );

  }
}