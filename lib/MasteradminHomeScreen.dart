import 'package:flutter/material.dart';
import 'package:flutter_iap_project/MasteradminHome_Page.dart';
import 'package:flutter_iap_project/MasteradminHome_Profile.dart';

class adminHomeScreen extends StatefulWidget {
  const adminHomeScreen({Key? key}) : super(key: key);

  @override
  _adminHomeScreenState createState() => _adminHomeScreenState();
}

class _adminHomeScreenState extends State<adminHomeScreen> {

  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);

  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    adminHome_Page(),
    adminHome_Profile()
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
                    icon: Icon(Icons.person),
                    title: Text('Search'),
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
