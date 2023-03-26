import 'package:flutter/material.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/view/screen/a/course_details_screen/widgets/basic_overlay_widget.dart';
import 'package:video_player/video_player.dart';

// ignore: must_be_immutable
class VideoPlayerWidget extends StatelessWidget {
  bool isFullScreen;
   VideoPlayerController controller;
  
   VideoPlayerWidget({required this.controller,required this.isFullScreen}) ;

  @override
  Widget build(BuildContext context) {
    return 
     controller.value.isInitialized?
    Container(
      alignment:  Alignment.topCenter,
      child:buildVideo() ,
    )
    
    :Center(
      child: CircularProgressIndicator(
        color: ColorConstant.indigoA200,
      ),
    );
    
  }

  Widget buildVideo(){
    return Stack(
      children: [
        buildVideoPlayer(),
        Positioned.fill(child: BasicOverlayWidget(controller: controller,
        isFullScreen: isFullScreen,
        ) )
      ],
    );
  }
  
 Widget buildVideoPlayer() {
return
    AspectRatio(
      aspectRatio:controller.value.aspectRatio,
      child: VideoPlayer(controller));
  }
}