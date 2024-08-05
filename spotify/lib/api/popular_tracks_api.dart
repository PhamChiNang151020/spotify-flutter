import 'package:spotify/api/app_config_url.dart';
import 'package:spotify/base_class/api/base_api.dart';
import 'package:spotify/data/data.dart';
import 'package:spotify/data/models/new_release_model.dart';

class PopularTracksApi extends BaseApi<PopularTracksModel> {
  PopularTracksApi(super.context);

  @override
  PopularTracksModel convertJson(Map<String, dynamic> mapJson) {
    return PopularTracksModel.fromJson(mapJson);
  }

  @override
  RequestMethod getRequestMethod() {
    return RequestMethod.GET;
  }

  @override
  String getUrl() {
    return AppConfigUrl.POPULAR_TRACKS;
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
