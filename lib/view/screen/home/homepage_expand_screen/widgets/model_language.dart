import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/core/constants/image_constant.dart';
import 'package:tdc_frontend_mobile/main.dart';
import 'package:translator/translator.dart';

class ModalLanguage extends StatefulWidget {
  @override
  State<ModalLanguage> createState() => _ModalLanguageState();
}

class _ModalLanguageState extends State<ModalLanguage> {
  final translator = GoogleTranslator();
  TextEditingController englishController = TextEditingController();
  TextEditingController khmerController = TextEditingController();
  String _selectedLanguage = 'en';
  String _translatedText = '';

  void _translateLanguageEngToKhmer() async {
    setState(() {
      _translatedText = 'Translating...';
    });

    Translation translatedText = await translator.translate(
      'Language',
      to: _selectedLanguage,
    );
    setState(() {
      _translatedText = translatedText.toString();
    });
  }

  void _handleRadioValueChange(String? value) {
    setState(() {
      _selectedLanguage = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(1000),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: ScreenUtil().setHeight(
              3.00,
            ),
            width: ScreenUtil().setWidth(
              56.00,
            ),
            margin: EdgeInsets.only(
              left: ScreenUtil().setWidth(
                10.00,
              ),
              top: ScreenUtil().setHeight(
                16.00,
              ),
              right: ScreenUtil().setWidth(
                10.00,
              ),
            ),
            decoration: BoxDecoration(
              color: ColorConstant.gray300,
              borderRadius: BorderRadius.circular(
                ScreenUtil().setWidth(
                  1.50,
                ),
              ),
            ),
          ),
          Align(
              alignment: Alignment.center,
              child: Padding(
                  padding: EdgeInsets.only(
                    left: 80,
                    top: 40,
                    right: 80,
                  ).r,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: 2,
                          ).r,
                          child: Text(
                            _translatedText,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: ScreenUtil().setSp(70),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.close,
                              size: 25,
                            ))
                      ]))),
          Container(
            height: 1,
            margin: REdgeInsets.only(left: 80, right: 80, top: 20, bottom: 20),
            color: ColorConstant.darkLine,
          ),
          SizedBox(
            height: ScreenUtil().setHeight(50),
          ),
          Padding(
            padding: REdgeInsets.only(left: 60, right: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "English (US)",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: ScreenUtil().setSp(60),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Theme(
                  data: Theme.of(context).copyWith(
                    unselectedWidgetColor: ColorConstant.indigoA200,
                    // disabledColor: Colors.blue
                  ),
                  child: Radio(
                    value: 'en',
                    activeColor: ColorConstant.indigoA200,
                    groupValue: _selectedLanguage,
                    onChanged: (value) => _handleRadioValueChange(value),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: REdgeInsets.only(left: 60, right: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "Khmer",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: ScreenUtil().setSp(60),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Theme(
                  data: Theme.of(context).copyWith(
                    unselectedWidgetColor: ColorConstant.indigoA200,
                    // disabledColor: Colors.blue
                  ),
                  child: Radio(
                    value: 'km',
                    activeColor: ColorConstant.indigoA200,
                    groupValue: _selectedLanguage,
                    onChanged: (value) => _handleRadioValueChange(value),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            // onPressed: () => _translateLanguageEngToKhmer(),
            onPressed: () {
              // change the language to the next supported locale
            Get.updateLocale(locales.elementAt((locales.indexOf(Get.locale!) + 1) % locales.length));
            },
            child: Text('Translate'),
          ),
        ],
      ),
    );
  }
}
