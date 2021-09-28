import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Drop_Down.dart';
import 'package:flutter_iap_project/Text_editor.dart';
import '../../date_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class add_Gauge extends StatefulWidget {
  const add_Gauge({Key? key}) : super(key: key);

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
  List<dynamic> _gauges = [];
  var _selected_gauges;
  List<dynamic> _frequency = [];
  var _selected_frequency;
  List<dynamic> _location = [];
  var _selected_location;
  List<dynamic> _location_owner = [];
  var _selected_location_owner;




  List<String> guageSizes=[
    'GO',
    'No GO'
  ];
  var _chosenValue;

  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);

  Widget createSizes()
  {
    return Container(
      width: 300,
      height: 47,
      padding: EdgeInsets.fromLTRB(20,10,10,10),
      decoration: BoxDecoration(
          color: Colors.grey[100],
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(5))
      ),

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

          onChanged:handle_SizeChange,
        ),
      ),
    );

  }

  void handle_SizeChange(String? val)
  {
    setState(() {
      _chosenValue=val.toString();

      print("Size change"+_chosenValue);
    });
  }

  void addData()async{
    var gauge_name="snap gauge";
    var collection_name="all "+gauge_name;
    var wpp_number = gauge_number.text.toString();
    var manufacturer_number = identification_number.text.toString();
    var final_number = wpp_number+"_"+manufacturer_number;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection("Chakan")
        .doc("Gauge Types")
        .collection("All Gauges")
        .doc(gauge_name)
        .collection(collection_name)
        .doc(final_number)
        .set({
      'gauge_number': gauge_number.text.toString(), // John Doe
      'identification_number': identification_number.text.toString(), // Stokes and Sons
      'certificate_number': certificate_number.text.toString(), // 42
      'frequency': frequency.text.toString(),
      'go_size':go_size.text.toString(),
      'no_go_size':no_go_size.text.toString(),
      'remark':remark.text.toString(),
      'caliberated_on_date':"${selectedDate3.toLocal()}".split(' ')[0],
      'caliberation_due_date':"${selectedDate2.toLocal()}".split(' ')[0],
      'issued_date':"${selectedDate1.toLocal()}".split(' ')[0],
    })
    //.update({'GAUGE COST':'900'})
        .then((value) => Fluttertoast.showToast(
        msg:  "User Added",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    )) //we can use toast msg here
        .catchError((error) => print("Failed to add user: $error"));



    // Fluttertoast.showToast(
    //     msg:  gauge_number.text.toString(),
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.red,
    //     textColor: Colors.white,
    //     fontSize: 16.0
    // );
  }

  void getGaugetype()async{
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection("Chakan")
        .doc("Attributes")
        .collection("gauge types")
        .doc("1W6qHZfSxKcRAy7ycg52").get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
        var list = [];
        data.forEach((key, value) {
          list.add(value);
        });
        print(list);
        setState(() {
          _gauges = list;// we can use this list for dropdown
        });

      }else{
        print('Document does not exist on the database');
      }
    });

  }

  void getGaugefrequency()async{
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection("Chakan")
        .doc("Attributes")
        .collection("gauge frequency")
        .doc("all gauge frequency").get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
        var list = [];
        data.forEach((key, value) {
          list.add(value);
        });
        print(list);
        setState(() {
          _frequency = list;// we can use this list for dropdown
        });

      }else{
        print('Document does not exist on the database');
      }
    });

  }

  void getGaugeLocation()async{
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection("Chakan")
        .doc("Attributes")
        .collection("gauge location")
        .doc("YL40nPK2KqMB7HDCQi7k").get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
        var list = [];
        data.forEach((key, value) {
          list.add(value);
        });
        print(list);
        setState(() {
          _location = list;// we can use this list for dropdown
        });

      }else{
        print('Document does not exist on the database');
      }
    });

  }

  void getGaugeLocationOwner()async{
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection("Chakan")
        .doc("Attributes")
        .collection("gauge location owner")
        .doc("mGD9P9XtshOJcscT1EJ5").get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
        var list = [];
        data.forEach((key, value) {
          list.add(value);
        });
        print(list);
        setState(() {
          _location_owner = list;// we can use this list for dropdown
        });

      }else{
        print('Document does not exist on the database');
      }
    });

  }




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getGaugetype();
    getGaugefrequency();
    getGaugeLocation();
    getGaugeLocationOwner();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Scaffold(
          // appBar: AppBar(
          //   toolbarHeight: 50,
          //   backgroundColor: backred,
          //   title: Text("Update Gauge",
          //     style: TextStyle(
          //       color: Colors.white,
          //       fontSize: 30.0,
          //       fontWeight: FontWeight.bold,
          //
          //     ),
          //   ),
          //   centerTitle: true,
          // ),

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
                                Text("Gauge Description",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                                SizedBox(width: 140,),
                                Text("Gauge Number",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                                SizedBox(width: 180,),
                                Text("Gauge Type",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                                SizedBox(width: 210,),
                                Text("Identification Number",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),

                              ]

                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              DropDown(),
                              SizedBox(width: 30,),
                              Container(
                                width: 300,
                                height:50.0,
                                child: TextField(
                                  controller: gauge_number,
                                  decoration: InputDecoration(
                                    labelText: "Gauge Number",
                                    border: OutlineInputBorder(),

                                  ),),
                              ),

                              SizedBox(width: 30,),
                              Container(
                                width: 300,
                                padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: DropdownButton(
                                  hint: Text('Please choose a gauge type'), // Not necessary for Option 1
                                  value: _selected_gauges,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _selected_gauges = newValue;
                                    });

                                    Fluttertoast.showToast(
                                        msg: _selected_gauges,
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0
                                    );
                                  },
                                  items: _gauges.map((location) {
                                    return DropdownMenuItem(
                                      child: new Text(location),
                                      value: location,
                                    );
                                  }).toList(),
                                ),
                              ),
                              SizedBox(width: 30,),
                              Container(
                                width: 300,
                                height:50.0,
                                child: TextField(
                                  controller: identification_number,
                                  decoration: InputDecoration(
                                    labelText: "Identification Number",
                                    border: OutlineInputBorder(),

                                  ),),
                              ),
                            ]
                          ),
                          SizedBox(height: 20,),

                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Issued Date",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                                SizedBox(width: 210,),
                                Text("Calibration Due Date",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                                SizedBox(width: 120,),
                                Text("Certificate Number",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                                SizedBox(width: 140,),
                                Text("Location Owner",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                              ]

                          ),
                          SizedBox(height: 10,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TestPickerWidget(selectedDate1),
                              SizedBox(width: 20,),
                              TestPickerWidget(selectedDate2),
                              SizedBox(width: 20,),
                              Container(
                                width: 300,
                                height:50.0,
                                child: TextField(
                                  controller: certificate_number,
                                  decoration: InputDecoration(
                                    labelText: "Certificate Number",
                                    border: OutlineInputBorder(),

                                  ),),
                              ),

                              SizedBox(width: 20,),
                              Container(
                                width: 300,
                                padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: DropdownButton(
                                  hint: Text('Please choose a Location owner'), // Not necessary for Option 1
                                  value: _selected_location_owner,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _selected_location_owner = newValue;
                                    });

                                    Fluttertoast.showToast(
                                        msg: _selected_location_owner,
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0
                                    );
                                  },
                                  items: _location_owner.map((location) {
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
                            children: [
                              Text("Go",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                              SizedBox(width: 310,),
                              Text("No Go",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                              SizedBox(width: 270,),
                              Text("Frequency",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                              SizedBox(width: 230,),
                              Text("Caliberated On",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),

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
                              controller: go_size,
                              decoration: InputDecoration(
                                labelText: " Go size",
                                border: OutlineInputBorder(),

                              ),),
                          ),
                              SizedBox(width: 30,),
                              Container(
                                width: 300,
                                height:50.0,
                                child: TextField(
                                  controller: no_go_size,
                                  decoration: InputDecoration(
                                    labelText: "No Go size",
                                    border: OutlineInputBorder(),

                                  ),),
                              ),

                              SizedBox(width: 30,),
                              Container(
                                width: 300,
                                padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: DropdownButton(
                                  hint: Text('Please choose Frequency'), // Not necessary for Option 1
                                  value: _selected_frequency,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _selected_frequency = newValue;
                                    });

                                    Fluttertoast.showToast(
                                        msg: _selected_frequency,
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0
                                    );
                                  },
                                  items: _frequency.map((location) {
                                    return DropdownMenuItem(
                                      child: new Text(location),
                                      value: location,
                                    );
                                  }).toList(),
                                ),
                              ),

                              SizedBox(width: 30,),
                              TestPickerWidget(selectedDate3),

                            ],
                          ),

                          SizedBox(height: 20,),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Caliberation Done By",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                                SizedBox(width: 130,),
                                Text("Location",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                                SizedBox(width: 230,),
                                Text("Remark",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),

                              ]
                          ),
                          SizedBox(height: 10,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              DropDown(),
                              SizedBox(width: 30,),
                              Container(
                                width: 300,
                                padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: DropdownButton(
                                  hint: Text('Please choose Location'), // Not necessary for Option 1
                                  value: _selected_location,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _selected_location = newValue;
                                    });

                                    Fluttertoast.showToast(
                                        msg: _selected_location,
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white,
                                        fontSize: 16.0
                                    );
                                  },
                                  items: _location.map((location) {
                                    return DropdownMenuItem(
                                      child: new Text(location),
                                      value: location,
                                    );
                                  }).toList(),
                                ),
                              ),

                              SizedBox(width: 30,),
                              Container(
                                width: 300,
                                height:50.0,
                                child: TextField(
                                  controller: remark,
                                  decoration: InputDecoration(
                                    labelText: "Remark",
                                    border: OutlineInputBorder(),

                                  ),),
                              ),

                            ],
                          ),


                        ],
                      ),

                    ],
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    child: Text("ADD DATA"),
                    onPressed: () {
                      addData();
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        textStyle: TextStyle(
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
}