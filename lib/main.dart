import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/Application/Login/login_cubit.dart';
import 'package:gym_app/Application/file_picker_cubit.dart';
import 'package:gym_app/Presentation/Views/dash_board.dart';
import 'package:gym_app/Presentation/Views/login_screen.dart';
import 'package:gym_app/Presentation/Views/documents_screen.dart';
import 'package:gym_app/Presentation/Views/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
       minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child)
      => MultiBlocProvider(
        providers: [
    //  BlocProvider<FilePickerCubit>(
    //               create: (BuildContext context) => FilePickerCubit(),
    //             ),
                 BlocProvider<EmailSignInCubit>(
                  create: (BuildContext context) => EmailSignInCubit(),
                ),
                
        ],
        
        child: const MaterialApp(
        debugShowCheckedModeBanner: false,
          home: LoginScreen(),
        ),
      ),
    );
  }
}
