import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iap_project/Suppiler/Edit_Contact_Person_Emails.dart';
import 'package:flutter_iap_project/Suppiler/Edit_Contact_Person_Phone.dart';


class View_Contact_Person_Phones extends StatefulWidget {
  final String scode;
  const View_Contact_Person_Phones({Key? key,required this.scode}) : super(key: key);

  @override
  _View_Contact_Person_PhonesState createState() => _View_Contact_Person_PhonesState();
}

class _View_Contact_Person_PhonesState extends State<View_Contact_Person_Phones> {


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
            title: Text("Edit Contact Phones",
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
                  Edit_Contact_Person_Phones(supplier_code:widget.scode.toString())
                ],
              )
            ],
          )
      ),
    );
  }
}