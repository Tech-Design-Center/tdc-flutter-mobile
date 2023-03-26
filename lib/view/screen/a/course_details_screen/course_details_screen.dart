import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/core/constants/image_constant.dart';
import 'package:tdc_frontend_mobile/view/screen/a/course_details_content_screen/course_details_content_screen.dart';
import 'package:tdc_frontend_mobile/view/screen/a/course_details_screen/widgets/video_player.dart';
import 'package:tdc_frontend_mobile/view/screen/a/enroll_course_screen/enroll_course_screen.dart';
import 'package:video_player/video_player.dart';
import 'widgets/list2friends_one_item_widget.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class CourseDetailsScreen extends StatefulWidget {
  bool isEnrolled;
  var url;

  CourseDetailsScreen({super.key, required this.isEnrolled,required this.url});
  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen>
    with SingleTickerProviderStateMixin {
       TabController? tabController;
       VideoPlayerController? videoPlayerController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoPlayerController = VideoPlayerController.network(widget.url)
      ..addListener(() {
        setState(() {});
      })
      ..setLooping(false)
      ..initialize().then((value) => videoPlayerController!.play());
    tabController = tabController = TabController(length: 3, vsync: this);
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoPlayerController!.dispose();
    tabController!.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.indigo100,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: ScreenUtil().setHeight(
                860.00,
              ),
              width: ScreenUtil().screenWidth,
              child: VideoPlayerWidget(controller: videoPlayerController!,
              isFullScreen: false),
            ),
            Expanded(
              child: Container(

                width: ScreenUtil().screenWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color:
                      ColorConstant.whiteA700,
                ),
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 10,
                      ).r,
                      padding: EdgeInsets.only(top: 20).r,
                      decoration: BoxDecoration(
                        color: ColorConstant.gray50,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            ScreenUtil().setWidth(
                              30.00,
                            ),
                          ),
                          topRight: Radius.circular(
                            ScreenUtil().setWidth(
                              30.00,
                            ),
                          ),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Padding(
                              padding: EdgeInsets.only(

                                left: 24,
                                top: 12,
                                right: 24,
                              ).r,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      ScreenUtil().setWidth(
                                        20.00,
                                      ),
                                    ),
                                    child: Image.asset(
                                        ImageConstant.video2,
                                      height: ScreenUtil().setHeight(
                                        400.00,
                                      ),
                                      width: ScreenUtil().setWidth(
                                        400.00,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(

                                      left: 9,
                                      top: 5,
                                      bottom: 3,
                                    ).r,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Microsoft Office 2019",
                                          overflow: TextOverflow.fade,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(

                                            fontSize: ScreenUtil().setSp(
                                              80,
                                            ),
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w500,
                                            height: 1.00,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(

                                            top: 10,
                                            right: 10,
                                          ).r,
                                          child: Text(
                                            "Learn how to use computer, \ntyping, and office work",
                                            overflow: TextOverflow.fade,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              color: ColorConstant.bluegray500,
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

                                            top: 50,
                                            right: 10,
                                          ).r,
                                          child: Text(
                                            "Teach by : Mekmun Sopheaktra",
                                            overflow: TextOverflow.fade,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              color: ColorConstant.bluegray500,
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

                                            top: 30,
                                            right: 10,
                                          ).r,
                                          child: Row(
                                            children: [
                                              Text("35 Hours ",style: TextStyle(fontSize: 60.sp,color: Colors.blueAccent),),

                                            ],

                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                  margin: EdgeInsets.only(

                                      top: 24,
                                      right: 20,
                                      left: 20).r,
                                  decoration: BoxDecoration(
                                    color:ColorConstant.gray100,
                                    borderRadius: BorderRadius.circular(
                                      ScreenUtil().setWidth(
                                        22.00,
                                      ),
                                    ),
                                  ),
                                  child: widget.isEnrolled ?
                                  TabBar(
                                    indicatorPadding: EdgeInsets.all(5).w,
                                    indicator: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: ColorConstant.indigoA200),
                                    labelColor: ColorConstant.whiteA700,
                                    unselectedLabelColor:Colors.black,
                                    labelStyle: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500),
                                    unselectedLabelStyle: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400),
                                    controller: tabController,
                                    tabs: [
                                      Tab(
                                        text: "Videos",
                                      ),
                                      Tab(
                                        text: "About",
                                      ),

                                    ],
                                  )
                                    :
                                  TabBar(
                                    indicatorPadding: EdgeInsets.all(5).w,
                                    indicator: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: ColorConstant.indigoA200),
                                    labelColor: ColorConstant.whiteA700,
                                    unselectedLabelColor:Colors.black,
                                    labelStyle: TextStyle(
                                        fontSize: 60.sp,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500),
                                    unselectedLabelStyle: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400),
                                    controller: tabController,
                                    tabs: [
                                      Tab(
                                        text: "30\$",
                                      ),


                                    ],
                                  )
                              ),
                            ),

                            Container(
                              child: widget.isEnrolled ?
                              Container(
                                height: ScreenUtil().setHeight(1450),
                                child: TabBarView(
                                  controller: tabController,
                                  children: [
                                    CourseDetailsContentScreen(isEnrolled: widget.isEnrolled),
                                    SingleChildScrollView(
                                      padding: EdgeInsets.only(left: 20,right: 20).r,
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(

                                                left: 35,
                                                top: 60,
                                                right: 35,
                                                bottom: 40
                                            ).r,
                                            child: Text(
                                              "Introduction",
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
                                          Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                                margin: EdgeInsets.only(

                                                    left: 35,
                                                    right: 35,
                                                    top: 20).r,
                                                width: ScreenUtil().screenWidth,
                                                child: Text(
                                                  "Learn the fundamentals of children’s book illustration to create a playful portfolio ready to share with editors and art directors...",
                                                  style:
                                                  TextStyle(
                                                      fontSize: 50.sp,
                                                      color: ColorConstant
                                                          .gray600,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                      FontWeight.normal),

                                                )),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(

                                                left: 24,
                                                top: 80,
                                                right: 24,
                                                bottom: 40
                                            ).r,
                                            child: Text(
                                              "Details",
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
                                          Container(
                                            height: ScreenUtil().setHeight(
                                              300.00,
                                            ),
                                            width: ScreenUtil().screenWidth,
                                            child: ListView.builder(
                                              padding: EdgeInsets.only(

                                                left: 24,
                                                top: 12,
                                                right: 24,
                                              ).r,
                                              scrollDirection: Axis.horizontal,
                                              physics: BouncingScrollPhysics(),
                                              itemCount: 1,
                                              itemBuilder: (context, index) {
                                                return List2friendsOneItemWidget();
                                              },
                                            ),
                                          ),

                                          Padding(
                                            padding: EdgeInsets.only(

                                              left: 24,
                                              top: 32,
                                              right: 24,
                                            ).r,
                                            child: Text(
                                              "Tools you need",
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
                                          ListView.builder(
                                              physics: BouncingScrollPhysics(),
                                              padding: EdgeInsets.only(bottom: 70),
                                              shrinkWrap: true,
                                              itemCount: 1,
                                              itemBuilder: ((context, index) {
                                                return Padding(
                                                  padding: EdgeInsets.only(

                                                    left: 90,
                                                    top: 60,
                                                    right: 24,
                                                    bottom: 8,
                                                  ).r,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                    mainAxisSize:
                                                    MainAxisSize.min,
                                                    children: [
                                                      ClipRRect(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                            ScreenUtil().setWidth(
                                                              16.00,
                                                            ),
                                                          ),
                                                          child: Icon(Icons.computer,color: Colors.blueAccent,)
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(

                                                          left: 30,
                                                          right: 8,
                                                          top: 9,
                                                          bottom: 8,
                                                        ).r,
                                                        child: Text(
                                                          "Computer",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                          TextAlign.start,
                                                          style: TextStyle(
                                                            fontSize: ScreenUtil().setSp(
                                                              60,
                                                            ),
                                                            fontFamily: 'Poppins',
                                                            fontWeight:
                                                            FontWeight.w500,
                                                            height: 1.00,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              })),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                                  :
                              Container(
                                height: ScreenUtil().setHeight(1450),
                                child: TabBarView(
                                  controller: tabController,
                                  children: [
                                    SingleChildScrollView(
                                      padding: EdgeInsets.only(left: 20,right: 20).r,
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(

                                                left: 35,
                                                top: 60,
                                                right: 35,
                                                bottom: 40
                                            ).r,
                                            child: Text(
                                              "Introduction",
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
                                          Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                                margin: EdgeInsets.only(

                                                    left: 35,
                                                    right: 35,
                                                    top: 20).r,
                                                width: ScreenUtil().screenWidth,
                                                child: Text(
                                                  "Learn the fundamentals of children’s book illustration to create a playful portfolio ready to share with editors and art directors...",
                                                  style:
                                                  TextStyle(
                                                      fontSize: 50.sp,
                                                      color: ColorConstant
                                                          .gray600,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                      FontWeight.normal),

                                                )),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(

                                                left: 24,
                                                top: 80,
                                                right: 24,
                                                bottom: 40
                                            ).r,
                                            child: Text(
                                              "Details",
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
                                          Container(
                                            height: ScreenUtil().setHeight(
                                              300.00,
                                            ),
                                            width: ScreenUtil().screenWidth,
                                            child: ListView.builder(
                                              padding: EdgeInsets.only(

                                                left: 24,
                                                top: 12,
                                                right: 24,
                                              ).r,
                                              scrollDirection: Axis.horizontal,
                                              physics: BouncingScrollPhysics(),
                                              itemCount: 1,
                                              itemBuilder: (context, index) {
                                                return List2friendsOneItemWidget();
                                              },
                                            ),
                                          ),

                                          Padding(
                                            padding: EdgeInsets.only(

                                              left: 24,
                                              top: 32,
                                              right: 24,
                                            ).r,
                                            child: Text(
                                              "Tools you need",
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
                                          ListView.builder(
                                              physics: BouncingScrollPhysics(),
                                              padding: EdgeInsets.only(bottom: 70),
                                              shrinkWrap: true,
                                              itemCount: 1,
                                              itemBuilder: ((context, index) {
                                                return Padding(
                                                  padding: EdgeInsets.only(

                                                    left: 90,
                                                    top: 60,
                                                    right: 24,
                                                    bottom: 8,
                                                  ).r,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                    mainAxisSize:
                                                    MainAxisSize.min,
                                                    children: [
                                                      ClipRRect(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                            ScreenUtil().setWidth(
                                                              16.00,
                                                            ),
                                                          ),
                                                          child: Icon(Icons.computer,color: Colors.blueAccent,)
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(

                                                          left: 30,
                                                          right: 8,
                                                          top: 9,
                                                          bottom: 8,
                                                        ).r,
                                                        child: Text(
                                                          "Computer",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          textAlign:
                                                          TextAlign.start,
                                                          style: TextStyle(
                                                            fontSize: ScreenUtil().setSp(
                                                              60,
                                                            ),
                                                            fontFamily: 'Poppins',
                                                            fontWeight:
                                                            FontWeight.w500,
                                                            height: 1.00,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              })),
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              )


                            )
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: widget.isEnrolled ?
                      Container () :
                      Container(
                        width: ScreenUtil().screenWidth,
                        color: Colors.white,
                        child: InkWell(
                          onTap:() {
                            setState(() {
                              videoPlayerController!.pause();
                              Get.to(EnrollCourseScreen());
                            });
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
                            child: Text("Enroll Now!",style: TextStyle(color: Colors.white,fontSize: 70.sp,fontWeight: FontWeight.bold),),

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
