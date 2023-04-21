import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pod_player/pod_player.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/core/constants/image_constant.dart';
import 'package:tdc_frontend_mobile/view/dashboard_screen.dart';
import 'package:tdc_frontend_mobile/view/screen/home/enroll_course_screen/enroll_course_screen.dart';

import 'package:flutter/material.dart';
import 'package:tdc_frontend_mobile/view/screen/home/video_player_screen.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../model/category.dart';
import '../../../model/recommend.dart';

// ignore: must_be_immutable
class CourseDetailsScreen extends StatefulWidget {
  final String? image;
  final String? title;
  final String? author;
  final String? description;
  final String? about;
  final String? ABAPaymentURL;

  final int? duration;
  final int? price;
  final String? videoTrailerURL;
  final bool? isEnroll;
  final List<String>? playlistTitle;
  final List<List<String>>? videoTitle;
  final List<List<String>>? videoUrl;
  CourseDetailsScreen({
    super.key,
    required this.image,
    required this.title,
    required this.author,
    required this.description,
    required this.about,
    required this.duration,
    required this.price,
    required this.videoTrailerURL,
    required this.isEnroll,
    required this.playlistTitle,
    required this.videoTitle,
    required this.videoUrl,
    required this.ABAPaymentURL,
  });
  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen>
    with SingleTickerProviderStateMixin {
  late final PodPlayerController _controller;
  bool isLoading = true;
  bool isVideoPlaying = true;
  TabController? tabController;

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
      widget.videoTrailerURL!,
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

    _controller.addListener(_listener);
  }

