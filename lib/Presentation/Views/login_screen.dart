import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/Application/Login/login_cubit.dart';
import 'package:gym_app/Application/Login/login_state.dart';
import 'package:gym_app/Data/Repository/login_repo.dart';
import 'package:gym_app/Presentation/Common/custom_Button.dart';
import 'package:gym_app/Presentation/Common/custom_dialogue.dart';
import 'package:gym_app/Presentation/Common/custom_text_field.dart';
import 'package:gym_app/Presentation/Resources/app_colors.dart';
import 'package:gym_app/Presentation/Resources/navigation.dart';
import 'package:gym_app/Presentation/Resources/validation.dart';
import 'package:gym_app/Presentation/Views/dash_board.dart';
import 'package:gym_app/Presentation/Views/documents_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    userNameController.clear();
    passwordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              ClipPath(
                clipper: Clipper(),
                child: Container(
              height: 200,
              color: AppColors.primaryColor,
                ),
              ),
              Form(
                key: formKey,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Log in',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40.sp,
                            color: Colors.white),
                      ),
                      CustomTextField(
                          validator: Validate.email,
                          controller: userNameController,
                          hintText: 'Email Address',
                          textInputType: TextInputType.emailAddress),
                      CustomTextField(
                          validator: Validate.password,
                          controller: passwordController,
                          hintText: 'Password',
                          textInputType: TextInputType.text),
                      SizedBox(
                        height: 10,
                      ),
                      BlocConsumer<EmailSignInCubit, EmailState>(
                        listener: (context, state) {
                       if(state is ErrorEmailSigIn){
                        CustomDialogue().Dialogg(context, title: 'Error', message:'PLease Try Again!');
                            userNameController.clear();
            passwordController.clear();
        
                       }else if(state is LoadedEmailSigIn){
             
                        Navigate.toReplace(context, DocumentScreen(isShowDialogue: true,));
                       }
                        },
                        builder: (context, state) {
                          return CustomButton(
                              color: AppColors.primaryColor,
                              text: state is LoadingEmailSigIn?'Loading...':'Log in',
                              onTap: () {
        
                                if (formKey.currentState!.validate()) {
                                  context
                                      .read<EmailSignInCubit>()
                                      .emailLogin(userNameController.text);
                                    FocusScope.of(context).unfocus();
                                }
                              });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 35).h,
                        child: Text(
                          'forgot password?',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15.sp,
                              color: Colors.grey),
                        ),
                      ),
                      Text(
                        'Register now',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    log('${size.width.toString()}');
    var path = new Path();
    

    //path.quadraticBezierTo(300, 0, 0, 20);

  path.lineTo(0, size.height);
  var firstStart = Offset(size.width/5, size.height);
  var firstEnd = Offset(size.width /2.25, size.height - 50.0);

path.quadraticBezierTo(firstStart.dx, firstStart.dy,
 firstEnd.dy, firstEnd.dy);

 var secondStart = Offset(size.width - (size.width)/3.24, size.height - 105 );

 var secondEnd = Offset(size.width, size.height - 10);

path.quadraticBezierTo(secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}
