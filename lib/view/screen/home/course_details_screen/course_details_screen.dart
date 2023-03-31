import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/core/constants/image_constant.dart';
import 'package:tdc_frontend_mobile/view/screen/a/course_details_content_screen/widgets/course_lesson_video.dart';
import 'package:tdc_frontend_mobile/view/screen/a/enroll_course_screen/enroll_course_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'widgets/list2friends_one_item_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/video_playlist.dart';


// ignore: must_be_immutable
class CourseDetailsScreen extends StatefulWidget {
  bool isEnrolled;
  var id;
  CourseDetailsScreen({super.key, required this.isEnrolled,required this.id });
  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen>
    with SingleTickerProviderStateMixin {
  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;
  TabController? tabController;

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

   late var _ids = widget.id;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: _ids,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
    tabController = tabController = TabController(length: 3, vsync: this);
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  @mustCallSuper
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    tabController!.dispose();
    super.dispose();
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
              height: ScreenUtil().setHeight(860),
              child: YoutubePlayerBuilder(
                onExitFullScreen: () {
                  // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
                  SystemChrome.setPreferredOrientations(DeviceOrientation.values);
                },
                player: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.blueAccent,
                  topActions: <Widget>[
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Text(
                        _controller.metadata.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),

                  ],
                  onReady: () {
                    _isPlayerReady = true;
                  },
                  onEnded: (data) {
                    _controller
                        .load(_ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
                    _showSnackBar('Next Video Started!');
                  },
                ),

                builder: (context, player) => Scaffold(

                  body: ListView(
                    children: [
                      player,
                    ],
                  ),
                ),
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
                                            InkWell(
                                              onTap:  (){
                                                deactivate();
                                                Get.to(VideoPlayList());
                                              },

                                            child: CourseLessonVideo(),
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
                              deactivate();
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


  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        behavior: SnackBarBehavior.floating,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }

  Color _getStateColor(PlayerState state) {
    switch (state) {
      case PlayerState.unknown:
        return Colors.grey[700]!;
      case PlayerState.unStarted:
        return Colors.pink;
      case PlayerState.ended:
        return Colors.red;
      case PlayerState.playing:
        return Colors.blueAccent;
      case PlayerState.paused:
        return Colors.orange;
      case PlayerState.buffering:
        return Colors.yellow;
      case PlayerState.cued:
        return Colors.blue[900]!;
      default:
        return Colors.blue;
    }
  }
}
