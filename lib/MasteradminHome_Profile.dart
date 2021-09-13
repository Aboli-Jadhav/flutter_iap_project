import 'package:flutter/material.dart';

class master_adminHome_Profile extends StatefulWidget {
  const master_adminHome_Profile({Key? key}) : super(key: key);

  @override
  _master_adminHome_ProfileState createState() => _master_adminHome_ProfileState();
}

class _master_adminHome_ProfileState extends State<master_adminHome_Profile> {
  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: backred,
          title: Text("Windals Precision Ltd",
            style: TextStyle(
              color: Colors.white,
              fontSize: 50.0,
              fontWeight: FontWeight.bold,

            ),
          ),
          centerTitle: true,
        ),

        body:
        Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:
              [

                Container(
                  width: 0.2 * MediaQuery.of(context).size.width,
                  height:50.0,

                  child: ElevatedButton.icon(
                    style: ButtonStyle(

                      backgroundColor: MaterialStateProperty.all<Color>(backred),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: backred)
                        ),),
                    ),
                    onPressed: () {  },

                    label: Text(
                      "Edit Profile",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    icon: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 24.0,
                    ),
                  ),
                ),
                SizedBox(height: 100,),
                Container(
                  width: 0.2 * MediaQuery.of(context).size.width,
                  height:50.0,
                  child: ElevatedButton.icon(
                    style: ButtonStyle(

                      backgroundColor: MaterialStateProperty.all<Color>(backred),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: backred)
                        ),),
                    ),
                    onPressed: () {  },

                    label: Text(
                      "Log Out",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    icon: Icon(
                      Icons.logout,
                      color: Colors.white,
                      size: 24.0,
                    ),
                  ),
                ),
                SizedBox(height: 40,),



              ]
          ),
        ),
      ),

    );
  }
}
