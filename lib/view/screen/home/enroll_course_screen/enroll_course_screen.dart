import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:intl/intl.dart';
import 'package:tdc_frontend_mobile/view/screen/home/course_details_screen.dart';
import 'package:tdc_frontend_mobile/view/widgets/section_title_screen.dart';

import '../../../../controller/controllers.dart';
import '../../../../model/course.dart';
import '../../my_learning/confirm_payment_screen/confirm_payment_screen.dart';

class EnrollCourseScreen extends StatefulWidget {
  final int? price;
  final String? ABAPaymentURL;
  final String? title;

  const EnrollCourseScreen(
      {super.key, required this.price, required this.ABAPaymentURL, required this.title});

  @override
  State<EnrollCourseScreen> createState() => _EnrollCourseScreenState();
}

class _EnrollCourseScreenState extends State<EnrollCourseScreen> {
  Object? value2;
  String date = DateFormat("dd-MM-yyyy | HH:mm").format(DateTime.now());
  String time = DateFormat("HH:mm:ss").format(DateTime.now());
  String _verticalGroupValue = "ABA BANK";

  final _status = ["ABA BANK"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SectionTitleScreen(
              name: 'Enroll Course',
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: REdgeInsets.only(top: 50, bottom: 80),
                      child: Text(
                        "Microsoft Office 2019",
                        style: TextStyle(fontSize: 80.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      height: ScreenUtil().setHeight(1500),
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
                              padding: REdgeInsets.all(0),
                              child: Text("Students Name"),
                            ),
                            Padding(
                              padding: REdgeInsets.only(top: 60, bottom: 40),
                              child: Text(
                                authController.user.value!.fullName!,
                                style: TextStyle(fontSize: 65.sp, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Divider(
                              height: 20.h,
                              color: Colors.black,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 60).r,
                              child: Text("Student ID"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 60, bottom: 40).r,
                              child: Text(
                                '# ${authController.user.value!.id!}',
                                style: TextStyle(fontSize: 65.sp, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Divider(
                              height: 20.h,
                              color: Colors.black,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 60).r,
                              child: Text("Price"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 60, bottom: 40).r,
                              child: Text(
                                "${widget.price} \$",
                                style: TextStyle(fontSize: 65.sp, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Divider(
                              height: 20.h,
                              color: Colors.black,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 60).r,
                              child: Text("Enroll Date & Time"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 60, bottom: 40).r,
                              child: Text(
                                date,
                                style: TextStyle(fontSize: 65.sp, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: REdgeInsets.only(top: 50, bottom: 80, left: 130),
                      child: Text(
                        "Payment Method",
                        style: TextStyle(fontSize: 60.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      height: ScreenUtil().setHeight(300),
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
                              _verticalGroupValue = value ?? '';
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
                      padding: REdgeInsets.only(top: 200),
                      child: Container(
                        width: ScreenUtil().screenWidth,
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              Get.to(ConfirmPaymentScreen(
                                ABAPaymentURL: widget.ABAPaymentURL!,
                                title: widget.title!,
                              ));
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
                            child: Text(
                              "Next",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 70.sp,
                                  fontWeight: FontWeight.bold),
                            ),
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
