import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_iap_project/Admin/Add gauges/addguage_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:autocomplete_textfield_ns/autocomplete_textfield_ns.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'view_Master_guage.dart';
import 'package:flutter_iap_project/date_picker2.dart';


class front_view_gauge extends StatefulWidget {


  @override
  _front_view_gaugeState createState() => _front_view_gaugeState();
}

class _front_view_gaugeState extends State<front_view_gauge> {
  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);




  Widget build(BuildContext context){
    return Scaffold(

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 500.0),
            width: 500,
            height:50,
            child:const Text( "Gauge Type  " , style: TextStyle(color: Colors.black,fontSize: 22),
              textAlign: TextAlign.center,  ),
          ),

          const SizedBox(height:1.0,),

          // Container(
          //   width: 0.3 * MediaQuery.of(context).size.width,
          //   height:50.0,
          //   child: TextField(
          //     controller: a,
          //     decoration: const InputDecoration(
          //       hintText: "Enter Gauge Name",
          //       //labelText: "WPPL Identification Gauge Number",
          //       border: OutlineInputBorder(),
          //
          //     ),),
          // ),

          Container(
            width: 0.3 * MediaQuery.of(context).size.width,
            child: TextField(

              decoration: InputDecoration(
              labelText: "Gauge Name",
              border: OutlineInputBorder(),

              ),),
            ),


          SizedBox(height: 30.0,),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 500.0),
            width: 500,
            height:50,
            child:const Text( "Due Date " , style: TextStyle(color: Colors.black,fontSize: 22),
              textAlign: TextAlign.center,  ),
          ),

          const SizedBox(height:1.0,),
          TestPickerWidget2(""),
          SizedBox(height: 30,),

          ElevatedButton(
            child: Text("View Gauge"),
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
            ),
            onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) => view_master_gau()),);

            },
          )
        ],
      ),
    );
  }
}
