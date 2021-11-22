import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'EditSupplier.dart';
import 'ScopeDataModel.dart';
import 'SupplierDataModel.dart';

class ViewSupplier extends StatefulWidget {
  const ViewSupplier({Key? key}) : super(key: key);

  @override
  _ViewSupplierState createState() => _ViewSupplierState();
}

class _ViewSupplierState extends State<ViewSupplier> {
  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);

  var agencyCode=TextEditingController();
  late SupplierDataModel model;
  late ScopeDataModel scmodel;
  List<String> scopeList=[];

  void fetchSupplierRecord()
  {
        FirebaseFirestore.instance.collection("Chakan").doc("Supplier").collection("all_")
            .where("agencyCode",isEqualTo:agencyCode.text.toString()).get().then((value)
        async {
            value.docs.forEach((element) async {

              await FirebaseFirestore.instance.collection("Chakan").doc("Supplier").collection("all_")
                  .doc(element.id).get().then((val)
                  async {
                        model= new SupplierDataModel.toJson(val.data());
                        await  FirebaseFirestore.instance.collection("Chakan").doc("Supplier").collection("all_")
                            .doc(element.id).collection("Scope").get().then((abc)
                        {
                          //model= new SupplierDataModel.toJson(val.data());
                          abc.docs.forEach((ele) {
                            scmodel=new ScopeDataModel.toJSON(ele.data());
                            scopeList.add(scmodel.scopeItem);
                          });

                        }
                        );
                        print(model.scontactnm.toString()+scopeList.toString());
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new EditSupplier(supplierModel: model, scopedatamodel: scopeList),
                          ),
                        );
                  }
              );
                  }
              );
            //print(model);

        }
        );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          backgroundColor: lred,
          appBar: AppBar(
            toolbarHeight: 50,
            backgroundColor: backred,
            title: const Text(
              "Add Supplier",
              style:  TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),

        body:Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:
                      [
                        Text("Supplier Agency Code",style: TextStyle(color: Colors.black,fontSize: 18),textAlign: TextAlign.start,),
                        SizedBox(width: 20,),
                        Container(
                          width: 300,
                          height:37.0,
                          child: TextField(
                            enabled: true,
                            controller: agencyCode,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              //  labelText: "Gauge Type",
                              border: OutlineInputBorder(),

                            ),),
                        ),
                      ]
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  Container(
                    height: 40,
                    width: 0.2 * MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xffDF3F3F)),
                      ),
                      onPressed: fetchSupplierRecord,
                      child: Text(
                        " Edit Details",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),


                ],
              ),
            ),
        ),

)
    );
  }
}

