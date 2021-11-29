import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iap_project/Admin/view_gauge_model.dart';
import 'package:flutter_iap_project/Suppiler/ViewData/View_Supplier_data_Model.dart';
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

class view_supplier_data extends StatefulWidget {
  final String selectedValue;
  final String selected_option;

  const view_supplier_data(
      {Key? key, required this.selectedValue, required this.selected_option})
      : super(key: key);

  @override
  _view_supplier_dataState createState() => _view_supplier_dataState();
}

class _view_supplier_dataState extends State<view_supplier_data> {
  Color backred = Color(0xffDF3F3F);
  Color lred = Color(0xffFBEBEB);
  String final_selectedValue = '';
  static List<View_supplier_data_model> fetched_list = [];
  List<String> scopeList = [];
  List<String> ContactNm_List = [];
  List<String> ContactMail_List = [];
  List<String> ContactMob_List = [];
  FirebaseFirestore fstore=FirebaseFirestore.instance;


  int show = 0;

  void getMails(String RecId) async {
    await FirebaseFirestore.instance.collection("Chakan").doc("Supplier").collection(
        "all_")
        .doc(RecId).collection("Contact_Emails").get().then((value)
    {
      if(value.docs.isNotEmpty)
        {
          value.docs.forEach((element)
          {
            element.data().entries.forEach((ele) {
              ContactMail_List.add(ele.value);
              print(ele.value);
            });
          });
          setState(()
          {
          });
        }
      else{
        print("EMPTY");
      }

    }
    ).onError((error, stackTrace) {print("ERROR");});
    print(ContactMail_List);
  }

  void getNames(String RecId) async {
    print("Get Names Called");
   await  FirebaseFirestore.instance.collection("Chakan").doc("Supplier").collection(
        "all_")
        .doc(RecId).collection("Contact_Name").get().then((value)
    {
      print("ValSize"+value.size.toString());
      if(value.docs.isNotEmpty)
      {
        value.docs.forEach((element)
        {
          print(element.data());
          element.data().entries.forEach((ele) {
            ContactNm_List.add(ele.value);
            print("NM"+ele.value);
          });
        });
        setState(() {

        });
      }
      else
        {
          print("EMPTY");

        }

    }
    );
    print(ContactNm_List);
  }

  void getPhones(String RecId) async {
   await  FirebaseFirestore.instance.collection("Chakan").doc("Supplier").collection(
        "all_")
        .doc(RecId).collection("Contact_Phone").get().then((value)
    {
      value.docs.forEach((element)
      {
        element.data().entries.forEach((ele) {
          ContactMob_List.add(ele.value);
          print(ele.value);
        });
      });
      setState(() {

      });
    }
    );
    print(ContactMob_List);
  }

  void getScopes(String RecId) async {
    await FirebaseFirestore.instance.collection("Chakan").doc("Supplier").collection(
        "all_")
        .doc(RecId).collection("Scope").get().then((value)
    {
      print("First"+value.docs.first.id);
      value.docs.forEach((element)
      {
        element.data().entries.forEach((ele) {
          scopeList.add(ele.value);
          print(ele.value);
        });
      });
      setState(() {

      });
    }
    );
    print(scopeList);
  }

  dynamic getAll(String id)
   {
    getScopes(id);
    getNames(id);
    getPhones(id);
    getMails(id);
    print("GET ALL ENDED");
  }

  void fetch() {
    FirebaseFirestore.instance
        .collection("Chakan")
        .doc("Supplier")
        .collection("all_").get().then((value)
    {
      if(value.docs.isNotEmpty)
        {
          value.docs.forEach((element)
          {
            var fdb=fstore
                .collection("Chakan")
                .doc("Supplier")
                .collection("all_")
                .doc(element.id)
                .get();
            FirebaseFirestore.instance
                .collection("Chakan")
                .doc("Supplier")
                .collection("all_")
                .doc(element.id)
                .collection(widget.selectedValue)
                .where("name", isEqualTo: widget.selected_option)
                .get()
                .then((querySnapshot) async {
              print("SIZE"+querySnapshot.size.toString()+element.id);
              if (querySnapshot.docs.isNotEmpty)
              {
                print("HIIII"+element.id); await getAll(element.id);
                // querySnapshot.docs.forEach((doc)
                // async {
                fdb.then((doc)
                {
                  View_supplier_data_model model=View_supplier_data_model(
                      doc['agencyCode'],
                      doc['NABL_certificate_No'],
                      doc['agencyAddress'],
                      doc['agencyName'],
                      doc['NABL_Cert_Due_Date'],
                      doc['NABL_Cert_Date'],
                      doc['NABL_Lab_Scope_Download_Link'],
                      doc['NABL_Certificate_Download_Link'],
                      doc['NABL_Lab_Scope_FileName'],
                      doc['NABL_Certificate_FileName'],
                      doc['agencytype'],
                      scopeList,ContactMob_List,ContactNm_List,
                      ContactMail_List
                  );
                  fetched_list.add(model);print("MODEL"+model.snm);
                });

                // });
                setState(() {
                  show = 1;
                });
                print("Fetched list: ${fetched_list[0].scode}");

              }
              else{
                setState(() {
                  if(fetched_list.length==0)
                    {
                      show=2;
                    }
                  else
                    {
                      show=1;
                    }

                });
                print("view_supplier_datage 86 : OOPS file doesn't exists");
              }
            });

          });
        }
      else
        {
          setState(() {
            show=2;
          });
          print("view_supplier_datage 85 : OOPS file doesn't exists");
        }

    });

  }


