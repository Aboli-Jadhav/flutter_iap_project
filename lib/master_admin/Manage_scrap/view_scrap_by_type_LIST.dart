import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' show Workbook, Worksheet, ExcelDataRow, ExcelDataCell;
import 'package:universal_html/html.dart' show AnchorElement;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'ScrapDataModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class view_Scrap_by_type_LIST extends StatefulWidget {

  final String guage_type;
  const view_Scrap_by_type_LIST({Key? key,required this.guage_type}) : super(key: key);

  @override
  _view_Scrap_by_type_LISTState createState() => _view_Scrap_by_type_LISTState();
}

class _view_Scrap_by_type_LISTState extends State<view_Scrap_by_type_LIST> {
  Color backred = Color(0xffDF3F3F);
  Color lred = Color(0xffFBEBEB);

  List<ScrapDataModel> fetchedlist=[];

  _showMyDialog(String title,String str) async {
    //BuildContext context;
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: lred,
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(str),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  int show=1;
  List<String> Type_specific_IDs=[];

  void getIDOfType()
  {
    var fstore=FirebaseFirestore.instance;
    fstore.collection("Chakan").doc("Scrap")
        .collection("all_scrap").get()
        .then((value)
    {
      if(value.docs.isNotEmpty)
      {
        value.docs.forEach((doc)
        {
          print(doc.id.toString());
          if(doc.data()['gauge_type'].toString() == widget.guage_type)
            {
              Type_specific_IDs.add(doc.id);
            }
        });
        //print("Fetched list: ${fetchedlist[0].identification_number}");
      }
      else
      {
        // setState(() {
        //   show=1;
        // });
        print("view_supplier_datage 84 : OOPS file doesn't exists");
      }
    }).then((value) => fetchAll());
  }

  void fetchAll()
  {
    var fstore=FirebaseFirestore.instance;

      if(Type_specific_IDs.isEmpty)
      {
          _showMyDialog("Problem", "No Data Available");
          show=1;
      }
      else
        {
          fstore.collection("Chakan").doc("Scrap")
              .collection("all_scrap").get()
              .then((value)
          {
            if(value.docs.isNotEmpty)
            {
              value.docs.forEach((doc)
              {
                print(doc.id.toString());
                if(doc.data()['gauge_type'].toString() == widget.guage_type)
                {
                  ScrapDataModel model=ScrapDataModel(
                      doc['item_code'],
                      doc['invoice_date'],
                      doc['invoice_number'],
                      doc['identification_number'],
                      doc['gauge_type'],
                      doc['gauge_make'],
                      doc['manufacturer_serial_number'],
                      doc['maximum'],
                      doc['minimum'],
                      doc['nabl_accrediation_status'],
                      doc['nominal_size'],
                      doc['plant'],
                      doc['process_owner'],
                      doc['process_owner_mail_id'],
                      doc['reason'],
                      doc['remark'],
                      doc['responsible_person'],
                      doc['scrap_date'],
                      doc['scrap_note_id_no'],
                      doc['unit'],
                      doc['gauge_location'],
                      doc['gauge_life'],
                      doc['gauge_cost'],
                      doc['certificate_number'],
                      doc['calibration_frequency'],
                      doc['calibration_due_date'],
                      doc['calibration_date'],
                      doc['calibration_cost'],
                      doc['calibration_agency_name'],
                      doc['acceptance_criteria']
                  );
                  fetchedlist.add(model);
                  show++;
                }
              });
              setState(() {
                //show = 2;
              });
              print("Fetched list: ${fetchedlist[0].identification_number}");
            }
            else
            {
              setState(() {
                show=1;
              });
              print("view_supplier_datage 86 : OOPS file doesn't exists");
            }
          });
        }


  }


  @override
  void initState() {
    // TODO: implement initState
    show = 1;
    //getIDOfType();
    getIDOfType();
    Fluttertoast.showToast(
        msg: "View Scrap",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    setState(() {

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 50,
            backgroundColor: backred,
            title: Text(
              "View Scrap2",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(50.0, 30, 50, 15),
                child: ExcelRowHeading(
                    one: "Gauge Identification Number",
                    two: "Nominal Size",
                    three: "Reason For Scrap",
                    four : "Responsible Person",
                    five : "Scrap Note ID No",
                    six :"Scrap Date",
                ),
              ),
              Container(
                height: 480,
                //color: Colors.blueGrey,
                child: show != 1
                    ? Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 30.0),
                  child: ListView.builder(
                    //shrinkWrap: true,
                    itemCount: fetchedlist.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ExcelRow(
                          model: fetchedlist[index]

                      );
                    },
                  ),
                ): show==1 ? Center(child: Text("No such data"),): Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              SizedBox(height: 10,),
              // Center(
              //   child:
              //   ElevatedButton(child: Text('Export To Excel'), onPressed: show==2? null: createExcel, style: ElevatedButton.styleFrom(primary: Colors.red),),
              // ),
            ],
          )),
    );
  }

}


