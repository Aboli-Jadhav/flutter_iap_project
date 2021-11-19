import 'package:autocomplete_textfield_ns/autocomplete_textfield_ns.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iap_project/master_admin/tab_header/tab.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../date_picker.dart';
import 'custom_dialog_box.dart';

class AddNewGaugeToSystem extends StatefulWidget {
  final List<String> gauge_location;
  final List<String> gauge_name;

  const AddNewGaugeToSystem(
      {Key? key, required this.gauge_location, required this.gauge_name})
      : super(key: key);

  @override
  _AddNewGaugeToSystemState createState() => _AddNewGaugeToSystemState();
}

class _AddNewGaugeToSystemState extends State<AddNewGaugeToSystem> {
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
  var gauge_short_form = TextEditingController();
  var model_short_form = TextEditingController();
  var windal_short_form = TextEditingController();
  var last_number = TextEditingController();
  var _suggestion = TextEditingController();
  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
  List<String> added = [];
  String currentText = "";
  var _suggestion2 = TextEditingController();
  GlobalKey<AutoCompleteTextFieldState<String>> key2 = GlobalKey();
  List<String> added2 = [];
  String currentText2 = "";
  var _selected_plant;
  List<String> _plants = ["BANJO", "NON BANJO"];

  Color backred = const Color(0xffDF3F3F);
  Color lred = const Color(0xffFBEBEB);

  @override
  void initState() {
    // TODO: implement initState
    windal_short_form.text = "WPP";
    last_number.text="00";
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: lred,
          appBar: AppBar(
            toolbarHeight: 50,
            backgroundColor: backred,
            title: const Text(
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
                              children: const [
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
                                // Container(
                                //   width: 300,
                                //   height: 50.0,
                                //   child: TextField(
                                //     controller: gauge_type,
                                //     enabled: false,
                                //     decoration: const InputDecoration(
                                //       //labelText: "Gauge Type",
                                //       border: OutlineInputBorder(),
                                //     ),
                                //   ),
                                // ),
                                Container(
                                  width: 300,
                                  height: 37,
                                  child: SimpleAutoCompleteTextField(
                                    key: key2,
                                    controller: _suggestion2,
                                    clearOnSubmit: false,
                                    //suggestions: gauge_type,
                                    suggestions: widget.gauge_name,
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 16.0),
                                    decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    )),
                                    textChanged: (text) => currentText2 = text,
                                    textSubmitted: (text) => setState(() {
                                      if (text != "") {
                                        added2.add(text);
                                      }
                                    }),
                                  ),
                                ),
                                const SizedBox(
                                  width: 100,
                                ),
                                Container(
                                  width: 300,
                                  height: 37.0,
                                  child: TextField(
                                    controller: identification_number,
                                    decoration: const InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      //labelText: "Identification Number",
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
                              children: const [
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
                                    fillColor: Colors.white,
                                    filled: true,
                                    //labelText: "Serial Number",
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
                                    fillColor: Colors.white,
                                    filled: true,
                                    //labelText: "Nominal Size",
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
                                    fillColor: Colors.white,
                                    filled: true,
                                    //labelText: "Minimum",
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
                                    fillColor: Colors.white,
                                    filled: true,
                                    //labelText: "Maximum",
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
                                  controller: gauge_make,
                                  decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    //labelText: "Instrument Make",
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
                                  "Invoice Date (DD.MM.YYYY)",
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
                                    fillColor: Colors.white,
                                    filled: true,
                                    //labelText: "Instrument Life",
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
                                    fillColor: Colors.white,
                                    filled: true,
                                    //labelText: "Invoice Number",
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 100,
                              ),
                              TestPickerWidget(selectedDate1),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text(
                                  "Physical Gauge/Instrument Location",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(
                                  width: 120,
                                ),
                                Text(
                                  "Gauge Short form",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(
                                  width: 270,
                                ),
                                Text(
                                  "Last number",
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
                              const SizedBox(
                                width: 100,
                              ),
                              Container(
                                width: 300,
                                height: 37.0,
                                child: TextField(
                                  controller: gauge_short_form,
                                  decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    //labelText: "Gauge Short form",
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
                                  controller: last_number,
                                  decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    //labelText: "Last number",
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
                                  "Model Short Form",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(
                                  width: 250,
                                ),
                                Text(
                                  "Windal Short form",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(
                                  width: 250,
                                ),
                                Text(
                                  "Plant",
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
                              Container(
                                width: 300,
                                height: 37.0,
                                child: TextField(
                                  controller: model_short_form,
                                  decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    //labelText: "Model Short form",
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
                                  controller: windal_short_form,
                                  decoration: const InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    //labelText: "Windal Short form",
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 100,
                              ),
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
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    child: const Text("ADD DATA"),
                    onPressed: () async {
                      await addData();
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                        textStyle: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ),
                ],
              )
            ],
          )),
    );
  }

  Future<void> addData() async {
    await addDataInLastNumber();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore
        .collection("Chakan")
        .doc("Gauges")
        .collection("All gauges")
        .add({
      'item_code': item_code.text.toString(),
      'gauge_type': widget.gauge_name,
      'identification_number': identification_number.text.toString(),
      'manufacturer_serial_number': manufacturer_serial_number.text.toString(),
      'nominal_size': nominal_size.text.toString(),
      'minimum': minimum.text.toString(),
      'maximum': maximum.text.toString(),
      'gauge_make': gauge_make.text.toString(),
      'gauge_cost': gauge_cost.text.toString(),
      'gauge_life': gauge_life.text.toString(),
      'invoice_number': invoice_number.text.toString(),
      'invoice_date': "${selectedDate1.toLocal()}".split(' ')[0],
      'gauge_location': _suggestion.text.toString(),
      'calibration_agency_name': "",
      'calibration_frequency': "",
      'calibration_cost': "",
      'remark': "",
      'calibration_date': "",
      'calibration_due_date': "",
      'plant':_selected_plant,
      'certificate_number': "",
      'nabl_accrediation_status':"",
      'process_owner':"",
      'process_owner_mail_id':"",
      'unit':"", //confirm about adding this textField in here and add_new_gauge_to_system
      'acceptance_criteria':''
    })
    //.update({'GAUGE COST':'900'})
        .then((value) => print("671: data added successfully in gauges")) //we can use toast msg here
        .catchError((error) => print("672: error while adding data to last number"));
  }

  addDataInLastNumber() async {
    FirebaseFirestore firestore = await FirebaseFirestore.instance;

    firestore
        .collection("Chakan")
        .doc("Gauge wppl next no")
        .collection("all numbers")
        .add({
      'gauge_name': _suggestion2.text.toString(),
      'gauge_sf': gauge_short_form.text.toString(),
      'model_sf': model_short_form.text.toString(),
      'last_number': last_number.text.toString(),
      'windal_sf': windal_short_form.text.toString()
    }).then((value) =>
            print("689:data added successfully in last number document"))
    .catchError((onError)=>print("690: error while adding data to last number"));
  }
}
