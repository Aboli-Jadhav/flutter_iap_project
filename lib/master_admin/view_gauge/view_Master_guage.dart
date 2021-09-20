import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'gauge_desc.dart';

class view_master_gau extends StatefulWidget {
  const view_master_gau({Key? key}) : super(key: key);

  @override
  _view_master_gauState createState() => _view_master_gauState();
}

class _view_master_gauState extends State<view_master_gau> {


  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Scaffold(


          body:ListView(
            padding: const EdgeInsets.all(40),
            children: <Widget>[
              Column(
                children: [
                  Row(
                    children:[
                      gauge_desc(),
                      SizedBox(width: 30,),
                      gauge_desc(),
                      SizedBox(width: 30,),
                      gauge_desc(),
                    ]
                  ),
                  SizedBox(height: 25,),
                  Row(
                    children:[
                      gauge_desc(),
                      SizedBox(width: 30,),
                      gauge_desc(),
                      SizedBox(width: 30,),
                      gauge_desc(),
                    ]
                  )
                ],
              )
            ],
          )
      ),
    );
  }
}