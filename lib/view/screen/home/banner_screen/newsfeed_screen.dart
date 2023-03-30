import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdc_frontend_mobile/view/dashboard_screen.dart';
<<<<<<< HEAD:lib/view/screen/newsfeed_screen/newsfeed_screen.dart
import 'package:tdc_frontend_mobile/view/screen/newsfeed_screen/widgets/newsfeed_item_widget.dart';
import 'package:tdc_frontend_mobile/view/screen/section_title_screen.dart';
=======
import 'package:tdc_frontend_mobile/view/screen/home/banner_screen/widgets/newsfeed_item_widget.dart';
>>>>>>> e16ac9de22b8068eaa7947ffc5b5771897aad276:lib/view/screen/home/banner_screen/newsfeed_screen.dart

class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen({Key? key}) : super(key: key);

  @override
  State<NewsFeedScreen> createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
<<<<<<< HEAD:lib/view/screen/newsfeed_screen/newsfeed_screen.dart
            SectionTitleScreen(name: 'Newsfeed', widget: DashboardScreen()),

=======
            Container(
              padding: EdgeInsets.only(left: 120).r,
              height: ScreenUtil().setHeight(300),
              width: double.infinity,
              color: Colors.grey.shade200,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DashboardScreen()),
                      );
                    },
                    child: Icon(Icons.arrow_back_ios),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 340,
                        top: 0,
                        right: 24,
                        bottom: 3,
                      ).r,
                      child: Text(
                        "Newsfeed",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(
                            100,
                          ),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.36,
                          height: 1.00,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
>>>>>>> e16ac9de22b8068eaa7947ffc5b5771897aad276:lib/view/screen/home/banner_screen/newsfeed_screen.dart
            Expanded(
              child: Container(
                width: ScreenUtil().screenWidth,
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(
                              left: 50,
                              top: 50,
                              right: 50,
                            ).r,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 16,
                                  ).r,
                                  child: ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: 3,
                                    itemBuilder: (context, index) {
                                      return NewsFeed_Items();
                                    },
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
