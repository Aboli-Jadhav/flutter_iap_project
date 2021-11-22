import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ViewScopeOfSupplier.dart';

class viewScope extends StatefulWidget {
  final String scode;
  const viewScope({Key? key,required this.scode}) : super(key: key);

  @override
  _viewScopeState createState() => _viewScopeState();
}

class _viewScopeState extends State<viewScope> {


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
                  ViewScopeOfSupplier(supplier_code:widget.scode.toString())
                ],
              )
            ],
          )
      ),
    );
  }
}