import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Supplierdetailsselection extends StatefulWidget {


  _details createState()=> _details();

}

class _details extends State<Supplierdetailsselection>{
  Widget build(BuildContext context){
    return Scaffold(
       appBar: AppBar(
         title:  Text("Suppiler NABL STATUS ",style:  TextStyle(
           fontSize: 15,
           fontWeight: FontWeight.bold,
         ),),
       ) ,
       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,

           children: [
             ElevatedButton(onPressed: (){

             }, child: Text("Supplier Details ",), style: ElevatedButton.styleFrom(
               primary: Colors.red,
             ),
             ),

             SizedBox(height: 60,),

             ElevatedButton(onPressed: (){

             }, child: Text("Supplier NabL Status ",), style: ElevatedButton.styleFrom(
               primary: Colors.red,
             ),
             )
           ],

         ),
       ) ,


    );
  }

}