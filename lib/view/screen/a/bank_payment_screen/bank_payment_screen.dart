import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:intl/intl.dart';

import 'package:tdc_frontend_mobile/view/screen/section_title_screen.dart';
class BankPaymentScreen extends StatefulWidget {
  @override
  State<BankPaymentScreen> createState() => _BankPaymentScreenState();
}

class _BankPaymentScreenState extends State<BankPaymentScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SectionTitleScreen(name: 'ABA Bank Payment'),

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
                            Text("wait sin tv confirm payment method j1 ke sin")
                          ],
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
