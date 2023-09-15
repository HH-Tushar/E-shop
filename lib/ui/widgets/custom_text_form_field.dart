import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final IconData myIcon;
  const CustomTextFormField(
      {Key? key, required this.labelText, required this.myIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      scrollPhysics: const ScrollPhysics(),
      keyboardType: TextInputType.text,
      focusNode: FocusNode(),
      decoration: InputDecoration(
          isCollapsed: true,
          labelText: labelText,
          prefixIcon: Icon(myIcon),
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 3,color: Colors.black),
            borderRadius: BorderRadius.circular(15),
          )),

      //validation here
    );
  }
}
