import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tdc_frontend_mobile/core/extension/string_extension.dart';
import 'package:tdc_frontend_mobile/view/dashboard_screen.dart';
import 'package:tdc_frontend_mobile/view/screen/home/homepage_expand_screen/homepage_expand_screen.dart';

import '../../../../controller/controllers.dart';
import '../forget_pass_screen/forget_pass_screen.dart';
import '../sign_up_screen/sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool obsecur = true;
  bool _passwordVisible = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 14.w),
              child: Container(
                width: ScreenUtil().screenWidth,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: REdgeInsets.only(
                          left: 24,
                          top: 70,
                          right: 24,
                        ),
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
                        margin: REdgeInsets.only(
                          left: 24,
                          top: 30,
                          right: 24,
                        ),
                        child: Text(
                          "Login to access\n your course",
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
                        margin: REdgeInsets.only(
                          left: 24,
                          top: 16,
                          right: 24,
                        ),
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
                        padding: REdgeInsets.only(left: 90, right: 90, top: 50),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: ScreenUtil().screenWidth,
                              margin: REdgeInsets.only(
                                left: 24,
                                top: 20,
                                right: 24,
                              ),
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
                                      padding: REdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding: REdgeInsets.only(
                                              top: 2,
                                            ),
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
                                            padding: REdgeInsets.only(
                                              bottom: 3,
                                            ),
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
                                    padding: const EdgeInsets.only(top: 30),
                                    child: TextFormField(
                                      controller: emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      autocorrect: false,
                                      obscureText: false,
                                      validator: (String? value) {
                                        if (value == null || value.isEmpty) {
                                          return "This field can't be empty";
                                        } else if (!value.isValidEmail) {
                                          return "Please enter valid email";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          border: OutlineInputBorder(),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                              borderSide: BorderSide(color: Colors.grey)),
                                          hintText: 'Email'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              margin: REdgeInsets.only(
                                left: 24,
                                top: 50,
                                right: 24,
                              ),
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
                                      padding: REdgeInsets.only(
                                        top: 30,
                                        left: 20,
                                        right: 20,
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding: REdgeInsets.only(
                                              top: 2,
                                            ),
                                            child: Text(
                                              "Password",
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
                                            padding: REdgeInsets.only(
                                              bottom: 3,
                                            ),
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
                                    padding: REdgeInsets.only(top: 30),
                                    child: TextFormField(
                                      controller: passwordController,
                                      keyboardType: TextInputType.visiblePassword,
                                      textInputAction: TextInputAction.done,
                                      obscureText: !_passwordVisible,
                                      validator: (String? value) {
                                        if (value == null || value.isEmpty) {
                                          return "This field can't be empty";
                                        }
                                        return null;
                                      },
                                      //This will obscure text dynamically
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                            borderSide: BorderSide(color: Colors.grey)),

                                        hintText: 'Enter your password',
                                        // Here is key idea
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            // Based on passwordVisible state choose the icon
                                            _passwordVisible
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: Theme.of(context).primaryColor,
                                          ),
                                          onPressed: () {
                                            // Update the state i.e. toogle the state of passwordVisible variable
                                            setState(() {
                                              _passwordVisible = !_passwordVisible;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: TextButton(
                                      style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(Colors.blue),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ForgetPassScreen()),
                                        );
                                      },
                                      child: Text(
                                        'Forget Password ?',
                                        style: TextStyle(
                                            fontSize: 15,
                                            decoration: TextDecoration.underline,
                                            fontFamily: 'PoppinsMedium16'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.blue)))),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            authController.signIn(
                                email: emailController.text, password: passwordController.text);
                          }

                          //for testing app
                          // Get.to(() => DashboardScreen());
                        },
                        child: Container(
                          width: ScreenUtil().setWidth(1100),
                          height: ScreenUtil().setHeight(190),
                          margin: REdgeInsets.only(
                            left: 19,
                            top: 20,
                            right: 19,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Login',
                            style: TextStyle(fontSize: 65.sp),
                          ),
                        ),
                      ),

                      Container(
                        alignment: Alignment.center,
                        margin: REdgeInsets.only(top: 13),
                        child: TextButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.black.withOpacity(0.8)),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignUpScreen()),
                            );
                          },
                          child: Padding(
                            padding:  REdgeInsets.all(50),
                            child: Container(
                              width: 0.8.sw,
                              child: Column(
                                children: [
                                  Text(
                                    'Dont have an account yet ?',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'PoppinsMedium16'),
                                  ),
                                  Text(
                                    'Register Now',
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
