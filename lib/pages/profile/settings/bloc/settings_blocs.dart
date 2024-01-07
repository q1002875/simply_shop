import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simply_shop/pages/profile/settings/bloc/settings_events.dart';
import 'package:simply_shop/pages/profile/settings/bloc/settings_states.dart';

class SettingsBlocs extends Bloc<SettingEvents, SettingStates> {
  SettingsBlocs() : super(SettingStates()) {
    on<TriggerSettings>(_triggerSettings);
  }
  _triggerSettings(SettingEvents event, Emitter<SettingStates> emit) {
    emit(SettingStates());
  }
}
