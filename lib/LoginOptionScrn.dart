import 'package:flutter/material.dart';

class LoginOptionScrn extends StatefulWidget {
  const LoginOptionScrn({Key? key}) : super(key: key);

  @override
  _LoginOptionScrnState createState() => _LoginOptionScrnState();
}

class _LoginOptionScrnState extends State<LoginOptionScrn> {
  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lred,
      appBar: AppBar(
        backgroundColor: backred,
        toolbarHeight: 80,
        elevation: 0,
        centerTitle: true,
        title:Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/logo12.png",
            ),
            SizedBox(width: 40,),
            Text("Windals Precision Ltd.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 50.0,
                fontWeight: FontWeight.bold,

              ),
            ),

          ],
        ),
      ),

        body:
        Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
                children:
                [
            Container(
            width: 0.3 * MediaQuery.of(context).size.width,
              height:50.0,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(backred),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: backred)
                  ),),
              ),
              onPressed: () {  },
              child: Text(
                "Master Admin",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),

            ),
    ),
    SizedBox(height: 100,),
                  Container(
                    width: 0.3 * MediaQuery.of(context).size.width,
                    height: 50.0,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(backred),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: backred)
                          ),),
                      ),
                      onPressed: () {  },
                      child: Text(
                        " Admin ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ),
                  ),
                  SizedBox(height: 100,),
                  Container(
                    width: 0.3 * MediaQuery.of(context).size.width,
                    height:50.0,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(backred),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: backred)
                          ),),
                      ),
                      onPressed: () {  },
                      child: Text(
                        " Viewer ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ),
                  ),
                  SizedBox(height: 100,),
    ],
            ),
          ),

    );
  }
}
