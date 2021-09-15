import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'update_item.dart';

class edit_owner extends StatefulWidget {
  const edit_owner({Key? key}) : super(key: key);

  @override
  _edit_ownerState createState() => _edit_ownerState();
}

class _edit_ownerState extends State<edit_owner> {


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
            title: Text("Edit Owner",
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