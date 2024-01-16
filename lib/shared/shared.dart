import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'colors.dart';

Widget textFormField({
  bool? obscureText ,
  IconButton? passwordSuffixIcon,
  Icon? prefixIcon,

  required String text,
  required String ifEmpty,
  required TextInputType textInputType,
  required TextEditingController textEditingController,
}) => TextFormField(
  keyboardType: textInputType,


  controller: textEditingController,
  obscureText:  obscureText ?? false ,

  validator: (value) {
    if ( value!.isEmpty) {
      return ifEmpty;
    }

  },

  decoration: InputDecoration(
    filled: true,
      fillColor: secondaryColor,

      hintText: text,
      hintStyle: TextStyle(

          color: Colors.grey
      ),
      focusColor: Colors.white,
      focusedBorder:OutlineInputBorder(

        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
          color: Colors.grey.withOpacity(0.5),
        ),

      ),
      focusedErrorBorder:OutlineInputBorder(

        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
          color: Colors.grey.withOpacity(0.5),
        ),

      ),
      disabledBorder: OutlineInputBorder (

        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
          color: Colors.grey.withOpacity(0.5),
        ),

      ),
      enabledBorder: OutlineInputBorder(

        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(
          color: Colors.grey.withOpacity(0.5),

        ),

      ),

    suffixIcon: passwordSuffixIcon ,
    prefixIcon:prefixIcon ,

  ),


);





