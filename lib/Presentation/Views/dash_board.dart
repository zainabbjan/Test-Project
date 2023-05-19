
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gym_app/Data/Models/posts_data.dart';
import 'package:gym_app/Presentation/Common/custom_dialogue.dart';
import 'package:gym_app/Presentation/Common/posts_custom_card.dart';
import 'package:gym_app/Presentation/Resources/app_colors.dart';


class DashboardHomePage extends StatefulWidget {
  @override
  State<DashboardHomePage> createState() => _DashboardHomePageState();
}

class _DashboardHomePageState extends State<DashboardHomePage> {
  @override
  void initState() {
      Future.delayed(const Duration(milliseconds: 500) ).then((value) =>CustomDialogue().Dialogg(context, title: ' Thank you!', message: 'All the documets are uploaded . Thank you!')) ;
   
      Future.delayed(const Duration(seconds: 3)).then((value) => Navigator.of(context).pop(true));
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20).r,
        child: Column(
          children: [
            
            Container(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: postsData.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 42.r,
                      backgroundColor: AppColors.primaryColorLight,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                          postsData[index].profileUrl,
                        ),
                        radius: 40,
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: postsData.length,
                itemBuilder: (BuildContext context, int index) {
                  return PostCustomCard(name: postsData[index].name, profileUrl: postsData[index].profileUrl, postImageUrls: postsData[index].postImageUrls,);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
