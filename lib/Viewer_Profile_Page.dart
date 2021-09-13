import 'package:flutter/material.dart';

class VIEWERPROFILE extends StatefulWidget{
  const VIEWERPROFILE({Key?key}) :super(key: key);
  _VIEWERPROFILE createState()=> _VIEWERPROFILE();
}

class _VIEWERPROFILE extends State<VIEWERPROFILE>{
  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);

  Widget build(BuildContext context){
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
           ),),

         ),
         body: Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                      label: Text("Edit profile",
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
                        ),
                      ),),
                      onPressed: () {},
                       label: Text("Logout",
                         style: TextStyle(
                           fontSize: 20.0,
                             color: Colors.white,
                           fontWeight: FontWeight.bold

                         ),
                       ),
                    icon: Icon(
                      Icons.exit_to_app_outlined,
                      color: Colors.white,
                      size: 24.0,
                    ),
                  ),
                ),
                SizedBox(height: 100,),

              ],

           ),

         ),
      ) ,
    );
  }
}