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
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'dart:convert';

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

  void getIDOfType()
  {
    //List<String> Type_specific_IDs=[];

    var fstore=FirebaseFirestore.instance;
    fstore.collection("Chakan").doc("Scrap")
        .collection("all_scrap").get()
        .then((value)
    {
      if(value.docs.isNotEmpty)
      {
        value.docs.forEach((doc)
        {
          print(doc.data()['gauge_type'].toString() +"\t"+widget.guage_type.toString());
          if(doc.data()['gauge_type'].toString().trim() == widget.guage_type.toString().trim())
          {
            Type_specific_IDs.add(doc.id);
            print(doc.id);
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

  List<String> Type_specific_IDs=[];
  void fetchAll()
  {
    //List<String> Type_specific_IDs=getIDOfType();
    var fstore=FirebaseFirestore.instance;

    print("List="+Type_specific_IDs.length.toString());
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
                if(doc.data()['gauge_type'].toString().trim() == widget.guage_type.toString().trim())
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
    getIDOfType();
    //fetchAll(getIDOfType());
    //fetchAll();
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
              Center(
                child:
                ElevatedButton(child: Text('Export To Excel'), onPressed: createExcel, style: ElevatedButton.styleFrom(primary: Colors.red),),
              ),
            ],
          )),
    );
  }
  Future<void> createExcel() async {
    final Workbook workbook = Workbook();
    final Worksheet sheet = workbook.worksheets[0];
    sheet.getRangeByName('A1').setText('Gauge ID No.');
    sheet.getRangeByName('B1').setText('Gauge Type');
    sheet.getRangeByName('C1').setText('Gauge Size');
    sheet.getRangeByName('D1').setText('Due Date');
    sheet.getRangeByName('E1').setText('Location');
    sheet.getRangeByName('F1').setText('Calibration Agency Name');
    sheet.getRangeByName('G1').setText('Calibration Cost');
    sheet.getRangeByName('H1').setText('Calibration Date');
    sheet.getRangeByName('I1').setText('Calibration Frequency');
    sheet.getRangeByName('J1').setText('Gauge Cost');
    sheet.getRangeByName('K1').setText('Gauge Life');
    sheet.getRangeByName('L1').setText('Gauge Make');
    sheet.getRangeByName('M1').setText('Invoice Date');
    sheet.getRangeByName('N1').setText('Invoice Number');
    sheet.getRangeByName('O1').setText('Item Code');
    sheet.getRangeByName('P1').setText('Manufacturer Serial Number');
    sheet.getRangeByName('Q1').setText('Maximum');
    sheet.getRangeByName('R1').setText('Minimum');
    sheet.getRangeByName('S1').setText('Remark');
    sheet.getRangeByName('T1').setText('Plant');
    sheet.getRangeByName('U1').setText('Certificate Number');
    sheet.getRangeByName('V1').setText('NABL Accrediation Status');
    sheet.getRangeByName('W1').setText('Process Owner');
    sheet.getRangeByName('X1').setText('Process Owner Mail Id');
    sheet.getRangeByName('Y1').setText('Unit');
    sheet.getRangeByName('Z1').setText('Acceptance Criteria');
    sheet.getRangeByName('AA1').setText('Reason');
    sheet.getRangeByName('AB1').setText('Scrap Date');
    sheet.getRangeByName('AC1').setText('Scrap Id No.');
    sheet.getRangeByName('AD1').setText('Responsible Person');


    for(int i=0;i<fetchedlist.length;i++){
      sheet.getRangeByName("A"+(i+2).toString()).setText(fetchedlist[i].identification_number);
      sheet.getRangeByName("B"+(i+2).toString()).setText(fetchedlist[i].gauge_type);
      sheet.getRangeByName("C"+(i+2).toString()).setText(fetchedlist[i].nominal_size);
      sheet.getRangeByName("D"+(i+2).toString()).setText(fetchedlist[i].calibration_due_date);
      sheet.getRangeByName("E"+(i+2).toString()).setText(fetchedlist[i].gauge_location);
      sheet.getRangeByName("F"+(i+2).toString()).setText(fetchedlist[i].calibration_agency_name);
      sheet.getRangeByName("G"+(i+2).toString()).setText(fetchedlist[i].calibration_cost);
      sheet.getRangeByName("H"+(i+2).toString()).setText(fetchedlist[i].calibration_date);
      sheet.getRangeByName("I"+(i+2).toString()).setText(fetchedlist[i].calibration_frequency);
      sheet.getRangeByName("J"+(i+2).toString()).setText(fetchedlist[i].gauge_cost);
      sheet.getRangeByName("K"+(i+2).toString()).setText(fetchedlist[i].gauge_life);
      sheet.getRangeByName("L"+(i+2).toString()).setText(fetchedlist[i].gauge_make);
      sheet.getRangeByName("M"+(i+2).toString()).setText(fetchedlist[i].invoice_date);
      sheet.getRangeByName("N"+(i+2).toString()).setText(fetchedlist[i].invoice_number);
      sheet.getRangeByName("O"+(i+2).toString()).setText(fetchedlist[i].item_code);
      sheet.getRangeByName("P"+(i+2).toString()).setText(fetchedlist[i].manufacturer_serial_number);
      sheet.getRangeByName("Q"+(i+2).toString()).setText(fetchedlist[i].maximum);
      sheet.getRangeByName("R"+(i+2).toString()).setText(fetchedlist[i].minimum);
      sheet.getRangeByName("S"+(i+2).toString()).setText(fetchedlist[i].remark);
      sheet.getRangeByName("T"+(i+2).toString()).setText(fetchedlist[i].plant);
      sheet.getRangeByName("U"+(i+2).toString()).setText(fetchedlist[i].certificate_number);
      sheet.getRangeByName("V"+(i+2).toString()).setText(fetchedlist[i].nabl_accrediation_status);
      sheet.getRangeByName("W"+(i+2).toString()).setText(fetchedlist[i].process_owner);
      sheet.getRangeByName("X"+(i+2).toString()).setText(fetchedlist[i].process_owner_mail_id);
      sheet.getRangeByName("Y"+(i+2).toString()).setText(fetchedlist[i].unit);
      sheet.getRangeByName("Z"+(i+2).toString()).setText(fetchedlist[i].acceptance_criteria);
      sheet.getRangeByName("AA"+(i+2).toString()).setText(fetchedlist[i].reason);
      sheet.getRangeByName("AB"+(i+2).toString()).setText(fetchedlist[i].scrap_date);
      sheet.getRangeByName("AC"+(i+2).toString()).setText(fetchedlist[i].scrap_note_id_no);
      sheet.getRangeByName("AD"+(i+2).toString()).setText(fetchedlist[i].responsible_person);
    }

    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();

    if (kIsWeb) {
      AnchorElement(
          href:
          'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
        ..setAttribute('download', 'Output.xlsx')
        ..click();
    } else {
      final String path = (await getApplicationSupportDirectory()).path;
      final String fileName = Platform.isWindows ? '$path\\Output.xlsx' : '$path/Output.xlsx';
      final File file = File(fileName);
      await file.writeAsBytes(bytes, flush: true);
      OpenFile.open(fileName);
    }
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




