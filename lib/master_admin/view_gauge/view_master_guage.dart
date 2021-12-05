import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iap_project/Admin/view_gauge_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:editable/editable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_iap_project/Admin/showgauge.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' show Workbook, Worksheet, ExcelDataRow, ExcelDataCell;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:universal_html/html.dart' show AnchorElement;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:convert';

import '../showgauge_masteradmin.dart';

class view_master_gau extends StatefulWidget {
  final String selectedValue;
  final String selected_option;

  const view_master_gau(
      {Key? key, required this.selectedValue, required this.selected_option})
      : super(key: key);

  @override
  _view_master_gauState createState() => _view_master_gauState();
}

class _view_master_gauState extends State<view_master_gau> {
  Color backred = Color(0xffDF3F3F);
  Color lred = Color(0xffFBEBEB);
  String final_selectedValue = '';
  static List<ViewGaugeModel> fetched_list = [];

  // List<ExcelRow> itemList = [
  //   const ExcelRow(one: "1", two: "1", three: "1", four: "1", five: "1"),
  //   const ExcelRow(one: "1", two: "1", three: "1", four: "1", five: "1"),
  //   const ExcelRow(one: "1", two: "1", three: "1", four: "1", five: "1"),
  //   const ExcelRow(one: "1", two: "1", three: "1", four: "1", five: "1"),
  //   const ExcelRow(one: "1", two: "1", three: "1", four: "1", five: "1"),
  //   const ExcelRow(one: "1", two: "1", three: "1", four: "1", five: "1"),
  //   const ExcelRow(one: "1", two: "1", three: "1", four: "1", five: "1"),
  //   const ExcelRow(one: "1", two: "1", three: "1", four: "1", five: "1"),
  // ];

  int show = 0;

