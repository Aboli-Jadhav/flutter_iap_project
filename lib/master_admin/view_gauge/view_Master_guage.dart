import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:editable/editable.dart';

class view_master_gau extends StatefulWidget {
  const view_master_gau({Key? key}) : super(key: key);

  @override
  _view_master_gauState createState() => _view_master_gauState();
}

class _view_master_gauState extends State<view_master_gau> {


  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);

  //row data
  List rows = [
  {"id": 'WP36473647364', "type":'Type A',"size":'3',"date":'01/01/2021',"location":'Pune'},
    {"id": 'WP36473647364', "type":'Type A',"size":'3',"date":'01/01/2021',"location":'Pune'},
    {"id": 'WP36473647364', "type":'Type A',"size":'3',"date":'01/01/2021',"location":'Pune'},
    {"id": 'WP36473647364', "type":'Type A',"size":'3',"date":'01/01/2021',"location":'Pune'},
    {"id": 'WP36473647364', "type":'Type A',"size":'3',"date":'01/01/2021',"location":'Pune'},
    {"id": 'WP36473647364', "type":'Type A',"size":'3',"date":'01/01/2021',"location":'Pune'},
    {"id": 'WP36473647364', "type":'Type A',"size":'3',"date":'01/01/2021',"location":'Pune'},
    {"id": 'WP36473647364', "type":'Type A',"size":'3',"date":'01/01/2021',"location":'Pune'},
    {"id": 'WP36473647364', "type":'Type A',"size":'3',"date":'01/01/2021',"location":'Pune'},
    {"id": 'WP36473647364', "type":'Type A',"size":'3',"date":'01/01/2021',"location":'Pune'},
    {"id": 'WP36473647364', "type":'Type A',"size":'3',"date":'01/01/2021',"location":'Pune'},
    {"id": 'WP36473647364', "type":'Type A',"size":'3',"date":'01/01/2021',"location":'Pune'},
    {"id": 'WP36473647364', "type":'Type A',"size":'3',"date":'01/01/2021',"location":'Pune'},
    {"id": 'WP36473647364', "type":'Type A',"size":'3',"date":'01/01/2021',"location":'Pune'},
  ];

  List headers = [
  {"title":'Gauge ID No.', 'index': 1, 'key':'id'},
  {"title":'Gauge Type', 'index': 2, 'key':'type'},
  {"title":'Gauge Size', 'index': 3, 'key':'size'},
  {"title":'Due Date', 'index': 4, 'key':'date'},
  {"title":'Location', 'index': 5, 'key':'location'},
  ];

  @override
  Widget build(BuildContext context) {

    return Container(

      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: backred,
          title: Text("View Gauge",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,

            ),
          ),
          centerTitle: true,
        ),

          body:Editable(
            columns: headers,
            rows: rows,
            showCreateButton: false,
            tdStyle: TextStyle(fontSize: 20),
            showSaveIcon: false,
            tdAlignment: TextAlign.center,
            thAlignment: TextAlign.center,
            thPaddingBottom: 12,
            thPaddingTop: 12,
            trHeight: 40,
            columnRatio: 0.196,
            borderColor: Colors.blue.shade900,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.all(Radius.circular(0))),
          ),
      ),
    );
  }
}