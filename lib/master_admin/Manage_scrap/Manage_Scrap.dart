import 'package:flutter/material.dart';
import 'package:flutter_iap_project/master_admin/Manage_scrap/Add_To_Scrap.dart';

class Manage_Scrap extends StatefulWidget {
  final List<String> gauge_name;

  const Manage_Scrap({Key? key, required this.gauge_name}) : super(key: key);

  @override
  _Manage_ScrapState createState() => _Manage_ScrapState();
}

class _Manage_ScrapState extends State<Manage_Scrap> {
  Color backred=Color(0xffDF3F3F);
  Color lred=Color(0xffFBEBEB);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(

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
                  onPressed: () {
                   // Navigator.pushNamed(context, '/addtoScrap');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddToScrap(gauge_name: widget.gauge_name)),
                    );
                  },
                  label: Text("Add To Scrap",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 24.0,
                  ),
                ),
              ),
              SizedBox(height: 100,),
              Container(
                width: 0.2 * MediaQuery.of(context).size.width,
                height:50.0,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(backred),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: backred)
                      ),
                    ),),
                  onPressed: () {
                    Navigator.pushNamed(context, '/viewScrap');
                  },
                  child: Text("View Scrap",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold

                    ),
                  ),

                ),
              ),
              SizedBox(height: 100,),

            ],

          ),

        ),
      ),
    );
  }
}
