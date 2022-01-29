import 'package:autocomplete_textfield_ns/autocomplete_textfield_ns.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Drop_Down.dart';
import 'package:flutter_iap_project/Text_editor.dart';
import '../../date_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'custom_dialog_box.dart';
import 'package:flutter_iap_project/date_picker2.dart';

class add_Gauge extends StatefulWidget {
  final List<String> gauge_location;
  final List<String> gauge_location_owner;
  final String gauge_name;
  final String model_name;

  const add_Gauge(
      {Key? key,
      required this.gauge_location,
        required this.gauge_location_owner,
      this.gauge_name = "",
      this.model_name = ""})
      : super(key: key);

  @override
  _add_GaugeState createState() => _add_GaugeState();
}

class _add_GaugeState extends State<add_Gauge> {
  DateTime selectedDate1 = DateTime.now();
  DateTime selectedDate2 = DateTime.now();
  DateTime selectedDate3 = DateTime.now();

  var go_size = TextEditingController();
  var no_go_size = TextEditingController();
  var frequency = TextEditingController();
  var certificate_number = TextEditingController();
  var gauge_number = TextEditingController();
  var identification_number = TextEditingController();
  var remark = TextEditingController();
  var nominal_size = TextEditingController();
  var manufacturer_serial_number = TextEditingController();
  var minimum = TextEditingController();
  var maximum = TextEditingController();
  var gauge_make = TextEditingController();
  var gauge_cost = TextEditingController();
  var gauge_life = TextEditingController();
  var invoice_number = TextEditingController();
  var item_code = TextEditingController();
  var gauge_type = TextEditingController();
  var _suggestion = TextEditingController();
  var unit = TextEditingController();
  var process_owner = TextEditingController();
  var process_owner_mail_id = TextEditingController();
  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
  List<String> added = [];
  String currentText = "";
  int upload_final_number=0;

  GlobalKey<AutoCompleteTextFieldState<String>> key3 = GlobalKey();
  List<String> added3 = [];
  String currentText3 = "";
  var _suggestion3 = TextEditingController();

  List<dynamic> _gauges = [];
  var _selected_gauges;
  List<dynamic> _frequency = [];
  var _selected_frequency;
  List<dynamic> _location = [];
  var _selected_location;
  List<dynamic> _location_owner = [];
  var _selected_location_owner;

  List<String> guageSizes = ['GO', 'No GO'];
  var _chosenValue;

  Color backred = const Color(0xffDF3F3F);
  Color lred = const Color(0xffFBEBEB);

