import '../../base_class/bloc/base_state.dart';

class GetInfoSuccess extends BaseBlocState {
  final bool isLogged;
  GetInfoSuccess({required this.isLogged});
}
