import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iap_project/Drop_Down.dart';
import 'package:flutter_iap_project/Text_editor.dart';
import 'package:flutter_iap_project/date_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../date_picker2.dart';
import 'package:flutter_iap_project/datepicker3.dart';
class Calibrate_Gauge extends StatefulWidget{
  final String wppl_number;
  const Calibrate_Gauge({Key? key,required this.wppl_number}) : super(key: key);

  _calibrate_gauge createState()=> _calibrate_gauge();
}

class _calibrate_gauge extends State<Calibrate_Gauge>{
  DateTime selectedDate = DateTime.now();
  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);
  DateTime selectedDate1 = DateTime.now();
  DateTime selectedDate2 = DateTime.now();
  DateTime selectedDate3 = DateTime.now();
  FirebaseFirestore firestore = FirebaseFirestore.instance;


  late final String wppl_number;
  late final String gauge_type;


  DateTime temp = DateTime.now();
  bool t = true;

  TextEditingController Gauge_Type = TextEditingController();
  TextEditingController Identification_Number = TextEditingController();
  TextEditingController Manufacturer_Number = TextEditingController();
  TextEditingController Nominal_Size = TextEditingController();
  TextEditingController Minimum = TextEditingController();
  TextEditingController Maximum = TextEditingController();
  TextEditingController Calibration_Agency_Name = TextEditingController();
  TextEditingController Calibration_Frequency = TextEditingController();
  TextEditingController Calibration_Cost = TextEditingController();
  TextEditingController Remark = TextEditingController();
  TextEditingController Gauge_location = TextEditingController();
  TextEditingController Acceptance_Criteria = TextEditingController();

  TextEditingController certificate_number = TextEditingController();
  TextEditingController nabl_accredation_status= TextEditingController();
  TextEditingController proces_owner = TextEditingController();
  TextEditingController process_owner_mail_id = TextEditingController();
 // TextEditingController unit = TextEditingController();
  TextEditingController plant = TextEditingController();

  String calibration_date="";
  String calibration_due_date="";
  String uid="";
  var item_code;
  var gauge_make;
  var gauge_cost;
  var gauge_life;
  var invoice_number;
  var invoice_date;
  var fetched_processowner;
  var fetched_processowner_mailid;
  var fetched_unit;


  final List<String> _gauges = [
    '30',
    '90',
    '180',
    '365'
  ];

  var _selected_freq;
  String selectedValue='';

  var t1 = TestPickerWidget3("", 0, "");
  var t2 = TestPickerWidget3("", 0, "");




  void calibrate_gauge_data()async{

    await firestore.collection("Chakan")
        .doc("Gauges")
        .collection("All gauges")
        .where("identification_number",isEqualTo: widget.wppl_number)
        .get()
        .then((QuerySnapshot querySnapshot) {
          if(querySnapshot.docs.isNotEmpty) {
            querySnapshot.docs.forEach((doc) {
              //print(doc["first_name"]);
              uid = doc.id.toString();
              String a = "";
              Gauge_Type.text = doc["gauge_type"];
              Identification_Number.text = doc["identification_number"];
              Manufacturer_Number.text = doc["manufacturer_serial_number"];
              Nominal_Size.text = doc["nominal_size"];
              Minimum.text = doc["minimum"];
              Maximum.text = doc["maximum"];
              Calibration_Agency_Name.text = doc["calibration_agency_name"];
              //_selected_freq = doc["calibration_frequency"];
              _selected_freq = '';
              Calibration_Cost.text = doc["calibration_cost"];
              Remark.text = doc["remark"];
              Gauge_location.text = doc["gauge_location"];

              item_code      =doc["item_code"];
              gauge_make     =doc["gauge_make"];
              gauge_cost     =doc["gauge_cost"];
              gauge_life     =doc["gauge_life"];
              invoice_number =doc["invoice_number"];
              invoice_date   =doc["invoice_date"];
              fetched_processowner = doc["process_owner"];
              fetched_processowner_mailid= doc["process_owner_mail_id"];
              fetched_unit  = doc['unit'];
              //unit = doc["unit"];

              certificate_number.text = doc['certificate_number'];
              nabl_accredation_status.text = doc['nabl_accrediation_status'];
              proces_owner.text = doc['process_owner'];
              process_owner_mail_id.text = doc['process_owner_mail_id'];
              //unit.text = doc['unit'];
              Acceptance_Criteria.text = doc['acceptance_criteria'];
              plant.text = doc['plant'];

              setState(() {
                calibration_date = doc["calibration_date"];
                calibration_due_date = "";
                if(_selected_freq=='')
                  _selected_freq = '30';
                print(calibration_date);
              });
              t1 = TestPickerWidget3("GAUGE STORE", int.parse(_selected_freq), calibration_due_date);
              t2 = TestPickerWidget3(calibration_date,0,"");
              if(Calibration_Cost.text.isEmpty){
                Fluttertoast.showToast(
                    msg: "Gauge is issued",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);


            }

            });
          }else{
            Fluttertoast.showToast(
                msg: "No such Gauge is added",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
    });
      }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getGaugetype();
    // getGaugefrequency();
    // getGaugeLocation();
    // getGaugeLocationOwner();
    calibrate_gauge_data();
  }


  @override
  Widget build(BuildContext context) {

    return Container(
      child: Scaffold(
        backgroundColor: lred,
        appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: backred,
          title: Text("Calibrate Gauge",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,

            ),
          ),
          centerTitle: true,
        ),

          body:ListView(
            padding: const EdgeInsets.all(20),
            children: <Widget>[
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: <Widget>[
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Type Of Gauge/Instrument",style: TextStyle(color: Colors.black,fontSize: 18),textAlign: TextAlign.start,),
                                SizedBox(width: 190,),
                                Text("WPPL Gauge/Instrument Identification Number",style: TextStyle(color: Colors.black,fontSize: 18),textAlign: TextAlign.start,),
                                SizedBox(width: 30,),
                                Text("Manufacturers Serial No.",style: TextStyle(color: Colors.black,fontSize: 18),textAlign: TextAlign.start,),

                              ]

                          ),
                          SizedBox(height: 10,),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                // Container(
                                //   height:50.0,
                                //   width: 300,
                                //   padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
                                //   decoration: BoxDecoration(
                                //     border: Border.all(color: Colors.grey),
                                //     borderRadius: BorderRadius.circular(5.0),
                                //   ),
                                //   child: DropdownButton(
                                //     hint: Text('Please choose a gauge type'), // Not necessary for Option 1
                                //     value: _selected_gauges,
                                //     onChanged: (newValue) {
                                //       setState(() {
                                //         _selected_gauges = newValue;
                                //       });
                                //
                                //       Fluttertoast.showToast(
                                //           msg: _selected_gauges,
                                //           toastLength: Toast.LENGTH_SHORT,
                                //           gravity: ToastGravity.CENTER,
                                //           timeInSecForIosWeb: 1,
                                //           backgroundColor: Colors.red,
                                //           textColor: Colors.white,
                                //           fontSize: 16.0
                                //       );
                                //     },
                                //     items: _gauges.map((location) {
                                //       return DropdownMenuItem(
                                //         child: new Text(location),
                                //         value: location,
                                //       );
                                //     }).toList(),
                                //   ),
                                // ),
                                Container(
                                  width: 300,
                                  height:37.0,
                                  child: TextField(
                                    enabled: false,
                                    controller: Gauge_Type,
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                    //  labelText: "Gauge Type",
                                      border: OutlineInputBorder(),

                                    ),),
                                ),
                                SizedBox(width: 100,),
                                Container(
                                  width: 300,
                                  height:37.0,
                                  child: TextField(
                                    enabled: false,
                                    controller: Identification_Number,
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                     // labelText: "Identification Number",
                                      border: OutlineInputBorder(),

                                    ),),
                                ),
                                SizedBox(width: 100,),
                                Container(
                                  width: 300,
                                  height:37.0,
                                  child: TextField(
                                    enabled: false,
                                    controller: Manufacturer_Number,
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                     // labelText: "Manufacturer Number",
                                      border: OutlineInputBorder(),

                                    ),),
                                ),
                              ]
                          ),
                          SizedBox(height: 20,),

                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Text("Nominal Size",style: TextStyle(color: Colors.black,fontSize: 18),textAlign: TextAlign.start,),
                                SizedBox(width: 290,),
                                Text("Minimum",style: TextStyle(color: Colors.black,fontSize: 18),textAlign: TextAlign.start,),
                                SizedBox(width: 330,),
                                Text("Maximum",style: TextStyle(color: Colors.black,fontSize: 18),textAlign: TextAlign.start,),
                              ]

                          ),
                          SizedBox(height: 10,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 300,
                                height:37.0,
                                child: TextField(
                                  enabled: false,
                                  controller: Nominal_Size,
                                  decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                   // labelText: "Nominal Size",
                                    border: OutlineInputBorder(),

                                  ),),
                              ),

                              SizedBox(width: 100,),
                              Container(
                                width: 300,
                                height:37.0,
                                child: TextField(
                                  enabled: false,
                                  controller: Minimum,
                                  decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                   // labelText: "Minimum",
                                    border: OutlineInputBorder(),

                                  ),),
                              ),
                              SizedBox(width: 100,),
                              Container(
                                width: 300,
                                height:37.0,
                                child: TextField(
                                  enabled: false,
                                  controller: Maximum,
                                  decoration:const  InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                   // labelText: "Maximum",
                                    border: OutlineInputBorder(),

                                  ),),
                              ),
                            ],
                          ),

                          SizedBox(height: 20,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text("Calibration Agency Name",style: TextStyle(color: Colors.black,fontSize: 18),textAlign: TextAlign.start,),
                              SizedBox(width: 200,),
                              Text("Issue Date (DD.MM.YYYY)",style: TextStyle(color: Colors.black,fontSize: 18),textAlign: TextAlign.start,),
                              SizedBox(width: 250,),
                              Text("Calibration Frequency (In Days)",style: TextStyle(color: Colors.black,fontSize: 18),textAlign: TextAlign.start,),

                            ],

                          ),
                          SizedBox(height: 10,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              //createSizes(),
                              Container(
                                width: 300,
                                height:37.0,
                                child: TextField(
                                  controller: Calibration_Agency_Name,
                                  decoration:const  InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                   // labelText: "Caliberation Agency Name",
                                    border: OutlineInputBorder(),

                                  ),),
                              ),
                              const SizedBox(width: 100,),
                              t1,
                              const SizedBox(width: 100,),
                              // Container(
                              //   height:50.0,
                              //   width: 300,
                              //   padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
                              //   decoration: BoxDecoration(
                              //     border: Border.all(color: Colors.grey),
                              //     borderRadius: BorderRadius.circular(5.0),
                              //   ),
                              //   child: DropdownButton(
                              //     hint: Text('Please choose Date'), // Not necessary for Option 1
                              //     value: _selected_frequency,
                              //     onChanged: (newValue) {
                              //       setState(() {
                              //         _selected_frequency = newValue;
                              //       });
                              //
                              //       Fluttertoast.showToast(
                              //           msg: _selected_frequency,
                              //           toastLength: Toast.LENGTH_SHORT,
                              //           gravity: ToastGravity.CENTER,
                              //           timeInSecForIosWeb: 1,
                              //           backgroundColor: Colors.red,
                              //           textColor: Colors.white,
                              //           fontSize: 16.0
                              //       );
                              //     },
                              //     items: _frequency.map((location) {
                              //       return DropdownMenuItem(
                              //         child: new Text(location),
                              //         value: location,
                              //       );
                              //     }).toList(),
                              //   ),
                              // ),
                              // Container(
                              //   width: 300,
                              //   height:37.0,
                              //   child: TextField(
                              //     controller: Calibration_Frequency,
                              //     onChanged: (value){
                              //       t1.freq = int.parse(Calibration_Frequency.text);
                              //     },
                              //     decoration:const  InputDecoration(
                              //       fillColor: Colors.white,
                              //       filled: true,
                              //      // labelText: "Caliberation Frequncy",
                              //       border: OutlineInputBorder(),
                              //
                              //     ),),
                              // ),
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
                                  hint: const Text('Please select frequency'),
                                  // Not necessary for Option 1
                                  value: _selected_freq,
                                  onChanged: (newValue) {
                                    t1.freq = int.parse(newValue.toString());
                                    setState(() {
                                      _selected_freq = newValue;
                                      //selected_value = newValue.toString();
                                    });

                                    Fluttertoast.showToast(
                                        msg: _selected_freq,
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


                            ],
                          ),

                          SizedBox(height: 20,),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:const [
                                Text("Calibration Due Date (DD.MM.YYYY)",style: TextStyle(color: Colors.black,fontSize: 18),textAlign: TextAlign.start,),
                                SizedBox(width: 120,),
                                Text("Calibration Cost (INR)",style: TextStyle(color: Colors.black,fontSize: 18),textAlign: TextAlign.start,),
                                SizedBox(width: 230,),
                                Text("Remark",style: TextStyle(color: Colors.black,fontSize: 18),textAlign: TextAlign.start,),

                              ]
                          ),
                          SizedBox(height: 10,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                          Container(
                                width: 270,
                                height: 37,
                                padding: EdgeInsets.fromLTRB(20,6,3,10),
                                decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.all(Radius.circular(5))
                                ),
                                child: Text(
                                  // "${widget.selectedDate.toLocal()}".split(' ')[0],
                                  calibration_due_date,
                                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                ),
                              ) ,
                              IconButton(
                                icon: Icon(Icons.calculate),
                                onPressed: () {
                                  // addData();
                                  setState(() {

                                    calibration_due_date = t1.select2;
                                  });

                                  //addCalibratedData();
                                },

                              ),
                              SizedBox(width: 90,),
                              Container(
                                width: 300,
                                height:37.0,
                                child: TextField(
                                  controller: Calibration_Cost,
                                  decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    //labelText: "Calibration Cost",
                                    border: OutlineInputBorder(),

                                  ),),
                              ),

                             const  SizedBox(width: 100,),
                              Container(
                                width: 300,
                                height:37.0,
                                child: TextField(
                                  controller: Remark,
                                  decoration:const  InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    //labelText: "Remark",
                                    border: OutlineInputBorder(),

                                  ),),
                              ),

                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:const  [
                                Text("Physical Gauge/Instrument Location",style: TextStyle(color: Colors.black,fontSize: 18),textAlign: TextAlign.start,),
                                SizedBox(width: 120,),
                                Text("Acceptance Criteria",style: TextStyle(color: Colors.black,fontSize: 18),textAlign: TextAlign.start,),
                                SizedBox(width: 190,),
                                Text("Certificate Number",style: TextStyle(color: Colors.black,fontSize: 18),textAlign: TextAlign.start,),


                              ]
                          ),
                         const  SizedBox(height: 10,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 300,
                                height:37.0,
                                child: TextField(
                                  controller: Gauge_location,
                                  decoration:const  InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                   // labelText: "Gauge Location",
                                    border: OutlineInputBorder(),

                                  ),),
                              ),
                              SizedBox(width: 100,),
                              Container(
                                width: 300,
                                height:37.0,
                                child: TextField(
                                  controller: Acceptance_Criteria,
                                  decoration:const  InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    // labelText: "Gauge Location",
                                    border: OutlineInputBorder(),

                                  ),),
                              ),
                              SizedBox(width: 100,),
                              Container(
                                width: 300,
                                height:37.0,
                                child: TextField(
                                  controller: certificate_number,
                                  decoration:const  InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                     labelText: "Certificate Number",
                                    border: OutlineInputBorder(),

                                  ),),
                              ),

                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:const  [
                                Text("nabl accredation status",style: TextStyle(color: Colors.black,fontSize: 18),textAlign: TextAlign.start,),
                                SizedBox(width: 210,),
                                // Text("process owner",style: TextStyle(color: Colors.black,fontSize: 18),textAlign: TextAlign.start,),
                                // SizedBox(width: 290,),
                                // Text("process owner mail id",style: TextStyle(color: Colors.black,fontSize: 18),textAlign: TextAlign.start,),
                                Text("plant",style: TextStyle(color: Colors.black,fontSize: 18),textAlign: TextAlign.start,),
                                SizedBox(width: 360,),
                                Text("Calibration Date (DD.MM.YYYY)",style: TextStyle(color: Colors.black,fontSize: 18),textAlign: TextAlign.start,),
                              ]
                          ),
                          const  SizedBox(height: 10,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 300,
                                height:37.0,
                                child: TextField(
                                  controller: nabl_accredation_status,
                                  decoration:const  InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                     labelText: "nabl accredation status",
                                    border: OutlineInputBorder(),

                                  ),),
                              ),
                              // SizedBox(width: 100,),
                              // Container(
                              //   width: 300,
                              //   height:37.0,
                              //   child: TextField(
                              //     controller: proces_owner,
                              //     decoration:const  InputDecoration(
                              //       fillColor: Colors.white,
                              //       filled: true,
                              //       labelText: "process owner",
                              //       border: OutlineInputBorder(),
                              //
                              //     ),),
                              // ),
                              // SizedBox(width: 100,),
                              // Container(
                              //   width: 300,
                              //   height:37.0,
                              //   child: TextField(
                              //     controller: process_owner_mail_id,
                              //     decoration:const  InputDecoration(
                              //       fillColor: Colors.white,
                              //       filled: true,
                              //       labelText: "process owner mail id",
                              //       border: OutlineInputBorder(),
                              //
                              //     ),),
                              // ),
                              const SizedBox(width: 100,),
                              Container(
                                width: 300,
                                height:37.0,
                                child: TextField(
                                  controller: plant,
                                  decoration:const  InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    //labelText: "plant",
                                    border: OutlineInputBorder(),

                                  ),),
                              ),

                              const SizedBox(width: 100,),
                                t2,
                            ],
                          ),
                          // const SizedBox(height: 20,),
                          // Row(
                          //     mainAxisAlignment: MainAxisAlignment.start,
                          //     children:const  [
                          //       // Text("unit",style: TextStyle(color: Colors.black,fontSize: 18),textAlign: TextAlign.start,),
                          //       // const SizedBox(width: 350,),
                          //       Text("plant",style: TextStyle(color: Colors.black,fontSize: 18),textAlign: TextAlign.start,),
                          //
                          //     ]
                          // ),
                          // const  SizedBox(height: 10,),
                          //
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   children: [
                          //     // Container(
                          //     //   width: 300,
                          //     //   height:37.0,
                          //     //   child: TextField(
                          //     //     controller: unit,
                          //     //     decoration:const  InputDecoration(
                          //     //       fillColor: Colors.white,
                          //     //       filled: true,
                          //     //       labelText: "unit",
                          //     //       border: OutlineInputBorder(),
                          //     //
                          //     //     ),),
                          //     // ),
                          //     // SizedBox(width: 100,),
                          //     Container(
                          //       width: 300,
                          //       height:37.0,
                          //       child: TextField(
                          //         controller: plant,
                          //         decoration:const  InputDecoration(
                          //           fillColor: Colors.white,
                          //           filled: true,
                          //           labelText: "plant",
                          //           border: OutlineInputBorder(),
                          //
                          //         ),),
                          //     ),
                          //
                          //   ],
                          // ),



                        ],
                      ),

                    ],
                  ),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                    child: const  Text("CALIBRATE DATA"),
                    onPressed: () {
                      // addData();
                      addCalibratedDataToHistory();
                      addCalibratedData();
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        padding:const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        textStyle:const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),

                  ),

                ],
              )
            ],
          )
      ),
    );
  }

  void addCalibratedData() async{

    await firestore.collection("Chakan")
        .doc("Gauges")
        .collection("All gauges")
        .doc(uid)
        .set({
      "gauge_type":Gauge_Type.text,
      "identification_number": Identification_Number.text,
      "manufacturer_serial_number":Manufacturer_Number.text,
      "nominal_size":Nominal_Size.text,
      "minimum":Minimum.text,
      "maximum":Maximum.text,
      "calibration_agency_name":Calibration_Agency_Name.text,
      "calibration_frequency":_selected_freq,
      "calibration_cost":Calibration_Cost.text,
      "remark":Remark.text,
      "gauge_location": Gauge_location.text,
      "calibration_date":t2.selectedDate,
      "calibration_due_date":calibration_due_date,
      "item_code": item_code,
      'gauge_make':gauge_make,
      'gauge_cost':gauge_cost,
      'gauge_life':gauge_life,
      'invoice_number':invoice_number,
      'invoice_date':invoice_date,
      //TODO : add these parameters
      'certificate_number':certificate_number.text,
      'nabl_accrediation_status':nabl_accredation_status.text,
      'process_owner':fetched_processowner,
      'process_owner_mail_id':fetched_processowner_mailid,
      'unit':fetched_unit,
      'plant':plant.text,
      'acceptance_criteria': Acceptance_Criteria.text
    })
        .then((value) {
      Fluttertoast.showToast(
          msg: "Gauge Calibrated Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    });
  }

  void addCalibratedDataToHistory() async{

    await firestore.collection("Chakan")
        .doc("Gauges")
        .collection("All gauges")
        .doc(uid)
    .collection("History")
        .add({
      "gauge_type":Gauge_Type.text,
      "identification_number": Identification_Number.text,
      "manufacturer_serial_number":Manufacturer_Number.text,
      "nominal_size":Nominal_Size.text,
      "minimum":Minimum.text,
      "maximum":Maximum.text,
      "calibration_agency_name":Calibration_Agency_Name.text,
      "calibration_frequency":_selected_freq,
      "calibration_cost":Calibration_Cost.text,
      "remark":Remark.text,
      "gauge_location": Gauge_location.text,
      "calibration_date":t2.selectedDate,
      "calibration_due_date":calibration_due_date,
      "item_code": item_code,
      'gauge_make':gauge_make,
      'gauge_cost':gauge_cost,
      'gauge_life':gauge_life,
      'invoice_number':invoice_number,
      'invoice_date':invoice_date,
      'certificate_number':certificate_number.text,
      'nabl_accrediation_status':nabl_accredation_status.text,
      'process_owner':fetched_processowner,
      'process_owner_mail_id':fetched_processowner_mailid,
      'unit':fetched_unit, //fetch this
      'plant':plant.text,
      'acceptance_criteria': Acceptance_Criteria.text


    })
        .then((value) {
      Fluttertoast.showToast(
          msg: "Gauge Calibrated Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    });
  }
}
