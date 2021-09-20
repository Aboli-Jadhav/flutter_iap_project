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


  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);

  @override
  Widget build(BuildContext context) {

    String? _chosenValue;
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
            padding: const EdgeInsets.all(40),
            children: <Widget>[
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [

                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Gauge Description",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                          SizedBox(height: 30,),
                          DropDown(),
                          SizedBox(height: 50,),
                          Text("Gauge Number",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                          SizedBox(height: 30,),
                          text_ed(),
                          SizedBox(height: 50,),
                          Text("Gauge Type",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                          SizedBox(height: 30,),
                          DropDown(),
                          SizedBox(height: 50,),
                          Text("Issued Date",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                          SizedBox(height: 30,),
                          TestPickerWidget(),
                          SizedBox(height: 50,),
                          Text("Caliberation Due Date",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                          SizedBox(height: 30,),
                          TestPickerWidget(),
                          SizedBox(height: 50,),
                          Text("Certificate Number",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                          SizedBox(height: 30,),
                          text_ed(),
                          SizedBox(height: 50,),
                          Text("Location Owner",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                          SizedBox(height: 30,),
                          DropDown(),

                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Identification Number",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                          SizedBox(height: 30,),
                          text_ed(),
                          SizedBox(height: 50,),
                          Text("Gauge Size",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                          SizedBox(height: 10,),
                          Text("GO Size",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                          SizedBox(height: 10,),
                          text_ed(),
                          SizedBox(height: 10,),
                          Text("NO GO Size",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                          text_ed(),
                          SizedBox(height: 50,),
                          Text("Frequency",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                          SizedBox(height: 30,),
                          text_ed(),
                          SizedBox(height: 50,),
                          Text("Caliberated On",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                          SizedBox(height: 30,),
                          TestPickerWidget(),
                          SizedBox(height: 50,),
                          Text("Caliberation Done By",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                          SizedBox(height: 30,),
                          DropDown(),
                          SizedBox(height: 50,),
                          Text("Location",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                          SizedBox(height: 30,),
                          DropDown(),
                          SizedBox(height: 50,),
                          Text("Remark",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                          SizedBox(height: 30,),
                          text_ed(),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 70,),
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