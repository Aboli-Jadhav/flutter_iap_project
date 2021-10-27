import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_iap_project/Admin/Show%20Gauges.dart';
import 'package:flutter_iap_project/Admin/showGauge.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../Drop_Down.dart';

class search_gauge extends StatefulWidget{
       const search_gauge({Key? key}) : super (key: key);


       _SREACH_GAUGE createState() => _SREACH_GAUGE();

}


class _SREACH_GAUGE extends State<search_gauge>{

  var a = TextEditingController();
  var b = TextEditingController();

  // List<String> _locations = ['A', 'B', 'C', 'D']; // Option 2
  var _selectedLocation;
  List<dynamic> _locations = [];// Option 2
  String calibration_agency_name ="";
  String calibration_cost       ="" ;
  String calibration_date        ="";
  String calibration_due_date   ="" ;
  String calibration_frequency   ="";
  String certificate_number      ="";
  String gauge_cost             ="";
  String gauge_life              ="";
  String gauge_make  ="";
  String gauge_manufacturer_id_number ="";
  String item_code ="";
  String maximum ="";
  String minimum ="";
  String nabl_accrediation_status ="";
  String nominal_size ="";
  String physical_location ="";
  String plant ="";
  String process_owner ="";
  String process_owner_mail_id ="";
  String remark ="";
  String unit ="";
  String wppl_gauge_id_number = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    a.text = "1201-35-1";
    b.text = "WPP-SG-15";

