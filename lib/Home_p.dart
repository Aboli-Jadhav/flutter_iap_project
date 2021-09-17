import 'package:flutter/material.dart';

class home_p extends StatefulWidget {
  const home_p({Key? key}) : super(key: key);

  @override
  _home_pState createState() => _home_pState();
}

class _home_pState extends State<home_p> {

  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);

  @override
  Widget build(BuildContext context) {
    return Container(
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
        ListView(
            children: <Widget>[
        Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:
               [
                 SizedBox(height: 50,),
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
                    onPressed: () {
                      Navigator.pushNamed(context, '/addViewer');
                    },
                    icon: Icon(
                      Icons.person_add_alt_1_sharp,
                      color: Colors.white,
                      size: 24.0,
                    ),
                    label: Text(
                      "Add Viewer",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  ),
                ),
                SizedBox(height: 40,),
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
                    onPressed: () {  },
                    icon: Icon(
                      Icons.remove_red_eye_outlined,
                      color: Colors.white,
                      size: 24.0,
                    ),
                    label: Text(
                      "View Gauges",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  ),
                ),
                SizedBox(height: 40,),

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
                    onPressed: () { Navigator.pushNamed(context, '/addgauge'); },
                    icon: Icon(
                      Icons.note_add,
                      color: Colors.white,
                      size: 24.0,
                    ),
                    label: Text(
                      "Add Gauge",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  ),
                ),
                SizedBox(height: 40,),

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
                    onPressed: () { Navigator.pushNamed(context, '/calibrate gauge'); },
                    icon: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 24.0,
                    ),
                    label: Text(
                      "Calibrate Guages",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  ),
                ),
                  SizedBox(height: 40.0,),
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
                    onPressed: () {  Navigator.pushNamed(context, '/searchgauge');},
                    icon: Icon(
                      Icons.search_sharp,
                      color: Colors.white,
                      size: 24.0,
                    ),
                    label: Text(
                      "Search Guages",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  ),
                ),

                SizedBox(height: 40.0,),
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
                    onPressed: () {  Navigator.pushNamed(context, '/manageScrap');},
                    icon: Icon(
                      Icons.delete_forever,
                      color: Colors.white,
                      size: 24.0,
                    ),
                    label: Text(
                      "Manage scrap",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  ),
                ),
              ]
          ),
        ),
      ],
    ),
      ),
    );
  }
}