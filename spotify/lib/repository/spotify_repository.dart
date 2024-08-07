import 'dart:async';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:spotify/api/artists/artists_detail_api.dart';
import 'package:spotify/api/artists/related_artists_api.dart';
import 'package:spotify/api/home/new_release_api.dart';
import 'package:spotify/api/home/show/several_show_api.dart';
import 'package:spotify/api/popular_tracks_api.dart';
import 'package:spotify/base_class/api/base_repository.dart';
import 'package:spotify/common/my_path.dart';
import 'package:spotify/data/models/profile/my_profile_model.dart';

import 'package:spotify/utils/utils.dart';

import '../api/artists/artist_api.dart';
import '../api/profile/my_profile_api.dart';
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

  Future<ArtistsDetailModel?> getArtistsDetail(String id) async {
    try {
      String pathApi = "$id/albums";
      return ArtistsDetailApi(context).execute(path: pathApi);
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

  Future<PopularTracksModel?> getPopularTracks(String id) async {
    try {
      // List<MockModel> tracks = await loadMockModel(MyPath.POPULAR_TRACKS);
      String pathApi = "$id/top-tracks";

      return PopularTracksApi(context).execute(path: pathApi);
    } catch (e) {
      logger.e(e);
      return null;
    }
  }

  Future<SeveralArtistsModel?> getRelatedArtists(String id) async {
    try {
      String pathApi = "$id/related-artists";
      return RelatedArtistsApi(context).execute(path: pathApi);
    } catch (e) {
      logger.e(e);
      return null;
    }
  }

  Future<List<SettingModel>> getSetting() async {
    String jsonString = await rootBundle.loadString(MyPath.SETTING);
    List<SettingModel> settings = settingModelFromJson(jsonString);
    return settings;
  }

  Future<MyProfileModel?> getCurrentProfile() async {
    try {
      return MyProfileApi(context).execute();
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