    getGaugetype();
  }
  void getGaugetype()async{

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection("Chakan")
        .doc("Attributes")
        .collection("gauge types")
        .doc("1W6qHZfSxKcRAy7ycg52").get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
        var list = [];
        data.forEach((key, value) {
          list.add(value);
        });
        print(list);
        setState(() {
          _locations = list;// we can use this list for dropdown
        });

      }else{
        print('Document does not exist on the database');
      }
    });

  }


  void submittoFirestore() async{
    var gauge_name=_selectedLocation;
    var collection_name="all "+gauge_name;
    var wpp_number = b.text;
    var manufacturer_number = a.text;
    var final_number = wpp_number+"_"+manufacturer_number;

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection("Chakan")
        .doc("Gauge Types")
        .collection("All Gauges")
        .doc(gauge_name)
        .collection(collection_name)
        .doc(final_number)
        .get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document exists on the database');
        Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;

        calibration_agency_name = data['CALIBRATION AGENCY NAME'];
        calibration_cost        = data['CALIBRATION COST'];
        calibration_date        = data['CALIBRATION DATE'];
        calibration_due_date    = data['CALIBRATION DUE DATE'];
        calibration_frequency   = data['CALIBRATION FREQUENCY'];
        certificate_number      = data['CERTIFICATE NUMBER'];
        gauge_cost              = data['GAUGE COST'];
        gauge_life              = data['GAUGE LIFE'];
        gauge_make              = data['GAUGE MAKE'];
        gauge_manufacturer_id_number= data['GAUGE MANUFACTURER ID NUMBER'];
        item_code               = data['ITEM CODE'];
        maximum                 = data['MAXIMUM'];
        minimum                 = data['MINIMUM'];
        nabl_accrediation_status= data['NABL ACCREDIATION STATUS'];
        nominal_size            = data['NOMINAL SIZE'];
        physical_location       = data['PHYSICAL LOCATION'];
        plant                   = data['PLANT'];
        process_owner           = data['PROCESS OWNER'];
        process_owner_mail_id   = data['PROCESS OWNER MAIL ID'];
        remark                  = data['REMARK'];
        unit                    = data['UNIT'];
        wppl_gauge_id_number   = data['WPPL GAUGE ID NUMBER'];

        Fluttertoast.showToast(
            msg:  wppl_gauge_id_number,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }else {
        print('Document does not exist on the database');
      }
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('calibration_agency_name', calibration_agency_name);
    prefs.setString('calibration_cost', calibration_cost);
    prefs.setString('calibration_date', calibration_date);
    prefs.setString('calibration_due_date', calibration_due_date);
    prefs.setString('calibration_frequency', calibration_frequency);
    prefs.setString('certificate_number', certificate_number);
    prefs.setString('gauge_cost', gauge_cost);
    prefs.setString('gauge_life', gauge_life);
    prefs.setString('gauge_make', gauge_make);
    prefs.setString('gauge_manufacturer_id_number', gauge_manufacturer_id_number);
    prefs.setString('item_code ', item_code );
    prefs.setString('maximum',maximum);
    prefs.setString('minimum', minimum);
    prefs.setString('nabl_accrediation_status', nabl_accrediation_status);
    prefs.setString('nominal_size ', nominal_size );
    prefs.setString('physical_location', physical_location);
    prefs.setString('plant', plant);
    prefs.setString('process_owner', process_owner);
    prefs.setString('process_owner_mail_id', process_owner_mail_id);
    prefs.setString('remark', remark );
    prefs.setString('unit', unit);
    prefs.setString('wppl_gauge_id_number', wppl_gauge_id_number);


    Fluttertoast.showToast(
        msg:  prefs.getString('unit').toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );


  }

  void wait()async{
    //await Future.delayed(Duration(seconds: 3));
    await Future.delayed(const Duration(seconds: 2), (){
    });
  }


       Color backred=Color(0xffDF3F3F);
       Color lred=Color(0xffFBEBEB);
       Widget build(BuildContext context){
            return Container(
              child: Scaffold(
                 // appBar: AppBar(
                 //    toolbarHeight: 60.0,
                 //        backgroundColor: backred,
                 //        title: Text("Windal Precision Ltd",
                 //        style: TextStyle(
                 //               color: Colors.white,
                 //               fontSize: 50.0,
                 //               fontWeight: FontWeight.bold,
                 //        ),),
                 // ),
              body: Row(
               children: [
                 SizedBox(width: 0.35 * MediaQuery.of(context).size.width,),
                 Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Container(
                          //   margin: EdgeInsets.symmetric(horizontal: 500.0),
                          //   width: 500,
                          //   height:50.0,
                          //   child: Text("Manufacture Identification number ", style: TextStyle(color: Colors.black,fontSize: 23),
                          //     textAlign: TextAlign.center,  ),
                          // ),
                          //
                          // SizedBox(height:1.0,),
                          //
                          // Container(
                          //   width: 0.3 * MediaQuery.of(context).size.width,
                          //   height:50.0,
                          //   child: TextField(
                          //     controller: a,
                          //     decoration: InputDecoration(
                          //       hintText: "Enter Manufacture Identification number",
                          //       labelText: " Manufacture Identification number",
                          //       border: OutlineInputBorder(),
                          //
                          //     ),),
                          // ),
                          //
                          // SizedBox(height: 30.0,),
                          //
                          // Container(
                          //   width: 0.3 * MediaQuery.of(context).size.width,
                          //   height:50.0,
                          //   child: Text("GAUGE TYPE", style: TextStyle(color: Colors.black,fontSize: 23),
                          //     textAlign: TextAlign.center,  ),
                          // ),
                          //
                          // SizedBox(height: 1.0,),
                          //
                          // //DropDown(),
                          // Container(
                          //   width: 0.3 * MediaQuery.of(context).size.width,
                          //   padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
                          //   decoration: BoxDecoration(
                          //     border: Border.all(color: Colors.grey),
                          //     borderRadius: BorderRadius.circular(5.0),
                          //   ),
                          //   child: DropdownButton(
                          //
                          //     hint: Text('Please choose a gauge type'), // Not necessary for Option 1
                          //     value: _selectedLocation,
                          //     onChanged: (newValue) {
                          //       setState(() {
                          //         _selectedLocation = newValue;
                          //       });
                          //
                          //       Fluttertoast.showToast(
                          //           msg: _selectedLocation,
                          //           toastLength: Toast.LENGTH_SHORT,
                          //           gravity: ToastGravity.CENTER,
                          //           timeInSecForIosWeb: 1,
                          //           backgroundColor: Colors.red,
                          //           textColor: Colors.white,
                          //           fontSize: 16.0
                          //       );
                          //     },
                          //     items: _locations.map((location) {
                          //       return DropdownMenuItem(
                          //         child: new Text(location),
                          //         value: location,
                          //       );
                          //     }).toList(),
                          //   ),
                          // ),
                          //
                          SizedBox(height: 30,),

                          Container(
                            width: 0.3 * MediaQuery.of(context).size.width,
                            height:50.0,


                            child : Text("WPPL Gauge Identification Number",
                              style: TextStyle(color: Colors.black,fontSize: 23),
                              textAlign: TextAlign.center,
                            ),),

                          Container(
                            width: 0.3 * MediaQuery.of(context).size.width,
                            height:50.0,
                            child: TextField(
                              controller: b,
                              decoration: InputDecoration(
                                labelText: ("GAUGE NUMBER"),
                                hintText:  ("Enter Gauge Number"),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),

                          SizedBox(height: 30,),

                          ElevatedButton(
                            child: Text("Search gauge"),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                            ),
                            onPressed: () {
                              submittoFirestore();
                              //Navigator.push(context,MaterialPageRoute(builder: (context) => ShowGauge(manufacturer_number: a.text,wppl_number: b.text,gauge_type: _selectedLocation,)),);
                              Navigator.push(context,MaterialPageRoute(builder: (context) => ShowGauge()),);

                              //Navigator.push(context,'/showgauge');
                            },
                          )

                        ],

                 ),
               ],
             ),
             ),

            );
     }



}