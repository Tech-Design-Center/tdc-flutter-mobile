import 'dart:io';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pod_player/pod_player.dart';
import 'package:tdc_frontend_mobile/controller/controllers.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/model/course.dart';
import 'package:tdc_frontend_mobile/view/dashboard_screen.dart';
import 'package:tdc_frontend_mobile/view/screen/home/enroll_course_screen/enroll_course_screen.dart';

import 'package:flutter/material.dart';
import 'package:tdc_frontend_mobile/view/screen/home/video_player_screen.dart';
import 'package:tdc_frontend_mobile/view/screen/my_learning/exam_screen/exam_screen.dart';
import 'package:tdc_frontend_mobile/view/screen/my_learning/my_course/pdf_view_screen/pdf_view_screen.dart';
import 'package:tdc_frontend_mobile/view/screen/welcome/onboarding_screen.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class CourseDetailsScreen extends StatefulWidget {
  final String? image;
  final String? title;
  final String? author;
  final String? description;
  final String? ABAPaymentURL;
  final String? documentsURL;
  final int? duration;
  final int? price;
  final String? videoTrailerURL;
  final bool? isEnroll;
  final List<String>? playlistTitle;
  final List<List<String>>? videoTitle;
  final List<List<String>>? videoUrl;
  final DateTime purchaseDate;
  final String? telegramURL;

  CourseDetailsScreen({
    super.key,
    required this.image,
    required this.title,
    required this.author,
    required this.description,
    required this.duration,
    required this.price,
    required this.videoTrailerURL,
    required this.isEnroll,
    required this.playlistTitle,
    required this.videoTitle,
    required this.videoUrl,
    required this.ABAPaymentURL,
    required this.documentsURL,
    required this.purchaseDate,
    required this.telegramURL,
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
  bool isExam = false;
  List<Course> course = myCourseController.courseList;
  String daynow = '0';
  int expDate = 0;
  @override
  void initState() {
    tabController = tabController = TabController(length: 3, vsync: this);
    super.initState();
    loadVideo();
    String APIDate = DateFormat('yyyy, MM, dd').format(widget.purchaseDate);
    List<String> dateParts = APIDate.split(", ");
    int year = int.parse(dateParts[0]);
    int month = int.parse(dateParts[1]);
    int day = int.parse(dateParts[2]);
    DateTime date = DateTime(year, month, day);
    DateTime givenDate = DateTime(date.year, date.month, date.day).toLocal();

    DateTime now = DateTime.now();

    int differenceInDays = now.difference(givenDate).inDays;
    daynow = differenceInDays.toString();

    //EasyLoading.showError(daynow);

    if (differenceInDays.toInt() > 30) {
      isExam = true;
    }

    expDate = 30 - differenceInDays;
    //EasyLoading.showError(expDate.toString());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void loadVideo() async {
    List<VideoQalityUrls>? urls;
    isExam
        ? urls = await PodPlayerController.getYoutubeUrls(
            widget.videoTrailerURL!,
          )
        : urls = await PodPlayerController.getYoutubeUrls(
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
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3), //color of shadow
                            spreadRadius: 5, //spread radius
                            blurRadius: 7, // blur radius
                            offset: Offset(0, 10), // changes position of shadow
                            //first paramerter of offset is left-right
                            //second parameter is top to down
                          ),
                          //you can set more BoxShadow() here
                        ],
                      ),
                      height: ScreenUtil().setHeight(300),
                      width: double.infinity,
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
                                  Get.offAll(() => DashboardScreen(
                                        selectedNavBarIndex: 0,
                                      ));
                                },
                                icon: const Icon(Icons.home_filled)),
                          ],
                        ),
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3), //color of shadow
                            spreadRadius: 5, //spread radius
                            blurRadius: 7, // blur radius
                            offset: Offset(0, 10), // changes position of shadow
                            //first paramerter of offset is left-right
                            //second parameter is top to down
                          ),
                          //you can set more BoxShadow() here
                        ],
                      ),
                      height: ScreenUtil().setHeight(300),
                      width: double.infinity,
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
                                  Get.offAll(() => DashboardScreen(
                                        selectedNavBarIndex: 0,
                                      ));
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
                                            "Teach by : ".tr + "${widget.author}",
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
                                            left: 10,
                                            top: 30,
                                            right: 10,
                                          ).r,
                                          child: Text(
                                            "Duration : ".tr + "${widget.duration}" + " Hours ".tr,
                                            style: TextStyle(
                                                fontSize: 60.sp, color: Colors.blueAccent),
                                          ),
                                        ),
                                        Container(
                                            child: widget.isEnroll!
                                                ? Padding(
                                                    padding: EdgeInsets.only(
                                                      left: 10,
                                                      top: 30,
                                                      right: 10,
                                                    ).r,
                                                    child: Text(
                                                      "$expDate" + " Day Left ".tr,
                                                      style: TextStyle(
                                                          fontSize: 60.sp, color: Colors.redAccent),
                                                    ),
                                                  )
                                                : Padding(
                                                    padding: EdgeInsets.only(
                                                      left: 10,
                                                      top: 30,
                                                      right: 10,
                                                    ).r,
                                                  ))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                    margin:
                                        EdgeInsets.only(top: 0, right: 50, left: 50, bottom: 20).r,
                                    decoration: BoxDecoration(
                                      color: ColorConstant.gray100,
                                      borderRadius: BorderRadius.circular(
                                        ScreenUtil().setWidth(
                                          22.00,
                                        ),
                                      ),
                                    ),
                                    child: widget.isEnroll!
                                        ? Container(
                                            child: isExam
                                                ? TabBar(
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
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w400),
                                                    controller: tabController,
                                                    tabs: [
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Tab(
                                                          text: "Exam".tr,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : TabBar(
                                                    indicatorPadding: EdgeInsets.all(5).w,
                                                    indicator: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(0),
                                                        color: ColorConstant.indigoA200),
                                                    labelColor: ColorConstant.whiteA700,
                                                    unselectedLabelColor: Colors.black,
                                                    labelStyle: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w500),
                                                    unselectedLabelStyle: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w400),
                                                    controller: tabController,
                                                    tabs: [
                                                      Container(
                                                        width: ScreenUtil().screenWidth,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(100.0),
                                                        ),
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Tab(
                                                          text: "Videos".tr,
                                                        ),
                                                      ),
                                                      Container(
                                                        width: ScreenUtil().screenWidth,
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Tab(
                                                          text: "About".tr,
                                                        ),
                                                      ),
                                                    ],
                                                  ))
                                        : TabBar(
                                            indicatorPadding: EdgeInsets.all(5).w,
                                            indicator: BoxDecoration(
                                                borderRadius: BorderRadius.circular(0),
                                                color: ColorConstant.indigoA200,
                                            ),
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
                                              Container(
                                                width: ScreenUtil().screenWidth,
                                                child: Tab(
                                                  text: "${widget.price}\$",
                                                ),
                                              ),
                                            ],
                                          )),
                              ),
                              Container(
                                  child: widget.isEnroll!
                                      ? Container(
                                          height: ScreenUtil().setHeight(1450),
                                          child: isExam
                                              ? TabBarView(
                                                  controller: tabController,
                                                  children: [
                                                    SingleChildScrollView(
                                                      padding: EdgeInsets.only(
                                                              left: 50, right: 50, bottom: 20)
                                                          .r,
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          border: Border.all(
                                                              width: 0.8, color: Colors.grey),
                                                          borderRadius: BorderRadius.all(
                                                              Radius.circular(30).w),
                                                        ),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment.start,
                                                          children: [
                                                            Padding(
                                                              padding: REdgeInsets.only(
                                                                  left: 35,
                                                                  top: 60,
                                                                  right: 35,
                                                                  bottom: 40),
                                                              child: Text(
                                                                'Description'.tr,
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
                                                                          top: 20,
                                                                          bottom: 20)
                                                                      .r,
                                                                  width: ScreenUtil().screenWidth,
                                                                  child: Text(
                                                                    "Please watch video introduction above before exam.",
                                                                    maxLines: 2,
                                                                    style: TextStyle(
                                                                        fontSize: 50.sp,
                                                                        color:
                                                                            ColorConstant.gray600,
                                                                        fontFamily: 'Poppins',
                                                                        fontWeight:
                                                                            FontWeight.normal),
                                                                  )),
                                                            ),
                                                            Divider(
                                                              height: 20.h,
                                                              color: Colors.black,
                                                            ),
                                                            SizedBox(
                                                              height: 20.h,
                                                            ),
                                                            Container(
                                                              decoration: BoxDecoration(
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                      color: Colors.blue,
                                                                      spreadRadius: 3),
                                                                ],
                                                                borderRadius: BorderRadius.all(
                                                                    Radius.circular(30).w),
                                                                color: Colors.blueAccent,
                                                              ),
                                                              padding: REdgeInsets.only(
                                                                  left: 50,
                                                                  top: 70,
                                                                  right: 35,
                                                                  bottom: 70),
                                                              child: InkWell(
                                                                onTap: () async {
                                                                  deactivate();
                                                                  await launch(
                                                                    widget.telegramURL!,
                                                                    forceSafariVC: false,
                                                                    forceWebView: false,
                                                                    headers: <String, String>{
                                                                      'my_header_key':
                                                                          'my_header_value'
                                                                    },
                                                                  );
                                                                },
                                                                child: Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons.telegram,
                                                                      color: Colors.white,
                                                                    ),
                                                                    SizedBox(
                                                                      width: 30.w,
                                                                    ),
                                                                    Text(
                                                                      'Telegram Support'.tr,
                                                                      overflow:
                                                                          TextOverflow.ellipsis,
                                                                      textAlign: TextAlign.start,
                                                                      style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontSize:
                                                                            ScreenUtil().setSp(
                                                                          80,
                                                                        ),
                                                                        fontFamily: 'Poppins',
                                                                        fontWeight: FontWeight.w600,
                                                                        height: 1.00,
                                                                      ),
                                                                    ),
                                                                    Spacer(),
                                                                    Icon(
                                                                      Icons.arrow_forward_ios,
                                                                      color: Colors.white,
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 20.h,
                                                            ),
                                                            Divider(
                                                              height: 20.h,
                                                              color: Colors.black,
                                                            ),
                                                            SizedBox(
                                                              height: 20.h,
                                                            ),
                                                            Container(
                                                                child: Platform.isAndroid &&
                                                                        Platform.isIOS
                                                                    ? InkWell(
                                                                        onTap: () async {
                                                                          deactivate();
                                                                          Get.to(ExamScreen());
                                                                        },
                                                                        child: Container(
                                                                          decoration: BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius
                                                                                    .circular(10),
                                                                            color: Colors.redAccent,
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                  color: Colors
                                                                                      .redAccent,
                                                                                  spreadRadius: 3),
                                                                            ],
                                                                          ),
                                                                          width: ScreenUtil()
                                                                              .screenWidth,
                                                                          height: 150.h,
                                                                          child: Center(
                                                                              child: Text(
                                                                            "Exam Now!".tr,
                                                                            style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontSize: 65.sp),
                                                                          )),
                                                                        ),
                                                                      )
                                                                    : InkWell(
                                                                        onTap: () async {
                                                                          deactivate();
                                                                        },
                                                                        child: Container(
                                                                          decoration: BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius
                                                                                    .circular(10),
                                                                            color: Colors.redAccent
                                                                                .withOpacity(0.5),
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                  color: Colors
                                                                                      .redAccent
                                                                                      .withOpacity(
                                                                                          0.5),
                                                                                  spreadRadius: 3),
                                                                            ],
                                                                          ),
                                                                          width: ScreenUtil()
                                                                              .screenWidth,
                                                                          height: 200.h,
                                                                          child: Center(
                                                                              child: Text(
                                                                            "Exam on Computer Only !"
                                                                                .tr,
                                                                            style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontSize: 65.sp),
                                                                          )),
                                                                        ),
                                                                      )),
                                                            SizedBox(
                                                              height: 100.h,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : TabBarView(
                                                  controller: tabController,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                              left: 14, right: 14, top: 50)
                                                          .r,
                                                      child: SingleChildScrollView(
                                                        physics: NeverScrollableScrollPhysics(),
                                                        child: Column(
                                                          children: [
                                                            //playlist card
                                                            ListView.separated(
                                                              physics: BouncingScrollPhysics(),
                                                              itemCount:
                                                                  widget.playlistTitle!.length,
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
                                                                        width: 0.8,
                                                                        color: Colors.grey),
                                                                    color: ColorConstant.gray50,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                      ScreenUtil().setWidth(
                                                                        60.00,
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
                                                                          3,
                                                                          3,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  child: ExpansionTile(
                                                                    title: Text(widget
                                                                        .playlistTitle![index]),
                                                                    children: [
                                                                      Container(
                                                                        decoration: BoxDecoration(
                                                                          border: Border.all(
                                                                              width: 0.4,
                                                                              color: Colors.grey),
                                                                          color:
                                                                              ColorConstant.gray50,
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
                                                                                  ScreenUtil()
                                                                                      .setWidth(
                                                                                2.00,
                                                                              ),
                                                                              blurRadius:
                                                                                  ScreenUtil()
                                                                                      .setWidth(
                                                                                2.00,
                                                                              ),
                                                                              offset: Offset(
                                                                                3.r,
                                                                                3.r,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        padding:
                                                                            const EdgeInsets.only(
                                                                                    left: 100)
                                                                                .r,
                                                                        child: ListView.builder(
                                                                          physics:
                                                                              NeverScrollableScrollPhysics(),
                                                                          itemCount: widget
                                                                              .videoTitle![index]
                                                                              .length,
                                                                          shrinkWrap: true,
                                                                          scrollDirection:
                                                                              Axis.vertical,
                                                                          padding: REdgeInsets.only(
                                                                              top: 40,
                                                                              left: 20,
                                                                              right: 20,
                                                                              bottom: 20),
                                                                          itemBuilder:
                                                                              (context, index1) {
                                                                            return GestureDetector(
                                                                              onTap: () {
                                                                                deactivate();
                                                                                Get.to(
                                                                                    VideoPlayerScreen(
                                                                                  videoUrl: widget
                                                                                          .videoUrl![
                                                                                      index][index1],
                                                                                  author:
                                                                                      widget.author,
                                                                                  description: widget
                                                                                      .description,
                                                                                  duration: widget
                                                                                      .duration,
                                                                                  image:
                                                                                      widget.image!,
                                                                                  title:
                                                                                      widget.title!,
                                                                                  videoTitle: widget
                                                                                          .videoTitle![
                                                                                      index][index1],
                                                                                  documentURL: widget
                                                                                      .documentsURL,
                                                                                ));
                                                                              },
                                                                              child: ListTile(
                                                                                  title: Text(
                                                                                      widget.videoTitle![
                                                                                              index]
                                                                                          [
                                                                                          index1])),
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                              separatorBuilder:
                                                                  (BuildContext context,
                                                                      int index) {
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
                                                      padding: EdgeInsets.only(
                                                              left: 50, right: 50, bottom: 20)
                                                          .r,
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          border: Border.all(
                                                              width: 0.8, color: Colors.grey),
                                                          borderRadius: BorderRadius.all(
                                                              Radius.circular(30).w),
                                                        ),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment.start,
                                                          children: [
                                                            Padding(
                                                              padding: REdgeInsets.only(
                                                                  left: 35,
                                                                  top: 60,
                                                                  right: 35,
                                                                  bottom: 40),
                                                              child: Text(
                                                                'Description'.tr,
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
                                                                          top: 20)
                                                                      .r,
                                                                  width: ScreenUtil().screenWidth,
                                                                  child: Text(
                                                                    widget.description!,
                                                                    maxLines: 2,
                                                                    style: TextStyle(
                                                                        fontSize: 50.sp,
                                                                        color:
                                                                            ColorConstant.gray600,
                                                                        fontFamily: 'Poppins',
                                                                        fontWeight:
                                                                            FontWeight.normal),
                                                                  )),
                                                            ),
                                                            SizedBox(
                                                              height: 20.h,
                                                            ),
                                                            Divider(
                                                              height: 20.h,
                                                              color: Colors.black,
                                                            ),
                                                            SizedBox(
                                                              height: 20.h,
                                                            ),
                                                            Padding(
                                                              padding: REdgeInsets.only(
                                                                  left: 35,
                                                                  top: 60,
                                                                  right: 35,
                                                                  bottom: 40),
                                                              child: Text(
                                                                'Documents'.tr,
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
                                                            Center(
                                                              child: TextButton(
                                                                onPressed: () {
                                                                  deactivate();
                                                                  Get.to(PdfViewerPage(
                                                                    DocumentURL:
                                                                        widget.documentsURL!,
                                                                  ));
                                                                },
                                                                child: Container(
                                                                  decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(10),
                                                                    color: Colors.blueAccent,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                          color: Colors.blue,
                                                                          spreadRadius: 3),
                                                                    ],
                                                                  ),
                                                                  width: 1000.w,
                                                                  height: 150.h,
                                                                  child: Center(
                                                                      child: Text(
                                                                    "Documents".tr,
                                                                    style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontSize: 65.sp),
                                                                  )),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 20.h,
                                                            ),
                                                            Divider(
                                                              height: 20.h,
                                                              color: Colors.black,
                                                            ),
                                                            SizedBox(
                                                              height: 20.h,
                                                            ),
                                                            Padding(
                                                              padding: REdgeInsets.only(
                                                                  left: 35,
                                                                  top: 60,
                                                                  right: 35,
                                                                  bottom: 40),
                                                              child: Text(
                                                                'Telegram Group'.tr,
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
                                                            Center(
                                                              child: TextButton(
                                                                onPressed: () async {
                                                                  deactivate();
                                                                  await launch(
                                                                    widget.telegramURL!,
                                                                    forceSafariVC: false,
                                                                    forceWebView: false,
                                                                    headers: <String, String>{
                                                                      'my_header_key':
                                                                          'my_header_value'
                                                                    },
                                                                  );
                                                                },
                                                                child: Container(
                                                                  decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(10),
                                                                    color: Colors.blueAccent,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                          color: Colors.blue,
                                                                          spreadRadius: 3),
                                                                    ],
                                                                  ),
                                                                  width: 1000.w,
                                                                  height: 150.h,
                                                                  child: Center(
                                                                      child: Text(
                                                                    "Telegram",
                                                                    style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontSize: 65.sp),
                                                                  )),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 20.h,
                                                            ),
                                                            Divider(
                                                              height: 20.h,
                                                              color: Colors.black,
                                                            ),
                                                            SizedBox(
                                                              height: 20.h,
                                                            ),
                                                            Padding(
                                                              padding: REdgeInsets.only(
                                                                  left: 24,
                                                                  top: 80,
                                                                  right: 24,
                                                                  bottom: 40),
                                                              child: Text(
                                                                "Information".tr,
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
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment.start,
                                                                children: [
                                                                  Align(
                                                                    alignment: Alignment.center,
                                                                    child: Padding(
                                                                      padding: REdgeInsets.only(
                                                                        left: 1,
                                                                        top: 5,
                                                                      ),
                                                                      child: Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment
                                                                                .center,
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                EdgeInsets.only(
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
                                                                            padding:
                                                                                EdgeInsets.only(
                                                                              left: 5,
                                                                              right: 5,
                                                                              top: 1,
                                                                            ).r,
                                                                            child: Text(
                                                                              "Beginner and Medium"
                                                                                  .tr,
                                                                              overflow: TextOverflow
                                                                                  .ellipsis,
                                                                              textAlign:
                                                                                  TextAlign.start,
                                                                              style: TextStyle(
                                                                                fontSize:
                                                                                    ScreenUtil()
                                                                                        .setSp(
                                                                                  60,
                                                                                ),
                                                                                fontFamily:
                                                                                    'Poppins',
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
                                                                      mainAxisSize:
                                                                          MainAxisSize.max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsets.only(
                                                                            bottom: 4,
                                                                          ).r,
                                                                          child: Icon(
                                                                            Icons.mic,
                                                                            color:
                                                                                Colors.blueAccent,
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsets.only(
                                                                            left: 10,
                                                                            right: 6,
                                                                            top: 1,
                                                                          ).r,
                                                                          child: Text(
                                                                            "Khmer".tr,
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
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 20.h,
                                                            ),
                                                            Divider(
                                                              height: 20.h,
                                                              color: Colors.black,
                                                            ),
                                                            SizedBox(
                                                              height: 20.h,
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets.only(
                                                                left: 24,
                                                                top: 32,
                                                                right: 24,
                                                              ).r,
                                                              child: Text(
                                                                "Tools you need".tr,
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
                                                                //padding: EdgeInsets.only(bottom: 70),
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
                                                                                BorderRadius
                                                                                    .circular(
                                                                              ScreenUtil().setWidth(
                                                                                16.00,
                                                                              ),
                                                                            ),
                                                                            child: Icon(
                                                                              Icons.computer,
                                                                              color:
                                                                                  Colors.blueAccent,
                                                                            )),
                                                                        Padding(
                                                                          padding: EdgeInsets.only(
                                                                            left: 30,
                                                                            right: 8,
                                                                            top: 9,
                                                                            bottom: 8,
                                                                          ).r,
                                                                          child: Text(
                                                                            "Computer".tr,
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
                                                                  );
                                                                })),
                                                            SizedBox(
                                                              height: 500.h,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ))
                                      : Container(
                                          padding: EdgeInsets.only(
                                                  top: 20, right: 50, left: 50, bottom: 20)
                                              .r,
                                          height: ScreenUtil().setHeight(1600),
                                          child: TabBarView(
                                            controller: tabController,
                                            children: [
                                              SingleChildScrollView(
                                                padding: EdgeInsets.only(left: 20, right: 20).r,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border:
                                                        Border.all(width: 0.8, color: Colors.grey),
                                                    borderRadius:
                                                        BorderRadius.all(Radius.circular(30).w),
                                                  ),
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
                                                          "Introduction".tr,
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
                                                                    top: 20,
                                                                    bottom: 30)
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
                                                      Divider(
                                                        height: 20.h,
                                                        color: Colors.black,
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                                left: 24,
                                                                top: 80,
                                                                right: 24,
                                                                bottom: 40)
                                                            .r,
                                                        child: Text(
                                                          "Details".tr,
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
                                                                            MainAxisAlignment
                                                                                .center,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment
                                                                                .center,
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding:
                                                                                EdgeInsets.only(
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
                                                                            padding:
                                                                                EdgeInsets.only(
                                                                              left: 5,
                                                                              right: 5,
                                                                              top: 1,
                                                                            ).r,
                                                                            child: Text(
                                                                              "Beginner and Medium"
                                                                                  .tr,
                                                                              overflow: TextOverflow
                                                                                  .ellipsis,
                                                                              textAlign:
                                                                                  TextAlign.start,
                                                                              style: TextStyle(
                                                                                fontSize:
                                                                                    ScreenUtil()
                                                                                        .setSp(
                                                                                  60,
                                                                                ),
                                                                                fontFamily:
                                                                                    'Poppins',
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
                                                                      mainAxisSize:
                                                                          MainAxisSize.max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsets.only(
                                                                            bottom: 4,
                                                                          ).r,
                                                                          child: Icon(
                                                                            Icons.mic,
                                                                            color:
                                                                                Colors.blueAccent,
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsets.only(
                                                                            left: 10,
                                                                            right: 6,
                                                                            top: 1,
                                                                          ).r,
                                                                          child: Text(
                                                                            "Khmer".tr,
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
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                      Divider(
                                                        height: 20.h,
                                                        color: Colors.black,
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                          left: 24,
                                                          top: 40,
                                                          right: 24,
                                                        ).r,
                                                        child: Text(
                                                          "Tools you need".tr,
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
                                                                      "Computer".tr,
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
                                                            );
                                                          })),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ))
                            ],
                          ),
                        ),
                      ),
                      Container(
                          child: authController.user.value?.fullName == null
                              ? Align(
                                  alignment: Alignment.bottomCenter,
                                  child: isVideoPlaying
                                      ? Container(
                                          child: widget.isEnroll!
                                              ? Container()
                                              : InkWell(
                                                  onTap: () {
                                                    deactivate();
                                                    Get.offAll(() => OnboardingScreen());
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
                                                      borderRadius:
                                                          BorderRadius.all(Radius.circular(50)),
                                                      color: Colors.blueAccent,
                                                    ),
                                                    child: Text(
                                                      "Enroll Now!".tr,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 70.sp,
                                                          fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                ))
                                      : Container(
                                          child: widget.isEnroll!
                                              ? Container()
                                              : InkWell(
                                                  onTap: () {
                                                    deactivate();
                                                    Get.offAll(() => OnboardingScreen());
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
                                                      borderRadius:
                                                          BorderRadius.all(Radius.circular(50)),
                                                      color: Colors.blueAccent,
                                                    ),
                                                    child: Text(
                                                      "Enroll Now!".tr,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 70.sp,
                                                          fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                )))
                              : Align(
                                  alignment: Alignment.bottomCenter,
                                  child: isVideoPlaying
                                      ? Container(
                                          child: widget.isEnroll!
                                              ? Container()
                                              : InkWell(
                                                  onTap: () {
                                                    deactivate();
                                                    Get.to(EnrollCourseScreen(
                                                        price: widget.price,
                                                        ABAPaymentURL: widget.ABAPaymentURL,
                                                        title: widget.title));
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
                                                      borderRadius:
                                                          BorderRadius.all(Radius.circular(50)),
                                                      color: Colors.blueAccent,
                                                    ),
                                                    child: Text(
                                                      "Enroll Now!".tr,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 70.sp,
                                                          fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                ))
                                      : Container(
                                          child: widget.isEnroll!
                                              ? Container()
                                              : InkWell(
                                                  onTap: () {
                                                    deactivate();
                                                    Get.to(EnrollCourseScreen(
                                                        price: widget.price,
                                                        ABAPaymentURL: widget.ABAPaymentURL,
                                                        title: widget.title));
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
                                                      borderRadius:
                                                          BorderRadius.all(Radius.circular(50)),
                                                      color: Colors.blueAccent,
                                                    ),
                                                    child: Text(
                                                      "Enroll Now!".tr,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 70.sp,
                                                          fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                ))))
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
