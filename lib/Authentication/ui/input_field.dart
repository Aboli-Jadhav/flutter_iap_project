import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'note_text.dart';

class InputField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool password;
  final bool isReadOnly;
  final String placeholder;
  final String validationMessage;
  //final Function enterPressed;
  final bool smallVersion;
  //final FocusNode fieldFocusNode;
  //final FocusNode nextFocusNode;
  final TextInputAction textInputAction;
  final String additionalNote;
  //final Function(String) onChanged;
  //final TextInputFormatter formatter;

  InputField(
      {required this.controller,
        required this.placeholder,
        //required this.enterPressed,
        //required this.fieldFocusNode,
        //required this.nextFocusNode ,
        this.additionalNote = "",
        //required this.onChanged,
        //required this.formatter,
        this.validationMessage = "",
        this.textInputAction = TextInputAction.next,
        this.textInputType = TextInputType.text,
        this.password = false,
        this.isReadOnly = false,
        this.smallVersion = false});

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late bool isPassword;
  double fieldHeight = 55;

  @override
  void initState() {
    super.initState();
    isPassword = widget.password;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 450,
          height: widget.smallVersion ? 40 : fieldHeight,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 15),
          decoration:
          widget.isReadOnly ? BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.grey[100]) : BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.grey[200]),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  controller: widget.controller,
                  keyboardType: widget.textInputType,
                  textInputAction: widget.textInputAction,
                  obscureText: isPassword,
                  readOnly: widget.isReadOnly,
                  decoration: InputDecoration.collapsed(
                      hintText: widget.placeholder,
                      hintStyle:
                      TextStyle(fontSize: widget.smallVersion ? 12 : 15)),
                ),
              ),
              GestureDetector(
                onTap: () => setState(() {
                  isPassword = !isPassword;
                }),
                child: widget.password
                    ? Container(
                    width: fieldHeight,
                    height: fieldHeight,
                    alignment: Alignment.center,
                    child: Icon(isPassword
                        ? Icons.visibility
                        : Icons.visibility_off))
                    : Container(),
              ),
            ],
          ),
        ),
        if (widget.validationMessage != null)
          NoteText(

            widget.validationMessage,
            color: Colors.red,
          ),
        if (widget.additionalNote != null) SizedBox(height: 5),
        if (widget.additionalNote != null) NoteText(widget.additionalNote,color: Colors.black26,),
        SizedBox(height: 10.0),
      ],
    );
  }
}