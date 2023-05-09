import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';



class ExamScreen extends StatefulWidget {
  const ExamScreen({Key? key}) : super(key: key);

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  late InAppWebViewController _webViewController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exam".tr),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse('https://docs.google.com/forms/d/e/1FAIpQLScXTLaJs6mRfyqg5sENwCuXTjESr_FEjpy62dHEjfRNrWtdsg/viewform'),
        ),
        onWebViewCreated: (controller) {
          _webViewController = controller;
        },
      ),
    );
  }
}





