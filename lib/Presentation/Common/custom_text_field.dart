import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/Presentation/Resources/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  final bool obscureText;
  final TextInputType textInputType;
  final String? Function(String?)? validator;


  final String? validateText;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    required this.textInputType,
    this.validator,
   
    this.validateText,
  }) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10).h,
        child: Container(
         padding: EdgeInsets.symmetric(horizontal: 25, vertical: 3).w,
          height: 49.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.r),
            color: Colors.white
          ),
          child: TextFormField(
          
            validator:
                validator,
            keyboardType: textInputType,
            obscureText: obscureText,
            controller: controller,
            cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText
            )
               
          ),
        ));
  }
}
