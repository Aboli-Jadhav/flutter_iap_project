import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_iap_project/Authentication/services/navigator_service.dart';
import 'package:flutter_iap_project/Authentication/locator.dart';

class master_adminHome_Profile extends StatefulWidget {
  const master_adminHome_Profile({Key? key}) : super(key: key);

  @override
  _master_adminHome_ProfileState createState() => _master_adminHome_ProfileState();
}

class _master_adminHome_ProfileState extends State<master_adminHome_Profile> {
  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);

  final NavigationService navigationService2 = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {

    FirebaseAuth auth = FirebaseAuth.instance;

    Future<void> _signOut() async {
      await FirebaseAuth.instance.signOut();
      navigationService2.pop();
      // print("Logout");
    }


    return Container(

      child: Scaffold(


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
                    onPressed: () {
                      Navigator.pushNamed(context, '/masterAdmin_EditProfile');
                    },

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
                    onPressed: () { _signOut(); },

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
