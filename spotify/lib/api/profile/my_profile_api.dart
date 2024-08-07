import 'package:spotify/api/app_config_url.dart';
import 'package:spotify/base_class/api/base_api.dart';
import 'package:spotify/data/models/new_release_model.dart';
import 'package:spotify/data/models/profile/my_profile_model.dart';

class MyProfileApi extends BaseApi<MyProfileModel> {
  MyProfileApi(super.context);

  @override
  MyProfileModel convertJson(Map<String, dynamic> mapJson) {
    return MyProfileModel.fromJson(mapJson);
  }

  @override
  RequestMethod getRequestMethod() {
    return RequestMethod.GET;
  }

  @override
  String getUrl() {
    return AppConfigUrl.CURRENT_USER;
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
