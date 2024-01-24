import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simply_shop/common/routes/bloc_observer.dart';
import 'package:simply_shop/common/service/storage_service.dart';

///全域初始化
class Global {
  static late StorageService storageService;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = MyGlobalObserver();
    await Firebase.initializeApp();
    storageService = await StorageService().init();
  }
}
