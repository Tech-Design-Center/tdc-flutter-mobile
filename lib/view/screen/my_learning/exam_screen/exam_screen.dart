
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:http/http.dart' as http;
import 'package:tdc_frontend_mobile/controller/controllers.dart';
import 'package:tdc_frontend_mobile/model/course.dart';

class ExamScreen extends StatefulWidget {
  const ExamScreen({Key? key}) : super(key: key);

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  late InAppWebViewController _webViewController;

  List<Course> course = myCourseController.courseList ;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Exam'),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse(course[0].examURL!.first),
        ),
        onWebViewCreated: (controller) {
          _webViewController = controller;
        },
      ),
    );
  }
}
