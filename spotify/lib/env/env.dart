import 'package:envied/envied.dart';

part 'env.g.dart';

// * Run with terminal:  dart run build_runner build

@Envied(path: '.env')
final class Env {
  @EnviedField(varName: 'CLIENT_ID')
  static const String CLIENT_ID = _Env.CLIENT_ID;
  @EnviedField(varName: 'CLIENT_SECRET')
  static const String CLIENT_SECRET = _Env.CLIENT_SECRET;
}
