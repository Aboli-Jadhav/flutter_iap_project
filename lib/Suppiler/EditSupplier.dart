import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iap_project/Suppiler/Edit_Supplier_Contact_Details.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'SupplierDataModel.dart';
import 'demoCalender.dart';
import 'viewScope.dart';

class EditSupplier extends StatefulWidget {
  final SupplierDataModel supplierModel;
  final List<String> scopedatamodel;

  const EditSupplier({Key? key, required this.supplierModel,required this.scopedatamodel}) : super(key: key);

  @override
  _EditSupplierState createState() => _EditSupplierState();
}

class _EditSupplierState extends State<EditSupplier>
{

  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);
  var _chosenValue;
  var t1,t2;
  var Scopefilenm,certFilenm,nabl_cert_link,lab_scope_link;
  var demoScope=TextEditingController();

  late ProgressDialog progressdialog;
  List<String> reqScope=[];
  List<String> supplierScope=[];
  List<String> agencytype=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _chosenValue=widget.supplierModel.stype.text;
    fetchAttributeValues();
    reqScope=widget.scopedatamodel.toList();
    createProgressDialog();
    t1=new TestPickerWidget2(widget.supplierModel.nabldate.text.toString());
    t2=new TestPickerWidget2(widget.supplierModel.nabldue.text.toString());

  }

  Future<void> _showMyDialog(String title,String str) async {
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

  void add_CertificatePdf_To_Cloud()
  async {
    FilePickerResult? result =
    await FilePicker.platform.pickFiles();

    if (result != null) {
      Uint8List? file = result.files.first
          .bytes;
      String fileName = result.files.first.name;


      var tp = FirebaseStorage.instance.ref()
          .child("files/"+widget.supplierModel.scode.text.toString()+"/");

      UploadTask task = tp.child("$fileName")
          .putData(file!);
      print(fileName);
      progressdialog.show(
          max: 100,
          msg: 'Uploading...',
          progressType: ProgressType.valuable,
          backgroundColor: backred,
          progressValueColor: lred,
          progressBgColor: Colors.white70,
          msgColor: Colors.white,
          valueColor: Colors.white
      );      task.whenComplete(()
      async {
        progressdialog.close();
        print("File Uploaded");
        certFilenm=fileName;
        nabl_cert_link=await tp.child("$fileName").getDownloadURL();
        print(nabl_cert_link);
        String id=await returnIDOfDOc();
        updateCertificateLinks(id);
      });

    }
  }

  List<String> splitScope(String str)
  {
    return str.split(",");
  }

  void add_NABL_LAB_ScopePdf_To_Cloud()
  async {
    FilePickerResult? result =
    await FilePicker.platform.pickFiles();

    if (result != null) {
      Uint8List? file = result.files.first
          .bytes;
      String fileName = result.files.first.name;


      var tp = FirebaseStorage.instance.ref()
          .child("files/"+widget.supplierModel.scode.text.toString()+"/");

      UploadTask task = tp.child("$fileName")
          .putData(file!);
      print(fileName);
      progressdialog.show(
          max: 100,
          msg: 'Uploading...',
          progressType: ProgressType.valuable,
          backgroundColor: backred,
          progressValueColor: lred,
          progressBgColor: Colors.white70,
          msgColor: Colors.white,
          valueColor: Colors.white
      );
      task.whenComplete(()
      async {
        progressdialog.close();
        print("File Uploaded");
        Scopefilenm=fileName;
        lab_scope_link=await tp.child("$fileName").getDownloadURL();
        print(lab_scope_link);
        String id=await returnIDOfDOc();print(id);
        updateScopeFileLinks(id);
      });

    }
  }

  // Future<String> returnIDOfDOc()
  // async {
  //   String ret="";
  //   await FirebaseFirestore.instance.collection("Chakan")
  //       .doc("Supplier").collection("all_").where("agencyCode",isEqualTo: widget.supplierModel.scode.text.toString())
  //       .get().then((value) => ret=value.docs.first.id.toString());
  //   print(ret);
  //   return ret;
  // }

  Future<String> returnIDOfDOc()
  async {
    String ret="";
    await FirebaseFirestore.instance.collection("Chakan")
        .doc("Supplier").collection("all_").where("agencyCode",isEqualTo: widget.supplierModel.scode.toString().trim())
        .get().then((value) => ret=value.docs.first.id.toString());
    print(ret);
    return ret;
  }

  void updateCertificateLinks(var id)
  async {
    await FirebaseFirestore.instance.collection("Chakan").doc("Supplier").collection("all_").doc(id).update(
        {
          'NABL_Certificate_Download_Link':nabl_cert_link.toString(),
          'NABL_Certificate_FileName':certFilenm.toString(),

        });
  }

  void updateScopeFileLinks(var id)
  async {
    await FirebaseFirestore.instance.collection("chakan").doc("Supplier").collection("all_").doc(id).update(
        {
          'NABL_Lab_Scope_Download_Link':lab_scope_link.toString(),
          'NABL_Lab_Scope_FileName':Scopefilenm.toString(),

        });
  }


  void fetchAttributeValues()
  async {
    await FirebaseFirestore.instance.collection("Chakan").doc("SupplierAttributes").collection("AgencyType")
        .get().then((value)
    {
      value.docs.forEach((element) {
        element.data().entries.forEach((ele)
        {
          agencytype.add(ele.value);
        });
      });
      setState(() {

      });
    });
    print(agencytype);
  }

  // void handleDropChange(String val)
  // {
  //
  // }

  void createProgressDialog()
  {
    progressdialog = ProgressDialog(context:context);

  }

  void disp()
  {
    print(widget.supplierModel.snm.text.toString());
  }

  void update_A_Supplier()
  async {
    var nabl_date=t1.selectedDate.toString();
    var nabl_due_date=t2.selectedDate.toString();
    supplierScope=splitScope(demoScope.text.toString().trim().toUpperCase());

    await FirebaseFirestore.instance.collection("Chakan")
        .doc("Supplier").collection("all_").where("agencyCode",isEqualTo: widget.supplierModel.scode.text.toString())
        .get().then((value) {
      value.docs.forEach((record) {
        var id = record.id;

        FirebaseFirestore.instance.collection("Chakan").doc("Supplier").collection("all_").doc(id).update(
            {
              'agencyName':widget.supplierModel.snm.text.toString().trim(),
              'agencytype':_chosenValue.toString().trim().toUpperCase(),
              'agencyAddress':widget.supplierModel.saddress.text.toString().trim(),
              'NABL_certificate_No':widget.supplierModel.nablNo.text.toString().trim(),
              'NABL_Cert_Date':nabl_date.toString(),
              'NABL_Cert_Due_Date':nabl_due_date.toString().trim(),
            }
        ).whenComplete(()
        {
          _showMyDialog("Success","Supplier Updated Successfully !!!!");
        }).onError((error, stackTrace) => _showMyDialog("Success","Supplier Updated Successfully !!!!"));


      });
    });

    // supplierScope.forEach((element)
    // async {
    //   await FirebaseFirestore.instance.collection("chakan")
    //       .doc("Supplier").collection("all_").doc(widget.supplierModel.scode.text.toString()).collection("Scope")
    //       .doc().set(
    //       {
    //         'name':element,
    //       });
    // });


    //dispValues();

  }


  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: lred,
        appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: backred,
          title: const Text(
            "View And Edit Supplier",
            style:  TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: <Widget>[
            Column(
              children:
              [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const
                            [
                              Text("Supplier Agency Name",style: TextStyle(color: Colors.black,fontSize: 18),textAlign: TextAlign.start,),
                              SizedBox(width: 200,),
                              Text("Supplier Type",style: TextStyle(color: Colors.black,fontSize: 18),textAlign: TextAlign.start,),
                              SizedBox(width: 200,),
                              Text("Supplier Address",style: TextStyle(color: Colors.black,fontSize: 18),textAlign: TextAlign.start,),
                            ]),
                        const SizedBox(
                          height: 10,
                        ),

                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children:
                            [
                              Container(
                                width: 300,
                                height:37.0,
                                child: TextField(
                                  enabled: true,
                                  controller: widget.supplierModel.snm,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    //  labelText: "Gauge Type",
                                    border: OutlineInputBorder(),

                                  ),),
                              ),
                              SizedBox(width: 100,),
                              Container(
                                width: 300,
                                height: 40,
                                padding: EdgeInsets.fromLTRB(20,10,10,10),
                                decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.all(Radius.circular(5))
                                ),

                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: _chosenValue,
                                    //elevation: 5,
                                    style: TextStyle(color: Colors.black),

                                    items: agencytype.map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    // hint: Text(
                                    //   "Select The Agency Type",
                                    //
                                    // ),

                                    onChanged:handleDropChange,
                                  ),
                                ),
                              ),
                              SizedBox(width: 100,),
                              Container(
                                width: 300,
                                height:37.0,
                                child: TextField(
                                  enabled: true,
                                  controller:widget.supplierModel.saddress ,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    // labelText: "Manufacturer Number",
                                    border: OutlineInputBorder(),

                                  ),),
                              ),
                            ]
                        ),

                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const
                            [
                              Text("Supplier Code",style: TextStyle(color: Colors.black,fontSize: 18),textAlign: TextAlign.start,),
                              SizedBox(width: 200,),
                            ]),
                        const SizedBox(height: 10,),

                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children:
                            [
                              Container(
                                width: 300,
                                height:37.0,
                                child: TextField(
                                  enabled: false,
                                  controller: widget.supplierModel.scode,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    //  labelText: "Gauge Type",
                                    border: OutlineInputBorder(),

                                  ),),
                              ),
                              SizedBox(width: 100,),
                            ]
                        ),

                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const
                            [
                              Text("NABL Certificate NUmber",style: TextStyle(color: Colors.black,fontSize: 18),textAlign: TextAlign.start,),
                              SizedBox(width: 200,),
                              Text("NABL Certificate Date",style: TextStyle(color: Colors.black,fontSize: 18),textAlign: TextAlign.start,),
                              SizedBox(width: 200,),
                              Text("NABL Certificate Due Date",style: TextStyle(color: Colors.black,fontSize: 18),textAlign: TextAlign.start,),
                            ]),
                        const SizedBox(
                          height: 10,
                        ),

                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children:
                            [
                              Container(
                                width: 300,
                                height:37.0,
                                child: TextField(
                                  enabled: true,
                                  controller: widget.supplierModel.nablNo,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    //  labelText: "Gauge Type",
                                    border: OutlineInputBorder(),

                                  ),),
                              ),
                              SizedBox(width: 100,),
                              t1,
                              SizedBox(width: 100,),
                              t2,

                            ]
                        ),
                        SizedBox(height: 30,),

                        /*Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:
                          [
                            Text("Scope of The Supplier :",style: TextStyle(color: Colors.black,fontSize: 18),textAlign: TextAlign.start,),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:
                          [
                            Container(
                              width: 900,
                              height:100,
                              child: TextField(
                                enabled: true,
                                minLines: 5,
                                maxLines: 7,
                                controller: demoScope,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  //  labelText: "Gauge Type",
                                  border: OutlineInputBorder(),

                                ),),
                            ),

                          ],
                        ),*/
                        SizedBox(height: 30,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: add_CertificatePdf_To_Cloud,
                                child: Text("Upload NABL Certificate",
                                  style: TextStyle(
                                    fontSize: 20,fontWeight:FontWeight.bold,
                                  ),
                                )
                            ),
                            SizedBox(width: 100,),
                            TextButton(
                              onPressed: add_NABL_LAB_ScopePdf_To_Cloud,
                              child:Text("Upload NABL Lab Scope",
                                style: TextStyle(
                                  fontSize: 20,fontWeight:FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(width: 100,),
                            TextButton(
                              onPressed: (){
                                Navigator.push(context,
                                    MaterialPageRoute(
                                        builder: (context) => new viewScope(scode:widget.supplierModel.scode.text.toString().trim())
                                    ));

                              },
                              child:Text("View Scope Of Supplier",
                                style: TextStyle(
                                  fontSize: 20,fontWeight:FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(width: 100,),
                            TextButton(
                              onPressed: (){
                                Navigator.push(context,
                                    MaterialPageRoute(
                                        builder: (context) => new Edit_Supplier_Contact_Details(scode:widget.supplierModel.scode.text.toString())
                                    ));

                              },
                              child:Text("Edit Supplier Contact Details",
                                style: TextStyle(
                                  fontSize: 20,fontWeight:FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 30,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              width: 0.2 * MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      Color(0xffDF3F3F)),
                                ),
                                onPressed: update_A_Supplier,
                                child: Text(
                                  "Update Supplier",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(width: 250,),

                            // Container(
                            //   height: 40,
                            //   width: 0.2 * MediaQuery
                            //       .of(context)
                            //       .size
                            //       .width,
                            //   child: ElevatedButton(
                            //     style: ButtonStyle(
                            //       backgroundColor: MaterialStateProperty.all<Color>(
                            //           Color(0xffDF3F3F)),
                            //     ),
                            //     onPressed: resetAll,
                            //     child: Text(
                            //       "RESET",
                            //       style: TextStyle(
                            //         fontSize: 20.0,
                            //         fontWeight: FontWeight.bold,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }




  void handleDropChange(String? value)
  {
    setState(() {
      _chosenValue=value!;
    });
  }
}


