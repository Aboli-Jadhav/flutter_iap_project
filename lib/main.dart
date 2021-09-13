import 'dart:js';
import 'package:flutter/material.dart';
import 'package:flutter_iap_project/AddGuage_Page.dart';
import 'package:flutter_iap_project/AdminHomeScreen.dart';
import 'package:flutter_iap_project/AdminLogin.dart';
import 'package:flutter_iap_project/LoginOptionScrn.dart';
import 'package:flutter_iap_project/MasteradminHomeScreen.dart';
import 'package:flutter_iap_project/MasteradminHome_Profile.dart';
import 'package:flutter_iap_project/MasteradminLogin.dart';
import 'package:flutter_iap_project/ViewerLogin.dart';
import 'package:flutter_iap_project/Viewer_Home_Screen.dart';
import 'package:flutter_iap_project/sreach_gauge.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/opt',
    routes: {
      '/opt': (context) => LoginOptionScrn(),
      '/master_adminLogin': (context) => master_adminLogin(),
      '/master_adminHome':(context) => master_adminHomeScreen(),
      '/admin_login' : (context) => AdminLogin(),
      '/viewer_login' : (context) => ViewerLogin(),
      '/adminpage' : (context) => Admin_Page(),
      '/addgauge' : (context) => add_Gauge(),
       '/viewerhome' :(context) =>VIEWERHOME(),
      '/searchgauge' : (context) => sreach_gauge(),
    },

    home:LoginOptionScrn(),
  ));
}

