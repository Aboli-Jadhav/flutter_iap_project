import 'package:flutter/material.dart';
import 'package:flutter_iap_project/View_AdminList.dart';

import 'AdminDataModel.dart';

class View_AdminList_DropDown extends StatefulWidget {
  const View_AdminList_DropDown({Key? key}) : super(key: key);

  @override
  _View_AdminList_DropDownState createState() => _View_AdminList_DropDownState();
}

class _View_AdminList_DropDownState extends State<View_AdminList_DropDown> {

  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);
  List<AdminDataModel> locAdmins=[];
  var _chosenValue;
  List<String> locations=[
    'Nagpur',
    'Chakan',
    'Shirdi',
  ];


  List<AdminDataModel> adminlist=[
    AdminDataModel("Aaa", "Chakan", "aaa.zzz@wpp.in", "1234567890"),
    AdminDataModel("BBB", "Chakan", "aaa.zzz@wpp.in", "1111111111"),
    AdminDataModel("CCC", "Chakan", "aaa.zzz@wpp.in", "2222222222"),
    AdminDataModel("DDD", "Nagpur", "aaa.zzz@wpp.in", "3333333333"),
    AdminDataModel("EEE", "Nagpur", "aaa.zzz@wpp.in", "4444444444"),
    AdminDataModel("FFF", "Chakan", "aaa.zzz@wpp.in", "5555555555"),
    AdminDataModel("ZZZ", "Nagpur", "aaa.zzz@wpp.in", "6666666666"),
    AdminDataModel("GGG", "Chakan", "aaa.zzz@wpp.in", "7777777777"),
    AdminDataModel("HHH", "Chakan", "aaa.zzz@wpp.in", "8888888888"),
    AdminDataModel("EEE", "Chakan", "aaa.zzz@wpp.in", "9999999999"),
    AdminDataModel("TYU", "Nagpur", "aaa.zzz@wpp.in", "1212121212"),
    AdminDataModel("NBN", "Nagpur", "aaa.zzz@wpp.in", "2323232323"),
    AdminDataModel("XXX", "Chakan", "aaa.zzz@wpp.in", "2525252524"),
    AdminDataModel("GGG", "Nagpur", "aaa.zzz@wpp.in", "8787878787"),
  ];

  void handleDropChange(String ?val)
  {
    setState(() {
      _chosenValue=val;
      for(int i=0;i<adminlist.length;i++)
      {
        if(_chosenValue.toString()==adminlist[i].location.toString())
        {
          locAdmins.add(adminlist[i]);
        }
      }


    });
  }

  // Widget createList(List<AdminDataModel> locAdmins)
  // {
  //   return ListView.builder(
  //     itemCount: locAdmins.length,
  //     itemBuilder: (_,index)
  //     {
  //       print(locAdmins[index].location);
  //       return setUI(locAdmins[index].admin_nm, locAdmins[index].location, locAdmins[index].email, locAdmins[index].phone);
  //
  //     },
  //   );
  // }

  // Widget setUI(String anm,String loc,String email,String phone)
  // {
  //   return new GestureDetector(
  //     onTap: (){},
  //     onLongPress: (){},
  //     child: Card(
  //       child: Container(
  //         child: Column(
  //           children: <Widget>[
  //             Text(
  //               "Admin Name:- "+anm,
  //               textAlign: TextAlign.left,
  //               style: TextStyle(
  //                 fontSize: 20.0,
  //                 fontWeight: FontWeight.bold,
  //
  //               ),
  //             ),
  //
  //             Text(
  //               "Email :- "+email,
  //               textAlign: TextAlign.left,
  //               style: TextStyle(
  //                 fontSize: 20.0,
  //                 fontWeight: FontWeight.bold,
  //
  //               ),
  //             ),
  //
  //             Text(
  //               "Location:- "+loc,
  //               textAlign: TextAlign.left,
  //               style: TextStyle(
  //                 fontSize: 20.0,
  //                 fontWeight: FontWeight.bold,
  //
  //               ),
  //             ),
  //
  //             Text(
  //               "Contact No:-"+phone,
  //               textAlign: TextAlign.left,
  //               style: TextStyle(
  //                 fontSize: 20.0,
  //                 fontWeight: FontWeight.bold,
  //
  //               ),
  //             ),
  //
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }



  @override
  Widget build(BuildContext context) {
    return Container(
      child:Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: backred,
          title: Text("View AdminList",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,

            ),
          ),
          centerTitle: true,
        ),

        body: ListView(
          children: <Widget>[
            Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 50.0,),

                  Container(
                    width: 0.3*MediaQuery.of(context).size.width,
                    height: 50,
                    padding: EdgeInsets.fromLTRB(20,10,10,10),
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(5))
                    ),

                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _chosenValue,
                        //elevation: 5,
                        style: TextStyle(color: Colors.black),

                        items: locations.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        hint: Text(
                          "Select The Location",

                        ),

                        onChanged:handleDropChange,
                      ),
                    ),
                  ),

                  SizedBox(height: 50.0,),
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
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => View_Admin_List(adminList: locAdmins)));
                      },
                      child: Text("View Admins",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ),
                  ),

                ]
            ),
          ],
        ),
      ),
    );
  }
}
