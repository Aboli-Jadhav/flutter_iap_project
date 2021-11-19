import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iap_project/Admin/view_gauge_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:editable/editable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_iap_project/Admin/showgauge.dart';

class view_master_gau extends StatefulWidget {
  final String selectedValue;
  final String selected_option;

  const view_master_gau(
      {Key? key, required this.selectedValue, required this.selected_option})
      : super(key: key);

  @override
  _view_master_gauState createState() => _view_master_gauState();
}

class _view_master_gauState extends State<view_master_gau> {
  Color backred = Color(0xffDF3F3F);
  Color lred = Color(0xffFBEBEB);
  String final_selectedValue = '';
  List<ViewGaugeModel> fetched_list = [];

  // List<ExcelRow> itemList = [
  //   const ExcelRow(one: "1", two: "1", three: "1", four: "1", five: "1"),
  //   const ExcelRow(one: "1", two: "1", three: "1", four: "1", five: "1"),
  //   const ExcelRow(one: "1", two: "1", three: "1", four: "1", five: "1"),
  //   const ExcelRow(one: "1", two: "1", three: "1", four: "1", five: "1"),
  //   const ExcelRow(one: "1", two: "1", three: "1", four: "1", five: "1"),
  //   const ExcelRow(one: "1", two: "1", three: "1", four: "1", five: "1"),
  //   const ExcelRow(one: "1", two: "1", three: "1", four: "1", five: "1"),
  //   const ExcelRow(one: "1", two: "1", three: "1", four: "1", five: "1"),
  // ];

  int show = 0;

  void fetchData() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore
        .collection("Chakan")
        .doc("Gauges")
        .collection("All gauges")
        .where(widget.selectedValue, isEqualTo: widget.selected_option)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        querySnapshot.docs.forEach((doc) {
          ViewGaugeModel model = ViewGaugeModel(
              doc['calibration_agency_name'],
              doc['calibration_cost'],
              doc['calibration_date'],
              doc['calibration_due_date'],
              doc['calibration_frequency'],
              doc['gauge_cost'],
              doc['gauge_life'],
              doc['gauge_location'],
              doc['gauge_make'],
              doc['gauge_type'],
              doc['identification_number'],
              doc['invoice_date'],
              doc['invoice_number'],
              doc['item_code'],
              doc['manufacturer_serial_number'],
              doc['maximum'],
              doc['minimum'],
              doc['nominal_size'],
              doc['remark'],
              doc['plant'],
            doc['certificate_number'],
            doc['nabl_accrediation_status'],
            doc['process_owner'],
            doc['process_owner_mail_id'],
            doc['unit'],
            doc['acceptance_criteria'],
          );
          fetched_list.add(model);
        });
        setState(() {
          show = 1;
        });
        print("Fetched list: ${fetched_list[0].calibration_agency_name}");
      }else{
        print("view_master_gauge 86 : OOPS file doesn't exists");
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    show = 0;
    Fluttertoast.showToast(
        msg: "${widget.selectedValue}\n${widget.selected_option}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 50,
            backgroundColor: backred,
            title: Text(
              "View Gauge",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(50.0, 30, 50, 15),
                child: ExcelRowHeading(
                    one: "Gauge ID No.",
                    two: "Gauge Type",
                    three: "Gauge Size",
                    four: "Due Date",
                    five: "Location"),
              ),
              show == 1
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50.0, vertical: 30.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: fetched_list.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ExcelRow(
                              // one:
                              //     fetched_list[index].identification_number,
                              // two: fetched_list[index].gauge_type,
                              // three: fetched_list[index].nominal_size,
                              // four:
                              //     fetched_list[index].calibration_due_date,
                              // five: fetched_list[index].gauge_location
                             model: fetched_list[index],
                          );
                        },
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            ],
          )),
    );
  }
}

class ExcelRowHeading extends StatelessWidget {
  final String one;
  final String two;
  final String three;
  final String four;
  final String five;

  const ExcelRowHeading(
      {Key? key,
      @required this.one = "",
      @required this.two = "",
      @required this.three = "",
      @required this.four = "",
      @required this.five = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = 35;
    Color color = Colors.black54;

    return Material(
        child: InkWell(
      onTap: () => print('whole row clicked'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // const SizedBox(
          //   width: 50.0,
          // ),
          Expanded(
            child: Center(
              child: Text(
                one,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
              ),
            ),
          ),
          Expanded(
            child: Center(
                child: Text(
              two,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
            )),
          ),
          Expanded(
            child: Center(
                child: Text(
              three,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
            )),
          ),
          Expanded(
            child: Center(
                child: Text(
              four,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
            )),
          ),
          Expanded(
            child: Center(
                child: Text(
              five,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
            )),
          ),

          // const SizedBox(
          //   width: 50.0,
          // ),
        ],
      ),
    ));
  }
}

class ExcelRow extends StatelessWidget {
  // final String one;
  // final String two;
  // final String three;
  // final String four;
  // final String five;
  final ViewGaugeModel model;

  const ExcelRow(
      {Key? key,
      // required this.one,
      // required this.two,
      // required this.three,
      // required this.four,
      // required this.five
        required this.model
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = 35;
    Color color = Colors.black54;

    return Material(
        child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ShowGauge(model: model)),
        );
      },
      child: Row(
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
              child: Center(child: Text(model.identification_number)),
            ),
          ),
          Expanded(
            child: Container(
              //width: 300,
              height: height,
              decoration: BoxDecoration(border: Border.all(color: color)),
              child: Center(child: Text(model.gauge_type)),
            ),
          ),
          Expanded(
            child: Container(
              //width: 300,
              height: height,
              decoration: BoxDecoration(border: Border.all(color: color)),
              child: Center(child: Text(model.nominal_size)),
            ),
          ),
          Expanded(
            child: Container(
              // width: 300,
              height: height,
              decoration: BoxDecoration(border: Border.all(color: color)),
              child: Center(child: Text(model.calibration_due_date)),
            ),
          ),
          Expanded(
            child: Container(
              // width: 300,
              height: height,
              decoration: BoxDecoration(border: Border.all(color: color)),
              child: Center(child: Text(model.gauge_location)),
            ),
          ),
          // Material(
          // child: InkWell(
          // onTap: ()=> print('row opened'),
          // child: Container(
          // width: 50,
          // height: height,
          // decoration:
          // BoxDecoration(border: Border.all(color: color)),
          // child: const Center(child: Icon(Icons.open_in_new,size: 15.0,)),
          // ),
          // ),
          // ),
          // const SizedBox(
          //   width: 50.0,
          // ),
        ],
      ),
    ));
  }
}
