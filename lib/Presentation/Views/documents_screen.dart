// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gym_app/Presentation/Common/custom_dialogue.dart';
import 'package:gym_app/Presentation/Resources/navigation.dart';
import 'package:gym_app/Presentation/Views/dash_board.dart';
import 'package:image_picker/image_picker.dart';

import 'package:gym_app/Data/Models/posts_data.dart';
import 'package:gym_app/Presentation/Common/custom_Button.dart';
import 'package:gym_app/Presentation/Resources/app_colors.dart';

class DocumentScreen extends StatefulWidget {
  final bool isShowDialogue;
  const DocumentScreen({
    Key? key,
    required this.isShowDialogue,
  }) : super(key: key);
  
  @override
  _DocumentScreenState createState() => _DocumentScreenState();
  
  
}

class _DocumentScreenState extends State<DocumentScreen> {
  List<File?> pickedFiles = List.generate(4, (_) => null);
 
@override
  void initState() {
    // TODO: implement initState
    if(widget.isShowDialogue)
    {
      Future.delayed(const Duration(milliseconds: 500) ).then((value) =>CustomDialogue().Dialogg(context, title: ' Login Successfull', message: 'You can proceed . Thank you!')) ;
      Future.delayed(const Duration(seconds: 3)).then((value) => Navigator.of(context).pop(true));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 70,left: 10,right: 10,bottom: 5),
          child: Column(
            children: [
               Text('Upload Documents',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35.sp,
                  color: Colors.white
                ),),
              
              Padding(
                padding: const EdgeInsets.only(top: 12,bottom: 25),
                child: Row(
                       children: [
                        for (int i = 0; i < 4; i++)
                        Padding(
              
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                margin: EdgeInsets.only(left: 10).r,
                      width: 55,
                      height: 6,
                      color: pickedFiles[i] != null ?AppColors.primaryColor: Colors.grey,
                        ),
                      )
                    ],
                ),
              ),
              for (int i = 0; i < 4; i++)
                GestureDetector(
                  onTap: () {
                    _showPickerDialog(i);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10).h,
                    child: Container(
                      height: 50.h,
                      padding: EdgeInsets.symmetric(horizontal: 16).r,
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                       color: Colors.white
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                                names[i],
                         
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          pickedFiles[i] != null
                              ? Container(
                                  width: 35.h,
                                  height: 35.h,
                                  decoration:const  BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    
                                  
                                  ),
                                  child: pickedFiles[i]!.path.endsWith('.pdf')
                                      ? const Icon(
                                          Icons.picture_as_pdf,

                                          
                                        )
                                      : Image.file(
                                          pickedFiles[i]!,
                                          fit: BoxFit.cover,
                                        ),
                                )
                              : SizedBox(),
      
                             
                        ],
                      ),
                    ),
                  ),
                ),
                 Padding(
                   padding: const EdgeInsets.only(bottom: 5,top:50).h,
                   child: CustomButton(color:  pickedFiles[0] != null && pickedFiles[1] != null && pickedFiles[2] != null && pickedFiles[3] != null? AppColors.primaryColorLight:
                      Colors.grey, text: 'Done', onTap: () { 

                       if( pickedFiles[0] != null && pickedFiles[1] != null && pickedFiles[2] != null && pickedFiles[3] != null) {
                      
                        Navigate.to(context, DashboardHomePage());
                       }else{
                        CustomDialogue().Dialogg(context, title: 'Dear User!', message: 'Kindly upload all the documents');
                       }
                       },),



                 ),
            ],
          ),
        ),
      ),
    );
  }

  void _showPickerDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Source',style: TextStyle(fontWeight: FontWeight.bold),),
          content: Text('Choose where to select the file from:'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _pickImage(ImageSource.gallery, index);
              },
              child: Text('Image from Gallery'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _pickImage(ImageSource.camera, index);
              },
              child: Text('Image from Camera',),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _pickFile(index);
              },
              child: Text('Document'),
            ),
          ],
        );
      },
    );
  }

  void _pickImage(ImageSource source, int index) async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
      source: source,
      imageQuality: 80,
    );

    if (pickedImage != null) {
      setState(() {
        pickedFiles[index] = File(pickedImage.path);
      });
    }
  }

  void _pickFile(int index) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        pickedFiles[index] = File(result.files.single.path!);
      });
    }
  }
}

