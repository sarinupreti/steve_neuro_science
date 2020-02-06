import 'package:flutter_screenutil/flutter_screenutil.dart';

class UISize {
  static double height(double height) => ScreenUtil().setHeight(height * 2);
  static double width(double width) => ScreenUtil().setWidth(width * 2);
  static double fontSize(double size) => ScreenUtil().setSp(size * 2);

  static double pixel(double pixel) =>
      (pixel * ScreenUtil.screenHeight * ScreenUtil.screenWidth) / 1483776.0;
}
