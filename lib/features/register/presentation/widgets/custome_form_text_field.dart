import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
   CustomFormTextField({
    super.key,required this.validator,required this.hintText,
     required this.keyboardType,this.obscureText,required this.controller
  });

  String? Function(String?)? validator;
   String? hintText;
   TextInputType keyboardType;
   bool? obscureText;
   TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      keyboardType: keyboardType,
      obscureText:obscureText?? false ,
      controller: controller,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide()
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15)
          ),focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15)
      ),errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15)
      )
      ),
    );
  }
}
