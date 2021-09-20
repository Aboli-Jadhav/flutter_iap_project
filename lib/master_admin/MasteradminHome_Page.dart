import 'package:flutter/material.dart';
import 'tab_header/tab.dart';

class master_adminHome_Page extends StatefulWidget {
  const master_adminHome_Page({Key? key}) : super(key: key);

  @override
  _master_adminHome_PageState createState() => _master_adminHome_PageState();
}

class _master_adminHome_PageState extends State<master_adminHome_Page> {

  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: backred,
          title: Text("Windals Precision Ltd.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,

            ),
          ),
          centerTitle: true,
        ),

        body:
        tab_head(),
      ),
    );
  }
}
