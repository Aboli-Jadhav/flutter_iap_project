import 'dart:js';
import 'package:flutter/material.dart';
import 'package:flutter_iap_project/Admin/Add%20gauges/AddGuage_Page.dart';
import 'package:flutter_iap_project/Admin/showGauge.dart';
import 'package:flutter_iap_project/master_admin/MasteradminHome_Page.dart';
import 'Admin/Show Gauges.dart';
import 'master_admin/Manage_scrap/Add_To_Scrap.dart';
import 'package:flutter_iap_project/Admin/Addviewer/Add_Viewer.dart';
import 'package:flutter_iap_project/AdminHomeScreen.dart';
import 'package:flutter_iap_project/Admin/AdminLogin.dart';
import 'package:flutter_iap_project/Admin_Edit_Profile.dart';
import 'package:flutter_iap_project/Admin/Calibrate%20Guages/Calibrate_Gauge.dart';
import 'package:flutter_iap_project/LoginOptionScrn.dart';
import 'master_admin/Manage_scrap/Manage_Scrap.dart';
import 'master_admin/Search/MasterAdmin_Edit_Profile.dart';
import 'master_admin/add_admin/Master_Add_Admins.dart';
import 'master_admin/Search/MasteradminHome_Profile.dart';
import 'master_admin/MasteradminLogin.dart';
import 'master_admin/Manage_scrap/ViewScrap.dart';
import 'master_admin/View_admin/View_AdminList_DropDown.dart';
import 'package:flutter_iap_project/ViewerLogin.dart';
import 'package:flutter_iap_project/Viewer_Home_Screen.dart';
import 'package:flutter_iap_project/Admin/Search%20Guages/search_gauge.dart';
import 'master_admin/Edit_Attribute/edit_Atri.dart';
import 'master_admin/Edit_Attribute/edit_freq.dart';
import 'master_admin/Edit_Attribute/edit_description.dart';
import 'master_admin/Edit_Attribute/edit_location.dart';
import 'master_admin/Edit_Attribute/edit_owner.dart';
import 'master_admin/Edit_Attribute/edit_range.dart';
import 'master_admin/Edit_Attribute/edit_type.dart';
import 'master_admin/view_gauge/view_Master_guage.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: '/opt',
    routes: {
      '/opt': (context) => LoginOptionScrn(),
      '/master_adminLogin': (context) => master_adminLogin(),
      '/admin_login' : (context) => AdminLogin(),
      '/viewer_login' : (context) => ViewerLogin(),
      '/adminpage' : (context) => Admin_Page(),
      '/addgauge' : (context) => add_Gauge(),
      '/showgauge' : (context) => ShowGauge(wppl_number: "",manufacturer_number: "",gauge_type: ""),
       '/viewerhome' :(context) =>VIEWERHOME(),
      '/searchgauge' : (context) => search_gauge(),
      '/manageScrap':(context) => Manage_Scrap(),
      '/addtoScrap':(context) => AddToScrap(),
      '/viewScrap':(context) => ViewScrapOfGuageType(),
      '/addViewer': (context) => AddViewer(),
      '/adminEditProfile': (context) => Admin_Edit_Profile(),
      '/master_add_admins': (context) => Master_AddAdmins(),
      '/masterAdmin_EditProfile': (context) => MasterAdmin_EditProfile(),
      // '/calibrate gauge' : (context) => Calibrate_Gauge(),
      '/edit_attribute' : (context) => edit_atri(),
      '/edit_frequency' : (context) => edit_freq(),
      '/edit_description' : (context) => edit_descr(),
      '/edit_location' : (context) => edit_loc(),
      '/edit_owner' : (context) => edit_owner(),
      '/edit_range' : (context) => edit_range(),
      '/edit_type' : (context) => edit_type(),
      '/view_master_gau' : (context) => view_master_gau(),
      '/viewAdminList' : (context) => View_AdminList_DropDown(),
      '/master_adminHome': (context) => master_adminHome_Page(),

    },

    home:LoginOptionScrn(),
  ));
}

