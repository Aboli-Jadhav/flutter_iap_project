import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_iap_project/Admin/Add gauges/addguage_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:autocomplete_textfield_ns/autocomplete_textfield_ns.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../date_picker.dart';
import 'view_master_guage.dart';
import 'package:flutter_iap_project/date_picker2.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';

class front_view_gauge extends StatefulWidget {
  List<String> gauge_name = [];
  List<String> gauge_location = [];



  front_view_gauge({required this.gauge_name,required this.gauge_location});

  @override
  _front_view_gaugeState createState() => _front_view_gaugeState();
}

class _front_view_gaugeState extends State<front_view_gauge> {
  Color backred = Color(0xffDF3F3F);
  Color lred = Color(0xffFBEBEB);
  //String search_value='';
  String selected_option='';


  String final_selectedValue='';

  final List<String> _gauges = [
    'Type of Gauge',
    'WPPL gauge ID no',
    'GAUGE/INSTRUMENT MAKE',
    'GAUGE/INSTRUMENT MANUFACTURING ID NO',
    'SIZE',
    'CALIBRATION DATE',
    'CALIBRATION DUE DATE',
    'LOCATION',
    'PLANT'
  ];

  TextEditingController type_of_gauge = TextEditingController();
  TextEditingController wppl_gauge_id_no = TextEditingController();
  TextEditingController gauge_make = TextEditingController();
  TextEditingController gauge_manufacturing_id_no = TextEditingController();
  TextEditingController size = TextEditingController();
  //TextEditingController calibration_date = TextEditingController();
  //TextEditingController calibration_due_date = TextEditingController();
  DateTime calibration_date = DateTime.now();
  DateTime calibration_due_date = DateTime.now();
  TextEditingController location = TextEditingController();
  TextEditingController plant = TextEditingController();



  String selectedDate='';

