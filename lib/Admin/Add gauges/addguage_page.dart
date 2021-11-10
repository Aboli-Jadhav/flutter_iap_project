import 'package:autocomplete_textfield_ns/autocomplete_textfield_ns.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Drop_Down.dart';
import 'package:flutter_iap_project/Text_editor.dart';
import '../../date_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'custom_dialog_box.dart';

class add_Gauge extends StatefulWidget {
  final List<String> gauge_location;
  final String gauge_name;
  final String model_name;

  const add_Gauge(
      {Key? key,
      required this.gauge_location,
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
  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
  List<String> added = [];
  String currentText = "";

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

  Color backred = Color(0xffDF3F3F);
  Color lred = Color(0xffFBEBEB);

  Widget createSizes() {
    return Container(
      width: 300,
      height: 47,
      padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
      decoration: BoxDecoration(
          color: Colors.grey[100],
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _chosenValue,
          //elevation: 5,
          style: TextStyle(color: Colors.black),

          items: guageSizes.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          hint: Text(
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

          'item_code': item_code.text.toString(),
          'gauge_type': _selected_gauges.toString(),
          'identification_number': identification_number.text.toString(),
          'manufacturer_serial_number':
              manufacturer_serial_number.text.toString(),
          'nominal_size': nominal_size.text.toString(),
          'minimum': minimum.text.toString(),
          'maximum': maximum.text.toString(),
          'gauge_make': gauge_make.text.toString(),
          'gauge_cost': gauge_cost.text.toString(),
          'gauge_life': gauge_life.text.toString(),
          'invoice_number': invoice_number.text.toString(),
          'invoice_date': "${selectedDate1.toLocal()}".split(' ')[0],
          'gauge_location': _selected_location.toString(),
          'calibration_agency_name': "",
          'calibration_frequency': "",
          'calibration_cost': "",
          'remark': "",
          'calibration_date': "",
          'calibration_due_date': ""
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
    //selectedDate1 = DateTime
    //_selected_location ="";
  }

  void getGaugetype() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore
        .collection("Chakan")
        .doc("Attributes")
        .collection("gauge types")
        .doc("1W6qHZfSxKcRAy7ycg52")
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        var list = [];
        data.forEach((key, value) {
          list.add(value);
        });
        print(list);
        setState(() {
          _gauges = list; // we can use this list for dropdown
        });
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  void getGaugefrequency() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore
        .collection("Chakan")
        .doc("Attributes")
        .collection("gauge frequency")
        .doc("all gauge frequency")
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        var list = [];
        data.forEach((key, value) {
          list.add(value);
        });
        print(list);
        setState(() {
          _frequency = list; // we can use this list for dropdown
        });
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  void getGaugeLocation() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore
        .collection("Chakan")
        .doc("Attributes")
        .collection("gauge location")
        .doc("YL40nPK2KqMB7HDCQi7k")
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        var list = [];
        data.forEach((key, value) {
          list.add(value);
        });
        print(list);
        setState(() {
          _location = list; // we can use this list for dropdown
        });
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  void getGaugeLocationOwner() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore
        .collection("Chakan")
        .doc("Attributes")
        .collection("gauge location owner")
        .doc("mGD9P9XtshOJcscT1EJ5")
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        var list = [];
        data.forEach((key, value) {
          list.add(value);
        });
        print(list);
        setState(() {
          _location_owner = list; // we can use this list for dropdown
        });
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gauge_type.text = widget.gauge_name;
    if(widget.model_name!=""){
      getFinalWpplModelNumber();
    }else{
      getFinalWpplGaugeNumber();
    }

    getGaugetype();
    getGaugefrequency();
    getGaugeLocation();
    getGaugeLocationOwner();
    print("Gauge Location: ${widget.gauge_location} ");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 50,
            backgroundColor: backred,
            title: Text(
              "Add Gauge",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          body: ListView(
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
                                // Text("Gauge Description",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                                // SizedBox(width: 140,),
                                Text(
                                  "Item Code",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(
                                  width: 320,
                                ),
                                Text(
                                  "Type Of Gauge/Instrument",
                                  style: TextStyle(
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
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //DropDown(),
                                //SizedBox(width: 30,),
                                Container(
                                  width: 300,
                                  height: 50.0,
                                  child: TextField(
                                    controller: item_code,
                                    decoration: InputDecoration(
                                      labelText: "Item Code",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),

                                SizedBox(
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
                                  height: 50.0,
                                  child: TextField(
                                    controller: gauge_type,
                                    enabled: false,
                                    decoration: InputDecoration(
                                      //labelText: "Gauge Type",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                ),
                                Container(
                                  width: 300,
                                  height: 50.0,
                                  child: TextField(
                                    enabled: false,
                                    controller: identification_number,
                                    decoration: InputDecoration(
                                      //labelText: "Identification Number",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ]),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Manufacturers Serial No.",
                                  style: TextStyle(
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
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  textAlign: TextAlign.start,
                                ),
                              ]),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 300,
                                height: 50.0,
                                child: TextField(
                                  controller: manufacturer_serial_number,
                                  decoration: InputDecoration(
                                    labelText: "Serial Number",
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                              ),
                              Container(
                                width: 300,
                                height: 50.0,
                                child: TextField(
                                  controller: nominal_size,
                                  decoration: InputDecoration(
                                    labelText: "Nominal Size",
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                              ),
                              Container(
                                width: 300,
                                height: 50.0,
                                child: TextField(
                                  controller: minimum,
                                  decoration: InputDecoration(
                                    labelText: "Minimum",
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Maximum",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(
                                width: 320,
                              ),
                              Text(
                                "Gauge/Instrument Make",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(
                                width: 210,
                              ),
                              Text(
                                "Gauge Manufacturing Cost (INR)",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              //createSizes(),

                              Container(
                                width: 300,
                                height: 50.0,
                                child: TextField(
                                  controller: maximum,
                                  decoration: InputDecoration(
                                    labelText: "Maximum",
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                              ),
                              Container(
                                width: 300,
                                height: 50.0,
                                child: TextField(
                                  controller: gauge_make,
                                  decoration: InputDecoration(
                                    labelText: "Instrument Make",
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                              ),
                              Container(
                                width: 300,
                                height: 50.0,
                                child: TextField(
                                  controller: gauge_cost,
                                  decoration: InputDecoration(
                                    labelText: "Instrument Cost",
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
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
                                  "Invoice Date (DD.MM.YYYY)",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  textAlign: TextAlign.start,
                                ),
                              ]),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 300,
                                height: 50.0,
                                child: TextField(
                                  controller: gauge_life,
                                  decoration: InputDecoration(
                                    labelText: "Instrument Life",
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                              ),
                              Container(
                                width: 300,
                                height: 50.0,
                                child: TextField(
                                  controller: invoice_number,
                                  decoration: InputDecoration(
                                    labelText: "Invoice Number",
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 100,
                              ),
                              TestPickerWidget(selectedDate1),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Physical Gauge/Instrument Location",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(
                                  width: 230,
                                ),
                              ]),
                          SizedBox(
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
                                child: SimpleAutoCompleteTextField(
                                  key: key,
                                  controller: _suggestion,
                                  clearOnSubmit: false,
                                  //suggestions: gauge_type,
                                  suggestions: widget.gauge_location,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 16.0),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  )),
                                  textChanged: (text) => currentText = text,
                                  textSubmitted: (text) => setState(() {
                                    if (text != "") {
                                      added.add(text);
                                    }
                                  }),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    child: Text("ADD DATA"),
                    onPressed: () {
                      addData();
                      Navigator.of(context).pop();
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomDialogBox(
                              title: "Success",
                              descriptions: "Data Successfully Added",
                              text: "OK",
                            );
                          });
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        textStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                ],
              )
            ],
          )),
    );
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
              if(a < 9) {
                value = "WPP/${doc["gauge_sf"]}/${doc["model_sf"]}/0${a + 1}";
              }else{
                value = "WPP/${doc["gauge_sf"]}/${doc["model_sf"]}/${a + 1}";
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
            if(a < 9){
              value = "WPP/${doc["gauge_sf"]}/0${a+1}";
            }else{
              value = "WPP/${doc["gauge_sf"]}/${a+1}";
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
}
