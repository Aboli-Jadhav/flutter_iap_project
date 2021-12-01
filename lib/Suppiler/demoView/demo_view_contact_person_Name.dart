import 'package:flutter/material.dart';
import 'package:flutter_iap_project/Suppiler/Edit_Contact_Person_Name.dart';
import 'package:flutter_iap_project/Suppiler/demoView/demo_Edit_Contact_Person_Name.dart';


class demoView_Contact_Person_Name extends StatefulWidget {
  final String scode;
  final String stype;
  const demoView_Contact_Person_Name({Key? key,required this.scode,required this.stype}) : super(key: key);

  @override
  _demoView_Contact_Person_NameState createState() => _demoView_Contact_Person_NameState();
}

class _demoView_Contact_Person_NameState extends State<demoView_Contact_Person_Name> {
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
            title: Text("Edit Contact Persons",
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
                  demoEdit_Contact_Person_Name(supplier_code:widget.scode.toString(), stype: widget.stype)
                ],
              )
            ],
          )
      ),
    );
  }
}
