import 'package:flutter/material.dart';
import 'package:flutter_iap_project/Drop_Down.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';



class show_gauge extends StatefulWidget {
  const show_gauge({Key? key}) : super(key: key);

  @override
  _show_gaugeState createState() => _show_gaugeState();
}

class _show_gaugeState extends State<show_gauge> {


  var _selectedLocation_gauge_type = "snap gauge";
  List<String> _options_gauge_type = ["snap gauge"];

  var _selectedLocation_location_owner = "Prachi Gaikwad";
  List<String> _options_location_owner = ["Prachi Gaikwad"];


  // var _selectedLocation_gauge_description = "Not added in databse";
  // List<String> _options_gauge_description = ["Not added in database"];

  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);

  TextEditingController manufacturer_identification_number = TextEditingController();
  TextEditingController gauge_number = TextEditingController();
  TextEditingController issued_date = TextEditingController();
  TextEditingController calibration_due_date = TextEditingController();
  TextEditingController certificate_number = TextEditingController();
  TextEditingController go_size = TextEditingController();
  TextEditingController nogo_size = TextEditingController();
  TextEditingController frequency = TextEditingController();
  TextEditingController calibrated_on = TextEditingController();
  TextEditingController remark = TextEditingController();

  void getSharedPrefrenceData()async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    manufacturer_identification_number.text = await prefs.getString('gauge_manufacturer_id_number').toString();
    gauge_number.text = await prefs.getString('wppl_gauge_id_number').toString();
    issued_date.text = "not added in database";
    calibration_due_date.text = await prefs.getString('calibration_due_date').toString();
    certificate_number.text = await prefs.getString('certificate_number').toString();
    go_size.text =await prefs.getString('maximum').toString();
    nogo_size.text =await prefs.getString('minimum').toString();
    frequency.text=await prefs.getString('calibration_frequency').toString();
    calibrated_on.text = "not added in database";
    remark.text =await prefs.getString('remark').toString();




    Fluttertoast.showToast(
        msg:  prefs.getString('certificate_number').toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSharedPrefrenceData();
  }

  @override
  Widget build(BuildContext context) {
    // manufacturer_identification_number.text = "120-35-1";
    // gauge_number.text = "WPP-SG-15";
    // issued_date.text = "not added in database";
    // calibration_due_date.text = "7/15/2022";
    // certificate_number.text = "MT/21-22/07-0198-004";
    // go_size.text = "54.9680";
    // nogo_size.text = "54.8045";
    // frequency.text= "364";
    // calibrated_on.text = "not added in database";
    // remark.text = "OK";

    return Container(
      child: Scaffold(
        appBar:AppBar(
          toolbarHeight: 50,
          backgroundColor: backred,
          title: Text("Gauge Details",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,

            ),
          ),
          centerTitle: true,
        ) ,
        body: ListView(
          padding: const EdgeInsets.all(40),
          children: <Widget>[
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Gauge Description",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                        SizedBox(height: 30,),
                        Container(
                          width: 0.3 * MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: DropdownButton(

                            hint: Text('Please choose a location'), // Not necessary for Option 1
                            value: _selectedLocation_gauge_type,
                            onChanged: (newValue) {
                              setState(() {
                                _selectedLocation_gauge_type = _options_gauge_type[0];
                              });

                              Fluttertoast.showToast(
                                  msg: _selectedLocation_gauge_type,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                            },
                            items: _options_gauge_type.map((location) {
                              return DropdownMenuItem(
                                child: new Text(location),
                                value: location,
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: 50,),
                        Text("Gauge Number",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                        SizedBox(height: 30,),

                        Container(
                          width: 0.3 * MediaQuery.of(context).size.width,
                          height:50.0,
                          child: TextField(
                            controller: gauge_number,
                            decoration: InputDecoration(
                              hintText: "Enter Manufacture Identification number",
                              //labelText: " Manufacture Identification number",
                              border: OutlineInputBorder(),

                            ),),
                        ),

                        SizedBox(height: 50,),
                        Text("Gauge Type",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                        SizedBox(height: 30,),
                        Container(
                          width: 0.3 * MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: DropdownButton(

                            hint: Text('Please choose a location'), // Not necessary for Option 1
                            value: _selectedLocation_gauge_type,
                            onChanged: (newValue) {
                              setState(() {
                                _selectedLocation_gauge_type = _options_gauge_type[0];
                              });

                              Fluttertoast.showToast(
                                  msg: _selectedLocation_gauge_type,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                            },
                            items: _options_gauge_type.map((location) {
                              return DropdownMenuItem(
                                child: new Text(location),
                                value: location,
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: 50,),
                        Text("Issued Date",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                        SizedBox(height: 30,),
                        Container(
                          width: 0.3 * MediaQuery.of(context).size.width,
                          height:50.0,
                          child: TextField(
                            controller: issued_date,
                            decoration: InputDecoration(
                              hintText: "Enter Manufacture Identification number",
                              //labelText: " Manufacture Identification number",
                              border: OutlineInputBorder(),

                            ),),
                        ),
                        SizedBox(height: 50,),
                        Text("Caliberation Due Date",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                        SizedBox(height: 30,),
                        Container(
                          width: 0.3 * MediaQuery.of(context).size.width,
                          height:50.0,
                          child: TextField(
                            controller: calibration_due_date,
                            decoration: InputDecoration(
                              hintText: "Enter Manufacture Identification number",
                              //labelText: " Manufacture Identification number",
                              border: OutlineInputBorder(),

                            ),),
                        ),
                        SizedBox(height: 50,),
                        Text("Certificate Number",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                        SizedBox(height: 30,),
                        Container(
                          width: 0.3 * MediaQuery.of(context).size.width,
                          height:50.0,
                          child: TextField(
                            controller: certificate_number,
                            decoration: InputDecoration(
                              hintText: "Enter Manufacture Identification number",
                              //labelText: " Manufacture Identification number",
                              border: OutlineInputBorder(),

                            ),),
                        ),
                        SizedBox(height: 50,),
                        Text("Location Owner",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                        SizedBox(height: 30,),
                        Container(
                          width: 0.3 * MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 10.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: DropdownButton(

                            hint: Text('Please choose a location'), // Not necessary for Option 1
                            value: _selectedLocation_location_owner,
                            onChanged: (newValue) {
                              setState(() {
                                _selectedLocation_location_owner = _options_location_owner[0];
                              });

                              Fluttertoast.showToast(
                                  msg: _selectedLocation_location_owner,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                            },
                            items: _options_location_owner.map((location) {
                              return DropdownMenuItem(
                                child: new Text(location),
                                value: location,
                              );
                            }).toList(),
                          ),
                        ),

                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Identification Number",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                        SizedBox(height: 30,),
                        Container(
                          width: 0.3 * MediaQuery.of(context).size.width,
                          height:50.0,
                          child: TextField(
                            controller: manufacturer_identification_number,
                            decoration: InputDecoration(
                              hintText: "Enter Manufacture Identification number",
                              //labelText: " Manufacture Identification number",
                              border: OutlineInputBorder(),

                            ),),
                        ),
                        // SizedBox(height: 50,),
                        // Text("Gauge Size",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                        SizedBox(height: 50,),
                        Text("GO Size",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                        SizedBox(height: 10,),
                        Container(
                          width: 0.3 * MediaQuery.of(context).size.width,
                          height:50.0,
                          child: TextField(
                            controller: go_size,
                            decoration: InputDecoration(
                              hintText: "Enter Manufacture Identification number",
                              //labelText: " Manufacture Identification number",
                              border: OutlineInputBorder(),

                            ),),
                        ),
                        SizedBox(height: 10,),
                        Text("NO GO Size",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                        Container(
                          width: 0.3 * MediaQuery.of(context).size.width,
                          height:50.0,
                          child: TextField(
                            controller: nogo_size,
                            decoration: InputDecoration(
                              hintText: "Enter Manufacture Identification number",
                              //labelText: " Manufacture Identification number",
                              border: OutlineInputBorder(),

                            ),),
                        ),
                        SizedBox(height: 50,),
                        Text("Frequency",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                        SizedBox(height: 30,),
                        Container(
                          width: 0.3 * MediaQuery.of(context).size.width,
                          height:50.0,
                          child: TextField(
                            controller: frequency,
                            decoration: InputDecoration(
                              hintText: "Enter Manufacture Identification number",
                              //labelText: " Manufacture Identification number",
                              border: OutlineInputBorder(),

                            ),),
                        ),
                        SizedBox(height: 50,),
                        Text("Caliberated On",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                        SizedBox(height: 30,),
                        Container(
                          width: 0.3 * MediaQuery.of(context).size.width,
                          height:50.0,
                          child: TextField(
                            controller: calibrated_on,
                            decoration: InputDecoration(
                              hintText: "Enter Manufacture Identification number",
                              //labelText: " Manufacture Identification number",
                              border: OutlineInputBorder(),

                            ),),
                        ),
                        SizedBox(height: 50,),
                        Text("Caliberation Done By",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                        SizedBox(height: 30,),
                        DropDown(),
                        SizedBox(height: 50,),
                        Text("Location",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                        SizedBox(height: 30,),
                        DropDown(),
                        SizedBox(height: 50,),
                        Text("Remark",style: TextStyle(color: Colors.black,fontSize: 23),textAlign: TextAlign.start,),
                        SizedBox(height: 30,),
                        Container(
                          width: 0.3 * MediaQuery.of(context).size.width,
                          height:50.0,
                          child: TextField(
                            controller: remark,
                            decoration: InputDecoration(
                              hintText: "Enter Manufacture Identification number",
                              //labelText: " Manufacture Identification number",
                              border: OutlineInputBorder(),

                            ),),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 70,),

              ],
            )
          ],
        ),
      ),
    );
  }
}
