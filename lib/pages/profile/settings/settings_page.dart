import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simply_shop/pages/profile/settings/bloc/settings_blocs.dart';
import 'package:simply_shop/pages/profile/settings/bloc/settings_states.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: BlocBuilder<SettingsBlocs, SettingStates>(
        builder: (context, state) {
          return Container(
            child: const Column(
              children: [Text("hellow there")],
            ),
          );
        },
      )),
    );
  }
}
