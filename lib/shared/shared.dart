import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../colors.dart';

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





Widget   mainButton (
{
  required BuildContext context,
  double? width,
  double? height,
  Color? backgroundColor,
  Color? textColor,
  double? textFontSize,
  required String text,
  required Function function,
}
    )=> Container(
  width: width ?? double.infinity,
  height:height ?? MediaQuery.of(context).size.height*0.06,
  child: MaterialButton(
    shape: RoundedRectangleBorder(
        borderRadius:
        BorderRadius.circular(15.0),
        side:
        BorderSide(color: Colors.white24)),
    onPressed: function(),
    color: backgroundColor ?? mainColor,
    textColor: Theme.of(context)
        .scaffoldBackgroundColor,
    child: Text(text??'',
      style: TextStyle(
          color: textColor ?? secondaryColor,
          fontSize: textFontSize ?? 16.sp,
          fontWeight: FontWeight.bold
      ),
    ),),
);