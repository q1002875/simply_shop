import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simply_shop/common/routes/names.dart';
import 'package:simply_shop/common/value/constatnt.dart';
import 'package:simply_shop/global.dart';
import 'package:simply_shop/pages/application/bloc/app.events.dart';
import 'package:simply_shop/pages/application/bloc/app_blocs.dart';
import 'package:simply_shop/pages/profile/settings/bloc/settings_blocs.dart';
import 'package:simply_shop/pages/profile/settings/bloc/settings_states.dart';
import 'package:simply_shop/pages/profile/settings/widgets/setting_widgets.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildSettingAppBar(),
      body: SingleChildScrollView(
          child: BlocBuilder<SettingsBlocs, SettingStates>(
        builder: (context, state) {
          return Container(
            child: Column(
              children: [settingsButton(context, removeUserData)],
            ),
          );
        },
      )),
    );
  }

  void removeUserData() {
    context.read<AppBlocs>().add(const TriggerAppEvent(0));
    Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoutes.SING_IN, (route) => false);
  }
}
