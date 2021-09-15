import 'package:flutter/material.dart';
import 'package:flutter_iap_project/AdminDataModel.dart';
import 'package:flutter_iap_project/View_AdminList_DropDOwn.dart';

class View_Admin_List extends StatefulWidget {
  final List<AdminDataModel> adminList;
  const View_Admin_List({required this.adminList,Key? key}) : super(key: key);

  @override
  _View_Admin_ListState createState() => _View_Admin_ListState();
}

class _View_Admin_ListState extends State<View_Admin_List> {

  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);

  void printLine()
  {
    print(widget.adminList.length);
  }

  Widget setUI(String anm,String loc,String email,String phone)
  {
    return new GestureDetector(
      onTap: (){},
      onLongPress: (){},
      child: Card(
        color: lred,
  shape: RoundedRectangleBorder(
  side: BorderSide(color: Colors.red, width: 0.5),
  borderRadius: BorderRadius.circular(10),

  ),
  elevation: 8.0,
  child: Padding(
  padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Admin Name:- "+anm,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,

                ),
              ),
              SizedBox(height: 10,),
              Text(
                "Email :- "+email,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,

                ),
              ),
              SizedBox(height: 10,),

              Text(
                "Location:- "+loc,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,

                ),
              ),
              SizedBox(height: 10,),

              Text(
                "Contact No:-"+phone,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,

                ),
              ),

            ],
          ),
        ),
      ),
    ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: backred,
          title: Text("Admin List",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,

            ),
          ),
          centerTitle: true,
        ),

        body:  Container(

          child:  ListView.builder(
            itemCount: widget.adminList.length,
            itemBuilder: (_,index)
            {
              print(widget.adminList[index].location);
              return setUI(widget.adminList[index].admin_nm, widget.adminList[index].location, widget.adminList[index].email, widget.adminList[index].phone);
              setState(() {

              });
            },
          ),

        ),

      ),
    );
  }
}
