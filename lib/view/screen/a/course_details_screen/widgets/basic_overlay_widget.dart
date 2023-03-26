import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/core/constants/image_constant.dart';
import 'package:tdc_frontend_mobile/view/screen/a/course_details_screen/video_fullscreen.dart';
import 'package:video_player/video_player.dart';

// ignore: must_be_immutable
class BasicOverlayWidget extends StatefulWidget {
  bool isFullScreen;

  VideoPlayerController controller;
  

   BasicOverlayWidget({required this.controller,
   required this.isFullScreen});

  @override
  State<BasicOverlayWidget> createState() => _BasicOverlayWidgetState();
}

class _BasicOverlayWidgetState extends State<BasicOverlayWidget> {
  bool isOptionsShowed=false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
          if (widget.controller.value.isPlaying){
            setState(() {
               isOptionsShowed=!isOptionsShowed;
            });
          }
      },
      child: Stack(
        children: [
         isOptionsShowed || !widget.controller.value.isPlaying?
          builPlayButton():SizedBox(width: 10.w,),
         
         
          Positioned(
            bottom:  0,
            left: 0,
            right: 0,
            child: Row(
              children: [
                Expanded(child: buildIndicator),
                InkWell(
                  onTap:widget.isFullScreen?(){
                    Navigator.pop(context);
                  }: (){
                    Navigator.push(
    context,
    MaterialPageRoute(builder: (context)
 =>FullScreenVideo()),
  );
                  },
                  child: Container(
                    width: ScreenUtil().setWidth(120),
                    height: ScreenUtil().setHeight(120),
                    child:widget.isFullScreen?  Image.asset(ImageConstant.fullScreenExit,
                    color: Colors.white,
                    width: ScreenUtil().setHeight(120),
                    height: ScreenUtil().setHeight(120),
                    
                    ):Image.asset(ImageConstant.fullscreen,
                    color: Colors.white,
                    width: ScreenUtil().setHeight(30),
                    height: ScreenUtil().setHeight(30),
                    
                    ),
                  ),
                )

              ],
            )
            ),
            
    
        ],
      ),
    );
    
  }

 Widget get buildIndicator {
  return VideoProgressIndicator(widget.controller, allowScrubbing: true,

  colors:VideoProgressColors(
    bufferedColor: ColorConstant.indigo100,

    playedColor: ColorConstant.indigoA200
   
  ) ,
  
  );
 }

 Widget builPlayButton() {
  return widget.controller.value.isPlaying && isOptionsShowed?
  Center(
    child: GestureDetector(
      onTap: (){
        widget.controller.pause();
      },
      child: Container(
        padding: EdgeInsets.all(
           16
        ).r,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ColorConstant.indigo100,
        ),
        child: Icon(Icons.pause_rounded,
        color: Colors.white,
        ),
    
      ),
    ),
  ):
  Center(
    child: GestureDetector(
      onTap: (){
        widget.controller.play();
      },
      child: Container(
        padding: EdgeInsets.all(
         16
        ).r,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ColorConstant.indigo100,
        ),
        child: Icon(Icons.play_arrow_rounded,
        color: Colors.white,),
    
      ),
    ),
  );

 }
}