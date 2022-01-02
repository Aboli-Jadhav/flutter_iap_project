import 'package:flutter/material.dart';
import 'package:flutter_iap_project/suggestion_data.dart';
import 'Admin/tab_header/admintab.dart';
import 'master_admin/MasteradminHome_Page.dart';
import 'master_admin/Search/MasteradminHome_Profile.dart';
import 'package:flutter_iap_project/Admin/Home_p.dart';
import 'package:flutter_iap_project/Profile_ad.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Admin_Page extends StatefulWidget {

  const Admin_Page({Key? key}) : super(key: key);

  @override
  _Admin_PageState createState() => _Admin_PageState();
}

class _Admin_PageState extends State<Admin_Page> {

  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);
  List<String> gauge_names=[];
  List<String> gauge_locations=[];
  List<String> gauge_locations_owner=[];

  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    home_p(),
    profile_ad()
  ];
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    fetchGaugeNames();
    fetchGaugeLocation();
    fetchGaugeLocationOwner();
    super.initState();
    setState(() {
      isLoading = false;
    });
  }

  void fetchGaugeLocation() async{
    FirebaseFirestore firestore = await FirebaseFirestore.instance;
    await firestore.collection("Chakan")
        .doc("Attributes")
        .collection("gauge location")
        .get()
        .then((QuerySnapshot querySnapshot){
      if(querySnapshot.docs.isNotEmpty){
        querySnapshot.docs.forEach((doc) {
          gauge_locations.add(doc['name'].toString().trim());
        });
      }else{
        print('Gauge location list: The Result is Empty');
      }
      setState(() {

      });
      print("Gauge location list: $gauge_locations");

    });
  }

  void fetchGaugeLocationOwner() async{
    FirebaseFirestore firestore = await FirebaseFirestore.instance;
    await firestore.collection("Chakan")
        .doc("Attributes")
        .collection("gauge location owner")
        .get()
        .then((QuerySnapshot querySnapshot){
      if(querySnapshot.docs.isNotEmpty){
        querySnapshot.docs.forEach((doc) {
          gauge_locations_owner.add(doc['name'].toString().trim());
        });
      }else{
        print('Gauge location owner list: The Result is Empty');
      }
      setState(() {

      });
      print("Gauge location owner list: $gauge_locations_owner");

    });
  }

  void fetchGaugeNames() async{
    FirebaseFirestore firestore = await FirebaseFirestore.instance;
    await firestore.collection("Chakan")
    .doc("Attributes")
    .collection("gauge types")
    .get()
    .then((QuerySnapshot querySnapshot){
      if(querySnapshot.docs.isNotEmpty){
        querySnapshot.docs.forEach((doc) {
          gauge_names.add(doc['name'].toString().trim());
        });
      }else{
        print('Gauge Name List: The Result is Empty');
      }
      setState(() {

      });
      print("Gauge Name list: $gauge_names");
      //SuggestionData().gauge_name = gauge_names;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Scaffold(
        appBar: AppBar(
          toolbarHeight: 45,
          backgroundColor: backred,
          automaticallyImplyLeading: false,
          title: const Text("Windals Precision Ltd.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,

            ),
          ),
          centerTitle: true,
        ),

        body: isLoading ? Center(child: CircularProgressIndicator()) : admin_tab_head(gauge_name: gauge_names,gauge_location: gauge_locations,gauge_location_owner: gauge_locations_owner,),
        //_widgetOptions[_selectedIndex],
        // bottomNavigationBar: BottomNavigationBar(
        //   backgroundColor: backred,
        //   currentIndex: _selectedIndex,
        //   items: const <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.home),
        //       title: Text('Home'),
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.contacts),
        //       title: Text('Profile'),
        //     ),
        //
        //   ],
        //   type: BottomNavigationBarType.fixed,
        //   selectedItemColor: lred,
        //   iconSize: 40,
        //   elevation: 5,
        //   onTap: (index)
        //   {
        //     setState(() {
        //       _selectedIndex=index;
        //
        //     });
        //   },
        // ),
      ),
    );

  }
}