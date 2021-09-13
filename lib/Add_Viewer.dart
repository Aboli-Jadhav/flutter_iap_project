import 'package:flutter/material.dart';
class AddViewer extends StatefulWidget {
  const AddViewer({Key? key}) : super(key: key);

  // Changes remaining

  @override
  _AddViewerState createState() => _AddViewerState();
}

class _AddViewerState extends State<AddViewer> {
  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);

  @override
  Widget build(BuildContext context) {
    return Container(
        child:Scaffold(
          appBar: AppBar(
            toolbarHeight: 50,
            backgroundColor: backred,
            title: Text("Add Viewer",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,

              ),
            ),
            centerTitle: true,
          ),

            body: ListView(
              children: <Widget>[
               Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 30,),
                    Container(
                      width: 0.3 * MediaQuery.of(context).size.width,
                      height:50.0,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: ("Name"),
                          hintText:  ("Enter Name of the Viewer"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),

                    SizedBox(height: 30,),
                    Container(
                      width: 0.3 * MediaQuery.of(context).size.width,
                      height:50.0,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: ("Email ID"),
                          hintText:  ("Enter Email of the Viewer"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),

                    SizedBox(height: 30,),
                    Container(
                      width: 0.3 * MediaQuery.of(context).size.width,
                      height:50.0,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: ("Password"),
                          hintText:  ("Enter Password of the Viewer"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),

                    SizedBox(height: 30,),
                    Container(
                      width: 0.3 * MediaQuery.of(context).size.width,
                      height:50.0,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: ("Contact No"),
                          hintText:  ("Enter Contact No of the Viewer"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),

                    SizedBox(height: 30,),
                    Container(
                      width: 0.3 * MediaQuery.of(context).size.width,
                      height:50.0,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: ("Location"),
                          hintText:  ("Enter the Location of the Viewer"),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),

                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width:0.2 * MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(backred),
                            ),
                            onPressed: ()
                            {
                              //Navigator.popAndPushNamed(context, '/master_adminHome');
                            },
                            child: Text(
                              "Add Viewer",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                          ),
                        ),
                        SizedBox(width: 30,),

                        Container(
                          height: 40,
                          width:0.2 * MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(backred),
                            ),
                            onPressed: ()
                            {
                              Navigator.popAndPushNamed(context, '/master_adminHome');
                            },
                            child: Text(
                              "RESET",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

    ],
            ),
        ),
    );
  }
}