  var _selected_gauges;
  String selectedValue='';

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lred,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Select Search Option",style: const TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
              const SizedBox(height: 30,),
              Container(
                height: 50.0,
                width: 390,
                padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: DropdownButton(
                  hint: const Text('Please select search option'),
                  // Not necessary for Option 1
                  value: _selected_gauges,
                  onChanged: (newValue) {
                    setState(() {
                      _selected_gauges = newValue;
                      selectedValue = newValue.toString();
                    });

                    Fluttertoast.showToast(
                        msg: _selected_gauges,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  },
                  items: _gauges.map((location) {
                    return DropdownMenuItem(
                      child: new Text(location),
                      value: location,
                    );
                  }).toList(),
                ),
              ),
              // DropDown(
              //   items: _gauges,
              //   hint: Text("Male"),
              //   icon: Icon(
              //     Icons.expand_more,
              //     color: Colors.blue,
              //   ),
              //   onChanged: (String? p){
              //     setState(() {
              //       selectedValue=p!;
              //     });
              //   },
              // ),
              // Container(
              //   margin: const EdgeInsets.symmetric(horizontal: 500.0),
              //   width: 500,
              //   height:50,
              //   child:const Text( "Gauge Type  " , style: TextStyle(color: Colors.black,fontSize: 22),
              //     textAlign: TextAlign.center,  ),
              // ),
              //
              // const SizedBox(height:1.0,),
              // Container(
              //   width: 0.3 * MediaQuery.of(context).size.width,
              //   child: TextField(
              //
              //     decoration: InputDecoration(
              //     labelText: "Gauge Name",
              //     border: OutlineInputBorder(),
              //
              //     ),),
              //   ),
              //
              //
              // SizedBox(height: 30.0,),
              // Container(
              //   margin: const EdgeInsets.symmetric(horizontal: 500.0),
              //   width: 500,
              //   height:50,
              //   child:const Text( "Due Date " , style: TextStyle(color: Colors.black,fontSize: 22),
              //     textAlign: TextAlign.center,  ),
              // ),
              //
              // const SizedBox(height:1.0,),
              // TestPickerWidget2(""),
              const SizedBox(
                height: 30,
              ),
              showWidgets(
                value: selectedValue,
                gauge_name:widget.gauge_name,
                gauge_location: widget.gauge_location,
                selected_option: selected_option,
                type_of_gauge: type_of_gauge,
                wppl_gauge_id_no: wppl_gauge_id_no,
                gauge_make: gauge_make,
                gauge_manufacturing_id_no: gauge_manufacturing_id_no,
                size: size,
                calibration_date: calibration_date,
                calibration_due_date: calibration_due_date,
                location: location,
                plant: plant,
                selectedDate: selectedDate,
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                child: Text("View Gauge"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                onPressed: () {



                  switch(selectedValue) {
                    case 'Type of Gauge': {
                      // statements;
                      selected_option = type_of_gauge.text;
                      final_selectedValue='gauge_type';
                    }
                    break;

                    case 'WPPL gauge ID no': {
                      //statements;
                      selected_option = wppl_gauge_id_no.text;
                      final_selectedValue='identification_number';
                    }
                    break;

                    case 'GAUGE/INSTRUMENT MAKE': {
                  //statements;
                      selected_option = gauge_make.text;
                      final_selectedValue='gauge_make';
                  }
                  break;

                  case 'GAUGE/INSTRUMENT MANUFACTURING ID NO': {
                  //statements;
                    selected_option = gauge_manufacturing_id_no.text;
                    final_selectedValue='manufacturer_serial_number';
                  }
                  break;

                  case 'SIZE': {
                  //statements;
                    selected_option = size.text;
                    final_selectedValue='nominal_size';
                  }
                  break;

                  case 'CALIBRATION DATE': {
                  //statements;
                  //   selected_option = calibration_date.text;
                    selected_option = "${calibration_date.toLocal()}".split(' ')[0];
                    final_selectedValue='calibration_date';

                  }
                  break;

                  case 'CALIBRATION DUE DATE': {
                  //statements;
                  //   selected_option = calibration_due_date.text;
                    //selected_option ="${calibration_due_date.toLocal()}".split(' ')[0];
                    selected_option = selectedDate;
                    final_selectedValue='calibration_due_date';
                  }
                  break;

                  case 'LOCATION': {
                  //statements;
                    selected_option = location.text;
                    final_selectedValue='gauge_location';
                  }
                  break;

                    case 'PLANT': {
                      //statements;
                      selected_option = plant.text;
                      final_selectedValue='';
                    }
                    break;

                  default: {
                      //statements;
                    selected_option = 'none';
                    }
                    break;
                  }

                  // switch(selectedValue){
                  //   case 'Type of gauge':{final_selectedValue='gauge_type';}
                  //   break;
                  //   case 'WPPL gauge ID no':{final_selectedValue='identification_number';}
                  //   break;
                  //   case 'GAUGE/INSTRUMENT MAKE':{final_selectedValue='gauge_make';}
                  //   break;
                  //   case 'GAUGE/INSTRUMENT MANUFACTURING ID NO':{final_selectedValue='manufacturer_serial_number';}
                  //   break;
                  //   case 'SIZE':{final_selectedValue='nominal_size';}
                  //   break;
                  //   case 'CALIBRATION DATE':{final_selectedValue='calibration_date';}
                  //   break;
                  //   case 'CALIBRATION DUE DATE':{final_selectedValue='calibration_due_date';}
                  //   break;
                  //   case 'LOCATION':{final_selectedValue='gauge_location';}
                  //   break;
                  //   case 'PLANT':{final_selectedValue='';}
                  //   break;
                  //
                  //   default:{}
                  //   break;
                  // }

                  Fluttertoast.showToast(
                      msg: selected_option.toString(),
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);

                  type_of_gauge.clear();
                  wppl_gauge_id_no.clear();
                  gauge_make.clear();
                  gauge_manufacturing_id_no.clear();
                  size.clear();
                  // calibration_due_date.clear();
                  // calibration_date.clear();
                  location.clear();
                  plant.clear();


                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => view_master_gau(selectedValue:final_selectedValue, selected_option:selected_option)),
                  );

                },
              )
            ],
          ),
        ],
      ),
    );
  }
}



