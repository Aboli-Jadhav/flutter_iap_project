import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iap_project/Admin/Addviewer/Add_Viewer.dart';
import 'package:flutter_iap_project/Admin/Add gauges/front_add_gauge.dart';
import 'package:flutter_iap_project/Admin/Calibrate%20Guages/gauge_calibrate_details.dart';
import 'package:flutter_iap_project/Profile_ad.dart';
import 'package:flutter_iap_project/Suppiler/SupplierTab.dart';
import 'package:flutter_iap_project/master_admin/Manage_scrap/Manage_Scrap.dart';
import 'package:flutter_iap_project/master_admin/view_gauge/front_page.dart';


class admin_tab_head extends StatefulWidget{

   List<String> gauge_name=[];
   List<String> gauge_location=[];
   List<String> gauge_location_owner=[];


  admin_tab_head({required this.gauge_name,required this.gauge_location,required this.gauge_location_owner});

  _admin_tab_headState  createState() =>  _admin_tab_headState();
}

class _admin_tab_headState extends State<admin_tab_head>{
  Widget build(BuildContext){
    return DefaultTabController(length: 7, child: Scaffold(
      appBar: AppBar(
        toolbarHeight:0,
        backgroundColor: Colors.redAccent,
        elevation: 0,
        automaticallyImplyLeading: false,
        bottom: const TabBar(
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
              child: Align(
                alignment: Alignment.center,
                child: Text("Add Viewer"),
              ),
            ),
            Tab(
              child: Align(

                alignment: Alignment.center,
                child: Text("View Gauges"),
              ),
            ),
            Tab(
              child: Align(
                alignment: Alignment.center,
                child: Text("Add Gauges"),
              ),
            ),
            Tab(
              child: Align(
                alignment: Alignment.center,
                child: Text("Calibrate Gauges"),
              ),
            ),
            // Tab(
            //   child: Align(
            //     alignment: Alignment.center,
            //     child: Text("Search Gauges"),
            //   ),
            // ),
            Tab(
              child: Align(
                alignment: Alignment.center,
                child: Text("Manage Scrap"),

              ),
            ),
            Tab(
              child: Align(
                alignment: Alignment.center,
                child: Text("Suppliers"),

              ),
            ),
            Tab(
              child: Align(

                alignment: Alignment.center,
                child: Text("Logout"),
              ),
            ),
          ],
        ),
      ) ,
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          AddViewer(gauge_location: widget.gauge_location),
          front_view_gauge(gauge_name: widget.gauge_name,gauge_location: widget.gauge_location,),
          front_add_gauge(gauge_name:widget.gauge_name,gauge_location:widget.gauge_location,gauge_location_owner: widget.gauge_location_owner,),
          gauge_calibrate_search(gauge_name:widget.gauge_name,gauge_location: widget.gauge_location ),
          //search_gauge(),
          Manage_Scrap(gauge_name: widget.gauge_name,),
          SupplierTab(),
          profile_ad(),
        ],
      ),
    ));
  }
}