class ExcelRowHeading extends StatelessWidget {
  final String one;
  final String two;
  final String three;
  final String four;
  final String five;
  final String six;

  const ExcelRowHeading(
      {Key? key,
        @required this.one = "",
        @required this.two = "",
        @required this.three = "",
        @required this.four = "",
        @required this.five = "",
        @required this.six = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = 15;
    Color color = Colors.black54;

    return Material(
        child: InkWell(
          onTap: () => print('whole row clicked'),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const SizedBox(
              //   width: 50.0,
              // ),
              Expanded(
                child: Center(
                  child: Text(
                    one,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                    child: Text(
                      two,
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
                    )),
              ),
              Expanded(
                child: Center(
                    child: Text(
                      three,
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
                    )),
              ),
              Expanded(
                child: Center(
                    child: Text(
                      four,
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
                    )),
              ),
              Expanded(
                child: Center(
                    child: Text(
                      five,
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
                    )),
              ),
              Expanded(
                child: Center(
                    child: Text(
                      six,
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
                    )),
              ),

              // const SizedBox(
              //   width: 50.0,
              // ),
            ],
          ),
        ));
  }
}

class ExcelRow extends StatelessWidget {
  // final String one;
  // final String two;
  // final String three;
  // final String four;
  // final String five;
  final ScrapDataModel model;

  const ExcelRow(
      {Key? key,
        required this.model,
      })
      : super(key: key);


  Future<void> _showMyDialog(String title,String str,BuildContext context) async {
    //BuildContext context;
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          //backgroundColor: lred,
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(str),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = 35;
    Color color = Colors.black54;

    return Column(
      children: [
        Material(
            child: InkWell(
              onTap: () {
                // Navigator.pop(context);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Edit_For_ViewAll(scopedatamodel: model.scopeList, supplierModel: model)),
                // );
                print("ROWWWWWWWWW");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // const SizedBox(
                  //   width: 50.0,
                  // ),
                  Expanded(
                    child: Container(
                      //width: 300,
                      height: height,
                      decoration: BoxDecoration(border: Border.all(color: color)),
                      child: Center(child: Text(model.identification_number)),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      //width: 300,
                      height: height,
                      decoration: BoxDecoration(border: Border.all(color: color)),
                      child: Center(child: Text(model.nominal_size)),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      //width: 300,
                      height: height,
                      decoration: BoxDecoration(border: Border.all(color: color)),
                      child: Center(child: Text(model.reason)),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      //width: 300,
                      height: height,
                      decoration: BoxDecoration(border: Border.all(color: color)),
                      child: Center(child: Text(model.responsible_person)),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      // width: 300,
                      height: height,
                      decoration: BoxDecoration(border: Border.all(color: color)),
                      child: Center(child: Text(model.scrap_note_id_no)),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      //width: 300,
                      height: height,
                      decoration: BoxDecoration(border: Border.all(color: color)),
                      child: Center(child: Text(model.scrap_date)),
                    ),
                  ),                ],
              ),
            )),
      ],
    );
  }

}




