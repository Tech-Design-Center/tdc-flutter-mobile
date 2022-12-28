import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class ExampleScreen extends StatefulWidget {
  ExampleScreen({super.key});

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  TextEditingController englishController = TextEditingController();
  TextEditingController khmerController = TextEditingController();

  _translateLang() {
    translator
        .translate(englishController.text, to: 'km', from: 'en')
        .then((result) {
      setState(() {
        khmerController.text = result.toString();
      });
    });
  }

  final translator = GoogleTranslator();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        children: [
          TextFormField(
            controller: englishController,
            decoration: InputDecoration(hintText: 'English'),
          ),
          TextFormField(
            controller: khmerController,
            decoration: InputDecoration(hintText: 'Khmer'),
          ),
          TextButton(
              onPressed: () {
                _translateLang();
              },
              child: Text('Translate'))
        ],
      ),
    );
  }
}
