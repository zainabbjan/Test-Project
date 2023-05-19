import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDialogue {
  Future<void> Dialogg(BuildContext context,
      {required String? title,
      required String? message,
      bool? barrierDismissible}) async {
    return showDialog<void>(
      context: context,
      barrierColor: Colors.black12,
      barrierDismissible: barrierDismissible ?? true,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(15).r,
          elevation: 0.0,
          backgroundColor: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10).r,
          ),
          child: SuccessFulDialog.show(
              context: context, title: title, message: message),
        );
      },
    );
  }
}

class SuccessFulDialog {
  static Widget show(
      {required BuildContext context,
      required String? title,
      required String? message,
      double? height,
      double? width}) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop(true);
      },
      child: Container(
        height: height ?? 200.sp,
        width: width ?? 290.sp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
        ),
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 30.sp),
          children: <Widget>[
            SizedBox(
              height: 30.sp,
            ),
            Center(
                child: FittedBox(
                    child: Text(
              title!,
              style: TextStyle(fontSize: 40.sp),
            ))),
            SizedBox(
              height: 10.sp,
            ),
            Text(
              message!,
              style: TextStyle(fontSize: 12.sp),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
