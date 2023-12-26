import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simply_shop/pages/sign_in.dart/bloc/sign_in_blocs.dart';
import 'package:simply_shop/pages/welcome/bloc/welcome_blocs.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(lazy: false, create: (context) => welcomeBloc()),
        BlocProvider(
          create: (context) => SignInBloc(),
        )
      ];
}
