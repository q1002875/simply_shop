import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simply_shop/pages/sign_in.dart/bloc/sign_in_blocs.dart';
import 'package:simply_shop/pages/sign_in.dart/bloc/sign_in_events.dart';
import 'package:simply_shop/pages/sign_in.dart/bloc/sign_in_status.dart';
import 'package:simply_shop/pages/sign_in.dart/sign_in_contrller.dart';
import 'package:simply_shop/pages/sign_in.dart/widgets/sign_in_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
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
                Center(
                    child: reusableText("Or use yout email account to login")),
                Container(
                  margin: EdgeInsets.only(top: 40.h),
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText("Email"),
                      SizedBox(
                        height: 5.h,
                      ),
                      buildTextField(
                          "Enter your email address", "email", "user", (value) {
                        (context).read<SignInBloc>().add(EmailEvent(value));
                      }),
                      reusableText("Password"),
                      SizedBox(
                        height: 5.h,
                      ),
                      buildTextField("Enter your Password", "password", "lock",
                          (value) {
                        (context).read<SignInBloc>().add(PasswordEvent(value));
                      })
                    ],
                  ),
                ),
                forgotPassword(),
                buildLogInAdnRegButtom("Login", "login", () {
                  debugPrint('login button');
                  SignInController(context: context).handleSigIn('email');
                }),
                buildLogInAdnRegButtom("Register", "register", () {
                  debugPrint('Register button');
                  // SignInController(context: context).handleSigIn('register');
                })
              ],
            ),
          ),
        )),
      );
    });
  }
}
