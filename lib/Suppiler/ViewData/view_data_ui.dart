import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_iap_project/Admin/Add gauges/addguage_page.dart';
import 'package:flutter_iap_project/Suppiler/ViewData/view_supplier_data.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:autocomplete_textfield_ns/autocomplete_textfield_ns.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../date_picker.dart';
import 'package:flutter_iap_project/date_picker2.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';

class view_data_ui extends StatefulWidget {
  @override
  _view_data_uiState createState() => _view_data_uiState();
}

class _view_data_uiState extends State<view_data_ui> {
  Color backred = Color(0xffDF3F3F);
  Color lred = Color(0xffFBEBEB);
  String selected_option='';
  String final_selectedValue='';
  final List<String> _supplier = [
    'Type of Supplier',
    'Supplier Code',
    'Supplier Contact Person Name',
    'Supplier Contact Person Email',
    'Supplier Contact Person Phone',
    'Supplier Name',
    'Scope',
    'LOCATION'

  ];

  TextEditingController type_of_supplier = TextEditingController();
  TextEditingController sup_code = TextEditingController();
  TextEditingController sup_nm = TextEditingController();
  TextEditingController sup_contact_nm = TextEditingController();
  TextEditingController sup_contact_email = TextEditingController();
  TextEditingController sup_contact_mob = TextEditingController();
  TextEditingController scope = TextEditingController();
  TextEditingController location = TextEditingController();

  List<String> allscope=[];
  List<String> allnames=[];
  List<String> allmails=[];
  List<String> allPhones=[];
  List<String> agencyType=[];

  FirebaseFirestore fstore=FirebaseFirestore.instance;

  String selectedDate='';

  var _selected_gauges;
  String selectedValue='';

  void fetchAllScopes()
  {
      fstore.collection("Chakan")
          .doc("SupplierAttributes")
          .collection("Scopes")
          .get()
          .then((value)
          {
                value.docs.forEach((element)
                {
                    element.data().entries.forEach((ele)
                    {
                        allscope.add(ele.value);
                    });
                });
          });
      print(allscope);
      setState(() {

      });
  }

  void fetchAllContactInfo()
  {
    fstore.collection("Chakan")
        .doc("SupplierAttributes")
        .collection("Contact_Emails")
        .get()
        .then((value)
          {
            value.docs.forEach((element)
            {
              element.data().entries.forEach((ele)
              {
                allmails.add(ele.value);
              });
            });
          });
    print(allmails);

    fstore.collection("Chakan")
        .doc("SupplierAttributes")
        .collection("Contact_Names")
        .get()
        .then((value)
    {
      value.docs.forEach((element)
      {
        element.data().entries.forEach((ele)
        {
          allnames.add(ele.value);
        });
      });
    });
    print(allnames);

    fstore.collection("Chakan")
        .doc("SupplierAttributes")
        .collection("Contact_Phone")
        .get()
        .then((value)
    {
      value.docs.forEach((element)
      {
        element.data().entries.forEach((ele)
        {
          allPhones.add(ele.value);
        });
      });
    });
    setState(() {

    });
    print(allPhones);

  }

  void fetchAttributeValues()
  async {
    await FirebaseFirestore.instance.collection("Chakan").doc("SupplierAttributes").collection("AgencyType")
        .get().then((value)
    {
      value.docs.forEach((element) {
        print("HI");
        element.data().entries.forEach((ele)
        {
          agencyType.add(ele.value);print(ele.value);
        });
      });
    });
    print(agencyType);
  }

