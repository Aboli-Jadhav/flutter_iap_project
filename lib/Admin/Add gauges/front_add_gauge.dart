import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'addguage_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:autocomplete_textfield_ns/autocomplete_textfield_ns.dart';
import 'package:shared_preferences/shared_preferences.dart';


class front_add_gauge extends StatefulWidget {

  List<String> gauge_name=[];
  List<String> gauge_location=[];


  front_add_gauge({required this.gauge_name, required this.gauge_location});

  @override
  _front_add_gaugeState createState() => _front_add_gaugeState();
}

class _front_add_gaugeState extends State<front_add_gauge> {
  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);

  final _suggestion = TextEditingController();
  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
  List<String> added = [];
  String currentText = "";


  var a = TextEditingController();

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
            child: SimpleAutoCompleteTextField(
              key: key,
              controller: _suggestion,
              clearOnSubmit: false,
              //suggestions: gauge_type,
              suggestions: widget.gauge_name,
              style: const TextStyle(color: Colors.black, fontSize: 16.0),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  )
              ),
              textChanged: (text)=> currentText=text,
              textSubmitted: (text) => setState(() {
                if (text != "") {
                  added.add(text);
                }
              }),
            ),
          ),

          SizedBox(height: 30.0,),

          SizedBox(height: 30,),

          ElevatedButton(
            child: Text("Add Gauge"),
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
            ),
            onPressed: () {
              if(_suggestion.text.isEmpty){
                Fluttertoast.showToast(
                    msg: "Please Enter Gauge Name",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);

                  return;
              }else{
                Navigator.push(context,MaterialPageRoute(builder: (context) => add_Gauge(gauge_location:widget.gauge_location)),);
              }
            },
          )
        ],
      ),
    );
  }
}