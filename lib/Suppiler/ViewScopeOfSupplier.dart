import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewScopeOfSupplier extends StatefulWidget {
  final String supplier_code;
  const ViewScopeOfSupplier( {Key? key,required this.supplier_code}) : super(key: key);

  @override
  _ViewScopeOfSupplierState createState() => _ViewScopeOfSupplierState();
}

class _ViewScopeOfSupplierState extends State<ViewScopeOfSupplier> {
  List<String> fetched_data = [];
  var scope=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getScope();

  }

  void getScope() {
     FirebaseFirestore.instance.collection("Chakan").doc("Supplier").collection(
        "all_")
        .doc(widget.supplier_code.toString()).collection("Scope").get().then((value)
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

  void addItemToList() {
    FirebaseFirestore.instance.collection("Chakan")
        .doc("Supplier")
        .collection("all_")
        .doc(widget.supplier_code.toString())
        .collection("Scope").add({'name':scope.text.toString()}).then((value) {
      print("Scope added Successfully");
      setState(() {
        //final_list2 =[];
        scope.clear();
        fetched_data=[];
      });
      getScope();
    });
    // getData();
    //nctrl2.clear();
    //Provider.of<RefreshManager>(context,listen:false).isrefreshed=true;


  }

  void deleteItemfinal(String name) {
    // FirebaseFirestore firestore2 = FirebaseFirestore.instance;
    FirebaseFirestore.instance.collection("Chakan")
        .doc("Supplier")
        .collection("all_")
        .doc(widget.supplier_code.toString())
        .collection("Scope").where('name',isEqualTo: name)
        .get().then((QuerySnapshot querysnapshot) {

        querysnapshot.docs.forEach((element) async {
          await FirebaseFirestore.instance.collection("Chakan")
              .doc("Supplier")
              .collection("all_")
              .doc(widget.supplier_code.toString())
              .collection("Scope").doc(element.id).delete();
        });

      setState(() {
        //final_list2 =[];
        scope.clear();
        fetched_data=[];
      });
      getScope();
    }
    );


  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 340,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: scope,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Scope ',
                ),
              ),
            ),
          ),
          RaisedButton(
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
