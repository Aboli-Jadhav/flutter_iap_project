//import 'package:autocomplete_textfield/autocomplete_textfield.dart';
/*Notes:
1. fetching list of gauge types in initstate not working instead pass the list as parameter to this class
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_iap_project/Admin/Calibrate%20Guages/Calibrate_Gauge.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:autocomplete_textfield_ns/autocomplete_textfield_ns.dart';
import 'package:shared_preferences/shared_preferences.dart';

class gauge_calibrate_search extends StatefulWidget{

  const gauge_calibrate_search({Key? key}):super(key: key);
  _gauge_search_calibrate createState()=> _gauge_search_calibrate();

}

class _gauge_search_calibrate extends State<gauge_calibrate_search>{
  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);

  final _suggestion = TextEditingController();
  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
  List<String> added = [];
  String currentText = "";

  List<String> gauge_type = ['Plain Type Gauge', 'snap gauge',
    'Ring Type Gauge',
    'Limit Type Gauge',
  'Pin Type Gauge',
    'Caliper Type Gauge',
    'Feeler Type Gauge',
    'Screw Pitch Gauges',
    'Radius or Fillet Gauge',
  ];

  var a = TextEditingController();
  // var b = TextEditingController();

  // List<String> _locations = ['A', 'B', 'C', 'D']; // Option 2
  var _selectedLocation;


  List<String> _locations=[];// Option 2



  Future<void> shareperferences() async {

    SharedPreferences claibratedata = await SharedPreferences.getInstance();
    claibratedata .setString('Gauge Type', _suggestion.text);
    claibratedata .setString('Item Code', a.text);
  }

  void getGaugetype() {

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection("Chakan")
        .doc("Attributes")
        .collection("gauge types")
        .doc("1W6qHZfSxKcRAy7ycg52").get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
        List<String> list = [];
        data.forEach((key, value) {
          list.add(value);
        });
        print(list);
        // _locations = list;
        setState(() {
          _locations = list;
          // _locations = list;
          print(_locations.runtimeType);
          // we can use this list for dropdown
        });
      }else{
        print('Document does not exist on the database');
      }
    });


  }




  Widget build(BuildContext context){
    return Scaffold(
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 500.0),
            width: 500,
            height:50,
            child:Text( " WPPL Identification Gauge Number  " , style: TextStyle(color: Colors.black,fontSize: 22),
              textAlign: TextAlign.center,  ),
          ),

          const SizedBox(height:1.0,),

          Container(
            width: 0.3 * MediaQuery.of(context).size.width,
            height:50.0,
            child: TextField(
              controller: a,
              decoration:  InputDecoration(
                hintText: "Enter WPPL GAUGE NUMBER",
                labelText: "WPPL Identification Gauge Number",
                border: OutlineInputBorder(),

              ),),
          ),

          SizedBox(height: 30.0,),

          // Container(
          //   width: 0.3 * MediaQuery.of(context).size.width,
          //   height:50.0,
          //   child:const  Text("GAUGE TYPE", style: TextStyle(color: Colors.black,fontSize: 23),
          //     textAlign: TextAlign.center,  ),
          // ),
          //
          // SizedBox(height: 1.0,),
          //
          // //DropDown(),
          // // Container(
          // //   width: 0.3 * MediaQuery.of(context).size.width,
          // //   padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
          // //   decoration: BoxDecoration(
          // //     border: Border.all(color: Colors.grey),
          // //     borderRadius: BorderRadius.circular(5.0),
          // //   ),
          // //   child: DropdownButton(
          // //
          // //     hint: Text('Please choose a gauge type'), // Not necessary for Option 1
          // //     value: _selectedLocation,
          // //     onChanged: (newValue) {
          // //       setState(() {
          // //         _selectedLocation = newValue;
          // //       });
          // //
          // //       Fluttertoast.showToast(
          // //           msg: _selectedLocation,
          // //           toastLength: Toast.LENGTH_SHORT,
          // //           gravity: ToastGravity.CENTER,
          // //           timeInSecForIosWeb: 1,
          // //           backgroundColor: Colors.red,
          // //           textColor: Colors.white,
          // //           fontSize: 16.0
          // //       );
          // //     },
          // //     items: _locations.map((location) {
          // //       return DropdownMenuItem(
          // //         child: new Text(location),
          // //         value: location,
          // //       );
          // //     }).toList(),
          // //   ),
          // // ),
          // Container(
          //   width: 0.3 * MediaQuery.of(context).size.width,
          //   child: SimpleAutoCompleteTextField(
          //     key: key,
          //     controller: _suggestion,
          //     clearOnSubmit: false,
          //     suggestions: gauge_type,
          //     style: const TextStyle(color: Colors.black, fontSize: 16.0),
          //     decoration: InputDecoration(
          //         border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(10.0),
          //         )
          //     ),
          //     textChanged: (text)=> currentText=text,
          //     textSubmitted: (text) => setState(() {
          //       if (text != "") {
          //         added.add(text);
          //       }
          //     }),
          //   ),
          // ),

          // SizedBox(height: 30,),





          SizedBox(height: 30,),

          ElevatedButton(
            child: Text("Calibrate Gauge"),
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
            ),
            onPressed: () {

              Navigator.push(context,MaterialPageRoute(builder: (context) => Calibrate_Gauge()),);
              shareperferences();
              //Navigator.push(context,'/showgauge');
            },
          )

        ],

      ),
    );
  }
}