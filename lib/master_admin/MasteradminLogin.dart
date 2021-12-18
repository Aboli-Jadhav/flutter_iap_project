import 'package:flutter_iap_project/Authentication/view_model/login_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_iap_project/Authentication/ui/bussy_button.dart';
import 'package:flutter_iap_project/Authentication/ui/input_field.dart';
import 'package:flutter/material.dart';

class master_adminLogin extends StatefulWidget {
  const master_adminLogin({Key? key}) : super(key: key);

  @override
  _master_adminLoginState createState() => _master_adminLoginState();
}

class _master_adminLoginState extends State<master_adminLogin> {

  final emailController3 = TextEditingController();
  final passwordController3 = TextEditingController();

  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
    viewModelBuilder: () => LoginViewModel(),
    builder: (context, model, child) =>
      Container(
      child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 50,
                backgroundColor: backred,
                title: Text("Windals Precision Ltd",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.0,

                  ),
                ),
              centerTitle: true,
            ),

            body:
            ListView(
              children: <Widget>[
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
                      InputField(
                        placeholder: 'Email',
                        controller: emailController3,
                      ),
                      SizedBox(height: 10.0),
                      InputField(
                        placeholder: 'Password',
                        password: true,
                        controller: passwordController3,
                      ),
                      SizedBox(height: 5.0),

                          BusyButton(
                            title: 'Login',
                            busy: model.busy,
                            onPressed: () {
                              model.login(
                                c: context,
                                r: 1,
                                email: emailController3.text,
                                password: passwordController3.text,
                              );
                              emailController3.clear();
                              passwordController3.clear();
                            },
                          ),



                    ]
    ),
              ],
            ),
      ),
    ),
    );
  }
}
