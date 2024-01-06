import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simply_shop/common/value/colors.dart';
import 'package:simply_shop/pages/home/bloc/home_page_blocs.dart';
import 'package:simply_shop/pages/home/bloc/home_page_states.dart';
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
        body: BlocBuilder<HomePageBlocs, HomePageStates>(
            builder: (context, state) {
          return Container(
              // color: Colors.red,
              margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  homePageText("hello", color: AppColors.primaryText),
                  homePageText("dbestech",
                      color: AppColors.primaryText, top: 5),
                  const SizedBox(
                    height: 20,
                  ),
                  searchView(),
                  slidersView(context, state),
                  menuView()
                ],
              ));
        }));
  }
}
