import 'package:autocomplete_textfield_ns/autocomplete_textfield_ns.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class demoViewScopeOfSupplier extends StatefulWidget {
  final String supplier_code;
  final String stype;
  const demoViewScopeOfSupplier( {Key? key,required this.supplier_code,required this.stype}) : super(key: key);

  @override
  _demoViewScopeOfSupplierState createState() => _demoViewScopeOfSupplierState();
}

class _demoViewScopeOfSupplierState extends State<demoViewScopeOfSupplier> {
  List<String> fetched_data = [];
  var _suggestion=TextEditingController();

  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
  List<String> added = [];
  String currentText = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getScope();

  }

  Future<String> returnIDOfDOc()
  async {
    String ret="";
    await FirebaseFirestore.instance.collection("Chakan")
        .doc("Supplier").collection("all_")
        .get().then((value)
    {
            for(var ele in value.docs)
            {
              if(ele.data()['agencyCode']==widget.supplier_code.trim()
              &&  ele.data()['agencytype']==widget.stype.trim()
              )
                {
                    ret=ele.id;
                    return ret;
                }
              else
                {
                  print("Record not present.");
                }
            }
    });
    print(ret);
    return ret;
  }



  void getScope() async {
    String RecId=await returnIDOfDOc();
    FirebaseFirestore.instance.collection("Chakan").doc("Supplier").collection(
        "all_")
        .doc(RecId).collection("Scope").get().then((value)
    {
      value.docs.forEach((element)
      {
        element.data().entries.forEach((ele) {
          fetched_data.add(ele.value);
          print(ele.value);
        });
      });
      setState(() {

      });
    }
    );
    print(fetched_data);
  }

  void addItemToList()
  async{
    String RecId=await returnIDOfDOc();

    FirebaseFirestore.instance.collection("Chakan")
        .doc("Supplier")
        .collection("all_")
        .doc(RecId)
        .collection("Scope").add({'name':_suggestion.text.toString().trim().toUpperCase()}).whenComplete(()  {
      print("Scope added Successfully");
      setState(() {
        //final_list2 =[];
        _suggestion.clear();
        fetched_data=[];
      });
      getScope();
      setState(() {

      });
    });


  }

  void deleteItemfinal(String name) async{
    // FirebaseFirestore firestore2 = FirebaseFirestore.instance;
    String RecId=await returnIDOfDOc();

    FirebaseFirestore.instance.collection("Chakan")
        .doc("Supplier")
        .collection("all_")
        .doc(RecId)
        .collection("Scope").where('name',isEqualTo: name.trim().toUpperCase())
        .get().then((QuerySnapshot querysnapshot) {
      querysnapshot.docs.forEach((element) async {
        await FirebaseFirestore.instance.collection("Chakan")
            .doc("Supplier")
            .collection("all_")
            .doc(RecId)
            .collection("Scope").doc(element.id).delete().whenComplete(() {
          setState(() {
            _suggestion.clear();
            fetched_data = [];
          });
        });
        getScope();
        setState(() {

        });
      });
    }
    );


  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 300,
            height: 37,
            child: SimpleAutoCompleteTextField(
              key: key,
              controller: _suggestion,
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
              textChanged: (text) => currentText= text,
              textSubmitted: (text) => setState(() {
                if (text != "") {
                  added.add(text);
                }
              }),
            ),
          ),          RaisedButton(
            color: Colors.red,
            child: Text('Add'),
            onPressed: () {
              addItemToList();
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
                          print("Scope deleted");

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
