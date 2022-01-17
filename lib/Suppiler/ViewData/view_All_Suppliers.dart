import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:flutter_iap_project/Suppiler/ViewData/View_Supplier_data_Model.dart';
import 'package:flutter_iap_project/Suppiler/ViewData/return_All_SubCollections_List.dart';
import 'package:flutter_iap_project/Suppiler/demoView/demoEditSupplier.dart';
import 'package:flutter_iap_project/Suppiler/demoView/demoEditSupplier_ForViewAll.dart';
import 'package:flutter_iap_project/Suppiler/demoView/demo_Edit_Supplier_Contact_Details.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' show Workbook, Worksheet, ExcelDataRow, ExcelDataCell;
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:universal_html/html.dart' show AnchorElement;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:convert';

import '../viewScope.dart';

class view_All_Supplier_Data extends StatefulWidget {

  const view_All_Supplier_Data(
      {Key? key})
      : super(key: key);

  @override
  _view_All_Supplier_DataState createState() => _view_All_Supplier_DataState();
}

class _view_All_Supplier_DataState extends State<view_All_Supplier_Data> {
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

  // void fetch() {
  //   FirebaseFirestore.instance
  //       .collection("Chakan")
  //       .doc("Supplier")
  //       .collection("all_").get().then((value)
  //   {
  //     if(value.docs.isNotEmpty)
  //     {
  //       value.docs.forEach((element)
  //       {
  //         var fdb=fstore
  //             .collection("Chakan")
  //             .doc("Supplier")
  //             .collection("all_")
  //             .doc(element.id)
  //             .get();
  //         FirebaseFirestore.instance
  //             .collection("Chakan")
  //             .doc("Supplier")
  //             .collection("all_")
  //             .doc(element.id)
  //             .collection(widget.selectedValue)
  //             .where("name", isEqualTo: widget.selected_option)
  //             .get()
  //             .then((querySnapshot) async {
  //           print("SIZE"+querySnapshot.size.toString()+element.id);
  //           if (querySnapshot.docs.isNotEmpty)
  //           {
  //             print("HIIII"+element.id); await getAll(element.id);
  //             // querySnapshot.docs.forEach((doc)
  //             // async {
  //             fdb.then((doc)
  //             {
  //               View_supplier_data_model model=View_supplier_data_model(
  //                   doc['agencyCode'],
  //                   doc['NABL_certificate_No'],
  //                   doc['agencyAddress'],
  //                   doc['agencyName'],
  //                   doc['NABL_Cert_Due_Date'],
  //                   doc['NABL_Cert_Date'],
  //                   doc['NABL_Lab_Scope_Download_Link'],
  //                   doc['NABL_Certificate_Download_Link'],
  //                   doc['NABL_Lab_Scope_FileName'],
  //                   doc['NABL_Certificate_FileName'],
  //                   doc['agencytype'],
  //                   scopeList,ContactMob_List,ContactNm_List,
  //                   ContactMail_List
  //               );
  //               fetched_list.add(model);print("MODEL"+model.snm);
  //             });
  //
  //             // });
  //             setState(() {
  //               show = 1;
  //             });
  //             print("Fetched list: ${fetched_list[0].scode}");
  //
  //           }
  //           else{
  //             setState(() {
  //               if(fetched_list.length==0)
  //               {
  //                 show=2;
  //               }
  //               else
  //               {
  //                 show=1;
  //               }
  //
  //             });
  //             print("view_supplier_datage 86 : OOPS file doesn't exists");
  //           }
  //         });
  //
  //       });
  //     }
  //     else
  //     {
  //       setState(() {
  //         show=2;
  //       });
  //       print("view_supplier_datage 85 : OOPS file doesn't exists");
  //     }
  //
  //   });
  //
  // }


  // void fetchData() {
  //
  //   if(widget.selectedValue =="Contact_Name"||widget.selectedValue =="Contact_Emails"||
  //       widget.selectedValue =="Contact_Phone"||widget.selectedValue =="Scope")
  //   {
  //     print("FETCH");
  //     fetch();
  //   }
  //   else
  //   {
  //     FirebaseFirestore firestore = FirebaseFirestore.instance;
  //     firestore
  //         .collection("Chakan")
  //         .doc("Supplier")
  //         .collection("all_")
  //         .where(widget.selectedValue, isEqualTo: widget.selected_option)
  //         .get()
  //         .then((QuerySnapshot querySnapshot) {
  //       if (querySnapshot.docs.isNotEmpty) {
  //         querySnapshot.docs.forEach((doc) {
  //           getAll(doc.id);
  //           View_supplier_data_model model=View_supplier_data_model(
  //               doc['agencyCode'],
  //               doc['NABL_certificate_No'],
  //               doc['agencyAddress'],
  //               doc['agencyName'],
  //               doc['NABL_Cert_Due_Date'],
  //               doc['NABL_Cert_Date'],
  //               doc['NABL_Lab_Scope_Download_Link'],
  //               doc['NABL_Certificate_Download_Link'],
  //               doc['NABL_Lab_Scope_FileName'],
  //               doc['NABL_Certificate_FileName'],
  //               doc['agencytype'],
  //               scopeList,ContactMob_List,ContactNm_List,
  //               ContactMail_List
  //           );
  //
  //           fetched_list.add(model);
  //         });
  //         setState(() {
  //           show = 1;
  //         });
  //         print("Fetched list: ${fetched_list[0].scode}");
  //       }
  //       else{
  //         setState(() {
  //           show=2;
  //         });
  //         print("view_supplier_datage 86 : OOPS file doesn't exists");
  //       }
  //     });
  //   }
  //
  // }

