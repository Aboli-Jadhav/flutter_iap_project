import 'package:autocomplete_textfield_ns/autocomplete_textfield_ns.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iap_project/Suppiler/DeleteDataModel.dart';

class delete_Supplier_Rows extends StatefulWidget {
  const delete_Supplier_Rows( {Key? key}) : super(key: key);

  @override
  _delete_Supplier_RowsState createState() => _delete_Supplier_RowsState();
}

class _delete_Supplier_RowsState extends State<delete_Supplier_Rows> {
  List<DeleteModel> fetched_data = [];
  List<String> name_list = [];

  var scope=TextEditingController();
  GlobalKey<AutoCompleteTextFieldState<String>> key2 = GlobalKey();
  var _suggestion2 = TextEditingController();
  List<String> added2 = [];
  String currentText2 = "";

  GlobalKey<AutoCompleteTextFieldState<String>> key3 = GlobalKey();
  var _suggestion3 = TextEditingController();
  List<String> added3 = [];
  String currentText3 = "";

  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);

  List<String> agencyType=[];
  var supplier_names;

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

  void getSpecificCodes() async {
    //String RecId=await returnIDOfDOc();
    FirebaseFirestore.instance.collection("Chakan").doc("Supplier").collection(
        "all_")
        .get().then((value)
    {
      value.docs.forEach((element)
      {
        print(element.id);
        String code=element.data()['agencyName'];
        String type=element.data()['agencytype'];
        if(!name_list.contains(code)) {
          name_list.add(code);
          fetched_data.add(DeleteModel(type, code));
        }
      });
      setState(() {

      });
    }
    );
    print(fetched_data);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAttributeValues();
    getScope();

  }

  // Future<String> returnIDOfDOc(String name)
  // async {
  //   String ret="";
  //   await FirebaseFirestore.instance.collection("Chakan")
  //       .doc("Supplier").collection("all_").where("agencyCode",isEqualTo: name.toString())
  //       .get().then((value) => ret=value.docs.first.id.toString());
  //   print(ret);
  //   return ret;
  // }

  Future<String> returnIDOfDOc(String nm,String typ)
  async {
    String ret="";
    await FirebaseFirestore.instance.collection("Chakan")
        .doc("Supplier").collection("all_")
        .get().then((value)
    {
      if(value.docs.isNotEmpty)
      {
        for(var ele in value.docs)
        {
          if(ele.data()['agencyName']==nm.trim()
              &&  ele.data()['agencytype']==typ.trim()
          )
          {
            ret=ele.id;
            break;
          }
          else
          {
            print("Record not present.");
          }
        }
      }
      else{
        print("FAIL No SUCH RECORD !!!!");
      }

    });
    print(ret);
    return ret;
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


  void getScope() async {
    //String RecId=await returnIDOfDOc();
    FirebaseFirestore.instance.collection("Chakan").doc("Supplier").collection(
        "all_")
        .get().then((value)
    {
      value.docs.forEach((element)
      {
        print(element.id);
        String code=element.data()['agencyName'];
        String type=element.data()['agencytype'];
          name_list.add(code);
          fetched_data.add(DeleteModel(type, code));

      });
      setState(() {

      });
    }
    );
    print(fetched_data);
  }





  void deleteItemfinal(String name,String typ) async{
    // FirebaseFirestore firestore2 = FirebaseFirestore.instance;
    String RecId=await returnIDOfDOc(name,typ);
    if(RecId=="")
      {
          _showMyDialog("FAILURE", "SUPPLIER OF GIVEN TYPE AND CODE IS NOT PRESENT !!!!!");
      }
    else
      {
        FirebaseFirestore.instance.collection("Chakan")
            .doc("Supplier")
            .collection("all_")
            .doc(RecId).collection("Scope")
            .get()
            .then((value)
        {
          value.docs.forEach((element)
          {
            FirebaseFirestore.instance.collection("Chakan")
                .doc("Supplier")
                .collection("all_")
                .doc(RecId)
                .collection("Scope")
                .doc(element.id)
                .delete()
                .whenComplete(()
            {
              print("Scope Collection Reemoved");
            }
            );
          });
        });

        FirebaseFirestore.instance.collection("Chakan")
            .doc("Supplier")
            .collection("all_")
            .doc(RecId).collection("Contact_Emails")
            .get()
            .then((value)
        {
          value.docs.forEach((element)
          {
            FirebaseFirestore.instance.collection("Chakan")
                .doc("Supplier")
                .collection("all_")
                .doc(RecId)
                .collection("Contact_Emails")
                .doc(element.id)
                .delete()
                .whenComplete(()
            {
              print("Contact_Emails Collection Reemoved");
            }
            );
          });
        });


        FirebaseFirestore.instance.collection("Chakan")
            .doc("Supplier")
            .collection("all_")
            .doc(RecId).collection("Contact_Name")
            .get()
            .then((value)
        {
          value.docs.forEach((element)
          {
            FirebaseFirestore.instance.collection("Chakan")
                .doc("Supplier")
                .collection("all_")
                .doc(RecId)
                .collection("Contact_Name")
                .doc(element.id)
                .delete()
                .whenComplete(()
            {
              print("Contact_Name Collection Reemoved");
            }
            );
          });
        });

        FirebaseFirestore.instance.collection("Chakan")
            .doc("Supplier")
            .collection("all_")
            .doc(RecId).collection("Contact_Phone")
            .get()
            .then((value)
        {
          value.docs.forEach((element)
          {
            FirebaseFirestore.instance.collection("Chakan")
                .doc("Supplier")
                .collection("all_")
                .doc(RecId)
                .collection("Contact_Phone")
                .doc(element.id)
                .delete()
                .whenComplete(()
            {
              print("Contact_Phone Collection Reemoved");
            }
            );
          });
        });

        FirebaseFirestore.instance.collection("Chakan")
            .doc("Supplier")
            .collection("all_")
            .doc(RecId)
            .delete().whenComplete(()
        {
          setState(() {
            scope.clear();
            _suggestion2.clear();
            _suggestion3.clear();
            fetched_data = [];
            getScope();
          });
        }).then((value) => _showMyDialog("SUCCESS", "Supplier Deleted Successfully :-) !!!"))
            .onError((error, stackTrace) => _showMyDialog("FAIL", "Supplier Delete FAILED :-"));
        //getScope();
        setState(() {

        });
      }

   /* FirebaseFirestore.instance.collection("Chakan")
        .doc("Supplier")
        .collection("all_")
        .doc(RecId)
        .collection("Scope").where('name',isEqualTo: name)
        .get().then((QuerySnapshot querysnapshot) {
      querysnapshot.docs.forEach((element) async {
        await FirebaseFirestore.instance.collection("Chakan")
            .doc("Supplier")
            .collection("all_")
            .doc(RecId)
            .collection("Scope").doc(element.id).delete().whenComplete(() {
          setState(() {
            scope.clear();
            fetched_data = [];
          });
        });
        getScope();
        setState(() {

        });
      });
    }
    );*/


  }



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              Container(
                width: 340,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child:
                  Text("Enter Supplier Name and Type :-"),
                ),
              ),
              SizedBox(width:20),
              Container(
                width: 300,
                height: 37,
                child: SimpleAutoCompleteTextField(
                  key: key2,
                  controller: _suggestion2,
                  clearOnSubmit: false,
                  //suggestions: gauge_type,
                  suggestions: name_list,
                  style: const TextStyle(
                      color: Colors.black, fontSize: 16.0),
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                  textChanged: (text) => currentText2 = text,
                  textSubmitted: (text) => setState(() {
                    if (text != "") {
                      added2.add(text);
                    }
                  }),
                ),
              ),
              SizedBox(width:20),
              Container(
                width: 300,
                height: 37,
                child: SimpleAutoCompleteTextField(
                  key: key3,
                  controller: _suggestion3,
                  clearOnSubmit: false,
                  //suggestions: gauge_type,
                  suggestions: agencyType,
                  style: const TextStyle(
                      color: Colors.black, fontSize: 16.0),
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )),
                  textChanged: (text) => currentText3= text,
                  textSubmitted: (text) => setState(() {
                    if (text != "") {
                      added3.add(text);
                    }
                  }),
                ),
              ),

            ],


          ),



          RaisedButton(
            color: Colors.red,
            child: Text('Delete'),
            onPressed: () {
              deleteItemfinal(_suggestion2.text.toString().trim(),_suggestion3.text.trim().toString());
            },
          ),
          SizedBox(height: 30,),
          fetched_data!=[]? SizedBox(
            width: 900,
            child:  ListView.builder(

              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: fetched_data.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // const SizedBox(
                    //   width: 50.0,
                    // ),
                    Expanded(
                      child: Container(
                        //width: 300,
                        height: 45,
                        decoration: BoxDecoration(border: Border.all(color: Colors.black54)),
                        child: Center(child: Text(fetched_data[index].code,style: TextStyle(fontSize: 20),)),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        //width: 300,
                        height: 45,
                        decoration: BoxDecoration(border: Border.all(color: Colors.black54)),
                        child: Center(child: Text(fetched_data[index].type,style: TextStyle(fontSize: 20),)),
                      ),
                    ),
                    Material(
                      child: InkWell(
                        onTap: () {
                          deleteItemfinal(fetched_data[index].code,fetched_data[index].type);
                          print("Supplier deleted");

                        },
                        child: Container(
                          width: 50,
                          height: 45,
                          decoration: BoxDecoration(border: Border.all(color: Colors.black54)),
                          child: Icon(Icons.delete_outline),
                        ),
                      ),
                    ),

                  ],
                );
                //return ExcelRow(one: fetched_data[index]);
                //var pet = names[index];
                // return Column(
                //   children: [
                //     ListTile(
                //
                //       shape: RoundedRectangleBorder(
                //           side: BorderSide(color: Colors.red, width: 0.5),
                //           borderRadius: BorderRadius.circular(10),
                //
                //       ),
                //       key: ValueKey(index),
                //       enabled: true,
                //       onTap: () async {
                //         var rename = await _showDialog(names[index]);
                //         if (rename != null) {
                //           names[index] = rename;
                //           setState(() {});
                //         }
                //       },
                //       title: Text(names[index]),
                //     ),
                //     SizedBox(height: 20,)
                //   ],
                // );
              },
            ),
          ):Container(color: Colors.red,),
        ],
      ),
    );
  }
}
