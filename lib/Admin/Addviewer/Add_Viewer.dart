import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_iap_project/Authentication/view_model/sign_up.dart';
import 'package:flutter_iap_project/Authentication/ui/bussy_button.dart';
import 'package:flutter_iap_project/Authentication/ui/input_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddViewer extends StatefulWidget {
  const AddViewer({Key? key}) : super(key: key);

  // Changes remaining

  @override
  _AddViewerState createState() => _AddViewerState();
}

class _AddViewerState extends State<AddViewer> {
  final name6 = TextEditingController();
  final contact6 = TextEditingController();
  final location6 = TextEditingController();
  final emailController6 = TextEditingController();
  final passwordController6 = TextEditingController();

  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
    viewModelBuilder: () => SignUpViewModel(),
    builder: (context, model, child) =>
      Container(
        child:Scaffold(
          // appBar: AppBar(
          //   toolbarHeight: 50,
          //   backgroundColor: backred,
          //   title: Text("Add Viewer",
          //     style: TextStyle(
          //       color: Colors.white,
          //       fontSize: 30.0,
          //       fontWeight: FontWeight.bold,
          //
          //     ),
          //   ),
          //   centerTitle: true,
          // ),

            body: ListView(
              children: <Widget>[
               Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 17,),
                    Text("Viewer's Details"),
                    SizedBox(height: 17,),
                    Container(
                      width: 0.3 * MediaQuery.of(context).size.width,
                      height:50.0,
                      child: TextField(
                        controller: name6,
                        decoration: InputDecoration(
                          labelText: ("Name"),
                          hintText:  ("Enter Name of the Viewer"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),


                    SizedBox(height: 17,),
                    Container(
                      width: 0.3 * MediaQuery.of(context).size.width,
                      height:50.0,
                      child: TextField(
                        controller: contact6,
                        decoration: InputDecoration(
                          labelText: ("Contact No"),
                          hintText:  ("Enter Contact No of the Viewer"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),

                    SizedBox(height: 17,),
                    Container(
                      width: 0.3 * MediaQuery.of(context).size.width,
                      height:50.0,
                      child: TextField(
                        controller: location6,
                        decoration: InputDecoration(
                          labelText: ("Location"),
                          hintText:  ("Enter the Location of the Viewer"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),

                    SizedBox(height: 17,),

                    Text("Sign Up Credentials"),

                    SizedBox(height: 15,),
                    InputField(
                      placeholder: 'Email',
                      controller: emailController6,
                    ),
                    SizedBox(height: 0,),
                    InputField(
                      placeholder: 'Password',
                      password: true,
                      controller: passwordController6,
                      additionalNote: 'Password has to be a minimum of 6 characters.',
                    ),
                    SizedBox(height: 10,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            BusyButton(
                              title: 'Add Viewer',
                              busy: model.busy,
                              onPressed: () {
                                FirebaseFirestore.instance.collection("Chakan").doc("Viewer_User").collection("Add_ViewUser").add(
                                    {
                                      "Name" : name6.text,
                                      "Contact" : contact6.text,
                                      "Location" : location6.text,
                                      "Email" : emailController6.text
                                    }).then((_){
                                  print("Success");
                                });
                                model.signUp(
                                  email: emailController6.text,
                                  password: passwordController6.text,
                                );
                                emailController6.clear();
                                passwordController6.clear();
                                name6.clear();
                                contact6.clear();
                                location6.clear();
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
    ),
    );
  }
}