class showWidgets extends StatefulWidget {
  final String value;
  final List<String> gauge_name;
  final List<String> gauge_location;
  final String selected_option;
  final TextEditingController type_of_gauge;
  final TextEditingController wppl_gauge_id_no ;
  final TextEditingController gauge_make;
  final TextEditingController gauge_manufacturing_id_no ;
  final TextEditingController size;
  final DateTime calibration_date;
  final DateTime calibration_due_date;
  final TextEditingController location;
  final TextEditingController plant;
  final String selectedDate;

  // DateTime selectedDate2 = DateTime.now();
  // DateTime selectedDate3 = DateTime.now();

  const showWidgets({Key? key, required this.value,required this.gauge_name,required this.gauge_location,required this.selected_option,required this.type_of_gauge,required this.wppl_gauge_id_no, required this.gauge_make, required this.gauge_manufacturing_id_no,required this.size,required this.calibration_date,required this.calibration_due_date,required this.location,required this.plant, required this.selectedDate}) : super(key: key);

  @override
  _showWidgetsState createState() => _showWidgetsState();
}

class _showWidgetsState extends State<showWidgets> {

  //final _suggestion = TextEditingController();
  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
  List<String> added = [];
  String currentText = "";
  //final _suggestion2 = TextEditingController();
  GlobalKey<AutoCompleteTextFieldState<String>> key2 = GlobalKey();
  List<String> added2 = [];
  String currentText2 = "";




  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 100,
      //color: Colors.red,
      child: Column(
        children: [
      widget.value == "Type of Gauge" ? Container(
            height: 100,
            //color: Colors.red,
            child: //widget.value == "Type of Gauge" ?
            Column(
              children: [
                const Text(
                  "Enter Type of Gauge",
                  style: TextStyle(fontSize: 22),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  color: Colors.white,
                  width: 0.3 * MediaQuery.of(context).size.width,
                  child: SimpleAutoCompleteTextField(
                    key: key,
                    controller: widget.type_of_gauge,
                    clearOnSubmit: false,
                    //suggestions: gauge_type,
                    suggestions: widget.gauge_name,
                    style: const TextStyle(color: Colors.black, fontSize: 16.0),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                    textChanged: (text) {
                      currentText = text;

                    },
                    textSubmitted: (text) => setState(() {
                      if (text != "") {
                        //_gauges.clear();
                        Fluttertoast.showToast(
                            msg: text.toString(),
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);

                        added.add(text);
                      }
                    }),
                  ),
                ),
              ],
            )
                // : SizedBox.shrink(),
          ): const SizedBox(height: 0.1,),


          widget.value == "WPPL gauge ID no" ? Container(
              height: 100,
              //color: Colors.green,
              child: //widget.value == "Type of Gauge" ?
              Column(
                children: [
                  const Text(
                    "Enter WPPL gauge ID no",
                    style: TextStyle(fontSize: 22),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: 390,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Center(
                      child: TextField(
                        controller: widget.wppl_gauge_id_no,
                        decoration: const InputDecoration.collapsed(
                          hintText: "WPPL gauge number",
                          //fillColor: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              )
            // : SizedBox.shrink(),
          ): const SizedBox(height: 0.1,),

          widget.value == "GAUGE/INSTRUMENT MAKE" ? Container(
              height: 100,
              //color: Colors.blue,
              child: //widget.value == "Type of Gauge" ?
              Column(
                children: [
                  const Text(
                    "Enter GAUGE/INSTRUMENT MAKE",
                    style: TextStyle(fontSize: 22),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: 390,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Center(
                      child: TextField(
                        controller: widget.gauge_make,
                        decoration: InputDecoration.collapsed(
                          hintText: "Gauge type",
                          //fillColor: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              )
            // : SizedBox.shrink(),
          ): const SizedBox(height: 0.1,),

          widget.value == "GAUGE/INSTRUMENT MANUFACTURING ID NO" ? Container(
              height: 100,
              //color: Colors.orange,
              child: //widget.value == "Type of Gauge" ?
              Column(
                children: [
                  const Text(
                    "Enter GAUGE/INSTRUMENT MANUFACTURING ID NO",
                    style: TextStyle(fontSize: 22),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: 390,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Center(
                      child: TextField(
                        controller: widget.gauge_manufacturing_id_no,
                        decoration: InputDecoration.collapsed(
                          hintText: "GAUGE/INSTRUMENT MANUFACTURING ID NO",
                          //fillColor: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              )
            // : SizedBox.shrink(),
          ): const SizedBox(height: 0.1,),

          widget.value == "SIZE" ? Container(
              height: 100,
              //color: Colors.purple,
              child: //widget.value == "Type of Gauge" ?
              Column(
                children: [
                  const Text(
                    "Enter SIZE",
                    style: TextStyle(fontSize: 22),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: 390,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Center(
                      child: TextField(
                        controller: widget.size,
                        decoration: InputDecoration.collapsed(
                          hintText: "Enter Size",
                          //fillColor: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              )
            // : SizedBox.shrink(),
          ): const SizedBox(height: 0.1,),

          widget.value == "CALIBRATION DATE" ? Container(
              height: 100,
             // color: Colors.greenAccent,
              child: //widget.value == "Type of Gauge" ?
              Column(
                children: [
                  const Text(
                    "Enter CALIBRATION DATE",
                    style: TextStyle(fontSize: 22),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  TestPickerWidget(widget.calibration_date),
                ],
              )
            // : SizedBox.shrink(),
          ): const SizedBox(height: 0.1,),

          widget.value == "CALIBRATION DUE DATE" ? Container(
              height: 100,
              //color: Colors.teal,
              child: //widget.value == "Type of Gauge" ?
              Column(
                children: [
                  const Text(
                    "Enter CALIBRATION DUE DATE",
                    style: TextStyle(fontSize: 22),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  TestPickerWidget(widget.calibration_due_date),
                  //TestPickerWidget2(widget.selectedDate),
                ],
              )
            // : SizedBox.shrink(),
          ): const SizedBox(height: 0.1,),

          widget.value == "LOCATION" ? Container(
              height: 100,
              //color: Colors.brown,
              child: //widget.value == "Type of Gauge" ?
              Column(
                children: [
                  const Text(
                    "Enter LOCATION",
                    style: TextStyle(fontSize: 22),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Colors.white,
                    width: 0.3 * MediaQuery.of(context).size.width,
                    child: SimpleAutoCompleteTextField(
                      key: key2,
                      controller: widget.location,
                      clearOnSubmit: false,
                      //suggestions: gauge_type,
                      suggestions: widget.gauge_location,
                      style: const TextStyle(color: Colors.black, fontSize: 16.0),
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )),
                      textChanged: (text) {
                        currentText2 = text;

                      },
                      textSubmitted: (text) => setState(() {
                        if (text != "") {
                          //_gauges.clear();
                          Fluttertoast.showToast(
                              msg: text.toString(),
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);


                          //checkForModel();

                          added2.add(text);
                        }
                      }),
                    ),
                  ),
                ],
              )
            // : SizedBox.shrink(),
          ): const SizedBox(height: 0.1,),

          widget.value == "PLANT" ? Container(
              height: 100,
              //color: Colors.black,
              child: //widget.value == "Type of Gauge" ?
              Column(
                children: [
                  const Text(
                    "Enter PLANT",
                    style: TextStyle(fontSize: 22),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: 390,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Center(
                      child: TextField(
                        controller: widget.plant,
                        decoration: InputDecoration.collapsed(
                          hintText: "Gauge type",
                          //fillColor: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              )
            // : SizedBox.shrink(),
          ): const SizedBox(height: 0.1,),

        ],
      ),
    );
  }
}
