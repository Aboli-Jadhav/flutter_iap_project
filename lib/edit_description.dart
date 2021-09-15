import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'update_item.dart';

class edit_descr extends StatefulWidget {
  const edit_descr({Key? key}) : super(key: key);

  @override
  _edit_descrState createState() => _edit_descrState();
}

class _edit_descrState extends State<edit_descr> {


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
            title: Text("Edit Gauge Description",
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
                  update_item()
                ],
              )
            ],
          )
      ),
    );
  }
}