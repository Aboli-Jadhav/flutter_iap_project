import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iap_project/Suppiler/demoView/demo_Edit_Contact_Person_Emails.dart';


class demo_View_Contact_Person_Emails extends StatefulWidget {
  final String scode;
  final String stype;
  final String sname;
  const demo_View_Contact_Person_Emails({Key? key,required this.scode,required this.stype,required this.sname}) : super(key: key);

  @override
  _demo_View_Contact_Person_EmailsState createState() => _demo_View_Contact_Person_EmailsState();
}

class _demo_View_Contact_Person_EmailsState extends State<demo_View_Contact_Person_Emails> {


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
            title: Text("Edit Contact Person's Emails",
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
                  demo_Edit_Contact_Person_Emails(supplier_code:widget.scode.toString(), stype: widget.stype, sname:widget.sname ,)
                ],
              )
            ],
          )
      ),
    );
  }
}