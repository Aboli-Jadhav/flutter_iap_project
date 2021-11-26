import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ShowGauge_Widget_MasterAdmin extends StatefulWidget {
  final String heading;
  final TextEditingController data;

  const ShowGauge_Widget_MasterAdmin({Key? key, required this.heading, required this.data})
      : super(key: key);

  @override
  _ShowGauge_WidgetState createState() => _ShowGauge_WidgetState();
}

class _ShowGauge_WidgetState extends State<ShowGauge_Widget_MasterAdmin> {
  //TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // _controller.text = widget.data;

    return Column(
      children: [
        Text(
          widget.heading,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w100),
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            height: 37,
            child: TextField(
              enabled: true,
              controller: widget.data,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(),
              ),
            ),
          ),
        )
      ],
    );
  }
}
