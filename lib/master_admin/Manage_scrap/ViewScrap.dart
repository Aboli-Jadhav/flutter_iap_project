import 'package:flutter/material.dart';

// Not sure about this.
//This class is for viewing the scrap by guage type.
//When user selects the guage type and clicks the button we can generate a excel containing all scraps with the given guage type.
class ViewScrapOfGuageType extends StatefulWidget {
  const ViewScrapOfGuageType({Key? key}) : super(key: key);

  @override
  _ViewScrapOfGuageTypeState createState() => _ViewScrapOfGuageTypeState();
}

class _ViewScrapOfGuageTypeState extends State<ViewScrapOfGuageType> {

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
        title: Text("Manage Scrap",
        style: TextStyle(
        color: Colors.white,
        fontSize: 30.0,
        fontWeight: FontWeight.bold,

    ),
    ),
    centerTitle: true,
    ),

          body:Center(
            child: Container(
              //padding: EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 0.3*MediaQuery.of(context).size.width,
                    height: 50,
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

                  SizedBox(height: 30,),

                  Container(
                    width: 0.2 * MediaQuery.of(context).size.width,
                    height:50.0,
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
                      child: Text("View Scrap",
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
          )
    ),
    );
  }
}
