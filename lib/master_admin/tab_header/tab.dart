import 'package:flutter/material.dart';
import '../add_admin/Master_Add_Admins.dart';
import '../View_admin/View_AdminList_DropDown.dart';
import 'package:flutter_iap_project/master_admin/Edit_Attribute/edit_Atri.dart';
import '../view_gauge/view_Master_guage.dart';
import '../Manage_scrap/Manage_Scrap.dart';
import '../Search/MasteradminHome_Profile.dart';


class tab_head extends StatefulWidget {
  @override
  _tab_headState createState() => _tab_headState();
}

class _tab_headState extends State<tab_head> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
            backgroundColor: Colors.redAccent,
            elevation: 0,
            automaticallyImplyLeading: false,
            bottom: TabBar(
                isScrollable: false,
                labelColor: Colors.redAccent,
                unselectedLabelColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    color: Colors.white),
                tabs: [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Add Admins"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("View Admin List"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Edit Attributes"),
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
                      child: Text("Manage Scraps"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Search"),
                    ),
                  ),
                ]
            ),
          ),
          body: TabBarView(children: [
            Master_AddAdmins(),
            View_AdminList_DropDown(),
            edit_atri(),
            view_master_gau(),
            Manage_Scrap(),
            master_adminHome_Profile()
          ]),
        )
    );
  }
}
