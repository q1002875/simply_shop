import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simply_shop/common/value/colors.dart';
import 'package:simply_shop/pages/home/bloc/home_page_blocs.dart';
import 'package:simply_shop/pages/home/bloc/home_page_events.dart';
import 'package:simply_shop/pages/home/bloc/home_page_states.dart';

AppBar homeBuildAppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 15.w,
              height: 12.h,
              child: Image.asset("assets/icons/menu.png"),
            ),
            GestureDetector(
              child: Container(
                width: 40.w,
                height: 40.h,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/icons/person.png"))),
              ),
            )
          ]),
    ),
  );
}

Widget homePageText(String text,
    {Color? color = AppColors.primaryText, int top = 20}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style:
          TextStyle(color: color, fontSize: 24.sp, fontWeight: FontWeight.bold),
    ),
  );
}

Widget menuView() {
  return Column(
    children: [
      Container(
        width: 325.w,
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _reusbaleMenuText("Choose your course"),
            _reusbaleMenuText("See all",
                fontSize: 13, color: AppColors.primaryThreeElementText)
          ],
        ),
      )
    ],
  );
}

Widget searchView() {
  return Row(
    children: [
      Container(
        width: 280.w,
        height: 40.h,
        // color: Colors.red,
        decoration: BoxDecoration(
            color: AppColors.primaryBackground,
            borderRadius: BorderRadius.circular(15.h),
            border: Border.all(color: AppColors.primaryFourElementText)),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 17.w),
              width: 16.w,
              height: 16.w,
              child: Image.asset("assets/icons/search.png"),
            ),
            SizedBox(
              width: 240.w,
              height: 50.h,
              child: TextField(
                // onChanged: (value) => func!(value),

                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
                    hintText: "search your course",
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    disabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent))),
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Avenit",
                    fontWeight: FontWeight.normal,
                    fontSize: 16.sp),
                autocorrect: false,
                obscureText: false,
              ),
            )
          ],
        ),
      ),
      GestureDetector(
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.all(Radius.circular(13.w)),
              border: Border.all(color: AppColors.primaryElement)),
          child: Image.asset("assets/icons/options.png"),
        ),
      )
    ],
  );
}

Widget slidersView(BuildContext context, HomePageStates state) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w,
        height: 160.h,
        child: PageView(
          onPageChanged: (value) {
            print(value.toString());
            context.read<HomePageBlocs>().add(HomePageDots(value));
          },
          children: [
            _slidersContainer(),
            _slidersContainer(path: "assets/icons/image_1.png"),
            _slidersContainer(path: "assets/icons/image_2.png"),
          ],
        ),
      ),
      Container(
        child: DotsIndicator(
          dotsCount: 3,
          position: state.index,
          decorator: DotsDecorator(
              color: AppColors.primaryThreeElementText,
              activeColor: AppColors.primaryElement,
              size: const Size.square(5.0),
              activeSize: const Size(17.0, 5.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0))),
        ),
      )
    ],
  );
}

Widget _reusbaleMenuText(String text,
    {Color color = AppColors.primaryText, int fontSize = 16}) {
  return Container(
    child: Text(
      text,
      style: TextStyle(
          color: color, fontWeight: FontWeight.bold, fontSize: fontSize.sp),
    ),
  );
}

Widget _slidersContainer({String path = "assets/icons/art.png"}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.h)),
        image: DecorationImage(fit: BoxFit.fill, image: AssetImage(path))),
  );
}
