import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simply_shop/common/value/colors.dart';
import 'package:simply_shop/pages/home/widgets/home_page_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: homeBuildAppBar(),
      body: Container(
          // color: Colors.red,
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 25.h),
                child: Text(
                  "Hellow",
                  style: TextStyle(
                      color: AppColors.primaryText,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5.h),
                child: Text(
                  "dbestech",
                  style: TextStyle(
                      color: AppColors.primaryText,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          )),
    );
  }
}
