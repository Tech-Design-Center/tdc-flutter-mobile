import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../sign_in_screen/sign_in_screen.dart';

class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 14.w),
            child: Container(
              width: ScreenUtil().screenWidth,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 24,
                      top: 70,
                      right: 24,
                    ).r,
                    child: Image(
                      image: AssetImage('assets/images/logo.png'),
                      height: ScreenUtil().setHeight(600),
                      width: ScreenUtil().setWidth(600),
                    ),
                  ),
                  Container(
                    width: ScreenUtil().setWidth(
                      1000.00,
                    ),
                    margin: EdgeInsets.only(
                      left: 24,
                      top: 30,
                      right: 24,
                    ).r,
                    child: Text(
                      "Forget Password",
                      maxLines: null,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(
                          90,
                        ),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.36,
                        height: 1.33,
                      ),
                    ),
                  ),
                  //input
                  Container(
                    padding: REdgeInsets.only(left: 90, right: 90, top: 50),
                    alignment: Alignment.center,
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Please Contact to Tech Design Center Telegram\nto recover your password",textAlign: TextAlign.center,style: TextStyle(fontSize: 15),),
                        SizedBox(height: 100.h,),
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
                                    style: TextStyle(
                                        fontSize: 60.sp, color: Colors.black.withOpacity(0.7)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Spacer(),

                  Column(
                    children: [

                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 13).r,
                        child: TextButton(
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Colors.black.withOpacity(0.8)),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignInScreen()),
                            );
                          },
                          child: Container(
                            width: 0.9.sw,
                            child: Column(
                              children: [
                                Text(
                                  'Back',
                                  style: TextStyle(
                                      fontSize: 18,
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'PoppinsMedium16'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
