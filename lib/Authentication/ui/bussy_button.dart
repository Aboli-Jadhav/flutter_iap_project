//import 'package:compound/ui/shared/shared_styles.dart';
import 'package:flutter/material.dart';

class BusyButton extends StatefulWidget {
  final bool busy;
  final String title;
  final VoidCallback onPressed;
  final bool enabled;
  const BusyButton(
      {required this.title,
        this.busy = false,
        required this.onPressed,
        this.enabled = true});

  @override
  _BusyButtonState createState() => _BusyButtonState();
}

class _BusyButtonState extends State<BusyButton> {
  Color backred=Color(0xffDF3F3F);
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: 150,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(backred),
        ),
        onPressed:  widget.onPressed,
        child: AnimatedContainer(

          height: 40 ,
          width: 100,
          duration: const Duration(milliseconds: 300),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
              horizontal: 3,
              vertical: 5),

          child: Text(
            widget.title,
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
          )
        ),
      ),
    );
  }
}