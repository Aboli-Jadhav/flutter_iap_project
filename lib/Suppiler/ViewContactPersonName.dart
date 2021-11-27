import 'package:flutter/material.dart';
import 'package:flutter_iap_project/Suppiler/Edit_Contact_Person_Name.dart';


class View_Contact_Person_Name extends StatefulWidget {
  final String scode;
  const View_Contact_Person_Name({Key? key,required this.scode}) : super(key: key);

  @override
  _View_Contact_Person_NameState createState() => _View_Contact_Person_NameState();
}

class _View_Contact_Person_NameState extends State<View_Contact_Person_Name> {
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
                  Edit_Contact_Person_Name(supplier_code:widget.scode.toString())
                ],
              )
            ],
          )
      ),
    );
  }
}
