import 'package:spotify/api/app_config_url.dart';
import 'package:spotify/base_class/api/base_api.dart';
import 'package:spotify/data/models/models.dart';
import 'package:spotify/data/models/new_release_model.dart';
import 'package:spotify/data/models/show/show_model.dart';

class SeveralShowApi extends BaseApi<SeveralShowModel> {
  SeveralShowApi(super.context);

  @override
  SeveralShowModel convertJson(Map<String, dynamic> mapJson) {
    return SeveralShowModel.fromJson(mapJson);
  }

  @override
  RequestMethod getRequestMethod() {
    return RequestMethod.GET;
  }

  @override
  String getUrl() {
    return AppConfigUrl.SHOW;
  }

  @override
  bool isAutoShowMessage() {
    return false;
  }

  @override
  bool isAutoShowMessageError() {
    return false;
  }

  @override
  bool isAutoHandleResponse() {
    return false;
  }
}
