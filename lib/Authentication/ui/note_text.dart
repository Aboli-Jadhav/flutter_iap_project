import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteText extends StatelessWidget {
  final String text;
  //final TextAlign textAlign ;
  final Color color;
  const NoteText(this.text, {required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color:  Colors.grey[600],
      ),
    );
  }
}