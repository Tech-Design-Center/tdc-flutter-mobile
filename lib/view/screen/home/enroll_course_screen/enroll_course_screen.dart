import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tdc_frontend_mobile/view/widgets/section_title_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../controller/controllers.dart';

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
  final TextEditingController _numberCtrl = TextEditingController();
  @override
  void initState() {
    super.initState();
    _numberCtrl.text = "+85510407799";
  }

  Future<void> _openFacebook() async {
    String fbProtocolUrl;
    if (Platform.isIOS) {
      fbProtocolUrl = 'fb://profile/techdesigncenter';
    } else {
      fbProtocolUrl = 'fb://page/techdesigncenter';
    }

    String fallbackUrl = 'https://www.facebook.com/techdesigncenter';

    try {
      Uri fbBundleUri = Uri.parse(fbProtocolUrl);
      var canLaunchNatively = await canLaunchUrl(fbBundleUri);

      if (canLaunchNatively) {
        launchUrl(fbBundleUri);
      } else {
        await launchUrl(Uri.parse(fallbackUrl), mode: LaunchMode.externalApplication);
      }
    } catch (e, st) {
      // Handle this as you prefer
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SectionTitleScreen(
                name: 'Enroll Course',
                isBackButton: true,
              ),
              Container(
                padding: REdgeInsets.only(top: 50, bottom: 80),
                child: Text(
                  widget.title!,
                  style: TextStyle(fontSize: 80.sp, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: ScreenUtil().setHeight(1850),
                width: ScreenUtil().setWidth(1200),
                decoration: BoxDecoration(
                  border: Border.all(width: 0.8, color: Colors.grey),
                  borderRadius: BorderRadius.all(const Radius.circular(30).w),
                ),
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(60).w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: REdgeInsets.all(0),
                        child: Text("Students Name".tr),
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
                        child: Text("Student ID".tr),
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
                        child: Text("Price".tr),
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
                        child: Text("Course Duration".tr),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 60, bottom: 40).r,
                        child: Text(
                          "30 Days".tr,
                          style: TextStyle(fontSize: 65.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Divider(
                        height: 20.h,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 60).r,
                        child: Text("Enroll Date & Time".tr),
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
              SizedBox(
                height: 80.h,
              ),
              Container(
                width: ScreenUtil().setWidth(1200),
                decoration: BoxDecoration(
                  border: Border.all(width: 0.8, color: Colors.grey),
                  borderRadius: BorderRadius.all(const Radius.circular(30).w),
                ),
                padding: REdgeInsets.only(
                  top: 60,
                  bottom: 60,
                  left: 100,
                  right: 100,
                ),
                child: Column(
                  children: [
                    Text(
                      "Note :".tr,
                      style: TextStyle(
                          fontSize: 60.sp, color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 80.h,
                    ),
                    Text(
                      "Please take a screenshot of this screen and ABA Receipt to the Tech Design Center inbox below."
                          .tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 60.sp, color: Colors.black, height: 1.5),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 80.h,
              ),
              Column(
                children: [
                  Text(
                    "Teach Design Center Contacts :".tr,
                    style: TextStyle(
                        fontSize: 60.sp, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  InkWell(
                    onTap: () async {
                      FlutterPhoneDirectCaller.callNumber(_numberCtrl.text);
                    },
                    child: Container(
                      height: ScreenUtil().setHeight(200),
                      width: ScreenUtil().setWidth(1200),
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.8, color: Colors.grey),
                        borderRadius: BorderRadius.all(const Radius.circular(30).w),
                      ),
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: REdgeInsets.all(60),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.call,
                              size: 80.h,
                              color: Colors.blueAccent,
                            ),
                            SizedBox(
                              width: 50.h,
                            ),
                            Text(
                              "Tel : +855 10 407 799",
                              style:
                                  TextStyle(fontSize: 60.sp, color: Colors.black.withOpacity(0.7)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  InkWell(
                    onTap: () async {
                      _openFacebook();
                    },
                    child: Container(
                      height: ScreenUtil().setHeight(200),
                      width: ScreenUtil().setWidth(1200),
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.8, color: Colors.grey),
                        borderRadius: BorderRadius.all(const Radius.circular(30).w),
                      ),
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: REdgeInsets.all(60),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.facebook,
                              size: 80.h,
                              color: Colors.blueAccent,
                            ),
                            SizedBox(
                              width: 50.h,
                            ),
                            Text(
                              "FB Page : Tech Design Center",
                              style:
                                  TextStyle(fontSize: 60.sp, color: Colors.black.withOpacity(0.7)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  InkWell(
                    onTap: () async {
                      await launch(
                        "https://t.me/Techdesigncenter",
                        forceSafariVC: false,
                        forceWebView: false,
                        headers: <String, String>{'my_header_key': 'my_header_value'},
                      );
                    },
                    child: Container(
                      height: ScreenUtil().setHeight(200),
                      width: ScreenUtil().setWidth(1200),
                      decoration: BoxDecoration(
                        border: Border.all(width: 0.8, color: Colors.grey),
                        borderRadius: BorderRadius.all(const Radius.circular(30).w),
                      ),
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: REdgeInsets.all(60),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.telegram,
                              size: 80.h,
                              color: Colors.blueAccent,
                            ),
                            SizedBox(
                              width: 50.h,
                            ),
                            Text(
                              "Telegram : @Techdesigncenter ",
                              style:
                                  TextStyle(fontSize: 60.sp, color: Colors.black.withOpacity(0.7)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: REdgeInsets.only(top: 70),
                width: ScreenUtil().screenWidth,
                color: Colors.white,
                child: InkWell(
                  child: Container(
                    width: ScreenUtil().screenWidth,
                    color: Colors.white,
                    child: InkWell(
                      onTap: () async {
                        await launch(
                          widget.ABAPaymentURL!,
                          forceSafariVC: false,
                          forceWebView: false,
                          headers: <String, String>{'my_header_key': 'my_header_value'},
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 220.h,
                        margin: REdgeInsets.only(
                          top: 10,
                          bottom: 60,
                          left: 100,
                          right: 100,
                        ),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.blueAccent,
                        ),
                        child: Text(
                          "Pay Now".tr,
                          style: TextStyle(
                              color: Colors.white, fontSize: 70.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