  void fetchData() {
    print(widget.selectedValue+" "+widget.selected_option);

    if(widget.selectedValue =="Contact_Name"||widget.selectedValue =="Contact_Emails"||
        widget.selectedValue =="Contact_Phone"||widget.selectedValue =="Scope")
      {
        print("FETCH");
            fetch();
      }
    else
      {
        FirebaseFirestore firestore = FirebaseFirestore.instance;
        firestore
            .collection("Chakan")
            .doc("Supplier")
            .collection("all_")
            .where(widget.selectedValue, isEqualTo: widget.selected_option)
            .get()
            .then((QuerySnapshot querySnapshot) {
          if (querySnapshot.docs.isNotEmpty) {
            querySnapshot.docs.forEach((doc) {
              getAll(doc.id);
              View_supplier_data_model model=View_supplier_data_model(
                  doc['agencyCode'],
                  doc['NABL_certificate_No'],
                  doc['agencyAddress'],
                  doc['agencyName'],
                  doc['NABL_Cert_Due_Date'],
                  doc['NABL_Cert_Date'],
                  doc['NABL_Lab_Scope_Download_Link'],
                  doc['NABL_Certificate_Download_Link'],
                  doc['NABL_Lab_Scope_FileName'],
                  doc['NABL_Certificate_FileName'],
                  doc['agencytype'],
                  scopeList,ContactMob_List,ContactNm_List,
                  ContactMail_List
              );

              fetched_list.add(model);
            });
            setState(() {
              show = 1;
            });
            print("Fetched list: ${fetched_list[0].scode}");
          }
          else{
            setState(() {
              show=2;
            });
            print("view_supplier_datage 86 : OOPS file doesn't exists");
          }
        });
      }

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
              "View Supplier",
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
                    one: "Supplier Code.",
                    two: "Supplier Type",
                    three: "Supplier Name",
                    four: "Scope Of Supplier",
                    five:"NABL Certificate NO",
                    six:"NABL Lab Scope Certificate",
                ),
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
                        model: fetched_list[index],
                      );
                    },
                  ),
                ): show==2 ? Center(child: Text("No such data"),): Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              SizedBox(height: 20,),
              // Center(
              //   child:
              //   ElevatedButton(child: Text('Export To Excel'), onPressed: show==2? null: createExcel, style: ElevatedButton.styleFrom(primary: Colors.red),),
              // ),
            ],
          )),
    );
  }

  doNotExport(){
    print('No data to export');
  }

  // Future<void> createExcel() async {
  //   final Workbook workbook = Workbook();
  //   final Worksheet sheet = workbook.worksheets[0];
  //   sheet.getRangeByName('A1').setText('Gauge ID No.');
  //   sheet.getRangeByName('B1').setText('Gauge Type');
  //   sheet.getRangeByName('C1').setText('Gauge Size');
  //   sheet.getRangeByName('D1').setText('Due Date');
  //   sheet.getRangeByName('E1').setText('Location');
  //   sheet.getRangeByName('F1').setText('Calibration Agency Name');
  //   sheet.getRangeByName('G1').setText('Calibration Cost');
  //   sheet.getRangeByName('H1').setText('Calibration Date');
  //   sheet.getRangeByName('I1').setText('Calibration Frequency');
  //   sheet.getRangeByName('J1').setText('Gauge Cost');
  //   sheet.getRangeByName('K1').setText('Gauge Life');
  //   sheet.getRangeByName('L1').setText('Gauge Make');
  //   sheet.getRangeByName('M1').setText('Invoice Date');
  //   sheet.getRangeByName('N1').setText('Invoice Number');
  //   sheet.getRangeByName('O1').setText('Item Code');
  //   sheet.getRangeByName('P1').setText('Manufacturer Serial Number');
  //   sheet.getRangeByName('Q1').setText('Maximum');
  //   sheet.getRangeByName('R1').setText('Minimum');
  //   sheet.getRangeByName('S1').setText('Remark');
  //   sheet.getRangeByName('T1').setText('Plant');
  //   sheet.getRangeByName('U1').setText('Certificate Number');
  //   sheet.getRangeByName('V1').setText('NABL Accrediation Status');
  //   sheet.getRangeByName('W1').setText('Process Owner');
  //   sheet.getRangeByName('X1').setText('Process Owner Mail Id');
  //   sheet.getRangeByName('Y1').setText('Unit');
  //   sheet.getRangeByName('Z1').setText('Acceptance Criteria');
  //
  //
  //   for(int i=0;i<_view_supplier_dataState.fetched_list.length;i++){
  //     sheet.getRangeByName("A"+(i+2).toString()).setText(_view_supplier_dataState.fetched_list[i].identification_number);
  //     sheet.getRangeByName("B"+(i+2).toString()).setText(_view_supplier_dataState.fetched_list[i].gauge_type);
  //     sheet.getRangeByName("C"+(i+2).toString()).setText(_view_supplier_dataState.fetched_list[i].nominal_size);
  //     sheet.getRangeByName("D"+(i+2).toString()).setText(_view_supplier_dataState.fetched_list[i].calibration_due_date);
  //     sheet.getRangeByName("E"+(i+2).toString()).setText(_view_supplier_dataState.fetched_list[i].gauge_location);
  //     sheet.getRangeByName("F"+(i+2).toString()).setText(_view_supplier_dataState.fetched_list[i].calibration_agency_name);
  //     sheet.getRangeByName("G"+(i+2).toString()).setText(_view_supplier_dataState.fetched_list[i].calibration_cost);
  //     sheet.getRangeByName("H"+(i+2).toString()).setText(_view_supplier_dataState.fetched_list[i].calibration_date);
  //     sheet.getRangeByName("I"+(i+2).toString()).setText(_view_supplier_dataState.fetched_list[i].calibration_frequency);
  //     sheet.getRangeByName("J"+(i+2).toString()).setText(_view_supplier_dataState.fetched_list[i].gauge_cost);
  //     sheet.getRangeByName("K"+(i+2).toString()).setText(_view_supplier_dataState.fetched_list[i].gauge_life);
  //     sheet.getRangeByName("L"+(i+2).toString()).setText(_view_supplier_dataState.fetched_list[i].gauge_make);
  //     sheet.getRangeByName("M"+(i+2).toString()).setText(_view_supplier_dataState.fetched_list[i].invoice_date);
  //     sheet.getRangeByName("N"+(i+2).toString()).setText(_view_supplier_dataState.fetched_list[i].invoice_number);
  //     sheet.getRangeByName("O"+(i+2).toString()).setText(_view_supplier_dataState.fetched_list[i].item_code);
  //     sheet.getRangeByName("P"+(i+2).toString()).setText(_view_supplier_dataState.fetched_list[i].manufacturer_serial_number);
  //     sheet.getRangeByName("Q"+(i+2).toString()).setText(_view_supplier_dataState.fetched_list[i].maximum);
  //     sheet.getRangeByName("R"+(i+2).toString()).setText(_view_supplier_dataState.fetched_list[i].minimum);
  //     sheet.getRangeByName("S"+(i+2).toString()).setText(_view_supplier_dataState.fetched_list[i].remark);
  //     sheet.getRangeByName("T"+(i+2).toString()).setText(_view_supplier_dataState.fetched_list[i].plant);
  //     sheet.getRangeByName("U"+(i+2).toString()).setText(_view_supplier_dataState.fetched_list[i].certificate_number);
  //     sheet.getRangeByName("V"+(i+2).toString()).setText(_view_supplier_dataState.fetched_list[i].nabl_accrediation_status);
  //     sheet.getRangeByName("W"+(i+2).toString()).setText(_view_supplier_dataState.fetched_list[i].process_owner);
  //     sheet.getRangeByName("X"+(i+2).toString()).setText(_view_supplier_dataState.fetched_list[i].process_owner_mail_id);
  //     sheet.getRangeByName("Y"+(i+2).toString()).setText(_view_supplier_dataState.fetched_list[i].unit);
  //     sheet.getRangeByName("Z"+(i+2).toString()).setText(_view_supplier_dataState.fetched_list[i].acceptance_criteria);
  //   }
  //
  //   final List<int> bytes = workbook.saveAsStream();
  //   workbook.dispose();
  //
  //   if (kIsWeb) {
  //     AnchorElement(
  //         href:
  //         'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
  //       ..setAttribute('download', 'Output.xlsx')
  //       ..click();
  //   } else {
  //     final String path = (await getApplicationSupportDirectory()).path;
  //     final String fileName = Platform.isWindows ? '$path\\Output.xlsx' : '$path/Output.xlsx';
  //     final File file = File(fileName);
  //     await file.writeAsBytes(bytes, flush: true);
  //     OpenFile.open(fileName);
  //   }
  // }

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
  final View_supplier_data_model model;

  const ExcelRow(
      {Key? key,
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
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => ShowGauge(model: model)),
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
                      child: Center(child: Text(model.scode)),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      //width: 300,
                      height: height,
                      decoration: BoxDecoration(border: Border.all(color: color)),
                      child: Center(child: Text(model.stype)),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      //width: 300,
                      height: height,
                      decoration: BoxDecoration(border: Border.all(color: color)),
                      child: Center(child: Text(model.snm)),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      // width: 300,
                      height: height,
                      decoration: BoxDecoration(border: Border.all(color: color)),
                      child: Center(child: Text(model.scopeList.toString())),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      // width: 300,
                      height: height,
                      decoration: BoxDecoration(border: Border.all(color: color)),
                      child: Center(child: Text(model.nabl_no)),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      // width: 300,
                      height: height,
                      decoration: BoxDecoration(border: Border.all(color: color)),
                      child: Center(child: Text(model.lab_scope_link)),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }

}




