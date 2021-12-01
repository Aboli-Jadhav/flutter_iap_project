import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'demoViewScopeOfSupplier.dart';


class demoviewScope extends StatefulWidget {
  final String scode;
  final String stype;
  const demoviewScope({Key? key,required this.scode,required this.stype}) : super(key: key);

  @override
  _demoviewScopeState createState() => _demoviewScopeState();
}

class _demoviewScopeState extends State<demoviewScope> {


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
            title: Text("Edit Scope",
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
                  demoViewScopeOfSupplier(supplier_code:widget.scode, stype: widget.stype,)
                ],
              )
            ],
          )
      ),
    );
  }
}