import 'package:autocomplete_textfield_ns/autocomplete_textfield_ns.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class delete_Supplier_Rows extends StatefulWidget {
  const delete_Supplier_Rows( {Key? key}) : super(key: key);

  @override
  _delete_Supplier_RowsState createState() => _delete_Supplier_RowsState();
}

class _delete_Supplier_RowsState extends State<delete_Supplier_Rows> {
  List<String> fetched_data = [];
  var scope=TextEditingController();
  GlobalKey<AutoCompleteTextFieldState<String>> key2 = GlobalKey();
  var _suggestion2 = TextEditingController();
  List<String> added2 = [];
  String currentText2 = "";
  var supplier_code;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getScope();

  }

  Future<String> returnIDOfDOc(String name)
  async {
    String ret="";
    await FirebaseFirestore.instance.collection("Chakan")
        .doc("Supplier").collection("all_").where("agencyCode",isEqualTo: name.toString())
        .get().then((value) => ret=value.docs.first.id.toString());
    print(ret);
    return ret;
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
        String code=element.data()['agencyCode'];
        fetched_data.add(code);
      });
      setState(() {

      });
    }
    );
    print(fetched_data);
  }



  void deleteItemfinal(String name) async{
    // FirebaseFirestore firestore2 = FirebaseFirestore.instance;
    String RecId=await returnIDOfDOc(name);

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
        fetched_data = [];
      });
    });
    getScope();
    setState(() {

    });
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
          // SizedBox(
          //   width: 340,
          //   child: Padding(
          //     padding: EdgeInsets.all(20),
          //     child: TextField(
          //       controller: scope,
          //       decoration: InputDecoration(
          //         border: OutlineInputBorder(),
          //         labelText: 'Enter Scope ',
          //       ),
          //     ),
          //   ),
          // ),
          Container(
            width: 300,
            height: 37,
            child: SimpleAutoCompleteTextField(
              key: key2,
              controller: _suggestion2,
              clearOnSubmit: false,
              //suggestions: gauge_type,
              suggestions: fetched_data,
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

          RaisedButton(
            color: Colors.red,
            child: Text('Delete'),
            onPressed: () {
              deleteItemfinal(_suggestion2.text.toString());
            },
          ),
          SizedBox(height: 30,),
          fetched_data!=[]? SizedBox(
            width: 400,
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
                        child: Center(child: Text(fetched_data[index],style: TextStyle(fontSize: 20),)),
                      ),
                    ),
                    Material(
                      child: InkWell(
                        onTap: () {
                          deleteItemfinal(fetched_data[index]);
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
