import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';


class PdfviewerScreen extends StatefulWidget {
  final String DocumentURL;
  final String title;
  const PdfviewerScreen({Key? key, required this.DocumentURL, required this.title}) : super(key: key);

  @override
  State<PdfviewerScreen> createState() => _PdfviewerScreenState();
}



class _PdfviewerScreenState extends State<PdfviewerScreen> {


  late File Pfile;

  bool isLoading = false;

  Future<void> loadNetwork() async {
    setState(() {
      isLoading = true;
    });
    //var url = 'http://www.pdf995.com/samples/pdf.pdf';
    final response = await http.get(Uri.parse(widget.DocumentURL));
    final bytes = response.bodyBytes;
    final filename = basename(widget.DocumentURL);
    final dir = await getApplicationDocumentsDirectory();
    var file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    setState(() {
      Pfile = file;
    });

    print(Pfile);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    loadNetwork();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title.tr,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
        child: Center(
          child: PDFView(
            filePath: Pfile.path,
          ),
        ),
      ),
    );
  }
}
