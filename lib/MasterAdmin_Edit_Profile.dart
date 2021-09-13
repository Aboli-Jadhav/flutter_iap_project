import 'package:flutter/material.dart';

class MasterAdmin_EditProfile extends StatefulWidget {
  const MasterAdmin_EditProfile({Key? key}) : super(key: key);

  @override
  _MasterAdmin_EditProfileState createState() => _MasterAdmin_EditProfileState();
}

class _MasterAdmin_EditProfileState extends State<MasterAdmin_EditProfile> {
  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);

  @override
  Widget build(BuildContext context) {
    return Container(

      child:Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: backred,
          title: Text("Edit Profile",
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
            Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 30,),
                  Container(
                    width: 0.3 * MediaQuery.of(context).size.width,
                    height:50.0,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: ("Name"),
                        hintText:  ("Update Your Name "),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),

                  SizedBox(height: 30,),

                  Container(
                    width: 0.3 * MediaQuery.of(context).size.width,
                    height:50.0,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: ("Password"),
                        hintText:  ("Update UR Password "),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),

                  Container(
                    width: 0.3 * MediaQuery.of(context).size.width,
                    height:50.0,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: ("Confirm Password"),
                        hintText:  ("Re-Enter UR Password "),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),

                  SizedBox(height: 30,),
                  Container(
                    width: 0.3 * MediaQuery.of(context).size.width,
                    height:50.0,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: ("Contact No"),
                        hintText:  ("Update Your Contact No"),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),



                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width:0.2 * MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(backred),
                          ),
                          onPressed: ()
                          {
                            //Navigator.popAndPushNamed(context, '/master_adminHome');
                          },
                          child: Text(
                            "Update",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                        ),
                      ),
                      SizedBox(width: 30,),

                      Container(
                        height: 40,
                        width:0.2 * MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(backred),
                          ),
                          onPressed: ()
                          {
                          },
                          child: Text(
                            "RESET",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
