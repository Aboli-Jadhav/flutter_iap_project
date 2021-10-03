import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_iap_project/Authentication/view_model/sign_up.dart';
import 'package:flutter_iap_project/Authentication/ui/bussy_button.dart';
import 'package:flutter_iap_project/Authentication/ui/input_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Master_AddAdmins extends StatefulWidget {
  const Master_AddAdmins({Key? key}) : super(key: key);

  @override
  _Master_AddAdminsState createState() => _Master_AddAdminsState();
}

class _Master_AddAdminsState extends State<Master_AddAdmins> {
  final name5 = TextEditingController();
  final contact5 = TextEditingController();
  final location5 = TextEditingController();
  final emailController5 = TextEditingController();
  final passwordController5 = TextEditingController();

  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);

  @override
  Widget build(BuildContext context) {

    return ViewModelBuilder<SignUpViewModel>.reactive(
    viewModelBuilder: () => SignUpViewModel(),
    builder: (context, model, child) =>
      Container(
      child:Scaffold(

        body: ListView(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 17,),
                  Text("Admin's Details"),
                  SizedBox(height: 17,),
                  Container(
                    width: 0.3 * MediaQuery.of(context).size.width,
                    height:50.0,
                    child: TextField(
                      controller: name5,
                      decoration: InputDecoration(
                        labelText: ("Name"),
                        hintText:  ("Enter Name of the Admin"),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),



                  SizedBox(height: 17,),
                  Container(
                    width: 0.3 * MediaQuery.of(context).size.width,
                    height:50.0,
                    child: TextField(
                      controller: contact5,
                      decoration: InputDecoration(

                        labelText: ("Contact No"),
                        hintText:  ("Enter Contact No of the Admin"),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),

                  SizedBox(height: 17,),
                  Container(
                    width: 0.3 * MediaQuery.of(context).size.width,
                    height:50.0,
                    child: TextField(
                      controller: location5,
                      decoration: InputDecoration(
                        labelText: ("Location"),
                        hintText:  ("Enter the Location of the Admin"),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),

                  SizedBox(height: 17,),
                  Text("Sign Up Credentials"),
                  SizedBox(height: 10,),
                  InputField(
                    placeholder: 'Email',
                    controller: emailController5,
                  ),
                  SizedBox(height: 0,),
                  InputField(
                    placeholder: 'Password',
                    password: true,
                    controller: passwordController5,
                    additionalNote: 'Password has to be a minimum of 6 characters.',
                  ),
                  SizedBox(height: 10,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BusyButton(
                            title: 'Add Admin',
                            busy: model.busy,
                            onPressed: () {
                              FirebaseFirestore.instance.collection("Chakan").doc("Admin_User").collection("All_AdminUser").add(
                                  {
                                    "Name" : name5.text,
                                    "Contact" : contact5.text,
                                    "Location" : location5.text,
                                    "Email" : emailController5.text
                                  }).then((_){
                                print("Success");
                              });
                              model.signUp(
                                email: emailController5.text,
                                password: passwordController5.text,
                              );
                              emailController5.clear();
                              passwordController5.clear();
                              name5.clear();
                              contact5.clear();
                              location5.clear();
                            },
                          ),
                          Container(
                            height: 30,
                            width:115,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(backred),
                              ),
                              onPressed: ()
                              {
                                Navigator.popAndPushNamed(context, '/master_adminHome');
                              },
                              child: Text(
                                "Reset",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                            ),
                          ),
                        ],
                      ),


                      SizedBox(height: 100,)

                ],
              ),
            ),

          ],
        ),
      ),
    )
    );
  }
}