  void fetchData() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore
        .collection("Chakan")
        .doc("Gauges")
        .collection("All gauges")
        .where(widget.selectedValue, isEqualTo: widget.selected_option)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        querySnapshot.docs.forEach((doc) {
          ViewGaugeModel model = ViewGaugeModel(
              doc['calibration_agency_name'],
              doc['calibration_cost'],
              doc['calibration_date'],
              doc['calibration_due_date'],
              doc['calibration_frequency'],
              doc['gauge_cost'],
              doc['gauge_life'],
              doc['gauge_location'],
              doc['gauge_make'],
              doc['gauge_type'],
              doc['identification_number'],
              doc['invoice_date'],
              doc['invoice_number'],
              doc['item_code'],
              doc['manufacturer_serial_number'],
              doc['maximum'],
              doc['minimum'],
              doc['nominal_size'],
              doc['remark'],
              doc['plant'],
            doc['certificate_number'],
            doc['nabl_accrediation_status'],
            doc['process_owner'],
            doc['process_owner_mail_id'],
            doc['unit'],
            doc['acceptance_criteria'],
          );
          fetched_list.add(model);
        });
        setState(() {
          show = 1;
        });
        print("Fetched list: ${fetched_list[0].calibration_agency_name}");
      }else{
        setState(() {
          show=2;
        });
        print("view_master_gauge 86 : OOPS file doesn't exists");
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
  fetched_list = [];
    show = 0;
    Fluttertoast.showToast(
        msg: "${widget.selectedValue}\n${widget.selected_option}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    fetchData();
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
              "View Gauge",
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
                    one: "Gauge ID No.",
                    two: "Gauge Type",
                    three: "Gauge Size",
                    four: "Due Date",
                    five: "Location"),
              ),
              Container(
                height: 480,
                //color: Colors.blueGrey,
                child: show == 1
                    ? Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 30.0),
                  child: ListView.builder(
                    //shrinkWrap: true,
                    itemCount: fetched_list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ExcelRow(
                        // one:
                        //     fetched_list[index].identification_number,
                        // two: fetched_list[index].gauge_type,
                        // three: fetched_list[index].nominal_size,
                        // four:
                        //     fetched_list[index].calibration_due_date,
                        // five: fetched_list[index].gauge_location
                        model: fetched_list[index],
                      );
                    },
                  ),
                ): show==2 ? Center(child: Text("No such data"),): Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              SizedBox(height: 20,),
              Center(
                child:
                ElevatedButton(child: Text('Export To Excel'), onPressed: show==2? null: createExcel, style: ElevatedButton.styleFrom(primary: Colors.red),),
              ),
            ],
          )),
    );
  }

   doNotExport(){
    print('No data to export');
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


    for(int i=0;i<_view_master_gauState.fetched_list.length;i++){
      sheet.getRangeByName("A"+(i+2).toString()).setText(_view_master_gauState.fetched_list[i].identification_number);
      sheet.getRangeByName("B"+(i+2).toString()).setText(_view_master_gauState.fetched_list[i].gauge_type);
      sheet.getRangeByName("C"+(i+2).toString()).setText(_view_master_gauState.fetched_list[i].nominal_size);
      sheet.getRangeByName("D"+(i+2).toString()).setText(_view_master_gauState.fetched_list[i].calibration_due_date);
      sheet.getRangeByName("E"+(i+2).toString()).setText(_view_master_gauState.fetched_list[i].gauge_location);
      sheet.getRangeByName("F"+(i+2).toString()).setText(_view_master_gauState.fetched_list[i].calibration_agency_name);
      sheet.getRangeByName("G"+(i+2).toString()).setText(_view_master_gauState.fetched_list[i].calibration_cost);
      sheet.getRangeByName("H"+(i+2).toString()).setText(_view_master_gauState.fetched_list[i].calibration_date);
      sheet.getRangeByName("I"+(i+2).toString()).setText(_view_master_gauState.fetched_list[i].calibration_frequency);
      sheet.getRangeByName("J"+(i+2).toString()).setText(_view_master_gauState.fetched_list[i].gauge_cost);
      sheet.getRangeByName("K"+(i+2).toString()).setText(_view_master_gauState.fetched_list[i].gauge_life);
      sheet.getRangeByName("L"+(i+2).toString()).setText(_view_master_gauState.fetched_list[i].gauge_make);
      sheet.getRangeByName("M"+(i+2).toString()).setText(_view_master_gauState.fetched_list[i].invoice_date);
      sheet.getRangeByName("N"+(i+2).toString()).setText(_view_master_gauState.fetched_list[i].invoice_number);
      sheet.getRangeByName("O"+(i+2).toString()).setText(_view_master_gauState.fetched_list[i].item_code);
      sheet.getRangeByName("P"+(i+2).toString()).setText(_view_master_gauState.fetched_list[i].manufacturer_serial_number);
      sheet.getRangeByName("Q"+(i+2).toString()).setText(_view_master_gauState.fetched_list[i].maximum);
      sheet.getRangeByName("R"+(i+2).toString()).setText(_view_master_gauState.fetched_list[i].minimum);
      sheet.getRangeByName("S"+(i+2).toString()).setText(_view_master_gauState.fetched_list[i].remark);
      sheet.getRangeByName("T"+(i+2).toString()).setText(_view_master_gauState.fetched_list[i].plant);
      sheet.getRangeByName("U"+(i+2).toString()).setText(_view_master_gauState.fetched_list[i].certificate_number);
      sheet.getRangeByName("V"+(i+2).toString()).setText(_view_master_gauState.fetched_list[i].nabl_accrediation_status);
      sheet.getRangeByName("W"+(i+2).toString()).setText(_view_master_gauState.fetched_list[i].process_owner);
      sheet.getRangeByName("X"+(i+2).toString()).setText(_view_master_gauState.fetched_list[i].process_owner_mail_id);
      sheet.getRangeByName("Y"+(i+2).toString()).setText(_view_master_gauState.fetched_list[i].unit);
      sheet.getRangeByName("Z"+(i+2).toString()).setText(_view_master_gauState.fetched_list[i].acceptance_criteria);
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

  const ExcelRowHeading(
      {Key? key,
      @required this.one = "",
      @required this.two = "",
      @required this.three = "",
      @required this.four = "",
      @required this.five = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = 35;
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
  final ViewGaugeModel model;

  const ExcelRow(
      {Key? key,
      // required this.one,
      // required this.two,
      // required this.three,
      // required this.four,
      // required this.five
        required this.model
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = 35;
    Color color = Colors.black54;

    return Column(
      children: [
        Material(
            child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              //MaterialPageRoute(builder: (context) => ShowGauge(model: model)),
              MaterialPageRoute(builder: (context) => ShowGauge_MasterAdmin(model: model)),
            );
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
                  child: Center(child: Text(model.gauge_type)),
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
                  // width: 300,
                  height: height,
                  decoration: BoxDecoration(border: Border.all(color: color)),
                  child: Center(child: Text(model.calibration_due_date)),
                ),
              ),
              Expanded(
                child: Container(
                  // width: 300,
                  height: height,
                  decoration: BoxDecoration(border: Border.all(color: color)),
                  child: Center(child: Text(model.gauge_location)),
                ),
              ),
              // Material(
              // child: InkWell(
              // onTap: ()=> print('row opened'),
              // child: Container(
              // width: 50,
              // height: height,
              // decoration:
              // BoxDecoration(border: Border.all(color: color)),
              // child: const Center(child: Icon(Icons.open_in_new,size: 15.0,)),
              // ),
              // ),
              // ),
              // const SizedBox(
              //   width: 50.0,
              // ),
            ],
          ),
        )),
      ],
    );
  }

}




