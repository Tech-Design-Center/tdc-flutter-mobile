import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdc_frontend_mobile/view/screen/a/course_details_screen/widgets/video_player.dart';
import 'package:video_player/video_player.dart';


class FullScreenVideo extends StatefulWidget {
  @override
  State<FullScreenVideo> createState() => _FullScreenVideoState();
}

class _FullScreenVideoState extends State<FullScreenVideo> {
  VideoPlayerController? videoPlayerController;
  final asset = 'https://www.youtube.com/watch?v=7oWZe6CkKKQ';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoPlayerController = VideoPlayerController.network('https://firebasestorage.googleapis.com/v0/b/techdesigncenter-84455.appspot.com/o/aaaa.mp4?alt=media&token=da00496c-e501-4f20-a59c-2eb88dc6ed77')
      ..addListener(() {
        setState(() {});
      })
      ..setLooping(true)
      ..initialize().then((value) => videoPlayerController!.play());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoPlayerController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RotatedBox(
          quarterTurns: 1,
          child: Container(
            height: ScreenUtil().setHeight(3000),
            width: ScreenUtil().setWidth(3000),
            child: VideoPlayerWidget(
              controller: videoPlayerController!,
              isFullScreen: true,
            ),
          ),
        ),
      ),
    );
  }
}
