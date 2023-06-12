import 'package:flutter/material.dart';

import '../utils/app_color.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    Key? key,
    required this.controller,
    required this.validator,
    required this.hintText,
    this.textInputType,
    this.maxlines,
  }) : super(key: key);

  final TextEditingController controller;
  final Function(String?) validator;
  final String hintText;
  final TextInputType? textInputType;
  final int? maxlines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxlines?? 1,
      controller: controller,
      validator: (value) =>validator(value),
      keyboardType:textInputType,
      decoration:  InputDecoration(
        hintText:hintText ,
        hintStyle: const TextStyle(
            color: softGreyColor
        ),
        contentPadding: const EdgeInsets.symmetric(
            horizontal: 16, vertical: 4),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: primaryColor,
              width: 2),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: primaryColor,
              width: 2),
        ),
      ),
    );
  }
}