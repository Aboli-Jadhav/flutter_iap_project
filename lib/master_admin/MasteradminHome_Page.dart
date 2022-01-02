import 'package:flutter/material.dart';
import 'tab_header/tab.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class master_adminHome_Page extends StatefulWidget {
  const master_adminHome_Page({Key? key}) : super(key: key);

  @override
  _master_adminHome_PageState createState() => _master_adminHome_PageState();
}

class _master_adminHome_PageState extends State<master_adminHome_Page> {

  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);
  List<String> gauge_names=[];
  List<String> gauge_locations=[];
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    fetchGaugeNames();
    fetchGaugeLocation();
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
        print('The Result is Empty');
      }
      setState(() {

      });
      print("Gauge Name list: $gauge_locations");

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
        print('The Result is Empty');
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
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 45,
          backgroundColor: backred,
          title: Text("Windals Precision Ltd.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,

            ),
          ),
          centerTitle: true,
        ),

        body: isLoading ? Center(child: CircularProgressIndicator()) :
        tab_head(gauge_name: gauge_names,gauge_location: gauge_locations,),
      ),
    );
  }
}
