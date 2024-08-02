import 'package:spotify/api/app_config_url.dart';
import 'package:spotify/base_class/api/base_api.dart';
import 'package:spotify/data/models/artists/artists_detail_model.dart';
import 'package:spotify/data/models/models.dart';
import 'package:spotify/data/models/new_release_model.dart';

class ArtistsDetailApi extends BaseApi<ArtistsDetailModel> {
  ArtistsDetailApi(super.context);

  @override
  ArtistsDetailModel convertJson(Map<String, dynamic> mapJson) {
    return ArtistsDetailModel.fromJson(mapJson);
  }

  @override
  RequestMethod getRequestMethod() {
    return RequestMethod.GET;
  }

  @override
  String getUrl() {
    return AppConfigUrl.ARTISTS_DETAIL;
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
