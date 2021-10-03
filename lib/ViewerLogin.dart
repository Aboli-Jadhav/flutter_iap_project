import 'package:flutter/material.dart';
import 'package:flutter_iap_project/Authentication/ui/bussy_button.dart';
import 'package:flutter_iap_project/Authentication/ui/input_field.dart';
import 'package:flutter_iap_project/Authentication/view_model/login_view_model.dart';
import 'package:stacked/stacked.dart';

class ViewerLogin extends StatefulWidget{
  const ViewerLogin({Key? key}) : super(key: key);


  _Viewerlogin createState() => _Viewerlogin();

}

class _Viewerlogin extends State<ViewerLogin>{

  final emailController2 = TextEditingController();
  final passwordController2 = TextEditingController();

  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);
  Widget build(BuildContext context){
    return ViewModelBuilder<LoginViewModel>.reactive(
    viewModelBuilder: () => LoginViewModel(),
    builder: (context, model, child) =>
      Container(
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
              Text(" Viewer ",
                style: TextStyle(
                  fontSize: 25.0,
                  //fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30,),
              InputField(
                placeholder: 'Email',
                controller: emailController2,
              ),
              SizedBox(height: 10.0),
              InputField(
                placeholder: 'Password',
                password: true,
                controller: passwordController2,
              ),
              SizedBox(height: 5.0),

                  BusyButton(
                    title: 'Login',
                    busy: model.busy,
                    onPressed: () {
                      model.login(
                        r: 3,
                        email: emailController2.text,
                        password: passwordController2.text,
                      );
                      emailController2.clear();
                      passwordController2.clear();
                    },
                  ),
            ]
        ),
      ),
    ),
    );
  }
}