import 'package:flutter/material.dart';
import 'package:flutter_iap_project/Suppiler/Edit_Contact_Person_Emails.dart';
import 'package:flutter_iap_project/Suppiler/ViewContactPersonName.dart';
import 'package:flutter_iap_project/Suppiler/View_Contact_Person_Phones.dart';

import 'View_Contact_Person_Emails.dart';

class Edit_Supplier_Contact_Details extends StatefulWidget {
  final String scode;
  const Edit_Supplier_Contact_Details({Key? key,required this.scode}) : super(key: key);

  @override
  _Edit_Supplier_Contact_DetailsState createState() => _Edit_Supplier_Contact_DetailsState();
}

class _Edit_Supplier_Contact_DetailsState extends State<Edit_Supplier_Contact_Details> {
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
                  TextButton(
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => new View_Contact_Person_Emails(scode: widget.scode,)
                          ));

                    },
                    child:Text("Edit Contact Emails",
                      style: TextStyle(
                        fontSize: 20,fontWeight:FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 300,),
                  TextButton(
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => new View_Contact_Person_Name(scode: widget.scode)
                          ));

                    },
                    child:Text("Edit Supplier Contact Names",
                      style: TextStyle(
                        fontSize: 20,fontWeight:FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 300,),
                  TextButton(
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => new View_Contact_Person_Phones(scode:widget.scode)
                          ));

                    },
                    child:Text("Edit Supplier Contact Mobile NO",
                      style: TextStyle(
                        fontSize: 20,fontWeight:FontWeight.bold,
                      ),
                    ),
                  ),
                  //ViewScopeOfSupplier(supplier_code:widget.scode.toString())
                ],
              )
            ],
          )
      ),
    );
  }
}
