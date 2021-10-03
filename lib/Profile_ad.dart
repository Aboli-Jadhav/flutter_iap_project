import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_iap_project/Authentication/services/navigator_service.dart';
import 'package:flutter_iap_project/Authentication/locator.dart';
class profile_ad extends StatefulWidget {
  const profile_ad({Key? key}) : super(key: key);

  @override
  _profile_adState createState() => _profile_adState();
}

class _profile_adState extends State<profile_ad> {
  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);
  final NavigationService navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {

    FirebaseAuth auth = FirebaseAuth.instance;

    Future<void> _signOut() async {
      await FirebaseAuth.instance.signOut();
      navigationService.pop();
     // print("Logout");
    }

    return Container(

      child: Scaffold(
        // appBar: AppBar(
        //   toolbarHeight: 60,
        //   backgroundColor: backred,
        //   title: Text("Profile",
        //     style: TextStyle(
        //       color: Colors.white,
        //       fontSize: 50.0,
        //       fontWeight: FontWeight.bold,
        //
        //     ),
        //   ),
        //   centerTitle: true,
        // ),

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
                      Navigator.pushNamed(context, '/adminEditProfile');
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
                    onPressed: () {  },

                    label: Text(
                      "Export Data To Excel",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    icon: Icon(
                      Icons.import_export_outlined,
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