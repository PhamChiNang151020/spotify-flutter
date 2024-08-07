import 'package:spotify/base_class/bloc/base_state.dart';
import 'package:spotify/data/data.dart';

class SettingLoadSuccess extends BaseBlocState {
  final List<SettingModel> listSetting;
  SettingLoadSuccess({
    required this.listSetting,
  });

  SettingLoadSuccess copyWith({
    List<SettingModel>? listSetting,
  }) {
    return SettingLoadSuccess(
      listSetting: listSetting ?? this.listSetting,
    );
  }
}
