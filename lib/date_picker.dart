import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TestPickerWidget extends StatefulWidget {

  DateTime selectedDate = DateTime.now();

  TestPickerWidget(this.selectedDate, );

  @override
  _TestPickerWidgetState createState() => _TestPickerWidgetState();
}

class _TestPickerWidgetState extends State<TestPickerWidget> {
 // DateTime selectedDate = DateTime.now();
  bool t = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        t ? Container(
          width: 270,
          height: 37,
          padding: EdgeInsets.fromLTRB(20,6,3,10),
          decoration: BoxDecoration(
              color: Colors.grey[100],
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(5))
          ),
          child: Text(
            "${widget.selectedDate.toLocal()}".split(' ')[0],
            //widget.fetched_date,
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ) : Container(
          width: 270,
          height: 40,
          padding: EdgeInsets.fromLTRB(20,6,3,10),
          decoration: BoxDecoration(
              color: Colors.grey[100],
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(5))
          ),
          child: Text("Select Date",style: TextStyle(color: Colors.black26,fontSize: 19),textAlign: TextAlign.start,),
        ),
        SizedBox(
          height: 2.0,
        ),
        IconButton(
          onPressed: () => _selectDate(context), // Refer step 3
          icon: Icon(Icons.calendar_today,size: 30,),
          color: Colors.greenAccent,
        ),
      ],
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime ?picked = await showDatePicker(
      context: context,
      initialDate: widget.selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != widget.selectedDate)
      setState(() {
        widget.selectedDate = picked;
        t = true;
      });
  }
}