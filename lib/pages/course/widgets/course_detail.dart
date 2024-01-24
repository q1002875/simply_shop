import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simply_shop/common/value/colors.dart';
import 'package:simply_shop/common/widgets/bese_test_widget.dart';
import 'package:simply_shop/pages/sign_in.dart/widgets/sign_in_widget.dart';

var imagesInfo = <String, String>{
  "36 Hours Video": "video_detail.png",
  "Total 30 Lessons": "file_detail.png",
  "7 Downloadable Resources": "download_detail.png",
  // "Love": "heart(1).png",
  // "Reminders": "cube.png"
};

AppBar courseBuildAppBar() {
  return AppBar(
    title: reusableText('Course detail'),
  );
}

Widget courseBuildListView(BuildContext context) {
  return Column(
    children: [
      ...List.generate(
          imagesInfo.length,
          (index) => GestureDetector(
                onTap: () {
                  // Navigator.of(context).pushNamed(AppRoutes.SETTINGS);
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 15.h),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(7.0),
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.w),
                            color: AppColors.primaryElement),
                        child: Image.asset(
                            "assets/icons/${imagesInfo.values.elementAt(index)}"),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Text(
                        imagesInfo.keys.elementAt(index),
                        style: TextStyle(
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp),
                      ),
                    ],
                  ),
                ),
              ))
    ],
  );
}

Widget courseLessonList() {
  return Container(
    width: 325.w,
    height: 80.h,
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
    decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(10.w),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 1))
        ]),
    child: InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 60.w,
                height: 60.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.h),
                    image: const DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/icons/image_1.png'))),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListContainer(),
                  ListContainer(
                      color: AppColors.primaryThreeElementText, fontSize: 10)
                ],
              ),
            ],
          ),
          Container(
            child: Image(
                height: 24.h,
                width: 24.h,
                image: const AssetImage('assets/icons/arrow_right.png')),
          )
        ],
      ),
    ),
  );
}

Widget courseSummary() {
  return baseReusableText("The Course Includes", fontSize: 14);
}

Widget descriptionText() {
  return baseReusableText(
      'Course Description Course Description Course DescriptionCourse DescriptionCourse DescriptionCourse DescriptionCourse DescriptionCourse Description',
      color: AppColors.primaryThreeElementText,
      fontWight: FontWeight.normal,
      fontSize: 11);
}

Widget goBuyButton(String name) {
  return Container(
    padding: EdgeInsets.only(top: 12.h),
    decoration: BoxDecoration(
        color: AppColors.primaryElement,
        borderRadius: BorderRadius.circular(10.w),
        border: Border.all(color: AppColors.primaryElement)),
    width: 330.w,
    height: 50.h,
    child: Text(
      name,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: AppColors.primaryThreeElementText,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold),
    ),
  );
}

Widget ListContainer(
    {double fontSize = 13, Color color = AppColors.primaryText}) {
  return Container(
      width: 200.w,
      margin: EdgeInsets.only(left: 6.w),
      child: Text(
        "UI Design",
        overflow: TextOverflow.clip,
        maxLines: 1,
        style: TextStyle(
            color: color, fontSize: fontSize.sp, fontWeight: FontWeight.bold),
      ));
}

Widget menuView() {
  return Container(
    width: 325.w,
    color: Colors.white,
    child: Row(children: [
      GestureDetector(
        onTap: () {
          print('tap');
        },
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.circular(7.w),
                border: Border.all(color: AppColors.primaryElement)),
            child: baseReusableText('Author Page',
                color: AppColors.primaryElementText,
                fontSize: 10,
                fontWight: FontWeight.normal)),
      ),
      _iconAndNum("assets/icons/people.png", 0),
      _iconAndNum("assets/icons/star.png", 0)
    ]),
  );
}

Widget thumbNail() {
  return Container(
    width: 325.w,
    height: 200.h,
    decoration: const BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: AssetImage('assets/icons/image_1.png'))),
  );
}

Widget _iconAndNum(String iconPath, int num) {
  return Container(
    margin: EdgeInsets.only(left: 30.w),
    child: Row(
      children: [
        Image(
          image: AssetImage(iconPath),
          width: 20.w,
          height: 20.h,
        ),
        baseReusableText(num.toString(),
            color: AppColors.primaryThreeElementText,
            fontSize: 11,
            fontWight: FontWeight.normal)
      ],
    ),
  );
}
