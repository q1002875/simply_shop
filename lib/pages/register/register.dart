import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simply_shop/pages/register/bloc/register_blocs.dart';
import 'package:simply_shop/pages/register/bloc/register_events.dart';
import 'package:simply_shop/pages/register/bloc/register_states.dart';
import 'package:simply_shop/pages/register/register_controller.dart';
import 'package:simply_shop/pages/sign_in.dart/widgets/sign_in_widget.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBlocs, RegisterStates>(
        builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
            child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar('Sign up'),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // buildThirdPartyLogin(context),
                Center(
                    child: reusableText(
                        "Enter your details below and free sign up")),
                Container(
                  margin: EdgeInsets.only(top: 60.h),
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText("User name"),
                      buildTextField("Enter your  name", "name", "user",
                          (value) {
                        (context)
                            .read<RegisterBlocs>()
                            .add(UserNameEvent(value));
                      }),
                      reusableText("Email"),
                      buildTextField(
                          "Enter your email address", "email", "user", (value) {
                        (context).read<RegisterBlocs>().add(EmailEvent(value));
                      }),
                      reusableText("Password"),
                      buildTextField("Enter your Password", "password", "lock",
                          (value) {
                        (context)
                            .read<RegisterBlocs>()
                            .add(PasswordEvent(value));
                      }),
                      reusableText("Re-enter password"),
                      buildTextField(
                          "Re-Enter your password", "password", "lock",
                          (value) {
                        (context)
                            .read<RegisterBlocs>()
                            .add(RePasswordEvent(value));
                      }),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25.w),
                  child:
                      reusableText("Enter your details below and free sign up"),
                ),
                buildLogInAdnRegButtom("Sign up", "login", () {
                  debugPrint('Register button');
                  RegisterController(context: context).handleEmailRegister();
                })
              ],
            ),
          ),
        )),
      );
    });
  }
}
