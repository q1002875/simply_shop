import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simply_shop/common/value/colors.dart';
import 'package:simply_shop/pages/welcome/bloc/welcome.states.dart';
import 'package:simply_shop/pages/welcome/bloc/welcome_blocs.dart';
import 'package:simply_shop/pages/welcome/bloc/welcome_events.dart';

/////jeffxu
class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pagecontroller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(body: BlocBuilder<welcomeBloc, WelcomeState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(top: 34.h),
            width: 375.w,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  controller: pagecontroller,
                  onPageChanged: (index) {
                    state.page = index;
                    BlocProvider.of<welcomeBloc>(context).add(WelcomeEvent());
                    print("index value is $index");
                  },
                  children: [
                    _page(
                        0,
                        context,
                        "next",
                        "First see Learing",
                        "Forget about a for of paper all knowldget in on learning",
                        "assets/images/reading.png"),
                    _page(
                        1,
                        context,
                        "next",
                        "Connext With Everyone",
                        "Always keep in touch with your tutor & friend. Let's get connected",
                        "assets/images/boy.png"),
                    _page(
                        2,
                        context,
                        "get started",
                        "Always fascinated Learning",
                        "Anywhere anytime. The time is at our discrtion",
                        "assets/images/man.png"),
                  ],
                ),
                Positioned(
                    bottom: 130.w,
                    child: DotsIndicator(
                      position: state.page,
                      dotsCount: 3,
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(
                          color: Colors.grey,
                          activeColor: AppColors.primaryElement,
                          size: const Size.square(8.0),
                          activeSize: const Size(14.8, 8.8),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ))
              ],
            ),
          );
        },
      )),
    );
  }

  Widget _page(int index, BuildContext context, String buttonName, String title,
      String subTitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
          width: 330.w,
          height: 330.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          child: Text(
            title,
            style: TextStyle(
                color: AppColors.primaryText,
                fontSize: 24.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            subTitle,
            style: TextStyle(
                color: AppColors.primarySecondaryElementText,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        GestureDetector(
          onTap: () {
            pagecontroller.animateToPage(index + 1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn);
            debugPrint(" here$index");
            if (index == 2) {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("signIn", (route) => false);
            }

            // if (index < 3) {
            // } else {
            //   Navigator.of(context)
            //       .pushNamedAndRemoveUntil("signIn", (route) => false);
            // }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
            width: 370.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.all(
                Radius.circular(15.w),
              ),
              // boxShadow: BoxShadow(eeeeeerereg
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
                    fontSize: 20.sp,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
        )
      ],
    );
  }
}
