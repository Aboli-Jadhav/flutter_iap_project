import 'package:autocomplete_textfield_ns/autocomplete_textfield_ns.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iap_project/master_admin/tab_header/tab.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../date_picker.dart';
import 'custom_dialog_box.dart';
import 'package:flutter_iap_project/date_picker2.dart';

class AddNewGaugeToSystem extends StatefulWidget {
  final List<String> gauge_location;
  final List<String> gauge_name;
  final List<String> gauge_location_owner;

  const AddNewGaugeToSystem(
      {Key? key, required this.gauge_location, required this.gauge_name, required this.gauge_location_owner})
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
  var process_owner = TextEditingController();
  var process_owner_mail_id = TextEditingController();
  var unit = TextEditingController();

  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
  List<String> added = [];
  String currentText = "";
  var _suggestion2 = TextEditingController();
  GlobalKey<AutoCompleteTextFieldState<String>> key2 = GlobalKey();
  List<String> added2 = [];
  String currentText2 = "";
  var _selected_plant;
  List<String> _plants = ["BANJO", "NON BANJO"];

  GlobalKey<AutoCompleteTextFieldState<String>> key3 = GlobalKey();
  List<String> added3 = [];
  String currentText3 = "";
  var _suggestion3 = TextEditingController();


  Color backred = const Color(0xffDF3F3F);
  Color lred = const Color(0xffFBEBEB);

  @override
  void initState() {
    // TODO: implement initState
    unit.text = "MM";
    windal_short_form.text = "WPP";
    last_number.text="00";
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lred,
        appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: backred,
          title: const Text(
            "Add New Gauge to System",
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
                            TestPickerWidget2(""),
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
                                width: 110,
                              ),
                              Text(
                                "Gauge Short form",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(
                                width: 260,
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
                                width: 260,
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
                                width: 210,
                              ),
                              Text(
                                "Gauge Manufacturing Cost (INR)",
                                style:  TextStyle(
                                    color: Colors.black, fontSize: 18),
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(
                                width: 150,
                              ),
                              Text(
                                "Unit",
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

                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text("ADD DATA"),
                  onPressed: () async {
                    // if(){
                    //
                    // }
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
        ));
  }

  Future<void> addData() async {
    await addDataInLastNumber();
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore
        .collection("Chakan")
        .doc("Gauges")
        .collection("All gauges")
        .add({
      'item_code': item_code.text.toString().trim(),
      'gauge_type': _suggestion2.text.toString(),
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
      'plant':_selected_plant,
      'certificate_number': "",
      'nabl_accrediation_status':"",
      'process_owner':_suggestion3.text.toString(),
      'process_owner_mail_id':process_owner_mail_id.text.toString().trim(),
      'unit':unit.text.toString().trim(), //confirm about adding this textField in here and add_new_gauge_to_system
      'acceptance_criteria':''
    })
    //.update({'GAUGE COST':'900'})
        .then((value) => print("add_ new_gauge_to_ system 840: data added successfully in gauges")) //we can use toast msg here
        .catchError((error) => print("add_ new_gauge_to_ system 841: error while adding data to last number"));
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
            print("add_ new_gauge_to_ system 858:data added successfully in last number document"))
    .catchError((onError)=>print("add_ new_gauge_to_ system 859: error while adding data to last number"));
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
