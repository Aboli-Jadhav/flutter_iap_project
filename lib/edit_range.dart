import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'update_item.dart';

class edit_range extends StatefulWidget {
  const edit_range({Key? key}) : super(key: key);

  @override
  _edit_rangeState createState() => _edit_rangeState();
}

class _edit_rangeState extends State<edit_range> {


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
            title: Text("Edit Range",
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