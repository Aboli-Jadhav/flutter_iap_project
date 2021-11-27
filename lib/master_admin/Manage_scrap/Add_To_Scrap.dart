import 'package:autocomplete_textfield_ns/autocomplete_textfield_ns.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iap_project/Admin/view_gauge_model.dart';
import 'package:flutter_iap_project/date_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddToScrap extends StatefulWidget {

  final List<String> gauge_name;
  final String identification_number;
  final String nominal_size;
  final String manufacturer_number;
  final String gauge_name_from_showgauge;
  const AddToScrap({Key? key,required this.gauge_name, this.identification_number='', this.nominal_size ='',this.manufacturer_number = '', this.gauge_name_from_showgauge = ''}) : super(key: key);

  @override
  _AddToScrapState createState() => _AddToScrapState();
}

class _AddToScrapState extends State<AddToScrap> {
  DateTime selectedDate = DateTime.now();
  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);

  var manufacturer_serial_number=TextEditingController();
  var identification_number = TextEditingController();
  var gauge_type = TextEditingController();
  var nominal_size = TextEditingController();
  var reason = TextEditingController();
  var responsible_person = TextEditingController();
  var scrap_note_id_no = TextEditingController();
  DateTime scrap_date = DateTime.now();

  void add_toScrap()
  {
    var serial_no=manufacturer_serial_number.text.toString();
    var wppl_id_no=identification_number.text.toString();
    var guage_typ=_chosenValue;
    var nom_size=nominal_size.text.toString();
    var res=reason.text.toString();
    var resp_person=responsible_person.text.toString();
    var not_id_no=scrap_note_id_no.text.toString();
    var scrp_date="${selectedDate.toLocal()}".split(' ')[0];

    print(serial_no+"\n"+wppl_id_no+"\n"+guage_typ+"\n"+nom_size+"\n"+res+"\n"+resp_person+"\n"+not_id_no+"\n"+scrp_date);
  }

  var _chosenValue;
  List<String> guageTypes=[];
  
  void get_All_GuageTypes()
  async {
          await FirebaseFirestore.instance.collection("Chakan").doc("Attributes").collection("gauge types")
              .get().then((value)
          {
            value.docs.forEach((element)
            {
              element.data().entries.forEach((ele)
              {
                guageTypes.add(ele.value);
              });
            });

            print(guageTypes);

          });

  }


    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Success',
              style: TextStyle
                (color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
              textAlign: TextAlign.start,
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text(
                      'Gauge added successfully to Scrap !!!! ',
                      style: TextStyle
                        (color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                      textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }



  void handleDelete() async {

    var guageID=identification_number.text.toString();

    await FirebaseFirestore.instance
        .collection("Chakan").doc("Gauges").collection("All gauges").where(
        "identification_number", isEqualTo: guageID).get().then((value)
        {
            value.docs.forEach((element)
            async
            {
              await FirebaseFirestore.instance.collection("Chakan").doc("Scrap")
                  .collection("all_scrap").doc(element.id).set(
                  {
                          'reason': reason.text.toString(),
                          'responsible_person': responsible_person.text.toString(),
                          'scrap_date': "${selectedDate.toLocal()}".split(' ')[0],
                          'scrap_note_id_no': scrap_note_id_no.text.toString()
                  });
              await FirebaseFirestore.instance.collection("Chakan").doc("Scrap")
                  .collection("all_scrap").doc(element.id).update(Map.fromEntries(element.data().entries));

              await FirebaseFirestore.instance.collection("Chakan").doc("Gauges")
                  .collection("All gauges").doc(element.id).collection("History").get()
                  .then((val)
                  {
                      val.docs.forEach((ele)
                      async {
                        await FirebaseFirestore.instance.collection("Chakan").doc("History_Scrap")
                            .collection("Calibration_History").add(Map.fromEntries(ele.data().entries));

                        await FirebaseFirestore.instance.collection("Chakan").doc("Gauges")
                            .collection("All gauges").doc(element.id).collection("History").doc(ele.id).delete().then((value) => print("Collection Delete"));
                      });
                  });

              await FirebaseFirestore.instance.collection("Chakan").doc("Gauges")
                  .collection("All gauges").doc(element.id).delete()
                  .then((value)
                  {
                    print(element.id + " Success!");
                    _showMyDialog();

                  });
        //print("ABOLI");
      });

      });


  }



void handleDropChange(String ?val)
  {
    setState(() {
      _chosenValue=val;
    });
  }

  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
  List<String> added = [];
  String currentText = "";
  TextEditingController type_of_gauge = TextEditingController();

  @override
  void initState() {
    super.initState();
    if(widget.identification_number != ''){
      type_of_gauge.text = widget.gauge_name_from_showgauge;
      manufacturer_serial_number.text = widget.manufacturer_number;
      identification_number.text = widget.identification_number;
      nominal_size.text = widget.nominal_size;
    }
    //type_of_gauge.text = "abc";
    //get_All_GuageTypes();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: backred,
          title: Text("Add Gauge To Scrap",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,

            ),
          ),
          centerTitle: true,
        ),

        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0,60.0,20.0,10.0),
            child: ListView(
              children: <Widget>[
                Column(
                  children:[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    Column(
                      children:<Widget> [
                        Container(
                          width: 0.3 * MediaQuery.of(context).size.width,
                          height:40.0,
                          child: Text("Manufacture Serial number ", style: TextStyle(color: Colors.black,fontSize: 23),
                            textAlign: TextAlign.center,  ),
                        ),
                        Container(
                          width: 0.3 * MediaQuery.of(context).size.width,
                          height:40.0,
                          child: TextField(decoration: InputDecoration(
                            enabled: widget.gauge_name_from_showgauge!=''? false: true,
                            hintText: "Enter Manufacture Serial number",
                            //labelText: " Manufacture Serial number",
                            border: OutlineInputBorder(),

                          ),
                          controller: manufacturer_serial_number,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 0.3 * MediaQuery.of(context).size.width,
                          height:40.0,
                          child: Text("Gauge Type", style: TextStyle(color: Colors.black,fontSize: 23),
                            textAlign: TextAlign.center,  ),
                        ),

                        Container(
                          color: Colors.white,
                          width: 0.3 * MediaQuery.of(context).size.width,
                          child: SimpleAutoCompleteTextField(
                            key: key,
                            controller: type_of_gauge,
                            clearOnSubmit: false,
                            //suggestions: gauge_type,
                            suggestions: widget.gauge_name,
                            style: const TextStyle(color: Colors.black, fontSize: 16.0),
                            decoration: InputDecoration(
                              enabled: widget.gauge_name_from_showgauge!=''? false: true,
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
                    // Container(
                    //   width: 300,
                    //   height: 40,
                    //   padding: EdgeInsets.fromLTRB(20,10,10,10),
                    //   decoration: BoxDecoration(
                    //       color: Colors.grey[100],
                    //       border: Border.all(color: Colors.black),
                    //       borderRadius: BorderRadius.all(Radius.circular(5))
                    //   ),
                    //
                    //   child: DropdownButtonHideUnderline(
                    //     child: DropdownButton<String>(
                    //       value: _chosenValue,
                    //       //elevation: 5,
                    //       style: TextStyle(color: Colors.black),
                    //
                    //       items: guageTypes.map<DropdownMenuItem<String>>((String value) {
                    //             return DropdownMenuItem<String>(
                    //               value: value,
                    //               child: Text(value),
                    //             );
                    //       }).toList(),
                    //       hint: Text(
                    //             "Select The Gauge Type",
                    //
                    //       ),
                    //
                    //       onChanged:handleDropChange,
                    //     ),
                    //   ),
                    // ),
                      ],
                    ),

                    Column(
                      children: [
                        Container(
                          width: 0.3 * MediaQuery.of(context).size.width,
                          height:40.0,


                          child : Text("Gauge/Instrument Identification No.",
                            style: TextStyle(color: Colors.black,fontSize: 23),
                            textAlign: TextAlign.center,
                          ),),
                        Container(
                          width: 0.3 * MediaQuery.of(context).size.width,
                          height:40.0,
                          child: TextField(
                            decoration: InputDecoration(
                              enabled: widget.gauge_name_from_showgauge!=''? false: true,
                              //labelText: ("Instrument Identification Number"),
                              hintText:  ("Enter Instrument Identification Number"),
                              border: OutlineInputBorder(),
                            ),
                            controller: identification_number,
                          ),
                        ),
                      ],
                    ),
                      ]
                ),
                    SizedBox(height: 40,),
                    Row(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Column(
                      children: [
                        Container(
                          width: 0.3 * MediaQuery.of(context).size.width,
                          height:40.0,


                          child : Text("Nominal Size",
                            style: TextStyle(color: Colors.black,fontSize: 23),
                            textAlign: TextAlign.center,
                          ),),
                        Container(
                          width: 0.3 * MediaQuery.of(context).size.width,
                          height:40.0,
                          child: TextField(
                            enabled: widget.gauge_name_from_showgauge!=''? false: true,
                            decoration: InputDecoration(
                              //labelText: ("Nominal Size "),
                              hintText:  ("ENTER Nominal Size "),
                              border: OutlineInputBorder(),
                            ),
                            controller: nominal_size,
                          ),
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        Container(
                          width: 0.3 * MediaQuery.of(context).size.width,
                          height:40.0,


                          child : Text("Reason",
                            style: TextStyle(color: Colors.black,fontSize: 23),
                            textAlign: TextAlign.center,
                          ),),

                        Container(
                          width: 0.3 * MediaQuery.of(context).size.width,
                          height:40.0,
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: ("Reason"),
                              hintText:  ("Enter Reason For adding the guage to Scrap."),
                              border: OutlineInputBorder(),
                            ),
                            controller: reason,
                          ),
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        Container(
                          width: 0.3 * MediaQuery.of(context).size.width,
                          height:40.0,


                          child : Text("Responsible Person For Scrap",
                            style: TextStyle(color: Colors.black,fontSize: 23),
                            textAlign: TextAlign.center,
                          ),),

                        Container(
                          width: 0.3 * MediaQuery.of(context).size.width,
                          height:40.0,
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: ("Resposible Person"),
                              hintText:  ("ENTER Responsible Person For Scrap"),
                              border: OutlineInputBorder(),
                            ),
                            controller: responsible_person,
                          ),
                        ),
                      ],
                    ),
                  ]
                ),
                    SizedBox(height: 40,),
                    Row(

                        mainAxisAlignment: MainAxisAlignment.start,
                      children:[
                    Column(
                      children: [
                        Container(
                          width: 0.3 * MediaQuery.of(context).size.width,
                          height:40.0,


                          child : Text("Scrap Note ID No",
                            style: TextStyle(color: Colors.black,fontSize: 23),
                            textAlign: TextAlign.center,
                          ),),

                        Container(
                          width: 0.3 * MediaQuery.of(context).size.width,
                          height:40.0,
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: ("Scrap Note ID No"),
                              hintText:  ("ENTER Scrap Note ID No"),
                              border: OutlineInputBorder(),
                            ),
                            controller: scrap_note_id_no,
                          ),
                        ),
                      ],
                    ),


                    Column(

                      children:<Widget> [
                        Container(
                          width: 0.3 * MediaQuery.of(context).size.width,
                          height:40.0,


                          child : Text("Scrap Date (DD.MM.YYYY)",
                            style: TextStyle(color: Colors.black,fontSize: 23),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        TestPickerWidget(selectedDate),
                      ],
                    ),
                    ]
                    ),
                    SizedBox(height: 90,),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(200.0,30.0,100.0,30.0),
                      child: Center(
                        child: Row(

                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 0.2 * MediaQuery.of(context).size.width,
                              height:40.0,
                              child: ElevatedButton.icon(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(backred),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                        side: BorderSide(color: backred)
                                    ),),
                                ),
                                onPressed: ()
                                {
                                    handleDelete();
                                    add_toScrap();
                                },
                                label: Text("Add To Scrap",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 24.0,
                                ),
                              ),
                            ),

                            SizedBox(width: 30,),

                            Container(
                              width: 0.2 * MediaQuery.of(context).size.width,
                              height:40.0,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(backred),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                        side: BorderSide(color: backred)
                                    ),),
                                ),
                                onPressed: (){},
                                child: Text("Reset",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],

                ),
            ],
            ),
          ),
        ),
          ),
        );


  }
}
