import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color whiteA7007f = fromHex('#7fffffff');

  static Color bluegray50 = fromHex('#eaecef');
  static Color darkBg = fromHex('#171F2C');
  static Color darkTextField = fromHex('#1B2737');
  static Color darkLine= fromHex('#152946');
  static Color darkIcons= fromHex('#43536B');

  static Color gray90099 = fromHex('#9909101d');

  static Color red200 = fromHex('#f89f93');

  static Color indigoA101 = fromHex('#8582ff');

  static Color indigoA100 = fromHex('#9e9cfd');

  static Color blueA200 = fromHex('#4285fa');

  static Color black90000 = fromHex('#00000000');

  static Color black90044 = fromHex('#44000000');

  static Color gray600 = fromHex('#6f757d');

  static Color indigoA7007f = fromHex('#7f304ffe');

  static Color indigoA20014 = fromHex('#145a6cea');

  static Color amber100 = fromHex('#feeab6');

  static Color bluegray10087 = fromHex('#87ced3da');

  static Color redA700A2 = fromHex('#a2da1414');

  static Color black9000c = fromHex('#0c000000');

  static Color blue50 = fromHex('#eef4ff');

  static Color blue51 = fromHex('#dbe8fe');

  static Color cyan200 = fromHex('#8de2ef');


  static Color bluegray800 = fromHex('#2d3a4a');

  static Color black90099 = fromHex('#99000000');

  static Color bluegray400 = fromHex('#777e90');

  static Color blue100 = fromHex('#b5cffd');

  static Color whiteA700 = fromHex('#ffffff');

  static Color gray51 = fromHex('#fbfcfc');

  static Color indigoA7004c = fromHex('#4c304ffe');

  static Color bluegray90000 = fromHex('#0019233a');

  static Color indigoA201 = fromHex('#7875fc');

  static Color indigoA200 = fromHex('#5e5cf0');

  static Color blueA100 = fromHex('#8eb6fc');

  static Color gray50 = fromHex('#f8f9fa');

  static Color black9001e = fromHex('#1e0d0d0d');

  static Color bluegray970 = fromHex('#292f44');

  static Color gray906 = fromHex('#22262e');

  static Color deepOrange400 = fromHex('#ff6d5a');

  static Color black900Bf = fromHex('#bf0c0c0c');

  static Color bluegray5007e = fromHex('#7e727e90');

  static Color gray901 = fromHex('#222529');

  static Color bluegray90011 = fromHex('#11191855');

  static Color indigo50 = fromHex('#e9e9ff');

  static Color gray900 = fromHex('#262626');

  static Color blue600 = fromHex('#107af6');

  static Color lightBlue50 = fromHex('#ceeaff');

  static Color bluegray70021 = fromHex('#21477162');

  static Color gray300 = fromHex('#dcdcdc');

  static Color gray100 = fromHex('#f0f0ff');

  static Color bluegray900 = fromHex('#142846');

  static Color bluegray700 = fromHex('#43526b');

  static Color indigo100 = fromHex('#ccccff');

  static Color bluegray500 = fromHex('#727e90');

  static Color gray9007f = fromHex('#7f131416');

  static Color bluegray300 = fromHex('#a1a9b5');

  static Color bluegray80044 = fromHex('#442b5650');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
