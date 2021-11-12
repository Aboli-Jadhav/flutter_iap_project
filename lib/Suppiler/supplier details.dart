import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class suppilerdetails extends StatefulWidget{

  _detailsofsupplier createState()=>  _detailsofsupplier();
}

class _detailsofsupplier extends State<suppilerdetails>{

  Widget build(BuildContext context)
  {
   return Scaffold(
     appBar: AppBar(
       title: Text("SUPPLIER DETAILS ",style: TextStyle( fontWeight: FontWeight.bold  ),),
     ) ,

      body: Center(
          child: Column(
            mainAxisAlignment:  MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [


              Container(
                child: Text(" SUPPLIER ADDRESS",style: TextStyle(fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 10,),
              Container(
                child: Text(" SUPPLIER CODE",style: TextStyle(fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 10,),
              Container(
                child: Text(" SUPPLIER CONTACT PERSON NAME & MAIL ID",style: TextStyle(fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 10,),
              Container(
                child: Text(" SUPPLIER CONTACT NUMBER",style: TextStyle(fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 10,),


            ],
          ),


      ),
   );


  }

}