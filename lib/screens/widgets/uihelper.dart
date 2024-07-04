import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UiHelper{
  static CustomTextField(TextEditingController controller,String text,IconData icondata){
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 25.w,vertical: 15.h),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: text,
            suffixIcon: Icon(icondata),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5)
            )
        ),
      ),
    );
  }
}