import '../../base_class/bloc/base_event.dart';

class MainInitScreen extends BaseBlocEvent {
  final int index;
  MainInitScreen({required this.index});
}

class MainSelectScreen extends BaseBlocEvent {
  final int index;
  MainSelectScreen({required this.index});
}
