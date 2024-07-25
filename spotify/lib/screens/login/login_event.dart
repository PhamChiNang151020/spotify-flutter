import 'package:spotify/base_class/bloc/base_event.dart';

class LoginEvent extends BaseBlocEvent {
  final String clientID;
  final String clientSecret;
  LoginEvent({
    required this.clientID,
    required this.clientSecret,
  });
}
