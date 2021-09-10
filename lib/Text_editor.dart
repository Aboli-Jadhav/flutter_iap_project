import 'package:flutter/material.dart';

class text_ed extends StatefulWidget {
  @override
  _text_edState createState() => _text_edState();
}

class _text_edState extends State<text_ed> {

  TextEditingController _controller1 = TextEditingController();
  late String name;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 450,
        height: 50,
        child: TextFormField(
          onChanged: (value){
            name = value;
          },
          controller: _controller1,

          cursorColor: Color(0xFF1D023B),
          decoration: InputDecoration(
            errorStyle: TextStyle(
              color: Color(0xFF1D023B),
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(color:Color(0xFF1D023B),width: 3 )
            ),
            hintText: 'Name',
            fillColor: Colors.white.withOpacity(0.1),
            filled: true,
            contentPadding: EdgeInsets.fromLTRB(20,20,20,20),
          ),
        ),
      ),
    );
  }
}