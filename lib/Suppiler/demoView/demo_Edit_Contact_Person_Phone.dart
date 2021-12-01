import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class demo_Edit_Contact_Person_Phones extends StatefulWidget {
  final String supplier_code;
  final String stype;
  const demo_Edit_Contact_Person_Phones( {Key? key,required this.supplier_code,required this.stype}) : super(key: key);

  @override
  _demo_Edit_Contact_Person_PhonesState createState() => _demo_Edit_Contact_Person_PhonesState();
}

class _demo_Edit_Contact_Person_PhonesState extends State<demo_Edit_Contact_Person_Phones> {
  List<String> fetched_data = [];
  var scope=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNames();

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

  void getNames() async {
    String RecId=await returnIDOfDOc();
    FirebaseFirestore.instance.collection("Chakan").doc("Supplier").collection(
        "all_")
        .doc(RecId).collection("Contact_Phone").get().then((value)
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
        .collection("Contact_Phone").add({'name':scope.text.toString().trim()}).whenComplete(()  {
      print("Phone No added Successfully");
      setState(() {
        //final_list2 =[];
        scope.clear();
        fetched_data=[];
      });
      getNames();
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
        .collection("Contact_Phone").where('name',isEqualTo: name.trim())
        .get().then((QuerySnapshot querysnapshot) {
      querysnapshot.docs.forEach((element) async {
        await FirebaseFirestore.instance.collection("Chakan")
            .doc("Supplier")
            .collection("all_")
            .doc(RecId)
            .collection("Contact_Phone").doc(element.id).delete().whenComplete(() {
          setState(() {
            scope.clear();
            fetched_data = [];
          });
        });
        getNames();
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
          SizedBox(
            width: 340,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: scope,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Contact Mobile No ',
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
                          print("Person Contact deleted");

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
