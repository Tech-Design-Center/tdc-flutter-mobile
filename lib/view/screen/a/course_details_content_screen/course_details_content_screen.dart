import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/view/screen/a/course_details_content_screen/widgets/listitem4_item_widget.dart';


// ignore: must_be_immutable
class CourseDetailsContentScreen extends StatelessWidget {
bool isEnrolled = true;
CourseDetailsContentScreen(
  {required this.isEnrolled}
);


  final _headerStyle =  TextStyle(
      fontSize: 16, fontWeight: FontWeight.w600, fontFamily: 'poppins');

  @override
  Widget build(BuildContext context) {
  
    return  Padding(
      padding:EdgeInsets.only(left: 14,right: 14,top: 50).r,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Listitem4ItemWidget(),
            Listitem4ItemWidget(),
            Listitem4ItemWidget(),
            Listitem4ItemWidget(),
            Listitem4ItemWidget(),
            Listitem4ItemWidget(),
            Listitem4ItemWidget(),
            Listitem4ItemWidget(),
            Listitem4ItemWidget(),
          ],
        ),
          ),
    );


        
  }
}



