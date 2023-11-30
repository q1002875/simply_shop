import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simply_shop/pages/sign_in.dart/widgets/sign_in_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildThirdPartyLogin(context),
              Center(child: reusableText("Or use yout email account to login")),
              Container(
                margin: EdgeInsets.only(top: 66.h),
                padding: EdgeInsets.only(left: 25.w),
                child: Column(
                  children: [reusableText("Email")],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  Widget buildThirdPartyLogin(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _reusableIcons("google"),
          _reusableIcons("apple"),
          _reusableIcons("facebook")
        ],
      ),
    );
  }

  Widget reusableText(String text) {
    return Container(
      margin: EdgeInsets.only(bottom: 5.h),
      child: Text(
        text,
        style: TextStyle(
            color: Colors.grey.withOpacity(0.5),
            fontWeight: FontWeight.normal,
            fontSize: 14.sp),
      ),
    );
  }

  Widget _reusableIcons(String iconName) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
          width: 40.w,
          height: 40.w,
          child: Image.asset("assets/icons/$iconName.png")),
    );
  }
}
