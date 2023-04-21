import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdc_frontend_mobile/view/screen/home/enroll_course_screen/enroll_course_screen.dart';

import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:tdc_frontend_mobile/view/widgets/section_title_screen.dart';

import 'package:url_launcher/url_launcher.dart';

class ConfirmPaymentScreen extends StatefulWidget {
  final String? ABAPaymentURL;
  final String? title;
  const ConfirmPaymentScreen({super.key, required this.ABAPaymentURL, required this.title});

  @override
  State<ConfirmPaymentScreen> createState() => _ConfirmPaymentScreenState();
}

class _ConfirmPaymentScreenState extends State<ConfirmPaymentScreen> {
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
        child: Column(
          children: [
            SectionTitleScreen(name: 'Payment Method'),
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
                    Text(
                      "Please Click Pay Button to Enroll this Course.",
                      style: TextStyle(fontSize: 60.sp, color: Colors.black.withOpacity(0.5)),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Text(
                      "Note :  After Pay, Please Screenshot Receipt \n and Send to Tech Design Center Telegram",
                      style: TextStyle(
                          height: 6.h, fontSize: 60.sp, color: Colors.redAccent.withOpacity(0.8)),
                    ),
                    SizedBox(
                      height: 200.h,
                    ),
                    Text(
                      "Teach Design Center Contacts :",
                      style: TextStyle(fontSize: 60.sp, color: Colors.black.withOpacity(0.5)),
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
                          borderRadius: BorderRadius.all(Radius.circular(30).w),
                        ),
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(60).w,
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
                                style: TextStyle(
                                    fontSize: 60.sp, color: Colors.black.withOpacity(0.7)),
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
                          borderRadius: BorderRadius.all(Radius.circular(30).w),
                        ),
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(60).w,
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
                                style: TextStyle(
                                    fontSize: 60.sp, color: Colors.black.withOpacity(0.7)),
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
                          borderRadius: BorderRadius.all(Radius.circular(30).w),
                        ),
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(60).w,
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
                                style: TextStyle(
                                    fontSize: 60.sp, color: Colors.black.withOpacity(0.7)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 600.h,
                    ),
                    Container(
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
                            "Pay Now",
                            style: TextStyle(
                                color: Colors.white, fontSize: 70.sp, fontWeight: FontWeight.bold),
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
