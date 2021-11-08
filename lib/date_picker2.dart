import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TestPickerWidget2 extends StatefulWidget {
  DateTime temp = DateTime.now();
  String selectedDate;
  TestPickerWidget2(this.selectedDate);

  @override
  _TestPickerWidget2State createState() => _TestPickerWidget2State();
}

class _TestPickerWidget2State extends State<TestPickerWidget2> {
  // DateTime selectedDate = DateTime.now();
  bool t = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        t ? Container(
          width: 270,
          height: 40,
          padding: EdgeInsets.fromLTRB(20,6,3,10),
          decoration: BoxDecoration(
              color: Colors.grey[100],
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(5))
          ),
          child: Text(
            // "${widget.selectedDate.toLocal()}".split(' ')[0],
              widget.selectedDate,
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
          //child: Text(widget.fetched_date),
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
      initialDate: widget.temp,
      firstDate: DateTime(2000),
      lastDate: DateTime(3000),
    );
    if (picked != null && picked != widget.temp)
      setState(() {
        widget.temp = picked;
        String  jj = "${widget.temp.toLocal()}".split(' ')[0];
        widget.selectedDate = "";
        widget.selectedDate += jj[8];
        widget.selectedDate += jj[9];
        widget.selectedDate += jj[7];
        widget.selectedDate += jj[5];
        widget.selectedDate += jj[6];
        widget.selectedDate += jj[4];
        widget.selectedDate += jj[0];
        widget.selectedDate += jj[1];
        widget.selectedDate += jj[2];
        widget.selectedDate += jj[3];

        t = true;
      });
  }
}