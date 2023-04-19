import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreatePassScreen extends StatefulWidget {
  const CreatePassScreen({Key? key}) : super(key: key);

  @override
  State<CreatePassScreen> createState() => _CreatePassScreenState();
}

class _CreatePassScreenState extends State<CreatePassScreen> {
  bool obsecur = true;
  bool _passwordVisible = false;
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
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 14.w),
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
                              "Create New Password",
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
                          Container(
                            width: ScreenUtil().setWidth(
                              1000.00,
                            ),
                            margin: EdgeInsets.only(
                              left: 24,
                              top: 16,
                              right: 24,
                            ).r,
                            child: Text(
                              "If continuing, you have agreed to our Terms of service and confirm you have read our Privacy and Cookie Statement",
                              maxLines: null,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: ScreenUtil().setSp(
                                  50,
                                ),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 1.57,
                              ),
                            ),
                          ),
                          //input
                          Container(
                            padding:
                                EdgeInsets.only(left: 90, right: 90, top: 50).r,
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.only(
                                    left: 24,
                                    top: 50,
                                    right: 24,
                                  ).r,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      ScreenUtil().setWidth(
                                        2.00,
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            top: 30,
                                            left: 20,
                                            right: 20,
                                          ).r,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  top: 2,
                                                ).r,
                                                child: Text(
                                                  "Password",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:
                                                        ScreenUtil().setSp(
                                                      65,
                                                    ),
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.00,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  bottom: 3,
                                                ).r,
                                                child: Text(
                                                  " *",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize:
                                                        ScreenUtil().setSp(
                                                      60,
                                                    ),
                                                    fontFamily:
                                                        'Source Sans Pro',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 30).r,
                                        child: TextFormField(
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          textInputAction: TextInputAction.next,
                                          //controller: _userPasswordController,
                                          obscureText: !_passwordVisible,
                                          //This will obscure text dynamically
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5.0)),
                                                borderSide: BorderSide(
                                                    color: Colors.grey)),

                                            hintText: 'Enter your password',
                                            // Here is key idea
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                // Based on passwordVisible state choose the icon
                                                _passwordVisible
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                              onPressed: () {
                                                // Update the state i.e. toogle the state of passwordVisible variable
                                                setState(() {
                                                  _passwordVisible =
                                                      !_passwordVisible;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.only(
                                    left: 24,
                                    top: 50,
                                    right: 24,
                                  ).r,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      ScreenUtil().setWidth(
                                        2.00,
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            top: 30,
                                            left: 20,
                                            right: 20,
                                          ).r,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  top: 2,
                                                ).r,
                                                child: Text(
                                                  "Re-Type Password",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:
                                                        ScreenUtil().setSp(
                                                      65,
                                                    ),
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.00,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  bottom: 3,
                                                ).r,
                                                child: Text(
                                                  " *",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize:
                                                        ScreenUtil().setSp(
                                                      60,
                                                    ),
                                                    fontFamily:
                                                        'Source Sans Pro',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 30).r,
                                        child: TextFormField(
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          textInputAction: TextInputAction.done,
                                          //controller: _userPasswordController,
                                          obscureText: !_passwordVisible,
                                          //This will obscure text dynamically
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5.0)),
                                                borderSide: BorderSide(
                                                    color: Colors.grey)),

                                            hintText: 'Enter your password',
                                            // Here is key idea
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                // Based on passwordVisible state choose the icon
                                                _passwordVisible
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                              onPressed: () {
                                                // Update the state i.e. toogle the state of passwordVisible variable
                                                setState(() {
                                                  _passwordVisible =
                                                      !_passwordVisible;
                                                });
                                              },
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

                          Padding(
                            padding: EdgeInsets.only(top: 650).r,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          side:
                                              BorderSide(color: Colors.blue)))),
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
                                  'Login',
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
            ),
          );
        });
  }
}
