import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.color, required this.text, required this.onTap,
  });

 final Color color;
 final String text;
final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: onTap,

  
      child: Container(
                     height: 50.h,
                   width: double.infinity,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(25).r,
                       color: color,
                         boxShadow: 
                 [
                      BoxShadow(
                        color: Colors.black26,
                        spreadRadius: 1.0,
                        blurRadius: 15,
                        offset: Offset(0.0, 5.0),
                      )
                    ]
                   
                     ),
                     child:Center(child: Text(text,style: TextStyle(fontSize: 18.sp,color: Colors.white),),)
                   ),
    );
  }
}
