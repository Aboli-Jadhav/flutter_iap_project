import 'package:autocomplete_textfield_ns/autocomplete_textfield_ns.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iap_project/master_admin/Manage_scrap/NewView/viewscrap_By_Date_LIST.dart';
import 'package:intl/intl.dart';

import '../../../datepicker3.dart';

class viewScrapByDate_UI extends StatefulWidget {
  const viewScrapByDate_UI({Key? key}) : super(key: key);

  @override
  _viewScrapByDate_UIState createState() => _viewScrapByDate_UIState();
}

class _viewScrapByDate_UIState extends State<viewScrapByDate_UI> {

  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);

  var fromdate = TestPickerWidget3("", 0, "");
  var todate = TestPickerWidget3("", 0, "");

  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
  var fromdatext,todateTxt;

  void demoCompareTwoDates()
  {
    // fromdatext=fromdate.selectedDate.toString();
    // todateTxt=todate.selectedDate.toString();

    if ((fromdate.temp.isAtSameMomentAs(fromdate.temp) || fromdate.temp.isBefore(fromdate.temp)) && (todate.temp.isAfter(fromdate.temp) || todate.temp.isAtSameMomentAs(fromdate.temp))){
      print("dateC is between dateA and dateB");
    } else {
      print("dateC isn't between dateA and dateC");
    }

    //print(t1+"\n\n"+t2);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 50,
            backgroundColor: backred,
            title: Text("View Scrap",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,

              ),
            ),
            centerTitle: true,
          ),

          body:Center(
            child: Container(
              //padding: EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                              Text("FROM Date :-",style: TextStyle(color: Colors.black,fontSize: 18),textAlign: TextAlign.start,),
                              SizedBox(width: 100,),
                              fromdate,
                              ],
                  ),
                  SizedBox(height: 50,),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                            Text("TO Date :-",style: TextStyle(color: Colors.black,fontSize: 18),textAlign: TextAlign.start,),
                            SizedBox(width: 120,),
                            todate,
                  ],
                ),
                  SizedBox(height: 70,),
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
                          ),),
                      ),
                      onPressed: (){
                        Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) => new viewScrapByDate_Working(fromdt: fromdate,todt:todate),
                          ),
                        );
                      },
                      child: Text("View Scrap",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ),
                  ),

                ],
              ),
            ),
          )
      ),
    );
  }
}
