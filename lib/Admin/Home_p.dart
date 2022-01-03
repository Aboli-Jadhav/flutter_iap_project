import 'package:flutter/material.dart';
import 'package:flutter_iap_project/Admin/tab_header/admintab.dart';

class home_p extends StatefulWidget {
  const home_p({Key? key}) : super(key: key);

  @override
  _home_pState createState() => _home_pState();
}

class _home_pState extends State<home_p> {

  Color backred=Color(0xffdf3f3f);
  Color lred=Color(0xffFBEBEB);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 30,
          backgroundColor: backred,
          title: Text("Windals Precision Pvt Ltd.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,

            ),
          ),
          centerTitle: true,
        ),

       // body: admin_tab_head(),

      ),
    );
  }
}