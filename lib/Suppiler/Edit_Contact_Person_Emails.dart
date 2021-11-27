import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Edit_Contact_Person_Emails extends StatefulWidget {
  final String supplier_code;
  const Edit_Contact_Person_Emails( {Key? key,required this.supplier_code}) : super(key: key);

  @override
  _Edit_Contact_Person_EmailsState createState() => _Edit_Contact_Person_EmailsState();
}

class _Edit_Contact_Person_EmailsState extends State<Edit_Contact_Person_Emails> {
  List<String> fetched_data = [];
  var scope=TextEditingController();

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
        .doc("Supplier").collection("all_").where("agencyCode",isEqualTo: widget.supplier_code.toString())
        .get().then((value) => ret=value.docs.first.id.toString());
    print(ret);
    return ret;
  }

  void getScope() async {
    String RecId=await returnIDOfDOc();
    FirebaseFirestore.instance.collection("Chakan").doc("Supplier").collection(
        "all_")
        .doc(RecId).collection("Contact_Emails").get().then((value)
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
        .collection("Contact_Emails").add({'name':scope.text.toString()}).whenComplete(()  {
      print("Emails added Successfully");
      setState(() {
        //final_list2 =[];
        scope.clear();
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
        .collection("Contact_Emails").where('name',isEqualTo: name)
        .get().then((QuerySnapshot querysnapshot) {
      querysnapshot.docs.forEach((element) async {
        await FirebaseFirestore.instance.collection("Chakan")
            .doc("Supplier")
            .collection("all_")
            .doc(RecId)
            .collection("Contact_Emails").doc(element.id).delete().whenComplete(() {
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
                  labelText: 'Enter Contact Emails ',
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
                          print("Contact_Emails deleted");

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
              },
            ),
          ):Container(color: Colors.red,),
        ],
      ),
    );
  }
}
