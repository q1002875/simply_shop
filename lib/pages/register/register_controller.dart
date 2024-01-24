import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simply_shop/common/value/constatnt.dart';
import 'package:simply_shop/common/widgets/flutter_toast.dart';
import 'package:simply_shop/pages/register/bloc/register_blocs.dart';

class RegisterController {
  final BuildContext context;
  const RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = (context).read<RegisterBlocs>().state;
    String userNmae = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (userNmae.isEmpty) {
      toastInfo(msg: 'User name can not be empty');
      return;
    }

    if (email.isEmpty) {
      toastInfo(msg: 'email can not be empty');
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: 'password can not be empty');
      return;
    }
    if (rePassword.isEmpty) {
      toastInfo(msg: 'Your password confirmation is wrong');
      return;
    }

    try {
      final crediential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (crediential.user != null) {
        await crediential.user?.sendEmailVerification();
        await crediential.user?.updateDisplayName(userNmae);
        String photoUrl = "${AppConstants.SERVER_API_URL}uploads/default.png";
        await crediential.user?.updatePhotoURL(photoUrl);
        toastInfo(
            msg:
                'An email has been sent to your registered email. To activate it please check your email box and click on the link');
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(msg: 'The password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        toastInfo(msg: 'The email is already in use');
      } else if (e.code == 'weak-password') {
        toastInfo(msg: 'The password provided is too weak');
      }
    }
  }
}