  void fetchAll()
  {
        var fstore=FirebaseFirestore.instance;
        fstore.collection("Chakan").doc("Supplier")
        .collection("all_").get()
        .then((value)
        {
              if(value.docs.isNotEmpty)
                {
                    value.docs.forEach((doc)
                    {
                          getAll(doc.id);
                          print(doc.id.toString());
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
              else
                {
                  setState(() {
                    show=2;
                  });
                  print("view_supplier_datage 86 : OOPS file doesn't exists");
                }
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    fetched_list = [];
    show = 0;
    Fluttertoast.showToast(
        msg: "View ALl Suppliers",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    fetchAll();
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
                  one: "Supplier Code",
                  two: "Supplier Type",
                  three: "Supplier Name",
                  four: "Edit Contact Details And Scope",
                  five:"NABL Certificate No.",
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
                        model: fetched_list[index]

                      );
                    },
                  ),
                ): show==2 ? Center(child: Text("No such data"),): Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              SizedBox(height: 10,),
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
    sheet.getRangeByName('A1').setText('Sr. No.');
    sheet.getRangeByName('B1').setText('Name Of Supplier');
    sheet.getRangeByName('C1').setText('Vendor Code');
    sheet.getRangeByName('D1').setText('Address');
    sheet.getRangeByName('E1').setText('Contact Persons');
    sheet.getRangeByName('F1').setText('Contact Numbers');
    sheet.getRangeByName('G1').setText('Mail ID');
    sheet.getRangeByName('H1').setText('Supplier Type (Manufacturer/Instrument SupplyCalibration/Repairing )');
    sheet.getRangeByName('I1').setText('Scope of Supplier');
    sheet.getRangeByName('J1').setText('NABL CERTIFICATE NO');
    sheet.getRangeByName('K1').setText('NABL ISSUE DATE');
    sheet.getRangeByName('L1').setText('NABL VALID UPTO');
    sheet.getRangeByName('M1').setText('NABL Certificate Download Link');
    sheet.getRangeByName('N1').setText('NABL Lab Scope Download Link');

    for(int i=0;i<fetched_list.length;i++){

      return_all_subCollections_List all=new return_all_subCollections_List(fetched_list[i].scode,
          fetched_list[i].stype,fetched_list[i].snm);

      String name = "";
      String mail = "";
      String number = "";
      String sc = "";

      List<String> nm=await all.getNames();
      List<String> Email=await all.getEmails();
      List<String> Phone=await all.getPhones();
      String sclist=await all.getScope();
      //print('Futures :'+nm[i]+ ""+all.getEmails().toString());

      for(int j=0;j<nm.length;j++)
        name = name + nm[j] +",";

      for(int j=0;j<Email.length;j++)
        mail = mail + Email[j] +",";

      for(int j=0;j<Phone.length;j++)
        number = number + Phone[j] +",";


      print(sclist.length);

      sheet.getRangeByName("A"+(i+2).toString()).setText((i+1).toString());
      sheet.getRangeByName("B"+(i+2).toString()).setText(fetched_list[i].snm);
      sheet.getRangeByName("C"+(i+2).toString()).setText(fetched_list[i].scode);
      sheet.getRangeByName("D"+(i+2).toString()).setText(fetched_list[i].saddress);
      sheet.getRangeByName("E"+(i+2).toString()).setText(name);
      sheet.getRangeByName("F"+(i+2).toString()).setText(number);
      sheet.getRangeByName("G"+(i+2).toString()).setText(mail);
      sheet.getRangeByName("H"+(i+2).toString()).setText(fetched_list[i].stype);
      sheet.getRangeByName("I"+(i+2).toString()).setText(await all.getScope());
      sheet.getRangeByName("J"+(i+2).toString()).setText(fetched_list[i].nabl_no);
      sheet.getRangeByName("K"+(i+2).toString()).setText(fetched_list[i].nabldate);
      sheet.getRangeByName("L"+(i+2).toString()).setText(fetched_list[i].nabldue);
      sheet.getRangeByName("M"+(i+2).toString()).setText(fetched_list[i].nabl_cert_link);
      sheet.getRangeByName("N"+(i+2).toString()).setText(fetched_list[i].lab_scope_link);
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
  final View_supplier_data_model model;

  const ExcelRow(
      {Key? key,
        required this.model,
      })
      : super(key: key);

  static String downloadedLink="";

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


  Future<void> getDownloadLink(String nm,String type,String filenm,BuildContext context)
  async
  {
    // context:context;
    print(nm.toString()+type.toString());
    var fstorage=FirebaseStorage.instance.ref();
    //String downloadedLink ="";
    downloadedLink= await fstorage.child("files/"+nm.toString()+"_"+type.toString()+"/").child(filenm.toString()).getDownloadURL()
        .whenComplete(() => print("Downloazding"+downloadedLink));
    //.then((value) =>  downloadedLink.toString());
    if(downloadedLink=="")
    {
      _showMyDialog("Error", "UNABLE TO GET CERTIFICATE URL", context);
    }

    // return downloadedLink.toString();
  }

  @override
  Widget build(BuildContext context) {
    double height = 100;
    Color color = Colors.black54;

    return Column(
      children: [
        Material(
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Edit_For_ViewAll(scopedatamodel: model.scopeList, supplierModel: model)),
                );
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
                      child: Center(child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red, // background
                          // onPrimary: Colors.white, // foreground
                        ),
                        onPressed: ()
                      {
                        Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => new demo_Edit_Supplier_Contact_Details(scode: model.scode.toString(), stype: model.stype.toString(), sname: model.snm.toString()),
                          ),
                        );

                      },
                        child: Text("Edit Contact And Scope"),)),
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
                      decoration: BoxDecoration(border: Border.all(color: color)),
                      height: height,
                      child: Center(
                        child: Column(
                          children: [
                            Container(
                              // width: 300,
                              height: 40,
                              //decoration: BoxDecoration(border: Border.all(color: color)),
                              child: Center(child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red, // background
                                 // onPrimary: Colors.white, // foreground
                                ),
                                onPressed: ()
                                async
                                {
                                  if(model.stype != "Calibration")
                                  {
                                    _showMyDialog("ERROR","Repairing or Manufacturer Supplier types does not have Certificate !!", context);
                                  }
                                  else if(model.lab_scope_link == null || model.lab_scope_file_nm== null||
                                      model.lab_scope_link == "" || model.lab_scope_file_nm == ""||
                                      model.lab_scope_link == "null" || model.lab_scope_file_nm== "null"
                                  )
                                  {
                                    _showMyDialog("Problem", "Lab Scope Certificate not Available !!!!", context);
                                  }
                                  else
                                  {
                                    await getDownloadLink(model.snm,model.stype, model.lab_scope_file_nm,context).then((value)
                                    {
                                      var demo = html.window.open(downloadedLink, "_blank");
                                      demo.addEventListener(
                                          "onLoadedData", (event) {
                                        print("Downloading !!!!"+downloadedLink);
                                      });
                                      demo.close();
                                      _showMyDialog("Success", "Download Successful", context);
                                    });
                                  }


                                },
                                child: Text("Download NABL Lab Scope PDF"),)),
                            ),
                            SizedBox(height:10),
                            Container(
                              // width: 300,
                              height: 40,
                              //decoration: BoxDecoration(border: Border.all(color: color)),
                              child: Center(child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red, // background
                                  // onPrimary: Colors.white, // foreground
                                ),
                                onPressed: ()
                              async {
                                if(model.stype == "Repairing"||model.stype == "Manufacturer")
                                {
                                  _showMyDialog("ERROR","Repairing or Manufacturer Supplier types does not have Certificate !!", context);
                                }
                                else if(model.nabl_cert_link == null || model.certificate_file_nm== null||
                                    model.nabl_cert_link == "" || model.certificate_file_nm == ""||
                                    model.nabl_cert_link == "null" || model.certificate_file_nm== "null"
                                )
                                {
                                  _showMyDialog("Problem", "Certificate not Available !!!!", context);
                                }
                                else
                                {
                                  var a=0;
                                  await getDownloadLink(
                                      model.snm,model.stype, model.certificate_file_nm,
                                      context).then((value)
                                  {
                                    var demo =  html.window.open(downloadedLink.toString(), model.certificate_file_nm);
                                    demo.addEventListener(
                                        "onLoadedData", (event) {
                                      print("Downloading !!!!");
                                      a=1;
                                      demo.close();
                                    });
                                    _showMyDialog("Success", "Download Successful", context);

                                  }
                                  );
                                }

                              },
                                child: Text("Download NABL Certificate PDF"),)),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }

}




