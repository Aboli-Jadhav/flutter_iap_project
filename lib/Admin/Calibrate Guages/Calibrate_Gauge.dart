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
        // appBar: AppBar(
        //   toolbarHeight: 50,
        //   backgroundColor: backred,
        //   title: Text("Update Gauge",
        //     style: TextStyle(
        //       color: Colors.white,
        //       fontSize: 30.0,
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        //   centerTitle: true,
        // ),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 40),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Gauge Type",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                    SizedBox(width: 100,),
                    Text("WPPL Identification Number",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                    SizedBox(width: 50,),
                    Text("Manufacturers Serial No",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                    SizedBox(width: 80,),
                    Text("Gauge Size",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),

                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropDown(),
                    SizedBox(width: 20,),
                    text_ed(),
                    SizedBox(width: 20,),
                    text_ed(),
                    SizedBox(width: 20,),
                    text_ed(),

                  ],
                ),
                SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Calibration Agency Name",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                    SizedBox(width: 100,),
                    Text("Caliberated DATE",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                    SizedBox(width: 130,),
                    Text("frequency",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                    SizedBox(width: 200,),
                    Text("Caliberation Due Date",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),

                  ],
                ),
                SizedBox(height: 10,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    text_ed(),
                    SizedBox(width: 20,),
                    TestPickerWidget(),
                    SizedBox(width: 20,),
                    text_ed(),
                    SizedBox(width: 20,),
                    TestPickerWidget(),

                  ],
                ),
                SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Certificate Number",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                    SizedBox(width: 150,),
                    Text("Calibration cost",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                    SizedBox(width: 150,),
                    Text("Remark",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                    SizedBox(width: 250,),
                    Text("Instrument Location",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),

                  ],
                ),
                SizedBox(height: 10,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    text_ed(),
                    SizedBox(width: 20,),
                    text_ed(),
                    SizedBox(width: 20,),
                    text_ed(),
                    SizedBox(width: 20,),
                    DropDown(),

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