import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:editable/editable.dart';
import 'package:flutter_iap_project/Admin/showgauge.dart';

class view_master_gau extends StatefulWidget {
  const view_master_gau({Key? key}) : super(key: key);

  @override
  _view_master_gauState createState() => _view_master_gauState();
}

class _view_master_gauState extends State<view_master_gau> {


  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);


  List<ExcelRow> itemList = [
    const ExcelRow(one: "1", two: "1", three: "1", four: "1", five: "1"),
    const ExcelRow(one: "1", two: "1", three: "1", four: "1", five: "1"),
    const ExcelRow(one: "1", two: "1", three: "1", four: "1", five: "1"),
    const ExcelRow(one: "1", two: "1", three: "1", four: "1", five: "1"),
    const ExcelRow(one: "1", two: "1", three: "1", four: "1", five: "1"),
    const ExcelRow(one: "1", two: "1", three: "1", four: "1", five: "1"),
    const ExcelRow(one: "1", two: "1", three: "1", four: "1", five: "1"),
    const ExcelRow(one: "1", two: "1", three: "1", four: "1", five: "1"),
  ];
  //row data
  // List rows = [
  // {"id": 'WP36473647364', "type":'Type A',"size":'3',"date":'01/01/2021',"location":'Pune'},
  //   {"id": 'WP36473647364', "type":'Type A',"size":'3',"date":'01/01/2021',"location":'Pune'},
  //   {"id": 'WP36473647364', "type":'Type A',"size":'3',"date":'01/01/2021',"location":'Pune'},
  //   {"id": 'WP36473647364', "type":'Type A',"size":'3',"date":'01/01/2021',"location":'Pune'},
  //   {"id": 'WP36473647364', "type":'Type A',"size":'3',"date":'01/01/2021',"location":'Pune'},
  //   {"id": 'WP36473647364', "type":'Type A',"size":'3',"date":'01/01/2021',"location":'Pune'},
  //   {"id": 'WP36473647364', "type":'Type A',"size":'3',"date":'01/01/2021',"location":'Pune'},
  //   {"id": 'WP36473647364', "type":'Type A',"size":'3',"date":'01/01/2021',"location":'Pune'},
  //   {"id": 'WP36473647364', "type":'Type A',"size":'3',"date":'01/01/2021',"location":'Pune'},
  //   {"id": 'WP36473647364', "type":'Type A',"size":'3',"date":'01/01/2021',"location":'Pune'},
  //   {"id": 'WP36473647364', "type":'Type A',"size":'3',"date":'01/01/2021',"location":'Pune'},
  //   {"id": 'WP36473647364', "type":'Type A',"size":'3',"date":'01/01/2021',"location":'Pune'},
  //   {"id": 'WP36473647364', "type":'Type A',"size":'3',"date":'01/01/2021',"location":'Pune'},
  //   {"id": 'WP36473647364', "type":'Type A',"size":'3',"date":'01/01/2021',"location":'Pune'},
  // ];

  // List headers = [
  // {"title":'Gauge ID No.', 'index': 1, 'key':'id'},
  // {"title":'Gauge Type', 'index': 2, 'key':'type'},
  // {"title":'Gauge Size', 'index': 3, 'key':'size'},
  // {"title":'Due Date', 'index': 4, 'key':'date'},
  // {"title":'Location', 'index': 5, 'key':'location'},
  // ];

  @override
  Widget build(BuildContext context) {

    return Container(

      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: backred,
          title: Text("View Gauge",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,

            ),
          ),
          centerTitle: true,
        ),

          body:Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
            child: ListView.builder(
              itemCount: itemList.length,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return const Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 0, 0, 15),
                    child: ExcelRowHeading(
                        one: "Gauge ID No.",
                        two: "Gauge Type",
                        three: "Gauge Size",
                        four: "Due Date",
                        five: "Location"),
                  );
                }
                return ExcelRow(
                    one: itemList[index - 1].one,
                    two: itemList[index - 1].two,
                    three: itemList[index - 1].three,
                    four: itemList[index - 1].four,
                    five: itemList[index - 1].five);
              },
            ),
          ),


      ),
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
        @required this.one="",
        @required this.two="",
        @required this.three="",
        @required this.four="",
        @required this.five=""})
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
                child: Center(child: Text(two,style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),)),
              ),
              Expanded(
                child: Center(child: Text(three,style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),)),
              ),
              Expanded(
                child: Center(child: Text(four,style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),)),
              ),
              Expanded(
                child: Center(child: Text(five,style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),)),
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
  final String one;
  final String two;
  final String three;
  final String four;
  final String five;

  const ExcelRow(
      {Key? key,
        @required this.one="",
        @required this.two="",
        @required this.three="",
        @required this.four="",
        @required this.five=""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = 35;
    Color color = Colors.black54;

    return Material(
        child: InkWell(
          onTap: () {
            Navigator.push(context,MaterialPageRoute(builder: (context) => ShowGauge()),);
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
                  child: Center(child: Text(one)),
                ),
              ),
              Expanded(
                child: Container(
                  //width: 300,
                  height: height,
                  decoration: BoxDecoration(border: Border.all(color: color)),
                  child: Center(child: Text(two)),
                ),
              ),
              Expanded(
                child: Container(
                  //width: 300,
                  height: height,
                  decoration: BoxDecoration(border: Border.all(color: color)),
                  child: Center(child: Text(three)),
                ),
              ),
              Expanded(
                child: Container(
                  // width: 300,
                  height: height,
                  decoration: BoxDecoration(border: Border.all(color: color)),
                  child: Center(child: Text(four)),
                ),
              ),
              Expanded(
                child: Container(
                  // width: 300,
                  height: height,
                  decoration: BoxDecoration(border: Border.all(color: color)),
                  child: Center(child: Text(five)),
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
