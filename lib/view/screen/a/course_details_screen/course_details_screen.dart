import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pod_player/pod_player.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/core/constants/image_constant.dart';
import 'package:tdc_frontend_mobile/view/dashboard_screen.dart';
import 'package:tdc_frontend_mobile/view/screen/a/enroll_course_screen/enroll_course_screen.dart';

import 'package:flutter/material.dart';
import 'package:tdc_frontend_mobile/view/screen/a/videoplayerscreen/videoplayerscreen.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';



// ignore: must_be_immutable
class CourseDetailsScreen extends StatefulWidget {
  bool isEnrolled;
  var initURL;
  CourseDetailsScreen({super.key, required this.isEnrolled,required this.initURL });
  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen>
    with SingleTickerProviderStateMixin  {
  late final PodPlayerController _controller;
  bool isLoading = true;
  bool? isVideoPlaying;

 TabController? tabController;
 late var _ids = widget.initURL;

 @override
 void initState() {
   tabController = tabController = TabController(length: 3, vsync: this);
   super.initState();
   loadVideo();
 }

 @override
 void dispose() {
   _controller.dispose();
   super.dispose();
 }
  void loadVideo() async {
    final urls = await PodPlayerController.getYoutubeUrls(
      'https://youtu.be/A3ltMaM6noM',
    );
    setState(() => isLoading = false);
    _controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.networkQualityUrls(videoUrls: urls!),
      podPlayerConfig: const PodPlayerConfig(
        videoQualityPriority: [720, 360],
      ),
    )..initialise().then((value) {
      setState(() {
        isVideoPlaying = _controller.isVideoPlaying;
      });
    });
    _controller.addListener(_listner);;
  }

  ///Listnes to changes in video
  void _listner() {
    if (_controller.isVideoPlaying != isVideoPlaying) {
      isVideoPlaying = _controller.isVideoPlaying;
    }
    if (mounted) setState(() {});
  }
 @override
 void deactivate() {
   // Pauses video while navigating to next page.
   _controller.pause();
   super.deactivate();
 }

