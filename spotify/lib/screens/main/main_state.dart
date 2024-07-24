import 'package:spotify/base_class/bloc/base_state.dart';

class MainScreenLoadSuccess extends BaseBlocState {
  final int indexPage;
  MainScreenLoadSuccess({
    required this.indexPage,
  });

  MainScreenLoadSuccess copyWith({
    int? indexPage,
  }) {
    return MainScreenLoadSuccess(
      indexPage: indexPage ?? this.indexPage,
    );
  }
}
