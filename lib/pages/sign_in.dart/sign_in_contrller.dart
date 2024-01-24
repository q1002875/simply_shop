import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:simply_shop/common/apis/user_api.dart';
import 'package:simply_shop/common/entities/entities.dart';
import 'package:simply_shop/common/value/constatnt.dart';
import 'package:simply_shop/common/widgets/flutter_toast.dart';
import 'package:simply_shop/global.dart';
import 'package:simply_shop/pages/home/home_controller.dart';
import 'package:simply_shop/pages/sign_in.dart/bloc/sign_in_blocs.dart';

class SignInController {
  //先掛件context
  final BuildContext context;
  const SignInController({required this.context});

  Future<void> asyncPostAllData(LoginRequestEntity loginRequestEntity) async {
    EasyLoading.show(
        indicator: const CircularProgressIndicator(),
        maskType: EasyLoadingMaskType.clear,
        dismissOnTap: true);
    var result = await UserAPI.login(params: loginRequestEntity);

    if (result.code == 200) {
      try {
        Global.storageService.setString(
            AppConstants.STORAGE_USER_PROFILE_KEY, jsonEncode(result.data!));
        Global.storageService.setString(
            AppConstants.STORAGE_USER_TOKEN_KEY, result.data!.access_token!);
        EasyLoading.dismiss();
        if (context.mounted) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/application', (route) => false);
        }
      } catch (e) {
        print('saving local storage error${e.toString()}');
      }
    } else {
      EasyLoading.dismiss();
      toastInfo(msg: "unknow error");
    }
  }

  Future<void> handleSigIn(String type) async {
    //執行sing in bloc
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          toastInfo(msg: 'you need to fill email address');
        } else {
          debugPrint('email address :$emailAddress');
        }
        if (password.isEmpty) {
          toastInfo(msg: 'you need to fill password');
        } else {
          debugPrint('password is :$password');
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {
            debugPrint('user info${credential.user?.uid}');
          } else {
            debugPrint('user != null');
          }
          if (!credential.user!.emailVerified) {
            debugPrint('email not verified');
          } else {
            debugPrint('email not verified');
          }
          var user = credential.user;
          if (user != null) {
            debugPrint('user exist');
            String? displayName = user.displayName;
            String? email = user.email;
            String? id = user.uid;
            String? photoUrl = user.photoURL;

            LoginRequestEntity loginRequestEntity = LoginRequestEntity();
            loginRequestEntity.avatar = photoUrl;
            loginRequestEntity.name = displayName;
            loginRequestEntity.email = email;
            loginRequestEntity.open_id = id;
            loginRequestEntity.type = 1;

            asyncPostAllData(loginRequestEntity);
            if (context.mounted) {
              await HomeController(context: context).init();
            }
            //we got verified user from firebase
          } else {
            debugPrint('no user');
            //we have error getting user from fire
          }
        } on FirebaseAuthException catch (e) {
          // print('$e');
          // toastInfo(msg: '$e');
          if (e.code == 'user-not-found') {
            debugPrint('No user found for that email');
          } else if (e.code == 'wrong-password') {
            debugPrint('wrong password provided for that user');
          } else if (e.code == 'invalid-email') {
            debugPrint('your email format is wrong');
          }
        }
      }
    } catch (e) {}
  }
}
