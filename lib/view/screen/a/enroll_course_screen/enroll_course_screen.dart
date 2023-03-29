import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:intl/intl.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/core/constants/constants.dart';
import 'package:tdc_frontend_mobile/core/constants/image_constant.dart';
import 'package:tdc_frontend_mobile/view/screen/a/bank_payment_screen/bank_payment_screen.dart';
import 'package:tdc_frontend_mobile/view/screen/a/course_details_screen/course_details_screen.dart';
import 'package:tdc_frontend_mobile/view/screen/section_title_screen.dart';
class EnrollCourseScreen extends StatefulWidget {
  @override
  State<EnrollCourseScreen> createState() => _EnrollCourseScreenState();
}

class _EnrollCourseScreenState extends State<EnrollCourseScreen> {
  Object? value2;
  String date = DateFormat("dd-MM-yyyy | HH:mm").format(DateTime.now());
  String time = DateFormat("HH:mm:ss").format(DateTime.now());
  String _verticalGroupValue = "ABA BANK";

  final _status = ["ABA BANK", "Direct Payment"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children:  
              [
            SectionTitleScreen(name: 'Enroll Course', widget: CourseDetailsScreen(isEnrolled: false,),),
                        
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 50,bottom: 80).r,
                      child: Text("Microsoft Office 2019",style: TextStyle(fontSize: 80.sp,fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      height: ScreenUtil().setHeight(1330),
                      width: ScreenUtil().setWidth(1200),

                      decoration: BoxDecoration(
                        border: Border.all(width: 0.8, color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(30).w),
                      ),
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(60).w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(0),
                              child: Text("Students Name"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 60,bottom: 40).r,
                              child: Text("Tech Design Center",style: TextStyle(fontSize: 65.sp,fontWeight: FontWeight.bold),),
                            ),
                            Divider(height: 20.h,color: Colors.black,),
                            Padding(
                              padding: const EdgeInsets.only(top: 60).r,
                              child: Text("Student ID"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 60,bottom: 40).r,
                              child: Text("# 1111",style: TextStyle(fontSize: 65.sp,fontWeight: FontWeight.bold),),
                            ),
                            Divider(height: 20.h,color: Colors.black,),
                            Padding(
                              padding: const EdgeInsets.only(top: 60).r,
                              child: Text("Price"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 60,bottom: 40).r,
                              child: Text("30 \$",style: TextStyle(fontSize: 65.sp,fontWeight: FontWeight.bold),),
                            ),
                            Divider(height: 20.h,color: Colors.black,),

                            Padding(
                              padding: const EdgeInsets.only(top: 60).r,
                              child: Text("Enroll Date & Time"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 60,bottom: 40).r,
                              child:
                              Text(date,style: TextStyle(fontSize: 65.sp,fontWeight: FontWeight.bold),),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(top: 50,bottom: 80,left: 130).r,
                      child: Text("Payment Method",style: TextStyle(fontSize: 60.sp,fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      height: ScreenUtil().setHeight(380),
                      width: ScreenUtil().setWidth(1200),

                      decoration: BoxDecoration(
                        border: Border.all(width: 0.8, color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(30).w),
                      ),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          RadioGroup<String>.builder(
                            groupValue: _verticalGroupValue,
                            onChanged: (value) => setState(() {
                              _verticalGroupValue = value?? '';
                            }),
                            items: _status,
                            itemBuilder: (item) => RadioButtonBuilder(
                              item,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(

                      
                      padding: EdgeInsets.only(top: 200).r,
                      child:
                      Container(
                        width: ScreenUtil().screenWidth,
                        color: Colors.white,
                        child: InkWell(
                          onTap:() {
                            setState(() {

                                Get.to(BankPaymentScreen());

                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 220.h,
                            margin: EdgeInsets.only(
                              top: 10,
                              bottom: 60,
                              left: 100,
                              right: 100,
                            ).r,
                            decoration: BoxDecoration(

                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              color: Colors.blueAccent,

                            ),
                            child: Text("Next",style: TextStyle(color: Colors.white,fontSize: 70.sp,fontWeight: FontWeight.bold),),

                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
