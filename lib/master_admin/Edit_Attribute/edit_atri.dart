import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Drop_Down.dart';
import 'package:flutter_iap_project/Text_editor.dart';
import '../../date_picker.dart';

class edit_atri extends StatefulWidget {
  const edit_atri({Key? key}) : super(key: key);

  @override
  _edit_atriState createState() => _edit_atriState();
}

class _edit_atriState extends State<edit_atri> {


  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);

  @override
  Widget build(BuildContext context) {

    String? _chosenValue;
    return Container(
      child: Scaffold(


          body:ListView(
            padding: const EdgeInsets.all(40),
            children: <Widget>[
              Column(
                children: [
                  SizedBox(
                    width: 300,
                    child: ElevatedButton(

                        onPressed: (){
                          Navigator.pushNamed(context,  '/edit_frequency');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Frequency"),
                            Icon(Icons.keyboard_arrow_right)
                          ],
                        ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                          textStyle: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: 300,
                    child: ElevatedButton(
                        onPressed: (){
                          Navigator.pushNamed(context,  '/edit_location');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Location"),
                            Icon(Icons.keyboard_arrow_right)
                          ],
                        ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                          textStyle: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: 300,
                    child: ElevatedButton(
                        onPressed: (){
                          Navigator.pushNamed(context,  '/edit_owner');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Location Owner"),
                            Icon(Icons.keyboard_arrow_right)
                          ],
                        ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                          textStyle: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: 300,
                    child: ElevatedButton(
                        onPressed: (){
                          Navigator.pushNamed(context,  '/edit_range');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Gauge Size/Range"),
                            Icon(Icons.keyboard_arrow_right)
                          ],
                        ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                          textStyle: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: 300,
                    child: ElevatedButton(
                        onPressed: (){
                          Navigator.pushNamed(context,  '/edit_type');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Gauge Type"),
                            Icon(Icons.keyboard_arrow_right)
                          ],
                        ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                          textStyle: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: 300,
                    child: ElevatedButton(
                        onPressed: (){
                          Navigator.pushNamed(context,  '/edit_description');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Gauge Description"),
                            Icon(Icons.keyboard_arrow_right),
                          ],
                        ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                          textStyle: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold)),

                    ),
                  ),
                ],
              )
            ],
          )
      ),
    );
  }
}