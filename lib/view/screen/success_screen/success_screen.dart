import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccessScreen extends StatelessWidget {
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
                        Padding(
                          padding: EdgeInsets
                              .only(
                            left: 60,
                            top: 143,
                            right: 60,
                          )
                              .r,
                          child: Image(
                            image: AssetImage(
                                'assets/images/logo.png'),
                            height: ScreenUtil().setHeight(600),
                            width: ScreenUtil().setWidth(600),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets
                              .only(

                            left: 60,
                            top: 150,
                            right: 60,
                          )
                              .r,
                          child: Text(
                            "Congrats!",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.indigo,
                              fontSize: ScreenUtil().setSp(
                                90,
                              ),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.36,
                              height: 1.00,
                            ),
                          ),
                        ),
                        Container(

                          margin: EdgeInsets
                              .only(

                            left: 0,
                            top: 17,
                            right: 0,
                          )
                              .r,
                          child: Text(
                            "You have successfully registered\nan account!",
                            maxLines: null,
                            textAlign: TextAlign.center,
                            style: TextStyle(

                              fontSize: ScreenUtil().setSp(
                                70,
                              ),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 1.50,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: double.infinity,
                            margin: EdgeInsets
                                .only(

                              top: 1350,
                              bottom: 20,
                            )
                                .r,

                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius
                                                  .circular(18.0),
                                              side: BorderSide(
                                                  color: Colors.blue)
                                          )
                                      )
                                  ),
                                  onPressed: () {

                                    /*
    Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(
    builder: (context) =>
    SignInScreen()),
    (Route<dynamic> route) => false);
    */
                                  }, child: Container(

                                  width: ScreenUtil().setWidth(1100),
                                  height: ScreenUtil().setHeight(190),
                                  margin: EdgeInsets
                                      .only(left: 19, top: 20, right: 19,)
                                      .r,
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Home',
                                    style: TextStyle(fontSize: 65.sp),),),
                                ),
                              ],
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
