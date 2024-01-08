import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simply_shop/common/value/colors.dart';
import 'package:simply_shop/common/widgets/bese_test_widget.dart';

AppBar buildSettingAppBar() {
  return AppBar(
    title: Container(
      child: baseReusableText("Settings", color: AppColors.primaryText),
    ),
  );
}

Widget settingsButton(BuildContext context, void Function()? func) {
  return GestureDetector(
    onTap: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Confirm logout"),
              content: const Text("Confirm logout"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Cancel")),
                TextButton(onPressed: func, child: const Text("Confirm")),
              ],
            );
          });
    },
    child: Container(
      height: 100.w,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: AssetImage("assets/icons/Logout.png"))),
    ),
  );
}
