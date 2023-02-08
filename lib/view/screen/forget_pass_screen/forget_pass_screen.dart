import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdc_frontend_mobile/view/Screen/sign_in_screen/sign_in_screen.dart';
import 'package:tdc_frontend_mobile/view/screen/otp_verification_forget_screen/otp_verification_forget_screen.dart';
class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(1440, 3120),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return SafeArea(
            child: GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                body: SingleChildScrollView(
                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(
                        vertical: 20.h, horizontal: 14.w),
                    child: Container(
                      width: ScreenUtil().screenWidth,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets
                                .only(

                              left: 24,
                              top: 70,
                              right: 24,
                            )
                                .r,
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
                            margin: EdgeInsets
                                .only(

                              left: 24,
                              top: 30,
                              right: 24,
                            )
                                .r,
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
                            padding: EdgeInsets
                                .only(left: 90, right: 90, top: 50)
                                .r,
                            alignment: Alignment.center,

                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                //email
                                Container(

                                  width: ScreenUtil().screenWidth,
                                  margin: EdgeInsets
                                      .only(
                                    left: 24,
                                    top: 20,
                                    right: 24,
                                  )
                                      .r,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      ScreenUtil().setWidth(
                                        2.00,
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: EdgeInsets
                                              .only(
                                            left: 20,
                                            right: 20,
                                          )
                                              .r,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment
                                                .center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets
                                                    .only(

                                                  top: 2,
                                                )
                                                    .r,
                                                child: Text(
                                                  "Email",
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.start,

                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: ScreenUtil().setSp(
                                                      65,
                                                    ),
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.00,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets
                                                    .only(

                                                  bottom: 3,
                                                )
                                                    .r,
                                                child: Text(
                                                  " *",
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: ScreenUtil().setSp(
                                                      60,
                                                    ),
                                                    fontFamily: 'Source Sans Pro',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 30).r,
                                        child:  TextFormField(
                                          keyboardType: TextInputType.emailAddress,
                                          textInputAction: TextInputAction.done,
                                          autocorrect: false,
                                          obscureText: false,
                                          decoration: InputDecoration(

                                              fillColor: Colors.white,
                                              filled: true,
                                              border: OutlineInputBorder(),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(5.0)),
                                                  borderSide: BorderSide(
                                                      color: Colors.grey)),
                                              hintText: 'Email'
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Padding(padding: EdgeInsets.only(top: 1300).r,
                            child: Column(
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(18.0),
                                              side: BorderSide(color: Colors.blue)
                                          )
                                      )
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                OtpVerificationForgetScreen()),
                                            (Route<dynamic> route) => false);
                                  }, child: Container(

                                  width: ScreenUtil().setWidth(1100),
                                  height: ScreenUtil().setHeight(190),
                                  margin: EdgeInsets
                                      .only(left: 19, top: 20, right: 19,)
                                      .r,
                                  alignment: Alignment.center,
                                  child: Text('Register', style: TextStyle(fontSize: 65.sp),),),
                                ),

                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets
                                      .only(top: 13)
                                      .r,
                                  child: TextButton(
                                    style: ButtonStyle(
                                      foregroundColor: MaterialStateProperty.all<Color>(
                                          Colors.black.withOpacity(0.8)),
                                    ),
                                    onPressed: () {

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context)
                                        =>SignInScreen()),
                                      );
                                    },
                                    child: Container(
                                      width: 0.9.sw,
                                      child: Column(
                                        children: [
                                          Text('Back', style: TextStyle(
                                              fontSize: 18,
                                              decoration: TextDecoration.underline,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'PoppinsMedium16'),),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],

                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
