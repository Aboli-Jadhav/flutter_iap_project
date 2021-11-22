import 'package:autocomplete_textfield_ns/autocomplete_textfield_ns.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iap_project/Admin/Add%20gauges/custom_dialog_box.dart';
import 'View_AdminList.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../AdminDataModel.dart';
import 'package:fluttertoast/fluttertoast.dart';


class View_AdminList_DropDown extends StatefulWidget {

  final List<String> gauge_location;

  const View_AdminList_DropDown({Key? key,required this.gauge_location}) : super(key: key);

  @override
  _View_AdminList_DropDownState createState() => _View_AdminList_DropDownState();
}

class _View_AdminList_DropDownState extends State<View_AdminList_DropDown> {

  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);
  List<AdminDataModel> locAdmins=[];
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<String> fetched_data = [];
  var _chosenValue;
  List<String> locations=[
    'Nagpur',
    'Chakan',
    'Shirdi',
  ];
  var _selected_gauges;
  String delete_location='';


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  void getData(String location)  {

    firestore
        .collection("Chakan")
        .doc("Admin_User")
        .collection("All_AdminUser")
    .where("Location",isEqualTo: location.trim())
        .get()
        .then((QuerySnapshot querysnapshot) {
          print("then successfull...");
      if (querysnapshot.docs.isNotEmpty) {
        print("Admin list at ${location} is not empty");
        fetched_data.clear();
        querysnapshot.docs.forEach((doc) {
          fetched_data.add(doc["Name"]);
        });
        print("Admin list at ${location} is : ${fetched_data}");
        //return fetched_data;
        setState(() {

        });
      }
      else{
        print("Admin list at ${location} is empty");
      }
    }).catchError((onError) => print("view_adminlist_dropdown 67: could not fetch data"));
  }

  void deleteItemfinal(String name, String location) {
    // FirebaseFirestore firestore2 = FirebaseFirestore.instance;
    firestore
        .collection("Chakan")
        .doc("Admin_User")
        .collection("All_AdminUser")
        //.where('Location', isEqualTo: location)
         .where('Name', isEqualTo: name)
        .get()
        .then((QuerySnapshot querysnapshot) {
      if (querysnapshot.docs.isNotEmpty) {
        querysnapshot.docs.forEach((element) async {
          if(element["Location"]==location){
            await element.reference.delete();
            print("Item deleted");
            // TODO: delete Admin from Firebase Auth also
          }

        });
        setState(() {
          //final_list2 =[];
          //nctrl2.clear();
          fetched_data=[];
        });

      }
    });
  }


  // List<AdminDataModel> adminlist=[
  //   AdminDataModel("Aaa", "Chakan", "aaa.zzz@wpp.in", "1234567890"),
  //   AdminDataModel("BBB", "Chakan", "aaa.zzz@wpp.in", "1111111111"),
  //   AdminDataModel("CCC", "Chakan", "aaa.zzz@wpp.in", "2222222222"),
  //   AdminDataModel("DDD", "Nagpur", "aaa.zzz@wpp.in", "3333333333"),
  //   AdminDataModel("EEE", "Nagpur", "aaa.zzz@wpp.in", "4444444444"),
  //   AdminDataModel("FFF", "Chakan", "aaa.zzz@wpp.in", "5555555555"),
  //   AdminDataModel("ZZZ", "Nagpur", "aaa.zzz@wpp.in", "6666666666"),
  //   AdminDataModel("GGG", "Chakan", "aaa.zzz@wpp.in", "7777777777"),
  //   AdminDataModel("HHH", "Chakan", "aaa.zzz@wpp.in", "8888888888"),
  //   AdminDataModel("EEE", "Chakan", "aaa.zzz@wpp.in", "9999999999"),
  //   AdminDataModel("TYU", "Nagpur", "aaa.zzz@wpp.in", "1212121212"),
  //   AdminDataModel("NBN", "Nagpur", "aaa.zzz@wpp.in", "2323232323"),
  //   AdminDataModel("XXX", "Chakan", "aaa.zzz@wpp.in", "2525252524"),
  //   AdminDataModel("GGG", "Nagpur", "aaa.zzz@wpp.in", "8787878787"),
  // ];
  //
  // void handleDropChange(String ?val)
  // {
  //   setState(() {
  //     _chosenValue=val;
  //     for(int i=0;i<adminlist.length;i++)
  //     {
  //       if(_chosenValue.toString()==adminlist[i].location.toString())
  //       {
  //         locAdmins.add(adminlist[i]);
  //       }
  //     }
  //     Navigator.push(context, MaterialPageRoute(builder: (_) => View_Admin_List(adminList: locAdmins)));
  //
  //
  //
  //   });
  // }

  // Widget createList(List<AdminDataModel> locAdmins)
  // {
  //   return ListView.builder(
  //     itemCount: locAdmins.length,
  //     itemBuilder: (_,index)
  //     {
  //       print(locAdmins[index].location);
  //       return setUI(locAdmins[index].admin_nm, locAdmins[index].location, locAdmins[index].email, locAdmins[index].phone);
  //
  //     },
  //   );
  // }

  // Widget setUI(String anm,String loc,String email,String phone)
  // {
  //   return new GestureDetector(
  //     onTap: (){},
  //     onLongPress: (){},
  //     child: Card(
  //       child: Container(
  //         child: Column(
  //           children: <Widget>[
  //             Text(
  //               "Admin Name:- "+anm,
  //               textAlign: TextAlign.left,
  //               style: TextStyle(
  //                 fontSize: 20.0,
  //                 fontWeight: FontWeight.bold,
  //
  //               ),
  //             ),
  //
  //             Text(
  //               "Email :- "+email,
  //               textAlign: TextAlign.left,
  //               style: TextStyle(
  //                 fontSize: 20.0,
  //                 fontWeight: FontWeight.bold,
  //
  //               ),
  //             ),
  //
  //             Text(
  //               "Location:- "+loc,
  //               textAlign: TextAlign.left,
  //               style: TextStyle(
  //                 fontSize: 20.0,
  //                 fontWeight: FontWeight.bold,
  //
  //               ),
  //             ),
  //
  //             Text(
  //               "Contact No:-"+phone,
  //               textAlign: TextAlign.left,
  //               style: TextStyle(
  //                 fontSize: 20.0,
  //                 fontWeight: FontWeight.bold,
  //
  //               ),
  //             ),
  //
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
  List<String> added = [];
  String currentText = "";
  TextEditingController gauge_location = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
      child:Scaffold(


        body: ListView(
          children: <Widget>[
            Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 50.0,),

                  // Container(
                  //   width: 0.3*MediaQuery.of(context).size.width,
                  //   height: 50,
                  //   padding: EdgeInsets.fromLTRB(20,10,10,10),
                  //   decoration: BoxDecoration(
                  //       color: Colors.grey[100],
                  //       border: Border.all(color: Colors.black),
                  //       borderRadius: BorderRadius.all(Radius.circular(5))
                  //   ),
                  //
                  //   child: DropdownButtonHideUnderline(
                  //     child: DropdownButton<String>(
                  //       value: _chosenValue,
                  //       //elevation: 5,
                  //       style: TextStyle(color: Colors.black),
                  //
                  //       items: locations.map<DropdownMenuItem<String>>((String value) {
                  //         return DropdownMenuItem<String>(
                  //           value: value,
                  //           child: Text(value),
                  //         );
                  //       }).toList(),
                  //       hint: Text(
                  //         "Select The Location",
                  //
                  //       ),
                  //
                  //       onChanged:handleDropChange,
                  //     ),
                  //   ),
                  // ),

                  Container(
                    color: Colors.white,
                    width: 0.3 * MediaQuery.of(context).size.width,
                    child: SimpleAutoCompleteTextField(
                      key: key,
                      controller: gauge_location,
                      clearOnSubmit: false,
                      //suggestions: gauge_type,
                      suggestions: widget.gauge_location,
                      style: const TextStyle(color: Colors.black, fontSize: 16.0),
                      decoration: InputDecoration(
                        hintText: "Enter Location of Admins",
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )),
                      textChanged: (text) {
                        currentText = text;

                      },
                      textSubmitted: (text) => setState(() {
                        if (text != "") {
                          //_gauges.clear();
                          Fluttertoast.showToast(
                              msg: text.toString(),
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);

                          fetched_data = [];
                          getData(text.toString());
                          delete_location = text.toString();

                          added.add(text);
                        }
                      }),
                    ),
                  ),

                  SizedBox(height: 50.0,),
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
                                  //TODO add dialog box
                                  //CustomDialogBox(title: "Are you sure you want to delete?", descriptions: "Admin ${fetched_data[index]} from Location ${delete_location} will be deleted", text: "XYZ");
                                  deleteItemfinal(fetched_data[index],delete_location);
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
                 /*Container(
                    width: 0.2 * MediaQuery.of(context).size.width,
                    height:50.0,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(backred),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: backred)
                          ),),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => View_Admin_List(adminList: locAdmins)));
                      },
                      child: Text("View Admins",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ),
                  ),*/

                ]
            ),
          ],
        ),
      ),
    );
  }
}
