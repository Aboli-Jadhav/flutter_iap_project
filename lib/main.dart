import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_iap_project/AdminLogin.dart';
import 'package:flutter_iap_project/LoginOptionScrn.dart';
import 'package:flutter_iap_project/MasteradminHomeScreen.dart';
import 'package:flutter_iap_project/MasteradminHome_Profile.dart';
import 'package:flutter_iap_project/MasteradminLogin.dart';
import 'package:flutter_iap_project/ViewerLogin.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/opt',
    routes: {
      '/opt': (context) => LoginOptionScrn(),
      '/adminLog': (context) => adminLogin(),
      '/adminHome':(context) => adminHomeScreen(),
      '/ADMINLOGIN' : (context) => AdminLogin(),
      '/VIEWERLOGIN' : (context) => ViewerLogin()

    },

    home:LoginOptionScrn(),
  ));
}

