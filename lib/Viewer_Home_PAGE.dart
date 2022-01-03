import 'package:flutter/material.dart';

class Viewerhomepage extends StatefulWidget{
  const Viewerhomepage({Key? key}) : super(key: key);
  _Viewerhomepage createState()=> _Viewerhomepage();
}

class _Viewerhomepage extends State<Viewerhomepage>{
  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);
  Widget build(BuildContext context){
    return Container(
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

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                  onPressed: (){    },
                  icon: Icon(
                    Icons.remove_red_eye_outlined,
                    color: Colors.white,
                    size: 24.0,
                  ),
                  label: Text(
                    "View GAUGE",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ),

              ),


            ],
          ),
        ),
      ),
    );
  }
}