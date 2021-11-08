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

  String calibration_date="";
  String calibration_due_date="";
  String uid="";
  var item_code;
  var gauge_make;
  var gauge_cost;
  var gauge_life;
  var invoice_number;
  var invoice_date;




  // List<dynamic> _gauges = [];
  // var _selected_gauges;
  // List<dynamic> _frequency = [];
  // var _selected_frequency;
  // List<dynamic> _location = [];
  // var _selected_location;
  // List<dynamic> _location_owner = [];
  // var _selected_location_owner;




  // void addData()async{
  //   var gauge_name="snap gauge";
  //   var collection_name="all "+gauge_name;
  //   var wpp_number = gauge_number.text.toString();
  //   var manufacturer_number = identification_number.text.toString();
  //   var final_number = wpp_number+"_"+manufacturer_number;
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;
  //   firestore.collection("Chakan")
  //       .doc("Gauge Types")
  //       .collection("All Gauges")
  //       .doc(gauge_name)
  //       .collection(collection_name)
  //       .doc(final_number)
  //       .set({
  //     'gauge_number': gauge_number.text.toString(), // John Doe
  //     'identification_number': identification_number.text.toString(), // Stokes and Sons
  //     'certificate_number': certificate_number.text.toString(), // 42
  //     'frequency': frequency.text.toString(),
  //     'go_size':go_size.text.toString(),
  //     'no_go_size':no_go_size.text.toString(),
  //     'remark':remark.text.toString(),
  //     'caliberated_on_date':"${selectedDate3.toLocal()}".split(' ')[0],
  //     'caliberation_due_date':"${selectedDate2.toLocal()}".split(' ')[0],
  //     'issued_date':"${selectedDate1.toLocal()}".split(' ')[0],
  //   })
  //   //.update({'GAUGE COST':'900'})
  //       .then((value) => Fluttertoast.showToast(
  //       msg:  "User Added",
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.CENTER,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white,
  //       fontSize: 16.0
  //   )) //we can use toast msg here
  //       .catchError((error) => print("Failed to add user: $error"));
  //
  //
  //
  //   // Fluttertoast.showToast(
  //   //     msg:  gauge_number.text.toString(),
  //   //     toastLength: Toast.LENGTH_SHORT,
  //   //     gravity: ToastGravity.CENTER,
  //   //     timeInSecForIosWeb: 1,
  //   //     backgroundColor: Colors.red,
  //   //     textColor: Colors.white,
  //   //     fontSize: 16.0
  //   // );
  // }




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
              Calibration_Frequency.text = doc["calibration_frequency"];
              Calibration_Cost.text = doc["calibration_cost"];
              Remark.text = doc["remark"];
              Gauge_location.text = doc["gauge_location"];

              item_code      =doc["item_code"];
              gauge_make     =doc["gauge_make"];
              gauge_cost     =doc["gauge_cost"];
              gauge_life     =doc["gauge_life"];
              invoice_number =doc["invoice_number"];
              invoice_date   =doc["invoice_date"];
              setState(() {
                calibration_date = doc["calibration_date"];
                calibration_due_date = doc["calibration_due_date"];
              });

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
                                  height:50.0,
                                  child: TextField(
                                    enabled: false,
                                    controller: Gauge_Type,
                                    decoration: InputDecoration(
                                    //  labelText: "Gauge Type",
                                      border: OutlineInputBorder(),

                                    ),),
                                ),
                                SizedBox(width: 100,),
                                Container(
                                  width: 300,
                                  height:50.0,
                                  child: TextField(
                                    enabled: false,
                                    controller: Identification_Number,
                                    decoration: InputDecoration(
                                     // labelText: "Identification Number",
                                      border: OutlineInputBorder(),

                                    ),),
                                ),
                                SizedBox(width: 100,),
                                Container(
                                  width: 300,
                                  height:50.0,
                                  child: TextField(
                                    enabled: false,
                                    controller: Manufacturer_Number,
                                    decoration: InputDecoration(
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
                                height:50.0,
                                child: TextField(
                                  enabled: false,
                                  controller: Nominal_Size,
                                  decoration: const InputDecoration(
                                   // labelText: "Nominal Size",
                                    border: OutlineInputBorder(),

                                  ),),
                              ),

                              SizedBox(width: 100,),
                              Container(
                                width: 300,
                                height:50.0,
                                child: TextField(
                                  enabled: false,
                                  controller: Minimum,
                                  decoration: const InputDecoration(
                                   // labelText: "Minimum",
                                    border: OutlineInputBorder(),

                                  ),),
                              ),
                              SizedBox(width: 100,),
                              Container(
                                width: 300,
                                height:50.0,
                                child: TextField(
                                  enabled: false,
                                  controller: Maximum,
                                  decoration:const  InputDecoration(
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
                              Text("Calibration Date (DD.MM.YYYY)",style: TextStyle(color: Colors.black,fontSize: 18),textAlign: TextAlign.start,),
                              SizedBox(width: 150,),
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
                                height:50.0,
                                child: TextField(
                                  controller: Calibration_Agency_Name,
                                  decoration:const  InputDecoration(
                                   // labelText: "Caliberation Agency Name",
                                    border: OutlineInputBorder(),

                                  ),),
                              ),
                              const SizedBox(width: 100,),

                              TestPickerWidget2(selectedDate3,calibration_date), //Calibration Date

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
                              Container(
                                width: 300,
                                height:50.0,
                                child: TextField(
                                  controller: Calibration_Frequency,
                                  decoration:const  InputDecoration(
                                   // labelText: "Caliberation Frequncy",
                                    border: OutlineInputBorder(),

                                  ),),
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

                              TestPickerWidget2(selectedDate1,calibration_due_date), //Callibration Due Date

                              SizedBox(width: 100,),
                              Container(
                                width: 300,
                                height:50.0,
                                child: TextField(
                                  controller: Calibration_Cost,
                                  decoration: const InputDecoration(
                                    //labelText: "Calibration Cost",
                                    border: OutlineInputBorder(),

                                  ),),
                              ),

                             const  SizedBox(width: 100,),
                              Container(
                                width: 300,
                                height:50.0,
                                child: TextField(
                                  controller: Remark,
                                  decoration:const  InputDecoration(
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

                              ]
                          ),
                         const  SizedBox(height: 10,),

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
                              //     hint: Text('Please choose Location'), // Not necessary for Option 1
                              //     value: _selected_location,
                              //     onChanged: (newValue) {
                              //       setState(() {
                              //         _selected_location = newValue;
                              //       });
                              //
                              //       Fluttertoast.showToast(
                              //           msg: _selected_location,
                              //           toastLength: Toast.LENGTH_SHORT,
                              //           gravity: ToastGravity.CENTER,
                              //           timeInSecForIosWeb: 1,
                              //           backgroundColor: Colors.red,
                              //           textColor: Colors.white,
                              //           fontSize: 16.0
                              //       );
                              //     },
                              //     items: _location.map((location) {
                              //       return DropdownMenuItem(
                              //         child: new Text(location),
                              //         value: location,
                              //       );
                              //     }).toList(),
                              //   ),
                              // ),
                              Container(
                                width: 300,
                                height:50.0,
                                child: TextField(
                                  controller: Gauge_location,
                                  decoration:const  InputDecoration(
                                   // labelText: "Gauge Location",
                                    border: OutlineInputBorder(),

                                  ),),
                              ),

                            ],
                          ),

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
                      //addCalibratedData();
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
      "calibration_frequency":Calibration_Frequency.text,
      "calibration_cost":Calibration_Cost.text,
      "remark":Remark.text,
      "gauge_location": Gauge_location.text,
      "calibration_date":calibration_date,
      "calibration_due_date":calibration_due_date,
      "item_code": item_code,
      'gauge_make':gauge_make,
      'gauge_cost':gauge_cost,
      'gauge_life':gauge_life,
      'invoice_number':invoice_number,
      'invoice_date':invoice_date,


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
      "calibration_frequency":Calibration_Frequency.text,
      "calibration_cost":Calibration_Cost.text,
      "remark":Remark.text,
      "gauge_location": Gauge_location.text,
      "calibration_date":calibration_date,
      "calibration_due_date":calibration_due_date,
      "item_code": item_code,
      'gauge_make':gauge_make,
      'gauge_cost':gauge_cost,
      'gauge_life':gauge_life,
      'invoice_number':invoice_number,
      'invoice_date':invoice_date,


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
