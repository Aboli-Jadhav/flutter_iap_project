import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';



class update_item extends StatefulWidget {

  @override
  _update_itemState createState() => _update_itemState();
}

class _update_itemState extends State<update_item> {

  final List<String> names = <String>['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5', 'Item 6', 'Item 7', 'Item 8'];
  late String newName;
  late String addName;
  TextEditingController nctrl = TextEditingController();
  TextEditingController nctrl2 = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<String> fetched_data = [];

  _changePetName() {
    newName = nctrl.text;
    Navigator.pop(context, newName);
    return newName;
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData()  {

    //sleep(Duration(seconds:1));
    //Duration(seconds: 2);

    firestore
        .collection("Chakan")
        .doc("Attributes")
        .collection("gauge frequency")
        .get()
        .then((QuerySnapshot querysnapshot) {
      if (querysnapshot.docs.isNotEmpty) {
        fetched_data.clear();
        querysnapshot.docs.forEach((doc) {
          fetched_data.add(doc["name"]);
        });
        print(fetched_data);
        //return fetched_data;
        setState(() {

        });
      }
    }).catchError((onError) => print("update_item 41: could not fetch data"));



  }

  void addItemToList() {
    firestore
        .collection("Chakan")
        .doc("Attributes")
        .collection("gauge frequency")
        .add({'name': nctrl2.text}).whenComplete(()
        {
            print("Data added Successfully");
            setState(() {
              //final_list2 =[];
              nctrl2.clear();
              fetched_data=[];
            });
            getData();
      });
    // getData();
    //nctrl2.clear();
    //Provider.of<RefreshManager>(context,listen:false).isrefreshed=true;


  }

  void deleteItemfinal(String name) {
   // FirebaseFirestore firestore2 = FirebaseFirestore.instance;

    firestore
        .collection("Chakan")
        .doc("Attributes")
        .collection("gauge frequency")
        .where('name', isEqualTo: name)
        .get()
        .then((QuerySnapshot querysnapshot)
        {
          if (querysnapshot.docs.isNotEmpty)
          {
            querysnapshot.docs.forEach((element) async
            {
              await element.reference.delete().whenComplete(()
              {
                  setState(() {
                    nctrl2.clear();
                    fetched_data=[];
                  });
              });
              getData();
              setState(() {
                //final_list2 =[];

              });
            });

            //Provider.of<RefreshManager>(BuildContext context, listen: false)
          }
      });
  }

  Future<String?> _showDialog(String name) async {
    nctrl.text = name;
    return await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 5,
          backgroundColor: Colors.white70,
          title: Text(
            "New Description",
          ),
          content: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: nctrl,
                    onChanged: (e) {
                    },
                  ),
                ],
              )),
          actions: <Widget>[
            //
            // FlatButton(
            //   color: Colors.red,
            //   child: Text("Close"),
            //   onPressed: () {
            //     Navigator.of(context).pop(nctrl.text);
            //   },
            // ),
            // SizedBox(width: 60,),
            FlatButton(
              color: Colors.red,
              child: Text(
                "Submit",
              ),
              onPressed: () {
                var updateName = _changePetName();
                return updateName;
              },
            ),
          ],
        );
      },
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
                  controller: nctrl2,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Item Name',
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
              width: 600,
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
                            showAlertDialog(context,index);
                            print("Item deleted");

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
  showAlertDialog(BuildContext context,var index) {

    Widget cancelButton = TextButton(
      child: Text("NO"),
      onPressed: () {Navigator.of(context).pop();},
    );
    Widget launchButton = TextButton(
      child: Text("YES"),
      onPressed: () {
        deleteItemfinal(fetched_data[index]);
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Center(child: Text("Alert")),
      content: Text(
          "Do You Really Want To Delete"),
      actions: [
        cancelButton,
        launchButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class ExcelRow extends StatelessWidget {
  final String one;

  const ExcelRow({
    Key? key,
    required this.one,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = 35;
    Color color = Colors.black54;

    return Row(
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
            child: Center(child: Text(one)),
          ),
        ),
        Material(
          child: InkWell(
            onTap: () {
              //deleteItem(one);
              print("Item deleted");

            },
            child: Container(
              width: 50,
              height: height,
              decoration: BoxDecoration(border: Border.all(color: color)),
              child: Icon(Icons.delete_outline),
            ),
          ),
        ),

      ],
    );
  }

}

void deleteItem(String name) {
  FirebaseFirestore firestore2 = FirebaseFirestore.instance;

  firestore2
      .collection("Chakan")
      .doc("Attributes")
      .collection("gauge frequency")
      .where('name', isEqualTo: name)
      .get()
      .then((QuerySnapshot querysnapshot) {
    if (querysnapshot.docs.isNotEmpty) {
      querysnapshot.docs.forEach((element) {
        element.reference.delete();
      });
      //Provider.of<RefreshManager>(BuildContext context, listen: false)
    }
  });
}

