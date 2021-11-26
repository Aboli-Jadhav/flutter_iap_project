import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TestPickerWidget3 extends StatefulWidget {
  DateTime temp = DateTime.now();
  String select2;
  String selectedDate;
  int freq;
  TestPickerWidget3(this.selectedDate,this.freq,this.select2);

  @override
  _TestPickerWidget3State createState() => _TestPickerWidget3State();


}

class _TestPickerWidget3State extends State<TestPickerWidget3> {
  // DateTime selectedDate = DateTime.now();
  bool t = true;

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

        var ent =  new DateTime(widget.temp.year, widget.temp.month , widget.temp.day + widget.freq);
        String ff = ent.toString();
        widget.select2 = "";
        widget.select2 += ff[8];
        widget.select2 += ff[9];
        widget.select2 += ff[7];
        widget.select2 += ff[5];
        widget.select2 += ff[6];
        widget.select2 += ff[4];
        widget.select2 += ff[0];
        widget.select2 += ff[1];
        widget.select2 += ff[2];
        widget.select2 += ff[3];
        print(widget.select2);
        t = true;
      });
  }


}