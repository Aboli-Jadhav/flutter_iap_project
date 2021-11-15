import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'update_frequency.dart';

class edit_freq extends StatefulWidget {
  const edit_freq({Key? key}) : super(key: key);

  @override
  _edit_freqState createState() => _edit_freqState();
}

class _edit_freqState extends State<edit_freq> {


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
            title: Text("Edit Frequency",
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