  @override
  void initState()
  {
      fetchAllContactInfo();
      fetchAllScopes();
      fetchAttributeValues();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: backred,
        title: Text(
          "View Supplier",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
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
                  items: _supplier.map((location) {
                    return DropdownMenuItem(
                      child: new Text(location),
                      value: location,
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(
                height: 30,
              ),
              showWidgets(value: selectedValue, selected_option: selected_option,
                  sup_name: sup_nm, sup_code: sup_code, scopes: allscope, sup_types: agencyType,
                  cont_mails: allmails, cont_nms: allnames, cont_phones: allPhones,
                  location: location, type_of_supplier: type_of_supplier, contact_email: sup_contact_email, scope_sup: scope,
                  contact_mob: sup_contact_mob,contact_nms: sup_contact_nm
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
                    case 'Type of Supplier': {
                      // statements;
                      selected_option = type_of_supplier.text;
                      final_selectedValue='agencytype';
                    }
                    break;

                    case 'Supplier Code': {
                      //statements;
                      selected_option = sup_code.text;
                      final_selectedValue='agencyCode';
                    }
                    break;

                    case 'Supplier Contact Person Name': {
                      //statements;
                      selected_option = sup_contact_nm.text;
                      final_selectedValue='Contact_Name';
                    }
                    break;

                    case 'Supplier Contact Person Email': {
                      //statements;
                      selected_option = sup_contact_email.text;
                      final_selectedValue='Contact_Emails';
                    }
                    break;

                    case 'Supplier Contact Person Phone': {
                      //statements;
                      selected_option = sup_contact_mob.text;
                      final_selectedValue='Contact_Phone';
                    }
                    break;

                    case 'Supplier Name': {
                      //statements;
                      //   selected_option = calibration_date.text;
                      selected_option = sup_nm.text;
                      final_selectedValue='agencyName';

                    }
                    break;

                    case 'LOCATION': {
                      selected_option = location.text;
                      final_selectedValue='agencyAddress';
                    }
                    break;

                    case 'Scope': {
                      //statements;
                      selected_option = scope.text;
                      final_selectedValue='Scope';
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

                  print(allnames);
                  type_of_supplier.clear();
                  sup_code.clear();
                  location.clear();
                  sup_nm.clear();
                  location.clear();


                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => view_supplier_data(selectedValue:final_selectedValue, selected_option:selected_option)),
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
  final List<String> scopes;
  final List<String> cont_nms;
  final List<String> cont_phones;
  final List<String> cont_mails;
  final List<String> sup_types;
  final String selected_option;
  final TextEditingController type_of_supplier;
  final TextEditingController sup_code ;
  final TextEditingController sup_name;
  final TextEditingController location;
  final TextEditingController contact_mob ;
  final TextEditingController contact_email;
  final TextEditingController contact_nms;
  final TextEditingController scope_sup;


  const showWidgets({Key? key, required this.value ,required this.selected_option,required this.sup_name,required this.sup_code,
  required this.scopes,required this.sup_types,required this.cont_mails,
    required this.cont_nms,required this.cont_phones,
    required this.location,required this.type_of_supplier
    ,required this.contact_mob,required this.contact_email,required this.contact_nms,
  required this.scope_sup
  }) : super(key: key);

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
  GlobalKey<AutoCompleteTextFieldState<String>> key3 = GlobalKey();
  List<String> added3 = [];
  String currentText3 = "";
  //final _suggestion2 = TextEditingController();
  GlobalKey<AutoCompleteTextFieldState<String>> key4 = GlobalKey();
  List<String> added4 = [];
  String currentText4 = "";
  GlobalKey<AutoCompleteTextFieldState<String>> key5 = GlobalKey();
  List<String> added5 = [];
  String currentText5 = "";




  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 100,
      //color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            widget.value == 'Type of Supplier' ? Container(
                height: 100,
                //color: Colors.red,
                child: //widget.value == "Type of Gauge" ?
                Column(
                  children: [
                    const Text(
                      "Enter Type of Supplier",
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
                        controller: widget.type_of_supplier,
                        clearOnSubmit: false,
                        //suggestions: gauge_type,
                        suggestions: widget.sup_types,
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


            widget.value == "Supplier Code" ? Container(
                height: 100,
                //color: Colors.green,
                child: //widget.value == "Type of Gauge" ?
                Column(
                  children: [
                    const Text(
                      "Enter Supplier Code",
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
                          controller: widget.sup_code,
                          decoration: const InputDecoration.collapsed(
                            hintText: "Supplier Code",
                            //fillColor: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              // : SizedBox.shrink(),
            ): const SizedBox(height: 0.1,),

            widget.value == 'Supplier Name' ? Container(
                height: 100,
                //color: Colors.blue,
                child: //widget.value == "Type of Gauge" ?
                Column(
                  children: [
                    const Text(
                      "Supplier Name",
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
                          controller: widget.sup_name,
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

            widget.value == 'LOCATION' ? Container(
                height: 100,
                //color: Colors.orange,
                child: //widget.value == "Type of Gauge" ?
                Column(
                  children: [
                    const Text(
                      "Enter Location",
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
                          controller: widget.location,
                          decoration: InputDecoration.collapsed(
                            hintText: "Location",
                            //fillColor: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              // : SizedBox.shrink(),
            ): const SizedBox(height: 0.1,),

            widget.value == 'Scope' ? Container(
                height: 100,
                //color: Colors.red,
                child: //widget.value == "Type of Gauge" ?
                Column(
                  children: [
                    const Text(
                      "Enter Supplier the Scope",
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
                        controller: widget.scope_sup,
                        clearOnSubmit: false,
                        //suggestions: gauge_type,
                        suggestions: widget.scopes,
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

                            added2.add(text);
                          }
                        }),
                      ),
                    ),
                  ],
                )
              // : SizedBox.shrink(),
            ): const SizedBox(height: 0.1,),

            widget.value == 'Supplier Contact Person Name' ? Container(
                height: 100,
                //color: Colors.red,
                child: //widget.value == "Type of Gauge" ?
                Column(
                  children: [
                    const Text(
                      "Enter Supplier Contact Person Name",
                      style: TextStyle(fontSize: 22),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.white,
                      width: 0.3 * MediaQuery.of(context).size.width,
                      child: SimpleAutoCompleteTextField(
                        key: key3,
                        controller: widget.contact_nms,
                        clearOnSubmit: false,
                        //suggestions: gauge_type,
                        suggestions: widget.cont_nms,
                        style: const TextStyle(color: Colors.black, fontSize: 16.0),
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            )),
                        textChanged: (text) {
                          currentText3 = text;

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

                            added3.add(text);
                          }
                        }),
                      ),
                    ),
                  ],
                )
              // : SizedBox.shrink(),
            ): const SizedBox(height: 0.1,),

            widget.value == 'Supplier Contact Person Email' ? Container(
                height: 100,
                //color: Colors.red,
                child: //widget.value == "Type of Gauge" ?
                Column(
                  children: [
                    const Text(
                      "Enter Supplier Contact Person Email",
                      style: TextStyle(fontSize: 22),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.white,
                      width: 0.3 * MediaQuery.of(context).size.width,
                      child: SimpleAutoCompleteTextField(
                        key: key4,
                        controller: widget.contact_email,
                        clearOnSubmit: false,
                        //suggestions: gauge_type,
                        suggestions: widget.cont_mails,
                        style: const TextStyle(color: Colors.black, fontSize: 16.0),
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            )),
                        textChanged: (text) {
                          currentText4 = text;

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

                            added4.add(text);
                          }
                        }),
                      ),
                    ),
                  ],
                )
              // : SizedBox.shrink(),
            ): const SizedBox(height: 0.1,),

            widget.value == 'Supplier Contact Person Phone' ? Container(
                height: 100,
                //color: Colors.red,
                child: //widget.value == "Type of Gauge" ?
                Column(
                  children: [
                    const Text(
                      "Enter Supplier Contact Person Phone",
                      style: TextStyle(fontSize: 22),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: Colors.white,
                      width: 0.3 * MediaQuery.of(context).size.width,
                      child: SimpleAutoCompleteTextField(
                        key: key5,
                        controller: widget.contact_mob,
                        clearOnSubmit: false,
                        //suggestions: gauge_type,
                        suggestions: widget.cont_phones,
                        style: const TextStyle(color: Colors.black, fontSize: 16.0),
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            )),
                        textChanged: (text) {
                          currentText5 = text;

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

                            added5.add(text);
                          }
                        }),
                      ),
                    ),
                  ],
                )
              // : SizedBox.shrink(),
            ): const SizedBox(height: 0.1,),

            // widget.value == 'Supplier Contact Person Email' ? Container(
            //     height: 100,
            //     //color: Colors.red,
            //     child: //widget.value == "Type of Gauge" ?
            //     Column(
            //       children: [
            //         const Text(
            //           "Enter Supplier Contact Person Email",
            //           style: TextStyle(fontSize: 22),
            //         ),
            //         const SizedBox(
            //           height: 10,
            //         ),
            //         Container(
            //           color: Colors.white,
            //           width: 0.3 * MediaQuery.of(context).size.width,
            //           child: SimpleAutoCompleteTextField(
            //             key: key,
            //             controller: widget.contact_email,
            //             clearOnSubmit: false,
            //             //suggestions: gauge_type,
            //             suggestions: widget.cont_mails,
            //             style: const TextStyle(color: Colors.black, fontSize: 16.0),
            //             decoration: InputDecoration(
            //                 fillColor: Colors.white,
            //                 border: OutlineInputBorder(
            //                   borderRadius: BorderRadius.circular(5.0),
            //                 )),
            //             textChanged: (text) {
            //               currentText = text;
            //
            //             },
            //             textSubmitted: (text) => setState(() {
            //               if (text != "") {
            //                 //_gauges.clear();
            //                 Fluttertoast.showToast(
            //                     msg: text.toString(),
            //                     toastLength: Toast.LENGTH_SHORT,
            //                     gravity: ToastGravity.CENTER,
            //                     timeInSecForIosWeb: 1,
            //                     backgroundColor: Colors.red,
            //                     textColor: Colors.white,
            //                     fontSize: 16.0);
            //
            //                 added.add(text);
            //               }
            //             }),
            //           ),
            //         ),
            //       ],
            //     )
            //   // : SizedBox.shrink(),
            // ): const SizedBox(height: 0.1,),



          ],
        ),
      ),
    );
  }
}
