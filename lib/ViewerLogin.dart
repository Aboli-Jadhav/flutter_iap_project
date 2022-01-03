import 'package:flutter/material.dart';
import 'package:flutter_iap_project/Authentication/ui/bussy_button.dart';
import 'package:flutter_iap_project/Authentication/ui/input_field.dart';
import 'package:flutter_iap_project/Authentication/view_model/login_view_model.dart';
import 'package:stacked/stacked.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';


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
          title: Text("Windals Precision Pvt Ltd.",
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
                    onPressed: () async {
                      FirebaseFirestore.instance
                          .collection('Chakan')
                          .doc("Viewer_User")
                          .collection("Add_ViewUser")
                          .where('Email',isEqualTo: emailController2.text)
                          .get()
                          .then((value) {

                        if(value.docs.isNotEmpty){
                          model.login(
                            c: context,
                            r: 3,
                            email: emailController2.text,
                            password: passwordController2.text,
                          );
                        }else{
                          Fluttertoast.showToast(
                              msg: "Wrong Credentials Please Try Again",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1
                          );
                        }
                      })
                          .catchError((error) => print("Firebase Error"));


                    },
                  ),
            ]
        ),
      ),
    ),
    );
  }
}