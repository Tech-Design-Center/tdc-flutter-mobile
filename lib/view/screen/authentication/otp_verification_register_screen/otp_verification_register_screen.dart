import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationRegisterScreen extends StatefulWidget {
  const OtpVerificationRegisterScreen({Key? key}) : super(key: key);

  @override
  State<OtpVerificationRegisterScreen> createState() =>
      _OtpVerificationRegisterScreenState();
}

class _OtpVerificationRegisterScreenState
    extends State<OtpVerificationRegisterScreen> {
  bool isVerified = false;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(1440, 3120),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return Scaffold(
            body: SafeArea(
              child: Container(
                width: ScreenUtil().screenWidth,
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                          bottom: 10,
                                          top: 20,
                                          left: 20,
                                          right: 20)
                                      .r,
                                  child: TextButton(
                                    style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.blue),
                                    ),
                                    onPressed: () {
/*
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context)
                                        =>SignInScreen()),
                                      );
*/
                                    },
                                    child: Image(
                                      image: AssetImage(
                                          'assets/images/img_arrowleft.png'),
                                      height: ScreenUtil().setHeight(70),
                                      width: ScreenUtil().setWidth(70),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 142,
                                  top: 10,
                                  right: 142,
                                ).r,
                                child: Image(
                                  image: AssetImage(
                                      'assets/images/img_info_83X90.png'),
                                  height: ScreenUtil().setHeight(400),
                                  width: ScreenUtil().setWidth(400),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 24,
                            top: 18,
                            right: 24,
                          ).r,
                          child: Text(
                            "OTP Verification Code",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(
                                90,
                              ),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.36,
                              height: 1.00,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 24,
                            top: 22,
                            right: 24,
                          ).r,
                          child: Text(
                            "Enter the 4 digits code sent to you at",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: ScreenUtil().setSp(
                                50,
                              ),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 1.00,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 24,
                            top: 70,
                            right: 24,
                          ).r,
                          child: Text(
                            "inbox.tdc@gmail.com",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(
                                80,
                              ),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              height: 1.00,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 24,
                            top: 150,
                            right: 24,
                          ).r,
                          child: Container(
                            width: ScreenUtil().setWidth(
                              1100.00,
                            ),
                            height: ScreenUtil().setHeight(
                              400.00,
                            ),
                            child: PinCodeTextField(
                              // onSubmitted: (value) {
                              //   setState(() {
                              //     isVerified=true;
                              //   });

                              // },
                              onCompleted: (val) {
                                setState(() {
                                  isVerified = true;
                                });
                              },
                              backgroundColor: Colors.transparent,
                              appContext: context,
                              length: 4,
                              obscureText: false,
                              obscuringCharacter: '*',
                              keyboardType: TextInputType.number,
                              autoDismissKeyboard: true,
                              enableActiveFill: true,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              onChanged: (value) {
                                //  setState(() {
                                //   isVerified=true;
                                // });
                              },
                              textStyle: TextStyle(
                                fontSize: ScreenUtil().setSp(
                                  80,
                                ),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.36,
                                height: 1.00,
                              ),
                              pinTheme: PinTheme(
                                fieldHeight: ScreenUtil().setHeight(
                                  200.00,
                                ),
                                fieldWidth: ScreenUtil().setWidth(
                                  200.00,
                                ),
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(
                                  ScreenUtil().setWidth(
                                    16.00,
                                  ),
                                ),
                                selectedFillColor: Colors.grey,
                                activeFillColor: Colors.grey,
                                inactiveFillColor: Colors.white,
                                inactiveColor: Colors.black26,
                                selectedColor: Colors.indigo,
                                activeColor: Colors.black12,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 24,
                            top: 52,
                            right: 24,
                          ).r,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 1,
                                  bottom: 30,
                                ).r,
                                child: Text(
                                  "Didn’t receive the code?",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: ScreenUtil().setSp(
                                      60,
                                    ),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 1.00,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 30,
                                  bottom: 30,
                                ).r,
                                child: Text(
                                  "Resend code",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Colors.indigo,
                                    fontSize: ScreenUtil().setSp(
                                      60,
                                    ),
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    height: 1.00,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: BorderSide(color: Colors.blue)))),
                            onPressed: () {},
                            child: Container(
                              width: ScreenUtil().setWidth(1100),
                              height: ScreenUtil().setHeight(190),
                              margin: EdgeInsets.only(
                                left: 19,
                                top: 20,
                                right: 19,
                              ).r,
                              alignment: Alignment.center,
                              child: Text(
                                'Verify',
                                style: TextStyle(fontSize: 65.sp),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
