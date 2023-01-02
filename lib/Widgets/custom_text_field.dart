import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  String? hintText;
  Function(String)? onChange;
  String? type;
  bool obscureText = false;
  IconButton? viewIcon;

  CustomTextFormField(
      {Key? key,
      required this.hintText,
      required this.onChange,
      required this.obscureText,
      this.viewIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(4.0),
        child: TextFormField(
          obscureText: obscureText,
          validator: (data) {
            if (data!.isEmpty) {
              return 'Field is required';
            }
          },
          onChanged: onChange,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.white,
            ),
            suffixIcon: viewIcon,
          ),
        ));
  }
}
