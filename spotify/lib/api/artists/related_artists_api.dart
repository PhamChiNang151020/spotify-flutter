import 'package:spotify/api/app_config_url.dart';
import 'package:spotify/base_class/api/base_api.dart';
import 'package:spotify/data/models/models.dart';
import 'package:spotify/data/models/new_release_model.dart';

class RelatedArtistsApi extends BaseApi<SeveralArtistsModel> {
  RelatedArtistsApi(super.context);

  @override
  SeveralArtistsModel convertJson(Map<String, dynamic> mapJson) {
    return SeveralArtistsModel.fromJson(mapJson);
  }

  @override
  RequestMethod getRequestMethod() {
    return RequestMethod.GET;
  }

  @override
  String getUrl() {
    return AppConfigUrl.RELATED_ARTISTS;
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
