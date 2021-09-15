import 'dart:js';
import 'package:flutter/material.dart';
import 'package:flutter_iap_project/AddGuage_Page.dart';
import 'package:flutter_iap_project/Add_To_Scrap.dart';
import 'package:flutter_iap_project/Add_Viewer.dart';
import 'package:flutter_iap_project/AdminHomeScreen.dart';
import 'package:flutter_iap_project/AdminLogin.dart';
import 'package:flutter_iap_project/Admin_Edit_Profile.dart';
import 'package:flutter_iap_project/Calibrate_Gauge.dart';
import 'package:flutter_iap_project/LoginOptionScrn.dart';
import 'package:flutter_iap_project/Manage_Scrap.dart';
import 'package:flutter_iap_project/MasterAdmin_Edit_Profile.dart';
import 'package:flutter_iap_project/Master_Add_Admins.dart';
import 'package:flutter_iap_project/MasteradminHomeScreen.dart';
import 'package:flutter_iap_project/MasteradminHome_Profile.dart';
import 'package:flutter_iap_project/MasteradminLogin.dart';
import 'package:flutter_iap_project/ViewScrap.dart';
import 'package:flutter_iap_project/ViewerLogin.dart';
import 'package:flutter_iap_project/Viewer_Home_Screen.dart';
import 'package:flutter_iap_project/sreach_gauge.dart';
import 'edit_Atri.dart';
import 'edit_freq.dart';
import 'edit_description.dart';
import 'edit_location.dart';
import 'edit_owner.dart';
import 'edit_range.dart';
import 'edit_type.dart';
import 'view_Master_guage.dart';


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
      '/manageScrap':(context) => Manage_Scrap(),
      '/addtoScrap':(context) => AddToScrap(),
      '/viewScrap':(context) => ViewScrapOfGuageType(),
      '/addViewer': (context) => AddViewer(),
      '/adminEditProfile': (context) => Admin_Edit_Profile(),
      '/master_add_admins': (context) => Master_AddAdmins(),
      '/masterAdmin_EditProfile': (context) => MasterAdmin_EditProfile(),
      '/calibrate gauge' : (context) => Calibrate_Gauge(),
      '/edit_attribute' : (context) => edit_atri(),
      '/edit_frequency' : (context) => edit_freq(),
      '/edit_description' : (context) => edit_descr(),
      '/edit_location' : (context) => edit_loc(),
      '/edit_owner' : (context) => edit_owner(),
      '/edit_range' : (context) => edit_range(),
      '/edit_type' : (context) => edit_type(),
      '/view_master_gau' : (context) => view_master_gau(),


    },

    home:LoginOptionScrn(),
  ));
}