 @override
  Widget build(BuildContext context) {


    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: ScreenUtil().setHeight(300),
                width: double.infinity,
                color: Colors.grey.shade200,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            deactivate();
                            Get.back();
                          },
                          child: const Icon(Icons.arrow_back_ios)),
                      Text(
                        'Microsoft Offices',
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(
                            100,
                          ),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                    ],
                  ),
                ),
              ),
              Container(

                height: ScreenUtil().setHeight(880),
                child: isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Center(
                    child: PodVideoPlayer(

                      matchFrameAspectRatioToVideo: true,
                      matchVideoAspectRatioToFrame: true,
                      controller: _controller,
                      videoThumbnail: const DecorationImage(
                        image: NetworkImage('https://images.unsplash.com/photo-1569317002804-ab77bcf1bce4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dW5zcGxhc2h8ZW58MHx8MHx8&w=1000&q=80',
                    ),
                  fit: BoxFit.cover,
                ),),
                ),
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
                          top: 40,
                          bottom: 10,
                        ).r,
                        //padding: EdgeInsets.only(top: 20).r,
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
                                  bottom: 40,
                                  left: 24,
                                  top: 0,
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

                                        left: 50,
                                        top: 5,

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

                                        top: 0,
                                        right: 20,
                                        left: 20,
                                        bottom: 20
                                    ).r,
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

                                        Padding(
                                        padding:EdgeInsets.only(left: 14,right: 14,top: 50).r,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [

                                              Container(
                                                margin: EdgeInsets.only(

                                                  top: 12.0,
                                                  bottom: 12.0,
                                                ).r,
                                                decoration: BoxDecoration(
                                                  border: Border.all(width: 0.8, color: Colors.grey),
                                                  color: ColorConstant.gray50,
                                                  borderRadius: BorderRadius.circular(
                                                    ScreenUtil().setWidth(
                                                      60.00,
                                                    ),
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: ColorConstant.bluegray90011,
                                                      spreadRadius: ScreenUtil().setWidth(
                                                        2.00,
                                                      ),
                                                      blurRadius: ScreenUtil().setWidth(
                                                        2.00,
                                                      ),
                                                      offset: Offset(
                                                        3,
                                                        3,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                child: ExpansionTile(
                                                  title: Text('1. Introduction'),
                                                  children: <Widget>[
                                                    InkWell(
                                                      onTap:  (){

                                                        deactivate();
                                                        Get.to(
                                                            VideoPlayerScreen(URL: 'https://youtu.be/A3ltMaM6noM'));
                                                        },
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          border: Border.all(width: 0.4, color: Colors.grey),
                                                          color: ColorConstant.gray50,
                                                          borderRadius: BorderRadius.circular(
                                                            ScreenUtil().setWidth(
                                                              20.00,
                                                            ),
                                                          ),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: ColorConstant.bluegray90011,
                                                              spreadRadius: ScreenUtil().setWidth(
                                                                2.00,
                                                              ),
                                                              blurRadius: ScreenUtil().setWidth(
                                                                2.00,
                                                              ),
                                                              offset: Offset(
                                                                3,
                                                                3,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        padding: const EdgeInsets.only(left: 100).r,
                                                        child: ListTile(title: Text('A. Lession 1')),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap:  (){
                                                        deactivate();
                                                        Get.to(
                                                            VideoPlayerScreen(URL: 'https://youtu.be/A3ltMaM6noM'));

                                                      },
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          border: Border.all(width: 0.4, color: Colors.grey),
                                                          color: ColorConstant.gray50,
                                                          borderRadius: BorderRadius.circular(
                                                            ScreenUtil().setWidth(
                                                              20.00,
                                                            ),
                                                          ),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: ColorConstant.bluegray90011,
                                                              spreadRadius: ScreenUtil().setWidth(
                                                                2.00,
                                                              ),
                                                              blurRadius: ScreenUtil().setWidth(
                                                                2.00,
                                                              ),
                                                              offset: Offset(
                                                                3,
                                                                3,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        padding: const EdgeInsets.only(left: 100).r,
                                                        child: ListTile(title: Text('A. Lession 1')),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              Container(
                                                margin: EdgeInsets.only(

                                                  top: 12.0,
                                                  bottom: 12.0,
                                                ).r,
                                                decoration: BoxDecoration(
                                                  border: Border.all(width: 0.8, color: Colors.grey),
                                                  color: ColorConstant.gray50,
                                                  borderRadius: BorderRadius.circular(
                                                    ScreenUtil().setWidth(
                                                      60.00,
                                                    ),
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: ColorConstant.bluegray90011,
                                                      spreadRadius: ScreenUtil().setWidth(
                                                        2.00,
                                                      ),
                                                      blurRadius: ScreenUtil().setWidth(
                                                        2.00,
                                                      ),
                                                      offset: Offset(
                                                        3,
                                                        3,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                child: ExpansionTile(
                                                  title: Text('1. Introduction'),
                                                  children: <Widget>[
                                                    InkWell(
                                                      onTap:  (){

                                                        deactivate();
                                                        Get.to(
                                                            VideoPlayerScreen(URL: 'https://youtu.be/A3ltMaM6noM', ));

                                                      },
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          border: Border.all(width: 0.4, color: Colors.grey),
                                                          color: ColorConstant.gray50,
                                                          borderRadius: BorderRadius.circular(
                                                            ScreenUtil().setWidth(
                                                              20.00,
                                                            ),
                                                          ),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: ColorConstant.bluegray90011,
                                                              spreadRadius: ScreenUtil().setWidth(
                                                                2.00,
                                                              ),
                                                              blurRadius: ScreenUtil().setWidth(
                                                                2.00,
                                                              ),
                                                              offset: Offset(
                                                                3,
                                                                3,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        padding: const EdgeInsets.only(left: 100).r,
                                                        child: ListTile(title: Text('A. Lession 1')),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap:  (){
                                                        deactivate();
                                                        Get.to(
                                                            VideoPlayerScreen(URL: 'https://youtu.be/A3ltMaM6noM',));

                                                      },
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          border: Border.all(width: 0.4, color: Colors.grey),
                                                          color: ColorConstant.gray50,
                                                          borderRadius: BorderRadius.circular(
                                                            ScreenUtil().setWidth(
                                                              20.00,
                                                            ),
                                                          ),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: ColorConstant.bluegray90011,
                                                              spreadRadius: ScreenUtil().setWidth(
                                                                2.00,
                                                              ),
                                                              blurRadius: ScreenUtil().setWidth(
                                                                2.00,
                                                              ),
                                                              offset: Offset(
                                                                3,
                                                                3,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        padding: const EdgeInsets.only(left: 100).r,
                                                        child: ListTile(title: Text('A. Lession 1')),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),


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
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Align(
                                                    alignment: Alignment.center,
                                                    child: Padding(
                                                      padding:  EdgeInsets.only(

                                                        left: 1,
                                                        top: 5,
                                                      ).r,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        mainAxisSize: MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:  EdgeInsets.only(
                                                              left: 50,
                                                              top: 12,
                                                              right: 10,
                                                              bottom: 20,
                                                            ).r,
                                                            child: Icon(Icons.person,color: Colors.blueAccent,),
                                                          ),
                                                          Padding(
                                                            padding:  EdgeInsets.only(

                                                              left: 5,
                                                              right: 5,
                                                              top: 1,
                                                            ).r,
                                                            child: Text(
                                                              "Beginner",
                                                              overflow: TextOverflow.ellipsis,
                                                              textAlign: TextAlign.start,
                                                              style: TextStyle(

                                                                fontSize: ScreenUtil().setSp(
                                                                  60,
                                                                ),
                                                                fontFamily: 'Poppins',
                                                                fontWeight: FontWeight.w500,
                                                                height: 1.00,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:  EdgeInsets.only(

                                                      left: 50,
                                                      top: 12,
                                                      right: 10,
                                                    ).r,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisSize: MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:  EdgeInsets.only(

                                                            bottom: 4,
                                                          ).r,
                                                          child: Icon(Icons.mic,color: Colors.blueAccent,),
                                                        ),
                                                        Padding(
                                                          padding:  EdgeInsets.only(

                                                            left: 10,
                                                            right: 6,
                                                            top: 1,
                                                          ).r,
                                                          child: Text(
                                                            "Khmer",
                                                            overflow: TextOverflow.ellipsis,
                                                            textAlign: TextAlign.start,
                                                            style: TextStyle(

                                                              fontSize: ScreenUtil().setSp(
                                                                60,
                                                              ),
                                                              fontFamily: 'Poppins',
                                                              fontWeight: FontWeight.w500,
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
                                                  return Container(
                                                    margin: EdgeInsets.only(
                                                      right: 32,
                                                    ).r,
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.min,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Align(
                                                          alignment: Alignment.center,
                                                          child: Padding(
                                                            padding:  EdgeInsets.only(

                                                              left: 1,
                                                              top: 5,
                                                            ).r,
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              mainAxisSize: MainAxisSize.max,
                                                              children: [
                                                                Padding(
                                                                  padding:  EdgeInsets.only(
                                                                    left: 50,
                                                                    top: 12,
                                                                    right: 10,
                                                                    bottom: 20,
                                                                  ).r,
                                                                  child: Icon(Icons.person,color: Colors.blueAccent,),
                                                                ),
                                                                Padding(
                                                                  padding:  EdgeInsets.only(

                                                                    left: 5,
                                                                    right: 5,
                                                                    top: 1,
                                                                  ).r,
                                                                  child: Text(
                                                                    "Beginner",
                                                                    overflow: TextOverflow.ellipsis,
                                                                    textAlign: TextAlign.start,
                                                                    style: TextStyle(

                                                                      fontSize: ScreenUtil().setSp(
                                                                        60,
                                                                      ),
                                                                      fontFamily: 'Poppins',
                                                                      fontWeight: FontWeight.w500,
                                                                      height: 1.00,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:  EdgeInsets.only(

                                                            left: 50,
                                                            top: 12,
                                                            right: 10,
                                                          ).r,
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            mainAxisSize: MainAxisSize.max,
                                                            children: [
                                                              Padding(
                                                                padding:  EdgeInsets.only(

                                                                  bottom: 4,
                                                                ).r,
                                                                child: Icon(Icons.mic,color: Colors.blueAccent,),
                                                              ),
                                                              Padding(
                                                                padding:  EdgeInsets.only(

                                                                  left: 10,
                                                                  right: 6,
                                                                  top: 1,
                                                                ).r,
                                                                child: Text(
                                                                  "Khmer",
                                                                  overflow: TextOverflow.ellipsis,
                                                                  textAlign: TextAlign.start,
                                                                  style: TextStyle(

                                                                    fontSize: ScreenUtil().setSp(
                                                                      60,
                                                                    ),
                                                                    fontFamily: 'Poppins',
                                                                    fontWeight: FontWeight.w500,
                                                                    height: 1.00,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
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
                                deactivate();


                                Get.to(EnrollCourseScreen());
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
      ),
    );
  }




}



