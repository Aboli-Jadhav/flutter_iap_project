import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iap_project/master_admin/Edit_Attribute/update_gauge_type.dart';
import 'update_frequency.dart';

class edit_type extends StatefulWidget {
  const edit_type({Key? key}) : super(key: key);

  @override
  _edit_typeState createState() => _edit_typeState();
}

class _edit_typeState extends State<edit_type> {


  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);

  @override
  Widget build(BuildContext context) {

    String? _chosenValue;
    return Container(
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 50,
            backgroundColor: backred,
            title: Text("Edit Gauge Type",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,

              ),
            ),
            centerTitle: true,
          ),

          body:ListView(
            padding: const EdgeInsets.all(40),
            children: <Widget>[
              Column(
                children: [
                  update_gauge_type()
                ],
              )
            ],
          )
      ),
    );
  }
}