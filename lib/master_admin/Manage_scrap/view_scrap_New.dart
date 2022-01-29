import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_iap_project/master_admin/Manage_scrap/NewView/view_ALL_Scrap.dart';
import 'package:flutter_iap_project/master_admin/Manage_scrap/ViewScrap.dart';
import 'NewView/ViewScrap_ui.dart';

class view_Scrap_new extends StatefulWidget {
  const view_Scrap_new({Key? key}) : super(key: key);

  @override
  _view_Scrap_newState createState() => _view_Scrap_newState();
}

class _view_Scrap_newState extends State<view_Scrap_new> {

  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);
  List<String> agencyType=[];

  void fetchAttributeValues()
  async {
    await FirebaseFirestore.instance.collection("Chakan").doc(
        "SupplierAttributes").collection("AgencyType")
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        querySnapshot.docs.forEach((doc) {
          agencyType.add(doc['name'].toString().trim());
        });
      } else {
        print('The Result is Empty');
      }
      setState(() {

      });
      print("AgencyType: $agencyType");

      //.then((value)
      //{
      //   value.docs.forEach((element) {
      //     print("HI");
      //     element.data().entries.forEach((ele)
      //     {
      //       agencyType.add(ele.value);print(ele.value);
      //     });
      //   });
      // }).catchError(onError);
      // print(agencyType);
      // setState(() {
      //
      // });

    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // return_all_subCollections_List ab=return_all_subCollections_List("WPPLP00756","Calibration");
    // Future<List<String>> x=ab.getNames();
    // print(x);
    fetchAttributeValues();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: backred,
          title: Text(
            "View Scrap",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),

        backgroundColor: lred,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 0.2 * MediaQuery.of(context).size.width,
                height:50.0,
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(backred),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: backred)
                      ),),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => new View_Scrap_UI(),
                      ),
                    );
                  },
                  label: Text("View Scrap By Type",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 24.0,
                  ),
                ),
              ),
              SizedBox(height: 100,),
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
                      ),
                    ),),
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => new viewScrapByDate_UI(),
                      ),
                    );
                  },
                  child: Text("View Scrap By Date",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold

                    ),
                  ),

                ),
              ),
              SizedBox(height: 100,),
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
                      ),
                    ),),
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) => new view_ALL_Scrap(),
                      ),
                    );
                  },
                  child: Text("View All Scrap",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold

                    ),
                  ),

                ),
              ),
              

            ],

          ),

        ),
      ),
    );
  }
}
onError() {
  print("Error In fetching data.");
}

