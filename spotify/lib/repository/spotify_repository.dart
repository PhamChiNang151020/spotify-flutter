import 'package:spotify/api/home/new_release_api.dart';
import 'package:spotify/api/home/show/several_show_api.dart';
import 'package:spotify/base_class/api/base_repository.dart';
import 'package:spotify/common/my_path.dart';
import 'package:spotify/data/models/show/show_model.dart';

import 'package:spotify/utils/utils.dart';

import '../api/home/artist_api.dart';
import '../data/data.dart';

class SpotifyRepository extends BaseRepository {
  SpotifyRepository(super.context);

  Future<NewReleaseModel?> getNewRelease() async {
    try {
      return NewReleaseApi(context).execute();
    } catch (e) {
      logger.e(e);
      return null;
    }
  }

  Future<SeveralArtistsModel?> getArtists() async {
    try {
      List<MockModel> artists = await loadMockModel(MyPath.SEVERAL_ARTISTS);
      String pathApi = createIdString(artists);

      return SeveralArtistsApi(context).execute(path: pathApi);
    } catch (e) {
      logger.e(e);
      return null;
    }
  }

  Future<SeveralShowModel?> getSeveralShow() async {
    try {
      List<MockModel> show = await loadMockModel(MyPath.SEVERAL_SHOWS);
      String pathApi = createIdString(show);

      return SeveralShowApi(context).execute(path: pathApi);
    } catch (e) {
      logger.e(e);
      return null;
    }
  }

  String createIdString(List<MockModel> listJson) {
    List<String> ids = listJson.map((val) => val.id).toList();
    return ids.join(',');
  }
}
