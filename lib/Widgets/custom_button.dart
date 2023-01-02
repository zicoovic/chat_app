import 'package:flutter/material.dart';
// ignore: implementation_imports

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  String? textButton;
  VoidCallback? onTap;
  CustomButton({Key? key, required this.textButton, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(textButton!),
        ),
      ),
    );
  }
}
