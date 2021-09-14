import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iap_project/Drop_Down.dart';
import 'package:flutter_iap_project/Text_editor.dart';
import 'package:flutter_iap_project/date_picker.dart';

class Calibrate_Gauge extends StatefulWidget{
  const Calibrate_Gauge({Key? key}) : super(key: key);

  _calibrate_gauge createState()=> _calibrate_gauge();
}

class _calibrate_gauge extends State<Calibrate_Gauge>{
  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);
  Widget build(BuildContext context){
    return Container(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: backred,
          title: Text("Update Gauge",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(40),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Text("Gauge Type",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                     SizedBox(height: 30,),
                     DropDown(),
                     SizedBox(height: 50,),
                     Text("WPPL Identification Number",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                     SizedBox(height: 30,),
                     text_ed(),
                     SizedBox(height: 50,),
                     Text("Manufacturers Serial No",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                     SizedBox(height: 30,),
                     text_ed(),
                     SizedBox(height: 50,),
                     Text("Gauge Size",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                     SizedBox(height: 30,),
                     text_ed(),
                     SizedBox(height: 50,),
                     Text("Calibration Agency Name",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                     SizedBox(height: 30,),
                     text_ed(),
                     SizedBox(height: 50,),
                     Text("Caliberated DATE",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                     SizedBox(height: 30,),
                     TestPickerWidget(),
                     SizedBox(height: 50,),
                     Text("frequency",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                     SizedBox(height: 30,),
                     text_ed(),
                     SizedBox(height: 50,),
                     Text("Caliberation Due Date",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                     SizedBox(height: 30,),
                     TestPickerWidget(),
                     SizedBox(height: 50,),
                     Text("Certificate Number",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                     SizedBox(height: 30,),
                     text_ed(),
                     SizedBox(height: 50,),
                     Text("Calibration cost",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                     SizedBox(height: 30,),
                     text_ed(),
                     SizedBox(height: 50,),
                     Text("Remark",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                     SizedBox(height: 30,),
                     text_ed(),
                     Text("Instrument Location",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                     SizedBox(height: 30,),
                     DropDown(),
                     SizedBox(height: 50,),


                   ],
                 ),






               ],
            )

          ],
        ),



      ) ,
    );
  }
}