  Widget createSizes() {
    return Container(
      width: 300,
      height: 47,
      padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
      decoration: BoxDecoration(
          color: Colors.grey[100],
          border: Border.all(color: Colors.black),
          borderRadius: const BorderRadius.all(const Radius.circular(5))),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _chosenValue,
          //elevation: 5,
          style: const TextStyle(color: Colors.black),

          items: guageSizes.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          hint: const Text(
            "Select The Guage Size",
          ),

          onChanged: handle_SizeChange,
        ),
      ),
    );
  }

  void handle_SizeChange(String? val) {
    setState(() {
      _chosenValue = val.toString();

      print("Size change" + _chosenValue);
    });
  }

  void addData() async {
    var gauge_name = "snap gauge";
    var collection_name = "all " + gauge_name;
    var wpp_number = identification_number.text.toString();
    var manufacturer_number = manufacturer_serial_number.text.toString();
    var final_number = wpp_number + "_" + manufacturer_number;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore
        .collection("Chakan")
        .doc("Gauges")
        .collection("All gauges")
        .add({
          // 'gauge_number': gauge_number.text.toString(), // John Doe
          // 'identification_number': identification_number.text.toString(), // Stokes and Sons
          // 'certificate_number': certificate_number.text.toString(), // 42
          // 'frequency': frequency.text.toString(),
          // 'go_size':go_size.text.toString(),
          // 'no_go_size':no_go_size.text.toString(),
          // 'remark':remark.text.toString(),
          // 'caliberated_on_date':"${selectedDate3.toLocal()}".split(' ')[0],
          // 'caliberation_due_date':"${selectedDate2.toLocal()}".split(' ')[0],
          // 'issued_date':"${selectedDate1.toLocal()}".split(' ')[0],

          'item_code': item_code.text.toString().trim(),
          'gauge_type': widget.gauge_name,
          'identification_number': identification_number.text.toString().trim(),
          'manufacturer_serial_number': manufacturer_serial_number.text.toString().trim(),
          'nominal_size': nominal_size.text.toString().trim(),
          'minimum': minimum.text.toString().trim(),
          'maximum': maximum.text.toString().trim(),
          'gauge_make': gauge_make.text.toString().trim(),
          'gauge_cost': gauge_cost.text.toString().trim(),
          'gauge_life': gauge_life.text.toString().trim(),
          'invoice_number': invoice_number.text.toString().trim(),
          'invoice_date': "${selectedDate1.toLocal()}".split(' ')[0],
          'gauge_location': _suggestion.text.toString(),
          'calibration_agency_name': "",
          'calibration_frequency': "",
          'calibration_cost': "",
          'remark': "",
          'calibration_date': "",
          'calibration_due_date': "",
      //TODO: ADD PLANT ATTRIBUTE IN THIS SCREEN FOR INPUT
          'plant':_selected_plant,
      'certificate_number': "",
      'nabl_accrediation_status':"",
      'process_owner':_suggestion3.text.toString(),
      'process_owner_mail_id':process_owner_mail_id.text.toString(),
      'unit':unit.text.toString().trim(), //confirm about adding this textField in here and add_new_gauge_to_system
      'acceptance_criteria':''
        })
        //.update({'GAUGE COST':'900'})
        .then((value) => data_add_success()) //we can use toast msg here
        .catchError((error) => print("Failed to add user: $error"));
  }

  void data_add_success() {
    Fluttertoast.showToast(
        msg: "Data Added",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    item_code.clear();
    //_selected_gauges = "";
    identification_number.clear();
    manufacturer_serial_number.clear();
    nominal_size.clear();
    minimum.clear();
    maximum.clear();
    gauge_make.clear();
    gauge_cost.clear();
    gauge_life.clear();
    invoice_number.clear();
    gauge_type.clear();
    process_owner_mail_id.clear();
    process_owner.clear();

    //selectedDate1 = DateTime
    //_selected_location ="";
  }

  // void getGaugetype() async {
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;
  //   firestore
  //       .collection("Chakan")
  //       .doc("Attributes")
  //       .collection("gauge types")
  //       .doc("1W6qHZfSxKcRAy7ycg52")
  //       .get()
  //       .then((DocumentSnapshot documentSnapshot) {
  //     if (documentSnapshot.exists) {
  //       Map<String, dynamic> data =
  //           documentSnapshot.data() as Map<String, dynamic>;
  //       var list = [];
  //       data.forEach((key, value) {
  //         list.add(value);
  //       });
  //       print(list);
  //       setState(() {
  //         _gauges = list; // we can use this list for dropdown
  //       });
  //     } else {
  //       print('Document does not exist on the database');
  //     }
  //   });
  // }
  //
  // void getGaugefrequency() async {
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;
  //   firestore
  //       .collection("Chakan")
  //       .doc("Attributes")
  //       .collection("gauge frequency")
  //       .doc("all gauge frequency")
  //       .get()
  //       .then((DocumentSnapshot documentSnapshot) {
  //     if (documentSnapshot.exists) {
  //       Map<String, dynamic> data =
  //           documentSnapshot.data() as Map<String, dynamic>;
  //       var list = [];
  //       data.forEach((key, value) {
  //         list.add(value);
  //       });
  //       print(list);
  //       setState(() {
  //         _frequency = list; // we can use this list for dropdown
  //       });
  //     } else {
  //       print('Document does not exist on the database');
  //     }
  //   });
  // }
  //
  // void getGaugeLocation() async {
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;
  //   firestore
  //       .collection("Chakan")
  //       .doc("Attributes")
  //       .collection("gauge location")
  //       .doc("YL40nPK2KqMB7HDCQi7k")
  //       .get()
  //       .then((DocumentSnapshot documentSnapshot) {
  //     if (documentSnapshot.exists) {
  //       Map<String, dynamic> data =
  //           documentSnapshot.data() as Map<String, dynamic>;
  //       var list = [];
  //       data.forEach((key, value) {
  //         list.add(value);
  //       });
  //       print(list);
  //       setState(() {
  //         _location = list; // we can use this list for dropdown
  //       });
  //     } else {
  //       print('Document does not exist on the database');
  //     }
  //   });
  // }
  //
  // void getGaugeLocationOwner() async {
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;
  //   firestore
  //       .collection("Chakan")
  //       .doc("Attributes")
  //       .collection("gauge location owner")
  //       .doc("mGD9P9XtshOJcscT1EJ5")
  //       .get()
  //       .then((DocumentSnapshot documentSnapshot) {
  //     if (documentSnapshot.exists) {
  //       Map<String, dynamic> data =
  //           documentSnapshot.data() as Map<String, dynamic>;
  //       var list = [];
  //       data.forEach((key, value) {
  //         list.add(value);
  //       });
  //       print(list);
  //       setState(() {
  //         _location_owner = list; // we can use this list for dropdown
  //       });
  //     } else {
  //       print('Document does not exist on the database');
  //     }
  //   });
  // }

  var _selected_plant;
  List<String> _plants = ["BANJO", "NON BANJO"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    unit.text = "MM";
    gauge_type.text = widget.gauge_name;
    if(widget.model_name!=""){
      getFinalWpplModelNumber();
    }else{
      getFinalWpplGaugeNumber();
    }


    print("Gauge Location: ${widget.gauge_location} ");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lred,
        appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: backred,
          title: const Text(
            "Add Gauge",
            style:  TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                // Text("Gauge Description",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                                // SizedBox(width: 140,),
                                 Text(
                                  "Item Code",
                                  style:  TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  textAlign: TextAlign.start,
                                ),
                                 SizedBox(
                                  width: 320,
                                ),
                                 Text(
                                  "Type Of Gauge/Instrument",
                                  style:  TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  textAlign: TextAlign.start,
                                ),
                                 SizedBox(
                                  width: 190,
                                ),
                                 Text(
                                  "WPPL Gauge/Instrument Identification Number",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  textAlign: TextAlign.start,
                                ),
                              ]),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //DropDown(),
                                //SizedBox(width: 30,),
                                Container(
                                  width: 300,
                                  height: 37.0,
                                  child: TextField(
                                    controller: item_code,
                                    decoration: const InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      //labelText: "Item Code",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),

                                const SizedBox(
                                  width: 100,
                                ),
                                // Container(
                                //   height:50.0,
                                //   width: 300,
                                //   padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 10.0),
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
                                  height: 37.0,
                                  child: TextField(
                                    controller: gauge_type,
                                    enabled: false,
                                    decoration: const InputDecoration(
                                      //labelText: "Gauge Type",
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 100,
                                ),
                                Container(
                                  width: 300,
                                  height: 37.0,
                                  child: TextField(
                                    enabled: false,
                                    controller: identification_number,
                                    decoration: const InputDecoration(
                                      //labelText: "Identification Number",
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ]),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const[
                                 Text(
                                  "Manufacturers Serial No.",
                                  style:  TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  textAlign: TextAlign.start,
                                ),
                                 SizedBox(
                                  width: 205,
                                ),
                                 Text(
                                  "Nominal Size",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  textAlign: TextAlign.start,
                                ),
                                 SizedBox(
                                  width: 290,
                                ),
                                 Text(
                                  "Minimum",
                                  style:  TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  textAlign: TextAlign.start,
                                ),
                              ]),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 300,
                                height: 37.0,
                                child: TextField(
                                  controller: manufacturer_serial_number,
                                  decoration: const InputDecoration(
                                    //labelText: "Serial Number",
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 100,
                              ),
                              Container(
                                width: 300,
                                height: 37.0,
                                child: TextField(
                                  controller: nominal_size,
                                  decoration: const InputDecoration(
                                    //labelText: "Nominal Size",
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: const OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 100,
                              ),
                              Container(
                                width: 300,
                                height: 37.0,
                                child: TextField(
                                  controller: minimum,
                                  decoration: const InputDecoration(
                                    //labelText: "Minimum",
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: const OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                               Text(
                                "Maximum",
                                style:  TextStyle(
                                    color: Colors.black, fontSize: 18),
                                textAlign: TextAlign.start,
                              ),
                               SizedBox(
                                width: 320,
                              ),
                               Text(
                                 "Process Owner",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                                textAlign: TextAlign.start,
                              ),
                               SizedBox(
                                width: 270,
                              ),
                               Text(
                                 "Process Owner Mail id",
                                style:  TextStyle(
                                    color: Colors.black, fontSize: 18),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              //createSizes(),

                              Container(
                                width: 300,
                                height: 37.0,
                                child: TextField(
                                  controller: maximum,
                                  decoration: const InputDecoration(
                                    //labelText: "Maximum",
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: const OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 100,
                              ),
                              Container(
                                color: Colors.white,
                                width: 300,
                                height:37,
                                child: SimpleAutoCompleteTextField(
                                  key: key3,
                                  controller: _suggestion3,
                                  clearOnSubmit: false,
                                  //suggestions: gauge_type,
                                  suggestions: widget.gauge_location_owner,
                                  style: const TextStyle(color: Colors.black, fontSize: 16.0),
                                  decoration: InputDecoration(
                                    //hintText: "",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5.0),
                                      )),
                                  textChanged: (text) {
                                    currentText3 = text;

                                  },
                                  textSubmitted: (text) => setState(() {
                                    if (text != "") {
                                      changeProcessOwnerEmailId();
                                      added3.add(text);
                                    }
                                  }),
                                ),
                              ),
                              const SizedBox(width: 100,),
                              Container(
                                width: 300,
                                height: 37.0,
                                child: TextField(
                                  controller: process_owner_mail_id,
                                  decoration: const InputDecoration(
                                    //labelText: "Invoice Number",
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                 Text(
                                  "Gauge/Instrument Life (In Months)",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  textAlign: TextAlign.start,
                                ),
                                 SizedBox(
                                  width: 130,
                                ),
                                 Text(
                                  "Invoice Number",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  textAlign: TextAlign.start,
                                ),
                                 SizedBox(
                                  width: 270,
                                ),
                                 Text(
                                  "Invoice Date (MM.DD.YYYY)",
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  textAlign: TextAlign.start,
                                ),
                              ]),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 300,
                                height: 37.0,
                                child: TextField(
                                  controller: gauge_life,
                                  decoration: const InputDecoration(
                                    //labelText: "Instrument Life",
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 100,
                              ),
                              Container(
                                width: 300,
                                height: 37.0,
                                child: TextField(
                                  controller: invoice_number,
                                  decoration: const InputDecoration(
                                    //labelText: "Invoice Number",
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 100,
                              ),
                              TestPickerWidget2(""),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const[
                                 Text(
                                  "Physical Gauge/Instrument Location",
                                  style:  TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  textAlign: TextAlign.start,
                                ),
                                 SizedBox(
                                  width: 120,
                                ),
                                Text(
                                  "Plant",
                                  style:  TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(
                                  width: 350,
                                ),
                                Text(
                                  "Unit",
                                  style:  TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  textAlign: TextAlign.start,
                                ),
                              ]),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // Container(
                              //   height:50.0,
                              //   width: 300,
                              //   padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 10.0),
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
                                height: 37,
                                child: SimpleAutoCompleteTextField(
                                  key: key,
                                  controller: _suggestion,
                                  clearOnSubmit: false,
                                  //suggestions: gauge_type,
                                  suggestions: widget.gauge_location,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 16.0),
                                  decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  )),
                                  textChanged: (text) => currentText = text,
                                  textSubmitted: (text) => setState(() {
                                    if (text != "") {
                                      added.add(text);
                                    }
                                  }),
                                ),
                              ),
                              const SizedBox(width: 100,),
                              Container(
                                height: 37.0,
                                width: 300,
                                padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.black54),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: DropdownButton(
                                  hint: const Text('Select Plant'),
                                  // Not necessary for Option 1
                                  value: _selected_plant,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _selected_plant = newValue;

                                    });

                                    Fluttertoast.showToast(
                                        msg: _selected_plant,
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  },
                                  items: _plants.map((location) {
                                    return DropdownMenuItem(
                                      child: new Text(location),
                                      value: location,
                                    );
                                  }).toList(),
                                ),
                              ),
                              const SizedBox(width: 100,),
                              Container(
                                width: 300,
                                height: 37.0,
                                child: TextField(
                                  controller: unit,
                                  decoration: const InputDecoration(
                                    //labelText: "Invoice Number",
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const[
                                Text(
                                  "Gauge/Instrument Make",
                                  style:  TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(
                                  width: 230,
                                ),
                                Text(
                                  "Gauge Manufacturing Cost (INR)",
                                  style:  TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  textAlign: TextAlign.start,
                                ),
                              ]),
                          const SizedBox(height: 10,),
                          Row(
                            children: [

                              Container(
                                width: 300,
                                height: 37.0,
                                child: TextField(
                                  controller: gauge_make,
                                  decoration: const InputDecoration(
                                    //labelText: "Instrument Make",
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 100,
                              ),
                              Container(
                                width: 300,
                                height: 37.0,
                                child: TextField(
                                  controller: gauge_cost,
                                  decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    //labelText: "Instrument Cost",
                                    border: const OutlineInputBorder(),
                                  ),
                                ),
                              ),


                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    child: const Text("ADD DATA"),
                    onPressed: () {
                      //print("uploaded latest number = $upload_final_number");
                      updateLastNumber();
                      addData();
                      Navigator.of(context).pop();
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const CustomDialogBox(
                              title: "Success",
                              descriptions: "Data Successfully Added",
                              text: "OK",
                            );
                          });

                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        padding:
                            const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        textStyle: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  void getFinalWpplModelNumber() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore
        .collection("Chakan")
        .doc("Gauge wppl next no")
        .collection("all numbers")
        .where("model_sf", isEqualTo: widget.model_name)
        .get()
        .then((QuerySnapshot querySnapshot) {
           String value='';
          if(querySnapshot.docs.isNotEmpty){
            querySnapshot.docs.forEach((doc) {
              int a = int.parse(doc["last_number"]);
              upload_final_number = a+1;
              if(a < 9) {
                value = "${doc["windal_sf"]}/${doc["gauge_sf"]}/${doc["model_sf"]}/0${a + 1}";
              }else{
                value = "${doc["windal_sf"]}/${doc["gauge_sf"]}/${doc["model_sf"]}/${a + 1}";
              }
            });
            identification_number.text=value;
          }else{
            identification_number.text="no such model";
            print("no such model");
          }

    });


  }

  void getFinalWpplGaugeNumber() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore
        .collection("Chakan")
        .doc("Gauge wppl next no")
        .collection("all numbers")
        .where("gauge_name", isEqualTo: widget.gauge_name)
        .get()
        .then((QuerySnapshot querySnapshot) {
      String value='';
      if(querySnapshot.docs.isNotEmpty){
        querySnapshot.docs.forEach((doc) {
          if(doc["model_sf"]==""){
            int a = int.parse(doc["last_number"]);
            upload_final_number = a+1;
            if(a < 9){
              value = "${doc["windal_sf"]}/${doc["gauge_sf"]}/0${a+1}";
            }else{
              value = "${doc["windal_sf"]}/${doc["gauge_sf"]}/${a+1}";
            }

          }

        });
        identification_number.text=value;
      }else{
        identification_number.text="no such model";
        print("no such model");
      }

    });
    identification_number.text="";
  }

  void updateLastNumber() async {
    FirebaseFirestore firestore = await FirebaseFirestore.instance;
    if(widget.model_name==""){

      firestore
          .collection("Chakan")
          .doc("Gauge wppl next no")
          .collection("all numbers")
          .where("gauge_name", isEqualTo: widget.gauge_name)
          .get()
          .then((QuerySnapshot querySnapshot) {
        String id='';
        if(querySnapshot.docs.isNotEmpty){
          querySnapshot.docs.forEach((doc) {
            if(doc["model_sf"]==""){
              id=doc.id.toString();
              firestore
                  .collection("Chakan")
                  .doc("Gauge wppl next no")
                  .collection("all numbers")
              .doc(id)
              .update({"last_number":upload_final_number.toString()})
              .then((value) => print("878: Last number of gauge updated successfully"))
              .catchError((onError)=> print("879: error while updating last number") );
            }else{
              print("881: No such gauge found");
            }

          });

        }else{
          //identification_number.text="no such model";
          print("888: no such model");
        }

      });
    }else{

      firestore
          .collection("Chakan")
          .doc("Gauge wppl next no")
          .collection("all numbers")
          .where("gauge_name", isEqualTo: widget.gauge_name)
          .get()
          .then((QuerySnapshot querySnapshot) {
        String id='';
        if(querySnapshot.docs.isNotEmpty){
          querySnapshot.docs.forEach((doc) {
            if(doc["model_sf"]==widget.model_name){
              id=doc.id.toString();
              firestore
                  .collection("Chakan")
                  .doc("Gauge wppl next no")
                  .collection("all numbers")
                  .doc(id)
                  .update({"last_number":upload_final_number.toString()})
                  .then((value) => print("912: Last number of model updated successfully"))
                  .catchError((onError)=> print("913: error while updating last number") );
            }else{
              print("915: No such gauge found with this model number ");
            }

          });

        }else{
          //identification_number.text="no such model";
          print("922: no such model");
        }

      });


    }

  }

  void changeProcessOwnerEmailId() async{

    String emailid='';
    FirebaseFirestore firestore = await FirebaseFirestore.instance;
    await firestore.collection("Chakan")
        .doc("Attributes")
        .collection("gauge location owner")
        .where("name",isEqualTo: _suggestion3.text)
        .get()
        .then((QuerySnapshot querySnapshot){
      if(querySnapshot.docs.isNotEmpty){
        querySnapshot.docs.forEach((doc) {
          //print(doc['email'].toString().trim());
          emailid = doc['email'].toString().trim();
          process_owner_mail_id.text = doc['email'].toString().trim();
          //gauge_locations_owner.add(doc['name'].toString().trim());
        });
      }else{
        print('Gauge location owner emailid: The Result is Empty');
      }
      setState(() {

      });
      print("Gauge location owner emailid: ${emailid} ");

    });
  }
}