  ///Listnes to changes in video
  void _listener() {
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
              isVideoPlaying
                  ? Container(
                      height: ScreenUtil().setHeight(300),
                      width: double.infinity,
                      color: Colors.grey.shade200,
                      child: Padding(
                        padding: REdgeInsets.only(left: 30, right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  deactivate();
                                },
                                icon: const Icon(Icons.arrow_back_ios)),
                            SizedBox(
                              width: 1000.w,
                              child: Text(
                                widget.title!,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(
                                    100,
                                  ),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  deactivate();
                                  Get.offAll(() => DashboardScreen());
                                },
                                icon: const Icon(Icons.home_filled)),
                          ],
                        ),
                      ),
                    )
                  : Container(
                      height: ScreenUtil().setHeight(300),
                      width: double.infinity,
                      color: Colors.grey.shade200,
                      child: Padding(
                        padding: REdgeInsets.only(left: 30, right: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  deactivate();
                                  Get.back();
                                },
                                icon: Icon(Icons.arrow_back_ios)),
                            SizedBox(
                              width: 800.w,
                              child: Text(
                                widget.title!,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(
                                    100,
                                  ),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  deactivate();
                                  Get.offAll(() => DashboardScreen());
                                },
                                icon: Icon(Icons.home_filled)),
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
                          videoThumbnail: DecorationImage(
                            image: NetworkImage(
                              widget.image!,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
              ),
              Expanded(
                child: Container(
                  width: ScreenUtil().screenWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                    color: ColorConstant.whiteA700,
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
                                padding: REdgeInsets.only(
                                  bottom: 40,
                                  left: 24,
                                  top: 0,
                                  right: 24,
                                ),
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
                                      child: Image.network(
                                        widget.image!,
                                        height: ScreenUtil().setHeight(
                                          400.00,
                                        ),
                                        width: ScreenUtil().setWidth(
                                          400.00,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 40.w,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.title!,
                                          overflow: TextOverflow.ellipsis,
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
                                          padding: REdgeInsets.only(
                                            top: 10,
                                            right: 10,
                                          ),
                                          child: SizedBox(
                                            width: MediaQuery.of(context).size.width * 0.6,
                                            child: Text(
                                              widget.description!,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
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
                                        ),
                                        Padding(
                                          padding: REdgeInsets.only(
                                            top: 40,
                                            right: 10,
                                          ),
                                          child: Text(
                                            "Teach by : ${widget.author}",
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
                                              Text(
                                                "${widget.duration} Hours ",
                                                style: TextStyle(
                                                    fontSize: 60.sp, color: Colors.blueAccent),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                    margin:
                                        EdgeInsets.only(top: 0, right: 20, left: 20, bottom: 20).r,
                                    decoration: BoxDecoration(
                                      color: ColorConstant.gray100,
                                      borderRadius: BorderRadius.circular(
                                        ScreenUtil().setWidth(
                                          22.00,
                                        ),
                                      ),
                                    ),
                                    child: widget.isEnroll!
                                        ? TabBar(
                                            indicatorPadding: EdgeInsets.all(5).w,
                                            indicator: BoxDecoration(
                                                borderRadius: BorderRadius.circular(50),
                                                color: ColorConstant.indigoA200),
                                            labelColor: ColorConstant.whiteA700,
                                            unselectedLabelColor: Colors.black,
                                            labelStyle: TextStyle(
                                                fontFamily: 'Poppins', fontWeight: FontWeight.w500),
                                            unselectedLabelStyle: TextStyle(
                                                fontFamily: 'Poppins', fontWeight: FontWeight.w400),
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
                                        : TabBar(
                                            indicatorPadding: EdgeInsets.all(5).w,
                                            indicator: BoxDecoration(
                                                borderRadius: BorderRadius.circular(50),
                                                color: ColorConstant.indigoA200),
                                            labelColor: ColorConstant.whiteA700,
                                            unselectedLabelColor: Colors.black,
                                            labelStyle: TextStyle(
                                                fontSize: 60.sp,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500),
                                            unselectedLabelStyle: TextStyle(
                                                fontFamily: 'Poppins', fontWeight: FontWeight.w400),
                                            controller: tabController,
                                            tabs: [
                                              Tab(
                                                text: "${widget.price}\$",
                                              ),
                                            ],
                                          )),
                              ),
                              Container(
                                  child: widget.isEnroll!
                                      ? Container(
                                          height: ScreenUtil().setHeight(1450),
                                          child: TabBarView(
                                            controller: tabController,
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 14, right: 14, top: 50).r,
                                                child: SingleChildScrollView(
                                                  physics: NeverScrollableScrollPhysics(),
                                                  child: Column(
                                                    children: [
                                                      //playlist card
                                                      ListView.separated(
                                                        physics: BouncingScrollPhysics(),
                                                        itemCount: widget.playlistTitle!.length,
                                                        shrinkWrap: true,
                                                        scrollDirection: Axis.vertical,
                                                        padding: EdgeInsets.only(
                                                                top: 40,
                                                                left: 20,
                                                                right: 20,
                                                                bottom: 20)
                                                            .r,
                                                        itemBuilder: (context, index) {
                                                          return Container(
                                                            margin: EdgeInsets.only(
                                                              top: 12.0,
                                                              bottom: 12.0,
                                                            ).r,
                                                            decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  width: 0.8, color: Colors.grey),
                                                              color: ColorConstant.gray50,
                                                              borderRadius: BorderRadius.circular(
                                                                ScreenUtil().setWidth(
                                                                  60.00,
                                                                ),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color:
                                                                      ColorConstant.bluegray90011,
                                                                  spreadRadius:
                                                                      ScreenUtil().setWidth(
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
                                                              title: Text(
                                                                  widget.playlistTitle![index]),
                                                              children: [
                                                                Container(
                                                                  decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        width: 0.4,
                                                                        color: Colors.grey),
                                                                    color: ColorConstant.gray50,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                      ScreenUtil().setWidth(
                                                                        20.00,
                                                                      ),
                                                                    ),
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: ColorConstant
                                                                            .bluegray90011,
                                                                        spreadRadius:
                                                                            ScreenUtil().setWidth(
                                                                          2.00,
                                                                        ),
                                                                        blurRadius:
                                                                            ScreenUtil().setWidth(
                                                                          2.00,
                                                                        ),
                                                                        offset: Offset(
                                                                          3.r,
                                                                          3.r,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  padding: const EdgeInsets.only(
                                                                          left: 100)
                                                                      .r,
                                                                  child: ListView.builder(
                                                                    physics:
                                                                        NeverScrollableScrollPhysics(),
                                                                    itemCount: widget
                                                                        .videoTitle![index].length,
                                                                    shrinkWrap: true,
                                                                    scrollDirection: Axis.vertical,
                                                                    padding: EdgeInsets.only(
                                                                            top: 40,
                                                                            left: 20,
                                                                            right: 20,
                                                                            bottom: 20)
                                                                        .r,
                                                                    itemBuilder: (context, index1) {
                                                                      return GestureDetector(
                                                                        onTap: () {
                                                                          deactivate();
                                                                          Get.to(VideoPlayerScreen(
                                                                            videoUrl:
                                                                                widget.videoUrl![
                                                                                    index][index1],
                                                                            about: widget.about,
                                                                            author: widget.author,
                                                                            description:
                                                                                widget.description,
                                                                            duration:
                                                                                widget.duration,
                                                                            image: widget.image!,
                                                                            title: widget.title!,
                                                                            videoTitle:
                                                                                widget.videoTitle![
                                                                                    index][index1],
                                                                          ));
                                                                        },
                                                                        child: ListTile(
                                                                            title: Text(widget
                                                                                    .videoTitle![
                                                                                index][index1])),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                        separatorBuilder:
                                                            (BuildContext context, int index) {
                                                          return SizedBox(
                                                            width: 60.h,
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SingleChildScrollView(
                                                padding: EdgeInsets.only(left: 20, right: 20).r,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                              left: 35,
                                                              top: 60,
                                                              right: 35,
                                                              bottom: 40)
                                                          .r,
                                                      child: Text(
                                                        'Description',
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
                                                                  left: 35, right: 35, top: 20)
                                                              .r,
                                                          width: ScreenUtil().screenWidth,
                                                          child: Text(
                                                            widget.description!,
                                                            maxLines: 2,
                                                            style: TextStyle(
                                                                fontSize: 50.sp,
                                                                color: ColorConstant.gray600,
                                                                fontFamily: 'Poppins',
                                                                fontWeight: FontWeight.normal),
                                                          )),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                              left: 24,
                                                              top: 80,
                                                              right: 24,
                                                              bottom: 40)
                                                          .r,
                                                      child: Text(
                                                        "Information",
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
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          Align(
                                                            alignment: Alignment.center,
                                                            child: Padding(
                                                              padding: EdgeInsets.only(
                                                                left: 1,
                                                                top: 5,
                                                              ).r,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment.start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment.center,
                                                                mainAxisSize: MainAxisSize.max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsets.only(
                                                                      left: 50,
                                                                      top: 12,
                                                                      right: 10,
                                                                      bottom: 20,
                                                                    ).r,
                                                                    child: Icon(
                                                                      Icons.person,
                                                                      color: Colors.blueAccent,
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets.only(
                                                                      left: 5,
                                                                      right: 5,
                                                                      top: 1,
                                                                    ).r,
                                                                    child: Text(
                                                                      "Beginner",
                                                                      overflow:
                                                                          TextOverflow.ellipsis,
                                                                      textAlign: TextAlign.start,
                                                                      style: TextStyle(
                                                                        fontSize:
                                                                            ScreenUtil().setSp(
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
                                                            padding: EdgeInsets.only(
                                                              left: 50,
                                                              top: 12,
                                                              right: 10,
                                                            ).r,
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment.start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment.center,
                                                              mainAxisSize: MainAxisSize.max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsets.only(
                                                                    bottom: 4,
                                                                  ).r,
                                                                  child: Icon(
                                                                    Icons.mic,
                                                                    color: Colors.blueAccent,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets.only(
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
                                                              mainAxisSize: MainAxisSize.min,
                                                              children: [
                                                                ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                      ScreenUtil().setWidth(
                                                                        16.00,
                                                                      ),
                                                                    ),
                                                                    child: Icon(
                                                                      Icons.computer,
                                                                      color: Colors.blueAccent,
                                                                    )),
                                                                Padding(
                                                                  padding: EdgeInsets.only(
                                                                    left: 30,
                                                                    right: 8,
                                                                    top: 9,
                                                                    bottom: 8,
                                                                  ).r,
                                                                  child: Text(
                                                                    "Computer",
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
                                                          );
                                                        })),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : Container(
                                          height: ScreenUtil().setHeight(1450),
                                          child: TabBarView(
                                            controller: tabController,
                                            children: [
                                              SingleChildScrollView(
                                                padding: EdgeInsets.only(left: 20, right: 20).r,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                              left: 35,
                                                              top: 60,
                                                              right: 35,
                                                              bottom: 40)
                                                          .r,
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
                                                                  left: 35, right: 35, top: 20)
                                                              .r,
                                                          width: ScreenUtil().screenWidth,
                                                          child: Text(
                                                            "Learn the fundamentals of children’s book illustration to create a playful portfolio ready to share with editors and art directors...",
                                                            style: TextStyle(
                                                                fontSize: 50.sp,
                                                                color: ColorConstant.gray600,
                                                                fontFamily: 'Poppins',
                                                                fontWeight: FontWeight.normal),
                                                          )),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                              left: 24,
                                                              top: 80,
                                                              right: 24,
                                                              bottom: 40)
                                                          .r,
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
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment.start,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment.start,
                                                              children: [
                                                                Align(
                                                                  alignment: Alignment.center,
                                                                  child: Padding(
                                                                    padding: EdgeInsets.only(
                                                                      left: 1,
                                                                      top: 5,
                                                                    ).r,
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment.center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment.center,
                                                                      mainAxisSize:
                                                                          MainAxisSize.max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsets.only(
                                                                            left: 50,
                                                                            top: 12,
                                                                            right: 10,
                                                                            bottom: 20,
                                                                          ).r,
                                                                          child: Icon(
                                                                            Icons.person,
                                                                            color:
                                                                                Colors.blueAccent,
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsets.only(
                                                                            left: 5,
                                                                            right: 5,
                                                                            top: 1,
                                                                          ).r,
                                                                          child: Text(
                                                                            "Beginner",
                                                                            overflow: TextOverflow
                                                                                .ellipsis,
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: TextStyle(
                                                                              fontSize: ScreenUtil()
                                                                                  .setSp(
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
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets.only(
                                                                    left: 50,
                                                                    top: 12,
                                                                    right: 10,
                                                                  ).r,
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment.start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment.center,
                                                                    mainAxisSize: MainAxisSize.max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsets.only(
                                                                          bottom: 4,
                                                                        ).r,
                                                                        child: Icon(
                                                                          Icons.mic,
                                                                          color: Colors.blueAccent,
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsets.only(
                                                                          left: 10,
                                                                          right: 6,
                                                                          top: 1,
                                                                        ).r,
                                                                        child: Text(
                                                                          "Khmer",
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: TextStyle(
                                                                            fontSize:
                                                                                ScreenUtil().setSp(
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
                                                              mainAxisSize: MainAxisSize.min,
                                                              children: [
                                                                ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                      ScreenUtil().setWidth(
                                                                        16.00,
                                                                      ),
                                                                    ),
                                                                    child: Icon(
                                                                      Icons.computer,
                                                                      color: Colors.blueAccent,
                                                                    )),
                                                                Padding(
                                                                  padding: EdgeInsets.only(
                                                                    left: 30,
                                                                    right: 8,
                                                                    top: 9,
                                                                    bottom: 8,
                                                                  ).r,
                                                                  child: Text(
                                                                    "Computer",
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
                                                          );
                                                        })),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ))
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: widget.isEnroll!
                            ? Container()
                            : Container(
                                width: ScreenUtil().screenWidth,
                                color: Colors.white,
                                child: InkWell(
                                  onTap: () {
                                    deactivate();
                                    Get.to(EnrollCourseScreen(
                                      price: widget.price!,
                                      ABAPaymentURL: widget.ABAPaymentURL!,
                                      title: widget.title!,
                                    ));
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
                                    child: Text(
                                      "Enroll Now!",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 70.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
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
