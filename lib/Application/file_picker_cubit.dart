
// import 'dart:io';

// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:image_picker/image_picker.dart';

// import 'package:gym_app/Presentation/Resources/app_colors.dart';

// // Cubit for managing the state of the picked file
// class FilePickerCubit extends Cubit<File?> {
//   FilePickerCubit() : super(null);

//   void pickImage(ImageSource source) async {
//     final picker = ImagePicker();
//     final pickedImage = await picker.pickImage(
//       source: source,
//       imageQuality: 80,
//     );

//     if (pickedImage != null) {
//       emit(File(pickedImage.path));
//     }
//   }

//   void pickFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles();

//     if (result != null) {
//       emit(File(result.files.single.path!));
//     }
//   }
// }


