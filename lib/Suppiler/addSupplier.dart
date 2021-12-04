import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iap_project/date_picker2.dart';
import 'package:progress_dialog/progress_dialog.dart';

class AddSupplier extends StatefulWidget {
  final List<String> type;
  const AddSupplier({Key? key,required this.type}) : super(key: key);

  @override
  _AddSupplierState createState() => _AddSupplierState();
}

class _AddSupplierState extends State<AddSupplier> {
  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);

  var _chosenValue;

//  var t2;
  late ProgressDialog progressdialog;
  DateTime selectedDate=DateTime.now();
  List<String> agencyType=[];
  var t1=new TestPickerWidget2("");
  var t2=new TestPickerWidget2("");

  var sup_nm=TextEditingController();
  var agencytype;
  var sup_address=TextEditingController();
  var sup_code=TextEditingController();
  var contact_nm=TextEditingController();
  var contact_mail=TextEditingController();
  var contact_mob=TextEditingController();
  var nabl_cer_no=TextEditingController();
  var scope_Of_supplier=TextEditingController();
  var nabl_date;
  var nabl_due_date;
  var nabl_certificate_fileName,nabl_labScope_fileName,nabl_cert_link,lab_scope_link;
  List<String> supplier_scopes=[];
  List<String> contact_nm_list =[];
  List<String> contact_MobileNo_list =[];
  List<String> contact_MailID_list =[];

  void fetchAttributeValues()
   async {
      await FirebaseFirestore.instance.collection("Chakan").doc("SupplierAttributes").collection("AgencyType")
          .get().then((value)
      {
            value.docs.forEach((element) {
                  print("HI");
                  element.data().entries.forEach((ele)
                  {
                        agencyType.add(ele.value);print(ele.value);
                  });
            });
      });
     print(agencyType);
  }

  void insertScopeAttributes(String nm)
  {

      FirebaseFirestore.instance.collection("Chakan").doc("SupplierAttributes")
          .collection("Scopes").doc(nm.trim().toUpperCase()).set({'name':nm.trim().toUpperCase()}).whenComplete(() => print("Scope Added"));
  }

  void insertContactNAMEAttributes(String nm)
  {
    FirebaseFirestore.instance.collection("Chakan").doc("SupplierAttributes")
        .collection("Contact_Names").doc(nm.trim()).set({'name':nm.trim()}).whenComplete(() => print("Name Added"));
  }

  void insertCONTACT_EMAILAttributes(String nm)
  {
    FirebaseFirestore.instance.collection("Chakan").doc("SupplierAttributes")
        .collection("Contact_Emails").doc(nm.trim()).set({'name':nm.trim()}).whenComplete(() => print("Email Added"));
  }

  void insertCONTACT_PhoneAttributes(String nm)
  {
    FirebaseFirestore.instance.collection("Chakan").doc("SupplierAttributes")
        .collection("Contact_Phone").doc(nm.trim()).set({'name':nm.trim()}).whenComplete(() => print("Phone Added"));
  }

  void createProgressDialog()
  {
      progressdialog = ProgressDialog(context,type: ProgressDialogType.Normal);
      progressdialog.style(
          message: 'Uploading file...',
          borderRadius: 10.0,
          backgroundColor: Colors.white,
          progressWidget: CircularProgressIndicator(),
          elevation: 10.0,
          insetAnimCurve: Curves.easeInOut,
          progress: 0.0,
          maxProgress: 100.0,
          progressTextStyle: TextStyle(
              color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
          messageTextStyle: TextStyle(
              color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600)
      );
  }

  List<String> splitScope(String str)
  {
    return str.split(",");
  }

  void dispValues()
  {
    agencytype=_chosenValue;
        print(sup_nm.text.toString()+"\n"+agencytype+"\n"+sup_address.text.toString()+"\n"+
        sup_code.text.toString()+"\n"+contact_nm.text.toString()+"\n"+contact_mob.text.toString()+"\n"+
            nabl_cer_no.text.toString()+"\n"+nabl_date+"\n"+nabl_due_date
            +"\n"+nabl_certificate_fileName.toString()+nabl_labScope_fileName.toString()
        );
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

  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    Firebase.initializeApp();
    //fetchAttributeValues();
    agencyType=widget.type;
    createProgressDialog();
    nabl_cer_no.text="No Data Available";

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
          .child("files/"+sup_code.text.toString()+"/");

      UploadTask task = tp.child("$fileName")
          .putData(file!);
      print(fileName);
      progressdialog.show();
      task.whenComplete(()
      async {
        progressdialog.hide();
        print("File Uploaded");
        nabl_certificate_fileName=fileName;
        nabl_cert_link=await tp.child("$fileName").getDownloadURL();
        print(nabl_cert_link);
      });

    }
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
          .child("files/"+sup_code.text.toString()+"/");

      UploadTask task = tp.child("$fileName")
          .putData(file!);
      print(fileName);
      progressdialog.show();
      task.whenComplete(()
      async {
        progressdialog.hide();
        print("File Uploaded");
        nabl_labScope_fileName=fileName;
        lab_scope_link=await tp.child("$fileName").getDownloadURL();
        print(lab_scope_link);
      });

    }
  }

  void insert_A_Supplier()
  async {
    nabl_date=t1.selectedDate.toString();
    nabl_due_date=t2.selectedDate.toString();
    supplier_scopes=splitScope(scope_Of_supplier.text.toString().trim());
    contact_nm_list=splitScope(contact_nm.text.toString().trim());
    contact_MobileNo_list=splitScope(contact_mob.text.toString().trim());
    contact_MailID_list=splitScope(contact_mail.text.toString().trim());

    if(sup_nm.text.isNotEmpty&&_chosenValue!=null&&sup_address.text.isNotEmpty
    &&sup_code.text.isNotEmpty&&contact_mail.text.isNotEmpty&&supplier_scopes.length>=1&&
        contact_MobileNo_list.length>=1&&contact_nm_list.length>=1)
      {
        await FirebaseFirestore.instance.collection("Chakan").doc("Supplier").collection("all_").doc().set(
            {
              'agencyName':sup_nm.text.toString().trim(),
              'agencytype':_chosenValue.trim(),
              'agencyAddress':sup_address.text.toString().trim(),
              'agencyCode':sup_code.text.toString().trim(),
              //'contact_person_nm':contact_nm.text.toString(),
              //'contact_person_mailid':contact_mail.text.toString().trim(),
              //'contact_person_mob':contact_mob.text.toString().trim(),
              'NABL_certificate_No':nabl_cer_no.text.toString().trim(),
              'NABL_Cert_Date':nabl_date.toString().trim(),
              'NABL_Cert_Due_Date':nabl_due_date.toString().trim(),
              'NABL_Certificate_Download_Link':nabl_cert_link.toString().trim(),
              'NABL_Lab_Scope_Download_Link':lab_scope_link.toString().trim(),
              'NABL_Certificate_FileName':nabl_certificate_fileName.toString().trim(),
              'NABL_Lab_Scope_FileName':nabl_labScope_fileName.toString().trim(),

            }
        ).whenComplete(()
        {
          supplier_scopes.forEach((element)
          async {
            insertScopeAttributes(element);
            await FirebaseFirestore.instance.collection("Chakan")
                .doc("Supplier").collection("all_").where("agencyCode",isEqualTo: sup_code.text.toString().trim())
                .get().then((value)
            {
              value.docs.forEach((record)
              {
                var id=record.id;
                FirebaseFirestore.instance.collection("Chakan")
                    .doc("Supplier").collection("all_").doc(id).collection("Scope")
                    .doc().set(
                    {
                      'name':element.trim().toUpperCase(),
                    }).onError((error, stackTrace)
                {
                  _showMyDialog('Error','Add Supplier Failed !!!!!');
                  print("Error Occured while creating Scope Collection.");
                });
              });

            });

          });
          contact_nm_list.forEach((element)
          async {
            insertContactNAMEAttributes(element);
            await FirebaseFirestore.instance.collection("Chakan")
                .doc("Supplier").collection("all_").where("agencyCode",isEqualTo: sup_code.text.toString())
                .get().then((value)
            {
              value.docs.forEach((record)
              {
                var id=record.id;
                FirebaseFirestore.instance.collection("Chakan")
                    .doc("Supplier").collection("all_").doc(id).collection("Contact_Name")
                    .doc().set(
                    {
                      'name':element.trim(),
                    }).onError((error, stackTrace)
                {
                  _showMyDialog('Error','Add Supplier Failed !!!!!');
                  print("Error Occured while creating Name Collection.");
                });
              });

            });

          });
          contact_MobileNo_list.forEach((element)
          async {
            insertCONTACT_PhoneAttributes(element);
            await FirebaseFirestore.instance.collection("Chakan")
                .doc("Supplier").collection("all_").where("agencyCode",isEqualTo: sup_code.text.toString())
                .get().then((value)
            {
              value.docs.forEach((record)
              {
                var id=record.id;
                FirebaseFirestore.instance.collection("Chakan")
                    .doc("Supplier").collection("all_").doc(id).collection("Contact_Phone")
                    .doc().set(
                    {
                      'name':element.trim(),
                    }).onError((error, stackTrace)
                {
                  _showMyDialog('Error','Add Supplier Failed !!!!!');
                  print("Error Occured while creating Phone Collection.");
                });
              });

            });
            
          });
          contact_MailID_list.forEach((element)
          async {
            insertCONTACT_EMAILAttributes(element);
            await FirebaseFirestore.instance.collection("Chakan")
                .doc("Supplier").collection("all_").where("agencyCode",isEqualTo: sup_code.text.toString())
                .get().then((value)
            {
              value.docs.forEach((record)
              {
                var id=record.id;
                FirebaseFirestore.instance.collection("Chakan")
                    .doc("Supplier").collection("all_").doc(id).collection("Contact_Emails")
                    .doc().set(
                    {
                      'name':element.trim(),
                    }).onError((error, stackTrace)
                {
                  _showMyDialog('Error','Add Supplier Failed !!!!!');
                  print("Error Occured while creating Mail Collection.");
                });
              });

            });

          });

          //_showMyDialog('Success','Supplier Added Successfully !!!!!');

        }
        ).whenComplete(() => print('Supplier Added Successfully !!!!!'))
        .then((value) => _showMyDialog('Success','Supplier Added Successfully !!!!!'))
            .onError((error, stackTrace)
            {
              _showMyDialog('Error','Add Supplier Failed !!!!!');
              print("Error Occured !!!");
            });


        dispValues();resetAll();
      }
    else
      {
        _showMyDialog('Empty Fields','Please enter all mandatory details !!!!!');
      }


  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          backgroundColor: lred,
          appBar: AppBar(
            toolbarHeight: 50,
            backgroundColor: backred,
            title: const Text(
              "Add Supplier",
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
                                    controller: sup_nm,
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

                                        items: agencyType.map<DropdownMenuItem<String>>((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                        hint: Text(
                                          "Select The Agency Type",

                                        ),

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
                                    controller:sup_address ,
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
                                Text("Supplier Contact Person Name",style: TextStyle(color: Colors.black,fontSize: 18),textAlign: TextAlign.start,),
                                SizedBox(width: 200,),
                                Text("Contact Person Email",style: TextStyle(color: Colors.black,fontSize: 18),textAlign: TextAlign.start,),
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
                                    controller: sup_code,
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
                                  height:37.0,
                                  child: TextField(
                                    enabled: true,
                                    controller: contact_nm,
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      // labelText: "Identification Number",
                                      border: OutlineInputBorder(),

                                    ),),
                                ),
                                SizedBox(width: 100,),
                                Container(
                                  width: 300,
                                  height:37.0,
                                  child: TextField(
                                    enabled: true,
                                    controller: contact_mail,
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
                                Text("Supplier Contact Number",style: TextStyle(color: Colors.black,fontSize: 18),textAlign: TextAlign.start,),
                                SizedBox(width: 100,),
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
                                    controller: contact_mob,
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      //  labelText: "Gauge Type",
                                      border: OutlineInputBorder(),

                                    ),),
                                ),

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
                                    controller: nabl_cer_no,
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

                          Row(
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
                                  controller: scope_Of_supplier,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    //  labelText: "Gauge Type",
                                    border: OutlineInputBorder(),

                                  ),),
                              ),

                            ],
                          ),
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
                              SizedBox(width: 300,),
                              TextButton(
                                  onPressed: add_NABL_LAB_ScopePdf_To_Cloud,
                                  child:Text("Upload NABL Lab Scope",
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
                                  onPressed: insert_A_Supplier,
                                  child: Text(
                                    "ADD Supplier",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(width: 250,),

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
                                  onPressed: resetAll,
                                  child: Text(
                                    "RESET",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),],
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

  void handleDropChange(String? val)
  {
    setState(() {
      _chosenValue=val;
    });
  }

  void resetAll()
  {

        sup_nm.clear();
        sup_address.clear();
         sup_code.clear();
         contact_nm.clear();
         contact_mail.clear();
         contact_mob.clear();
         nabl_cer_no.clear();
         nabl_date;
         nabl_due_date;
        nabl_labScope_fileName="";
         nabl_cert_link="";
         lab_scope_link="";
         scope_Of_supplier.clear();


  }
}
