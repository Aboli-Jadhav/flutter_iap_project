import 'package:flutter/material.dart';
import 'package:flutter_iap_project/adminHomeScreen.dart';

class adminLogin extends StatefulWidget {
  const adminLogin({Key? key}) : super(key: key);

  @override
  _adminLoginState createState() => _adminLoginState();
}

class _adminLoginState extends State<adminLogin> {
  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 60,
                backgroundColor: backred,
                title: Text("Windals Precision Ltd.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,

                  ),
                ),
              centerTitle: true,
            ),

            body:
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:
                [
                    Center(
                      child: Image.asset("assets/logo.png",
                      scale: 1.5,
                      ),
                    ),
                  SizedBox(height: 30,),
                    Text(" Master Admin",
                      style: TextStyle(
                      fontSize: 25.0,
                      //fontWeight: FontWeight.bold,
                    ),
                    ),
                  SizedBox(height: 30,),
                  Container(
                    width:0.3 * MediaQuery.of(context).size.width,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'User Name',
                        hintText: 'Enter Your UserName',
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    width:0.3 * MediaQuery.of(context).size.width,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter Password',
                      ),
                    ),
                  ),
                  Container(
                    //margin: EdgeInsets.fromLTRB(300, 0, 0, 0),
                    child:FlatButton(
                      child: Text('Forgot Password',),
                      onPressed: () {
                        setState(() {

                        });
                      },
                    ),
                  ),
                  SizedBox(height: 30,),

                    Container(
                    height: 40,
                    width:0.3 * MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(backred),
                      ),
                      onPressed: ()
                      {
                        Navigator.popAndPushNamed(context, '/adminHome');
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ),
                  ),


                ]
    ),
      ),
    );
  }
}
