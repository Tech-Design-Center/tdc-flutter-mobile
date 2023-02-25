import 'package:animate_do/animate_do.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/core/constants/image_constant.dart';
import 'package:tdc_frontend_mobile/data/category_list.dart';
import 'package:tdc_frontend_mobile/view/Screen/sign_in_screen/sign_in_screen.dart';
import 'package:tdc_frontend_mobile/view/screen/homepage_expand_screen/light_settings_language_screen.dart';
import 'package:tdc_frontend_mobile/view/screen/notifications_screen/notifications_screen.dart';

import '../homepage_expand_screen/widgets/listitem10_item_widget.dart';
import '../homepage_expand_screen/widgets/listitem8_item_widget.dart';
import '../homepage_expand_screen/widgets/listitem9_item_widget.dart';
import 'package:flutter/material.dart';



class HomepageExpandScreen extends StatefulWidget {
  @override
  State<HomepageExpandScreen> createState() => _HomepageExpandScreenState();
}

class _HomepageExpandScreenState extends State<HomepageExpandScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      drawer: ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(35).w, bottomRight: Radius.circular(35).w),
        child: Drawer(
            backgroundColor:
            ColorConstant.whiteA700,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 200).r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24, left: 20, right: 20).r,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(300),
                        child: Image.asset(
                          ImageConstant.imgEllipse33,
                          width: ScreenUtil().setWidth(200),
                          height: ScreenUtil().setHeight(200),
                        ),
                      ),
                      20.horizontalSpace,
                      Text(
                        'Tech Design Center',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: ScreenUtil().setSp(70),
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 80, left: 50, right: 50).r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            ImageConstant.settings,
                            width: ScreenUtil().setWidth(100),
                            height: ScreenUtil().setHeight(100),
                          ),
                          20.horizontalSpace,
                          Text(
                            'Setting and Privacy',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: ScreenUtil().setSp(60),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: ColorConstant.indigoA200,
                        size: 20,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 80, left: 50, right: 50).r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            ImageConstant.help,
                            width: ScreenUtil().setWidth(100),
                            height: ScreenUtil().setHeight(100),
                          ),

                          20.horizontalSpace,
                          Text(
                            'Help and Support',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: ScreenUtil().setSp(60),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: ColorConstant.indigoA200,
                        size: 20,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 80, left: 50, right: 50).r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            ImageConstant.security,
                            width: ScreenUtil().setWidth(100),
                            height: ScreenUtil().setHeight(100),
                          ),

                          20.horizontalSpace,
                          Text(
                            'Security Access',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: ScreenUtil().setSp(60),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: ColorConstant.indigoA200,
                        size: 20,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 80, left: 50, right: 50).r,
                  child: Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10),
                                )),
                            builder: (context) {
                              return LightSettingsLanguageScreen();
                            });
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 0,
                          top: 0,
                          bottom: 0,
                          right: 0,
                        ).r,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 1,
                                    bottom: 1,
                                  ).r,
                                  child:  Image.asset(
                                    ImageConstant.settings,
                                    width: ScreenUtil().setWidth(100),
                                    height: ScreenUtil().setHeight(100),
                                  ),
                                ),
                                SizedBox(width: ScreenUtil().setWidth(25)),
                                Text(
                                  "Language",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: ScreenUtil().setSp(60),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "English (US)",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: ScreenUtil().setSp(60),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: ScreenUtil().setWidth(10)),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: ColorConstant.indigoA200,
                                  size: 20,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),


                SizedBox(height: ScreenUtil().setHeight(120),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context)
                          =>SignInScreen()),
                        );
                      },
                      child: Container(
                        height: ScreenUtil().setHeight(180),
                        width: ScreenUtil().setWidth(550),
                        margin: EdgeInsets.only(

                          left: 24,
                        ),
                        decoration: BoxDecoration(
                          color: ColorConstant.indigoA200,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Logout",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            )),
      ),
      body: SafeArea(

        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: ScreenUtil().screenWidth,
                margin: EdgeInsets.only(
                                left: 15, right: 23, top: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          onTap: () {
                            _scaffoldKey.currentState!.openDrawer();
                          },
                          child:
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                            ScreenUtil().setWidth(
                              24.00,
                            ),
                          ),
                          child: Row(
                            children: [
                              Image(
                                image: AssetImage(ImageConstant.imgEllipse33,),
                                height: ScreenUtil().setHeight(200),
                                width: ScreenUtil().setWidth(200),
                              ),
                              0.8.horizontalSpace,
                              Container(
                                margin: EdgeInsets.only(

                                  left: 0,
                                  top: 3,
                                  bottom: 2,
                                ).r,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:  EdgeInsets.only(
                                        left: 30,
                                        right: 0,
                                      ).r,
                                      child: Text(
                                        "Welcome Back!",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: ColorConstant.gray600,
                                          fontSize: ScreenUtil().setSp(
                                            50,
                                          ),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w500,
                                          height: 1.00,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.only(
                                        left: 30,
                                        top: 7,
                                      ).r,
                                      child: Text(
                                        "Tech Design Center",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(

                                          fontSize: ScreenUtil().setSp(
                                            60,
                                          ),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 0.36,
                                          height: 1.00,
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
                      ],
                    ),
                    InkWell(

                      onTap: (){
                        Navigator.push(
    context,
    MaterialPageRoute(builder: (context)
 =>NotificationsScreen()),
  );
                      },


                      child: Container(
                        height: ScreenUtil().setHeight(
                          120.00,
                        ),
                        width: ScreenUtil().setWidth(
                          120.00,
                        ),
                        margin: EdgeInsets.only(

                          top: 4,
                          bottom: 4,
                        ).r,
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          elevation: 0,
                          margin: EdgeInsets.all(0),
                          color:Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              ScreenUtil().setWidth(
                                8.00,
                              ),
                            ),
                          ),
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding:  EdgeInsets.only(

                                    left: 11,
                                    top: 10,
                                    right: 11,
                                    bottom: 10,
                                  ).r,
                                  child: Image(
                                    image: AssetImage(ImageConstant.imgNotification,),
                                    height: ScreenUtil().setHeight(400),
                                    width: ScreenUtil().setWidth(400),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  height: ScreenUtil().setHeight(
                                    40.00,
                                  ),
                                  width: ScreenUtil().setWidth(
                                    40.00,
                                  ),
                                  margin: EdgeInsets.only(

                                    left: 10,
                                    top: 9,
                                    right: 9,
                                    bottom: 10,
                                  ).r,
                                  decoration: BoxDecoration(
                                    color: ColorConstant.deepOrange400,
                                    borderRadius: BorderRadius.circular(
                                      ScreenUtil().setWidth(
                                        30.00,
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
                  ],
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: SingleChildScrollView(
                  padding:  EdgeInsets.only(
                    left: 0,
                    top: 8,
                  ).r,
                  child: Container(
                   width:ScreenUtil().setWidth(1400),
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(

                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(

                              height: ScreenUtil().setHeight(
                                800.00,
                              ),
                              width: ScreenUtil().setWidth(1500),
                              margin: EdgeInsets.only(
                                right: 60,
                                left: 20
                              ).r,
                              child: Container(

                                  child: ImageSlideshow(
                                    indicatorColor: Colors.blue,
                                    onPageChanged: (value) {
                                      debugPrint('Page changed: $value');
                                    },
                                    autoPlayInterval: 3000,
                                    isLoop: true,
                                    children: [
                                      Image.asset(
                                        'assets/images/courses1.png',
                                        fit: BoxFit.cover,
                                      ),

                                      Image.asset(
                                        'assets/images/courses2.png',
                                        fit: BoxFit.cover,
                                      ),
                                      Image.asset(
                                        'assets/images/courses3.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ],
                                  ),



                              ),
                      ),

                            Padding(
                              padding:  EdgeInsets.only(

                                top: 50,

                                left: 10,
                                bottom: 5,
                              ).r,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding:   EdgeInsets.only(

                                      top: 1,
                                    ).r ,
                                    child: Text(
                                      "Categories",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(

                                        fontSize: ScreenUtil().setSp(
                                          65,
                                        ),
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        height: 1.00,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(
                                      top: 13,
                                      right: 50,
                                      left: 0,
                                      bottom: 5,
                                    ).r,
                                    child: InkWell(
                                      onTap: (){
 /*
                                        Navigator.push(

    context,
    MaterialPageRoute(builder: (context)=>CategoriesScreen()),


  );
 */
                                      },
                                      child: Text(
                                        "See all",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: ColorConstant.indigoA200,
                                          fontSize: ScreenUtil().setSp(
                                            60,
                                          ),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          height: 1.00,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Padding(
                              padding:  EdgeInsets.only(

                                top: 20,
                              ).r,
                              child:  Padding(

                                padding: EdgeInsets.only(left:90,right:8).r,
                                child: Container(
                                    height: ScreenUtil().setHeight(450),
                                    child: ListView.separated(
                                      separatorBuilder: ((context, index) => SizedBox(width: 30,)),
                                      itemCount: categoryList.length,
                                      shrinkWrap:true,

                                      scrollDirection: Axis.horizontal,
                                      padding:  EdgeInsets.only(
                                        top: 40,
                                        left: 20,
                                        right: 20
                                      ).r,
                                     itemBuilder: (context,index){
                                      return Container(
                                        width: ScreenUtil().setWidth(200),
                                        child: Column(
                                          children: [
                                            Image.asset(categoryList[index].img,
                                            width: ScreenUtil().setWidth(800),
                                            height:  ScreenUtil().setHeight(200),
                                            ),

                                            Padding(
                                              padding: EdgeInsets.only(top: 20).r,
                                              child: Text(categoryList[index].title,
                                                textAlign: TextAlign.center,
                                              maxLines: 2,
                                              style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontSize: ScreenUtil().setSp(47),

                                              ),
                                              ),
                                            )

                                          ],
                                        ),
                                      );

                                     },



                                    ),
                                  ),
                              ),
                              ),



                            Padding(
                              padding:  EdgeInsets.only(

                                top: 0,

                                left: 10,
                                bottom: 5,
                              ).r,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding:   EdgeInsets.only(

                                      top: 1,
                                    ).r ,
                                    child: Text(
                                      "Recommended",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(

                                        fontSize: ScreenUtil().setSp(
                                          65,
                                        ),
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        height: 1.00,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(
                                      top: 13,
                                      right: 50,
                                      left: 0,
                                      bottom: 5,
                                    ).r,
                                    child: InkWell(
                                      onTap: (){
                                        /*
                                        Navigator.push(

    context,
    MaterialPageRoute(builder: (context)=>CategoriesScreen()),


  );
 */
                                      },
                                      child: Text(
                                        "See all",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: ColorConstant.indigoA200,
                                          fontSize: ScreenUtil().setSp(
                                            60,
                                          ),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          height: 1.00,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),


                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: ScreenUtil().setHeight(
                                  1050,
                                ),

                                child: ListView.separated(
                                   separatorBuilder: (context, index) => SizedBox(width: ScreenUtil().setWidth(24)),
                                  padding:  EdgeInsets.only(
                                    bottom: 10,
                                    top: 40,
                                    left: 20,
                                    right: 20
                                  ).r,
                                  scrollDirection: Axis.horizontal,
                                  physics: BouncingScrollPhysics(),
                                  itemCount: 3,
                                  itemBuilder: (context, index) {
                                    return Listitem8ItemWidget();
                                  },
                                ),
                              ),
                            ),

                            SizedBox(height: ScreenUtil().setHeight(100),),

                            Padding(
                              padding:  EdgeInsets.only(

                                top: 0,

                                left: 10,
                                bottom: 5,
                              ).r,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding:   EdgeInsets.only(

                                      top: 1,
                                    ).r ,
                                    child: Text(
                                      "Popular",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(

                                        fontSize: ScreenUtil().setSp(
                                          65,
                                        ),
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        height: 1.00,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(
                                      top: 13,
                                      right: 50,
                                      left: 0,
                                      bottom: 5,
                                    ).r,
                                    child: InkWell(
                                      onTap: (){
                                        /*
                                        Navigator.push(

    context,
    MaterialPageRoute(builder: (context)=>CategoriesScreen()),


  );
 */
                                      },
                                      child: Text(
                                        "See all",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: ColorConstant.indigoA200,
                                          fontSize: ScreenUtil().setSp(
                                            60,
                                          ),
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          height: 1.00,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: ScreenUtil().setHeight(
                                  1050,
                                ),

                                child: ListView.separated(
                                  separatorBuilder: (context, index) => SizedBox(width: ScreenUtil().setWidth(24)),
                                  padding:  EdgeInsets.only(
                                      bottom: 10,
                                      top: 40,
                                      left: 20,
                                      right: 20
                                  ).r,
                                  scrollDirection: Axis.horizontal,
                                  physics: BouncingScrollPhysics(),
                                  itemCount: 3,
                                  itemBuilder: (context, index) {
                                    return Listitem8ItemWidget();
                                  },
                                ),
                              ),
                            ),

                            SizedBox(height: ScreenUtil().setHeight(200),),



                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
