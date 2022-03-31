import 'package:flutter/material.dart';
import 'package:flutter_iap_project/Viewer_Home_PAGE.dart';
import 'package:flutter_iap_project/Viewer_Profile_Page.dart';

class VIEWERHOME extends StatefulWidget{
  const VIEWERHOME({Key?key}) :super(key: key);
  _VIEWERHOME createState()=> _VIEWERHOME();
}

class _VIEWERHOME extends State<VIEWERHOME>{
  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Viewerhomepage(),
    VIEWERPROFILE()
  ];
  Widget build(BuildContext context){
    return Container(
      child: Scaffold(
        body: _widgetOptions[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: backred,
          currentIndex: _selectedIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Search',
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


      ) ,
    );
  }
}