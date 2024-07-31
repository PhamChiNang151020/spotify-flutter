import 'package:spotify/api/app_config_url.dart';
import 'package:spotify/base_class/api/base_api.dart';
import 'package:spotify/data/models/new_release_model.dart';

class NewReleaseApi extends BaseApi<NewReleaseModel> {
  NewReleaseApi(super.context);

  @override
  NewReleaseModel convertJson(Map<String, dynamic> mapJson) {
    return NewReleaseModel.fromJson(mapJson);
  }

  @override
  RequestMethod getRequestMethod() {
    return RequestMethod.GET;
  }

  @override
  String getUrl() {
    return AppConfigUrl.NEW_RELEASES;
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
