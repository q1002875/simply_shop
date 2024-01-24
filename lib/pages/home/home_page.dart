import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simply_shop/common/entities/user.dart';
import 'package:simply_shop/common/routes/names.dart';
import 'package:simply_shop/common/value/colors.dart';
import 'package:simply_shop/pages/home/bloc/home_page_blocs.dart';
import 'package:simply_shop/pages/home/bloc/home_page_states.dart';
import 'package:simply_shop/pages/home/home_controller.dart';
import 'package:simply_shop/pages/home/widgets/home_page_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UserItem userProfile;

  @override
  Widget build(BuildContext context) {
    return userProfile != null
        ? Scaffold(
            backgroundColor: Colors.white,
            appBar: homeBuildAppBar(userProfile.avatar.toString()),
            body: BlocBuilder<HomePageBlocs, HomePageStates>(
                builder: (context, state) {
              if (state.courseItem.isEmpty) {
                HomeController(context: context).init();
              }
              return Container(
                  // color: Colors.red,
                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child:
                            homePageText("Hello", color: AppColors.primaryText),
                      ),
                      SliverToBoxAdapter(
                        child: homePageText("${userProfile.name}",
                            color: AppColors.primaryText, top: 5),
                      ),
                      SliverPadding(padding: EdgeInsets.only(top: 20.h)),
                      SliverToBoxAdapter(
                        child: searchView(),
                      ),
                      SliverToBoxAdapter(
                        child: slidersView(context, state),
                      ),
                      SliverToBoxAdapter(child: menuView()),
                      SliverPadding(
                        padding: EdgeInsets.symmetric(
                            vertical: 18.h, horizontal: 0.w),
                        sliver: SliverGrid(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 15,
                                    crossAxisSpacing: 15,
                                    childAspectRatio: 1.6),
                            delegate: SliverChildBuilderDelegate(
                                childCount: state.courseItem.length,
                                (BuildContext context, int index) {
                              return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        AppRoutes.COURSE_DETAIL,
                                        arguments: {
                                          "id": state.courseItem
                                              .elementAt(index)
                                              .id
                                        });
                                  },
                                  child: courseGrid(state.courseItem[index]));
                            })),
                      ),
                    ],
                  ));
            }))
        : Container();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    userProfile = HomeController(context: context).userProfile;
  }

  @override
  void initState() {
    super.initState();
    // _homecontroller = HomeController(context: context);
    // _homecontroller.init();
  }
}
