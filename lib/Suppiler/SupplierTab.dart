import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_iap_project/Suppiler/ViewData/view_data_ui.dart';
import 'package:flutter_iap_project/Suppiler/delete_Supplier.dart';
import 'addSupplier.dart';

class SupplierTab extends StatefulWidget {
  const SupplierTab({Key? key}) : super(key: key);

  @override
  _SupplierTabState createState() => _SupplierTabState();
}

class _SupplierTabState extends State<SupplierTab> {

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
                        builder: (context) => new AddSupplier(type: agencyType,),
                      ),
                    );
                  },
                  label: Text("Add Supplier",
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
                        builder: (context) => new view_data_ui(),
                      ),
                    );
                  },
                  child: Text("View Suppliers",
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
                        builder: (context) => new deleteSupplier(),
                      ),
                    );
                  },
                  child: Text("Delete Supplier",
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

