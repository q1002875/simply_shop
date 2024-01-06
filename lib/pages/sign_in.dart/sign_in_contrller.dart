import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simply_shop/common/value/constatnt.dart';
import 'package:simply_shop/common/widgets/flutter_toast.dart';
import 'package:simply_shop/global.dart';
import 'package:simply_shop/pages/sign_in.dart/bloc/sign_in_blocs.dart';

class SignInController {
  //先掛件context
  final BuildContext context;
  const SignInController({required this.context});

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
            // debugPrint('email not verified');
          }
          var user = credential.user;
          if (user != null) {
            debugPrint('user exist');
            Global.storageService
                .setString(AppConstants.STORAGE_USER_TOKEN_KEY, "123456");
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/application', (route) => false);
            //we got verified user from firebase
          } else {
            debugPrint('no user');
            //we have error getting user from fire
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            debugPrint('No user found for that email');
          } else if (e.code == 'worng-password') {
            debugPrint('worng password provided for that user');
          } else if (e.code == 'invalid-email') {
            debugPrint('your email format is worng');
          }
        }
      }
    } catch (e) {}
  }
}
