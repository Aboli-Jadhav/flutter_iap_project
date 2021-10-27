import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class gauge_desc extends StatefulWidget {
  @override
  _gauge_descState createState() => _gauge_descState();
}

class _gauge_descState extends State<gauge_desc> {
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.red, width: 0.5),
          borderRadius: BorderRadius.circular(8),

        ),
        color: Colors.grey[300],
        elevation: 8.0,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(

              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              height: 170,
              width: 280,
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Gauge ID No. : WP36473647364",style: TextStyle(fontSize: 15),),
                SizedBox(height: 12,),
                Text("Gauge Type : Type A",style: TextStyle(fontSize: 15),),
                SizedBox(height: 12,),
                Text("Gauge Size : 3",style: TextStyle(fontSize: 15),),
                SizedBox(height: 12,),
                Text("Due Date : 01/01/2021",style: TextStyle(fontSize: 15),),
                SizedBox(height: 12,),
                Text("Location : Pune",style: TextStyle(fontSize: 15),),
              ],
              ),
          ),
        )
    );
  }
}
