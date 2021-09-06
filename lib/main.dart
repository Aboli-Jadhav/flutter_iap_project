import 'package:flutter/material.dart';
import 'package:flutter_iap_project/LoginOptionScrn.dart';
import 'package:flutter_iap_project/adminHomeScreen.dart';
import 'package:flutter_iap_project/adminHome_Profile.dart';
import 'package:flutter_iap_project/adminLogin.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/opt',
    routes: {
      '/opt': (context) => LoginOptionScrn(),
      '/adminLog': (context) => adminLogin(),
      '/adminHome':(context) => adminHomeScreen(),

    },

    home:LoginOptionScrn(),
  ));
}

