import 'package:flutter/material.dart';
import 'Admin/tab_header/admintab.dart';
import 'master_admin/MasteradminHome_Page.dart';
import 'master_admin/Search/MasteradminHome_Profile.dart';
import 'package:flutter_iap_project/Admin/Home_p.dart';
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
        appBar: AppBar(
          toolbarHeight: 30,
          backgroundColor: backred,
          title: Text("Windals Precision Ltd.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,

            ),
          ),
          centerTitle: true,
        ),

        body: admin_tab_head(),
        //_widgetOptions[_selectedIndex],
        // bottomNavigationBar: BottomNavigationBar(
        //   backgroundColor: backred,
        //   currentIndex: _selectedIndex,
        //   items: const <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.home),
        //       title: Text('Home'),
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.contacts),
        //       title: Text('Profile'),
        //     ),
        //
        //   ],
        //   type: BottomNavigationBarType.fixed,
        //   selectedItemColor: lred,
        //   iconSize: 40,
        //   elevation: 5,
        //   onTap: (index)
        //   {
        //     setState(() {
        //       _selectedIndex=index;
        //
        //     });
        //   },
        // ),
      ),
    );

  }
}