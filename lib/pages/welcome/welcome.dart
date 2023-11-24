import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget _page(int index, BuildContext context, String buttonName, String title,
    String subTitle, String imagePath) {
  return Column(
    children: [
      SizedBox(
        width: 345.w,
        height: 345.w,
        child: const Text('Image one'),
      ),
      Container(
        child: Text(
          title,
          style: TextStyle(
              color: Colors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.normal),
        ),
      ),
      Container(
        width: 375.w,
        padding: EdgeInsets.only(left: 25.w, right: 30.w),
        child: Text(
          subTitle,
          style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontSize: 14.sp,
              fontWeight: FontWeight.normal),
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
        width: 325.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(
            Radius.circular(15.w),
          ),

          // boxShadow: BoxShadow(
          //     spreadRadius: 1,
          //     blurRadius: 2,
          //     offset: const Offset(0, 1),
          //     color: Colors.grey.withOpacity(0.5))
        ),
        child: Center(
          child: Text(
            buttonName,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
      )
    ],
  );
}

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 34.h),
      child: Scaffold(
        body: SizedBox(
          width: 375.w,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              PageView(
                children: [
                  _page(
                      1,
                      context,
                      "next",
                      "First see Learing",
                      "Forget about a for of paper all knowldget in on learning",
                      "imagePath"),
                  _page(
                      1,
                      context,
                      "next",
                      "Connext With Everyone",
                      "Always keep in touch with your tutor & friend. Let's get connected",
                      "imagePath"),
                  _page(
                      1,
                      context,
                      "get started",
                      "Always fascinated Learning",
                      "Anywhere anytime. The time is at our discrtion",
                      "imagePath"),
                ],
              ),
              Positioned(
                  bottom: 100.h,
                  child: DotsIndicator(
                    dotsCount: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                        color: Colors.grey,
                        activeColor: Colors.blue,
                        size: const Size.square(8.8),
                        activeSize: const Size(10.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
