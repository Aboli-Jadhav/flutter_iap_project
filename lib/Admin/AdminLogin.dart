import 'package:flutter/material.dart';
import 'package:flutter_iap_project/Authentication/view_model/login_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_iap_project/Authentication/ui/bussy_button.dart';
import 'package:flutter_iap_project/Authentication/ui/input_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class AdminLogin extends StatefulWidget{
  const AdminLogin({Key?key}) :super(key: key);

  _AdminLogin createState() => _AdminLogin();

}

class _AdminLogin extends State<AdminLogin>{

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);
  Widget  build(BuildContext context){
    return ViewModelBuilder<LoginViewModel>.reactive(
    viewModelBuilder: () => LoginViewModel(),
    builder: (context, model, child) =>
    Container(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
          backgroundColor: backred,
          title: Text('Windals Precision Ltd.',
          style: TextStyle(
             fontSize: 20
          ),
          ),
          centerTitle: true,
        ),
     body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
       children: [
           Center(
             child: Image.asset("assets/logo.png",scale: 1.5,),
           ),
         SizedBox(height: 30,),
         Text("  Admin   " ,
           style: TextStyle(
             fontSize: 25.0,
             //fontWeight: FontWeight.bold,
           ),
         ),
         SizedBox(height: 30,),
         InputField(
           placeholder: 'Email',
           controller: emailController,
         ),
      SizedBox(height: 10.0),
         InputField(
           placeholder: 'Password',
           password: true,
           controller: passwordController,
         ),
         SizedBox(height: 5.0),

             BusyButton(
               title: 'Login',
               busy: model.busy,
               onPressed: () {



                  model.login(
                     r: 2,
                     email: emailController.text,
                     password: passwordController.text,
                   );


                 emailController.clear();
                 passwordController.clear();
               },
             ),


       ],
     ) ,



      ),
      ),


);

  }



}