import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iap_project/Admin/Add%20gauges/AddGuage_Page.dart';
import 'package:flutter_iap_project/Admin/Addviewer/Add_Viewer.dart';
import 'package:flutter_iap_project/Admin/Calibrate%20Guages/Calibrate_Gauge.dart';
import 'package:flutter_iap_project/Admin/Search%20Guages/search_gauge.dart';
import 'package:flutter_iap_project/Profile_ad.dart';
import 'package:flutter_iap_project/master_admin/Manage_scrap/Manage_Scrap.dart';
import 'package:flutter_iap_project/master_admin/view_gauge/view_Master_guage.dart';

class admin_tab_head extends StatefulWidget{
 _admin_tab_headState  createState() =>  _admin_tab_headState();
}

class _admin_tab_headState extends State<admin_tab_head>{
  Widget build(BuildContext){
    return DefaultTabController(length: 7, child: Scaffold(
      appBar: AppBar(
        toolbarHeight:74,
        backgroundColor: Colors.redAccent,
        elevation: 0,
        bottom: TabBar(
          isScrollable: false,
          labelColor: Colors.redAccent,
          unselectedLabelColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.label,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            color:  Colors.white,
          ),
          tabs: [
            Tab(
              icon: Icon(Icons.person_add),
              child: Align(
                alignment: Alignment.center,
                child: Text("Add Viewer"),
              ),
            ),
            Tab(
              icon: Icon(Icons.preview_outlined),
              child: Align(

                alignment: Alignment.center,
                child: Text("View Gauges"),
              ),
            ),
            Tab(
              icon: Icon(Icons.note_add),
              child: Align(
                alignment: Alignment.center,
                child: Text("Add Gauges"),
              ),
            ),
            Tab(
              icon: Icon(Icons.edit),
              child: Align(
                alignment: Alignment.center,
                child: Text("Calibrate Gauges"),
              ),
            ),
            Tab(
              icon: Icon(Icons.search_sharp),
              child: Align(
                alignment: Alignment.center,
                child: Text("Search Gauges"),
              ),
            ),
            Tab(
              icon: Icon(Icons.delete_forever),
              child: Align(
                alignment: Alignment.center,
                child: Text("Manage Scrap"),

              ),
            ),
            Tab(
              icon: Icon(Icons.logout),
              child: Align(

                alignment: Alignment.center,
                child: Text("Logout"),
              ),
            ),
          ],
        ),
      ) ,
      body: TabBarView(
        children: [
          AddViewer(),
          view_master_gau(),
          add_Gauge(),
          Calibrate_Gauge(),
          search_gauge(),
          Manage_Scrap(),
          profile_ad(),
        ],
      ),
    ));
  }
}