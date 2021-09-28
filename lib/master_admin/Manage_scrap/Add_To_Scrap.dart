import 'package:flutter/material.dart';
import 'package:flutter_iap_project/date_picker.dart';

class AddToScrap extends StatefulWidget {
  const AddToScrap({Key? key}) : super(key: key);

  @override
  _AddToScrapState createState() => _AddToScrapState();
}

class _AddToScrapState extends State<AddToScrap> {
  DateTime selectedDate = DateTime.now();
  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);
  var _chosenValue;
  List<String> guageTypes=[
    ' DEPTH VERNIER CALLIPER',
    'ADJUSTABLE SNAP GAUGE ',
    'BEVEL  PROTRACTOR',
    'INSIDE DIAL CALLIPER ',
    'OD MASTER GAUGE',
    'THREAD RING GAUGE',
    'WIDTH GAUGE',

  ];

  void handleDropChange(String ?val)
  {
    setState(() {
      _chosenValue=val;
    });
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
                            hintText: "Enter Manufacture Serial number",
                            labelText: " Manufacture Serial number",
                            border: OutlineInputBorder(),

                          ),),
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
                      width: 300,
                      height: 40,
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

                          items: guageTypes.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                          }).toList(),
                          hint: Text(
                                "Select The Gauge Type",

                          ),

                          onChanged:handleDropChange,
                        ),
                      ),
                    ),
                      ],
                    ),

                    Column(
                      children: [
                        Container(
                          width: 0.3 * MediaQuery.of(context).size.width,
                          height:40.0,


                          child : Text("Instrument Identification NUMBER",
                            style: TextStyle(color: Colors.black,fontSize: 23),
                            textAlign: TextAlign.center,
                          ),),
                        Container(
                          width: 0.3 * MediaQuery.of(context).size.width,
                          height:40.0,
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: ("Instrument Identification NUMBER"),
                              hintText:  ("ENTER Instrument Identification NUMBER"),
                              border: OutlineInputBorder(),
                            ),
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
                            decoration: InputDecoration(
                              labelText: ("Nominal Size "),
                              hintText:  ("ENTER Nominal Size "),
                              border: OutlineInputBorder(),
                            ),
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
                          ),
                        ),
                      ],
                    ),


                    Column(

                      children:<Widget> [
                        Container(
                          width: 0.3 * MediaQuery.of(context).size.width,
                          height:40.0,


                          child : Text("Scrap Date",
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
                                onPressed: () {  },
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
                                onPressed: () {  },
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
