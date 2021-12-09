import 'package:autocomplete_textfield_ns/autocomplete_textfield_ns.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_iap_project/master_admin/Manage_scrap/ScrapDataModel.dart';
import 'package:flutter_iap_project/master_admin/Manage_scrap/view_scrap_by_type_LIST.dart';
import 'package:fluttertoast/fluttertoast.dart';

class View_Scrap_UI extends StatefulWidget {
  const View_Scrap_UI({Key? key}) : super(key: key);

  @override
  _View_Scrap_UIState createState() => _View_Scrap_UIState();
}

class _View_Scrap_UIState extends State<View_Scrap_UI> {

  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);
  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
  List<String> added = [];
  String currentText = "";

  var guage_type=TextEditingController();

  List<ScrapDataModel> fetched_list=[];
  int show=0;

  var _chosenValue;
  List<String> guageTypes=[];

  void getScopes() async {
    await FirebaseFirestore.instance.collection("Chakan").doc("Attributes").collection(
        "gauge types")
        .get().then((value)
    {
      print("First"+value.docs.first.id);
      value.docs.forEach((element)
      {
        element.data().entries.forEach((ele) {
          guageTypes.add(ele.value);
          print(ele.value);
        });
      });
      setState(() {

      });
    }
    ).onError((error, stackTrace) => _showMyDialog("Problem", "ERROR OCCURED S1 !!!!!!!"));
    print(guageTypes);
  }

   _showMyDialog(String title,String str) async {
    //BuildContext context;
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
  void initState() {
    // TODO: implement initState
    super.initState();
    getScopes();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
        appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: backred,
        title: Text("Manage Scrap",
        style: TextStyle(
        color: Colors.white,
        fontSize: 30.0,
        fontWeight: FontWeight.bold,

    ),
    ),
    centerTitle: true,
    ),

          body:Center(
            child: Container(
              //padding: EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.white,
                    width: 0.3 * MediaQuery.of(context).size.width,
                    child: SimpleAutoCompleteTextField(
                      key: key,
                      controller: guage_type,
                      clearOnSubmit: false,
                      //suggestions: gauge_type,
                      suggestions: guageTypes,
                      style: const TextStyle(color: Colors.black, fontSize: 16.0),
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintText: "Enter the Gauge Type",
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

                          added.add(text);
                        }
                      }),
                    ),
                  ),

                  SizedBox(height: 30,),

                  Container(
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
                      onPressed: ()
                      async {
                             //fetchAll();
                             Navigator.push(context,
                             MaterialPageRoute(builder: (context) => view_Scrap_by_type_LIST(guage_type: guage_type.text.toString(),))
                             );

                      },
                      child: Text("View Scrap",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ),
                  ),
                ],
              ),
            ),
          )
    ),
    );
  }
}
