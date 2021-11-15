import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iap_project/master_admin/Edit_Attribute/update_location.dart';
import 'update_frequency.dart';

class edit_loc extends StatefulWidget {
  const edit_loc({Key? key}) : super(key: key);

  @override
  _edit_locState createState() => _edit_locState();
}

class _edit_locState extends State<edit_loc> {


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
            title: Text("Edit Location",
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
                  update_location()
                ],
              )
            ],
          )
      ),
    );
  }
}