import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simply_shop/common/value/colors.dart';

Widget baseReusableText(String text,
    {Color color = AppColors.primaryText,
    int fontSize = 16,
    FontWeight fontWight = FontWeight.bold}) {
  return Container(
    child: Text(
      text,
      style:
          TextStyle(color: color, fontWeight: fontWight, fontSize: fontSize.sp),
    ),
  );
}
