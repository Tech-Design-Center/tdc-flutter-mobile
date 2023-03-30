import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdc_frontend_mobile/core/constants/color_constant.dart';
import 'package:tdc_frontend_mobile/core/constants/image_constant.dart';

class LightSettingsLanguageScreen extends StatefulWidget {
  @override
  State<LightSettingsLanguageScreen> createState() =>
      _LightSettingsLanguageScreenState();
}

class _LightSettingsLanguageScreenState
    extends State<LightSettingsLanguageScreen> {
  @override
  Widget build(BuildContext context) {
    int radioGroup = 0;
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
                            "Language",
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
            margin: EdgeInsets.only(left: 80, right: 80, top: 20, bottom: 20).r,
            color: ColorConstant.darkLine,
          ),
          SizedBox(
            height: ScreenUtil().setHeight(50),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(
                left: 80,
                top: 10,
                bottom: 10,
                right: 80,
              ).r,
              child: InkWell(
                onTap: () async {
                  setState(() async {
                    radioGroup = 0;
                  });
                },
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
                        value: 0,
                        activeColor: ColorConstant.indigoA200,
                        groupValue: radioGroup,
                        onChanged: (value) async {
                          setState(() async {
                            radioGroup = 0;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(
                left: 24,
                top: 10,
                bottom: 10,
                right: 21,
              ),
              child: InkWell(
                onTap: () async {
                  setState(() async {
                    radioGroup = 1;
                  });
                },
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
                        value: 1,
                        activeColor: ColorConstant.indigoA200,
                        groupValue: radioGroup,
                        onChanged: (value) {
                          setState(() async {
                            radioGroup = value as int;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
