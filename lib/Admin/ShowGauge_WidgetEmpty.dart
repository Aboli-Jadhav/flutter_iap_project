import 'package:flutter/material.dart';

class ShowGauge_WidgetEmpty extends StatefulWidget {
  const ShowGauge_WidgetEmpty({Key? key}) : super(key: key);

  @override
  _ShowGauge_WidgetEmptyState createState() => _ShowGauge_WidgetEmptyState();
}

class _ShowGauge_WidgetEmptyState extends State<ShowGauge_WidgetEmpty> {

  Color lred=Color(0xffFBEBEB);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w100
          ),),
        SizedBox(height: 8,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            height: 37,
            child: TextField(
              enabled: false,
              //controller: _controller,
              decoration: InputDecoration(
                fillColor: lred,
                filled: true,
                //border: OutlineInputBorder(),
              ),
            ),
          ),
        )
      ],
    );
  }
}
