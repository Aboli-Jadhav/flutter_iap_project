import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Drop_Down.dart';
import 'package:flutter_iap_project/Text_editor.dart';
import '../../date_picker.dart';

class add_Gauge extends StatefulWidget {
  const add_Gauge({Key? key}) : super(key: key);

  @override
  _add_GaugeState createState() => _add_GaugeState();
}

class _add_GaugeState extends State<add_Gauge> {

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
                              text_ed(),
                              SizedBox(width: 30,),
                              DropDown(),
                              SizedBox(width: 30,),
                              text_ed(),
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
                              TestPickerWidget(),
                              SizedBox(width: 20,),
                              TestPickerWidget(),
                              SizedBox(width: 20,),
                              text_ed(),
                              SizedBox(width: 20,),
                              DropDown(),
                            ],
                          ),

                          SizedBox(height: 20,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Gauge Size",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                              SizedBox(width: 220,),
                              Text('$_chosenValue',style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                              SizedBox(width: 290,),
                              Text("Frequency",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                              SizedBox(width: 230,),
                              Text("Caliberated On",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),

                            ],

                          ),
                          SizedBox(height: 10,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              createSizes(),
                              SizedBox(width: 30,),
                              text_ed(),
                              SizedBox(width: 30,),
                              text_ed(),
                              SizedBox(width: 30,),
                              TestPickerWidget(),

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
                              DropDown(),
                              SizedBox(width: 30,),
                              text_ed(),
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