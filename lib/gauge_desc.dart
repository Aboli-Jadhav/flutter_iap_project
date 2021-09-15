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
          borderRadius: BorderRadius.circular(10),

        ),
        color: Colors.grey[300],
        elevation: 8.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(

              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              height: 170,
              width: 350,
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Gauge Number : WP36473647364",style: TextStyle(fontSize: 20),),
                SizedBox(height: 30,),
                Text("Due Date : 18/02/2021",style: TextStyle(fontSize: 20),),
                SizedBox(height: 30,),
                Text("Location : Workshop 2",style: TextStyle(fontSize: 20),),
              ],
              ),
          ),
        )
    );
  }
}
