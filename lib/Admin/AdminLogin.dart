import 'package:flutter/material.dart';

class AdminLogin extends StatefulWidget{
  const AdminLogin({Key?key}) :super(key: key);

  _AdminLogin createState() => _AdminLogin();

}

class _AdminLogin extends State<AdminLogin>{
  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);
  Widget  build(BuildContext context){
    return Container(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: backred,
          title: Text('Windals Precision Ltd.',
          style: TextStyle(

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
        Container(
          width: 0.3 * MediaQuery.of(context).size.width,
       child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: ' User Name',
                  hintText: 'ENTER YOUR EMAIL ID'
                ),
         )
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
           width: 0.3* MediaQuery.of(context).size.width,
           child: ElevatedButton(
             style: ButtonStyle(
               backgroundColor: MaterialStateProperty.all<Color>(backred),
             ),
             onPressed: ()
             {
               Navigator.popAndPushNamed(context, '/adminpage');
             },
             child: Text(
               "Login",
               style: TextStyle(
                 fontSize: 20.0,
                 fontWeight: FontWeight.bold,
               ),
             ),


           ),
         )


       ],
     ) ,



      ),
      );




  }



}