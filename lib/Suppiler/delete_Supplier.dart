import 'package:flutter/material.dart';
import 'package:flutter_iap_project/Suppiler/delete_Supplier_fetch_rows.dart';

class deleteSupplier extends StatefulWidget {
  const deleteSupplier({Key? key}) : super(key: key);

  @override
  _deleteSupplierState createState() => _deleteSupplierState();
}

class _deleteSupplierState extends State<deleteSupplier> {
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
            title: Text("Delete Supplier",
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
                  delete_Supplier_Rows()
                ],
              )
            ],
          )
      ),
    );
  }
}
