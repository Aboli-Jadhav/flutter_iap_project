import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Drop_Down.dart';

class search_gauge extends StatefulWidget{
       const search_gauge({Key? key}) : super (key: key);


       _SREACH_GAUGE createState() => _SREACH_GAUGE();

}


class _SREACH_GAUGE extends State<search_gauge>{
       Color backred=Color(0xffDF3F3F);
       Color lred=Color(0xffFBEBEB);
       Widget build(BuildContext context){
            return Container(
             child: Scaffold(
                 // appBar: AppBar(
                 //    toolbarHeight: 60.0,
                 //        backgroundColor: backred,
                 //        title: Text("Windal Precision Ltd",
                 //        style: TextStyle(
                 //               color: Colors.white,
                 //               fontSize: 50.0,
                 //               fontWeight: FontWeight.bold,
                 //        ),),
                 // ),
             body: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 0.3 * MediaQuery.of(context).size.width,
                        height:50.0,
                        child: Text("Manufacture Identification number ", style: TextStyle(color: Colors.black,fontSize: 23),
                          textAlign: TextAlign.center,  ),
                      ),
                      SizedBox(height:1.0,),
                      Container(
                        width: 0.3 * MediaQuery.of(context).size.width,
                        height:50.0,
                        child: TextField(decoration: InputDecoration(
                          hintText: "Enter Manufacture Identification number",
                          labelText: " Manufacture Identification number",
                          border: OutlineInputBorder(),

                        ),),
                      ),
                      SizedBox(height: 30.0,),
                      Container(
                        width: 0.3 * MediaQuery.of(context).size.width,
                        height:50.0,
                       child: Text("GAUGE TYPE", style: TextStyle(color: Colors.black,fontSize: 23),
                         textAlign: TextAlign.center,  ),
                      ),
                      SizedBox(height: 1.0,),
                      DropDown(),
                      SizedBox(height: 30,),
                      Container(
                        width: 0.3 * MediaQuery.of(context).size.width,
                        height:50.0,


                        child : Text("GAUGE NUMBER",
                          style: TextStyle(color: Colors.black,fontSize: 23),
                        textAlign: TextAlign.center,
                        ),),
                      Container(
                        width: 0.3 * MediaQuery.of(context).size.width,
                        height:50.0,
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: ("GAUGE NUMBER"),
                            hintText:  ("ENTER GAUGE NUMBER"),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      )

                    ],

             ),
             ),

            );
     }



}