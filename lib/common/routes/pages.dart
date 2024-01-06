//unify blocProvider and routes and pages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simply_shop/common/routes/names.dart';
import 'package:simply_shop/global.dart';
import 'package:simply_shop/pages/application/application_page.dart';
import 'package:simply_shop/pages/application/bloc/app_blocs.dart';
import 'package:simply_shop/pages/home/bloc/home_page_blocs.dart';
import 'package:simply_shop/pages/home/home_page.dart';
import 'package:simply_shop/pages/register/bloc/register_blocs.dart';
import 'package:simply_shop/pages/register/register.dart';
import 'package:simply_shop/pages/sign_in.dart/bloc/sign_in_blocs.dart';
import 'package:simply_shop/pages/sign_in.dart/sign_in.dart';
import 'package:simply_shop/pages/welcome/bloc/welcome_blocs.dart';
import 'package:simply_shop/pages/welcome/welcome.dart';

class AppPages {
  //return all providers
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      if (bloc.bloc != null) {
        blocProviders.add(bloc.bloc);
      }
    }
    return blocProviders;
  }

  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      //check for route name macthing when navigator gets triggered
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        // print("valid route anme ${settings.name}");
        //檢查是否第一次進入
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();

        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          bool isLoggedin = Global.storageService.getIsLoggedIn();
          if (isLoggedin) {
            return MaterialPageRoute(
                builder: (_) => const ApplicationPage(), settings: settings);
          }
          return MaterialPageRoute(
              builder: (_) => const SignIn(), settings: settings);
        }

        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    print("invalid route name ${settings.name}");
    return MaterialPageRoute(
        builder: (_) => const SignIn(), settings: settings);
  }

  static List<PageEntity> routes() {
    return [
      PageEntity(
          route: AppRoutes.INITIAL,
          page: const Welcome(),
          bloc: BlocProvider(lazy: false, create: (_) => welcomeBloc())),
      PageEntity(
        route: AppRoutes.SING_IN,
        page: const SignIn(),
        bloc: BlocProvider(
          create: (_) => SignInBloc(),
        ),
      ),
      PageEntity(
          route: AppRoutes.REGISTER,
          page: const Register(),
          bloc: BlocProvider(
            create: (_) => RegisterBlocs(),
          )),
      PageEntity(
          route: AppRoutes.APPLICATION,
          page: const ApplicationPage(),
          bloc: BlocProvider(create: (_) => AppBlocs())),
      PageEntity(
          route: AppRoutes.HOME_PAGE,
          page: const HomePage(),
          bloc: BlocProvider(create: (_) => HomePageBlocs()))
    ];
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;
  //required不可忽視參數
  PageEntity({required this.route, required this.page, this.bloc});
}
