import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_iap_project/Authentication/services/navigator_service.dart';
import 'package:flutter_iap_project/Authentication/locator.dart';

class VIEWERPROFILE extends StatefulWidget{
  const VIEWERPROFILE({Key?key}) :super(key: key);
  _VIEWERPROFILE createState()=> _VIEWERPROFILE();
}

class _VIEWERPROFILE extends State<VIEWERPROFILE>{
  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);
  final NavigationService navigationService3 = locator<NavigationService>();



  Widget build(BuildContext context){

    FirebaseAuth auth = FirebaseAuth.instance;

    Future<void> _signOut() async {
      await FirebaseAuth.instance.signOut();
      navigationService3.pop();
      // print("Logout");
    }

    return Container(
      child: Scaffold(
         appBar: AppBar(
           toolbarHeight: 60,
           backgroundColor: backred,
           title: Text("Windals Precision Pvt Ltd",
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
                      onPressed: () {_signOut();},
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