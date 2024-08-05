// ignore_for_file: constant_identifier_names

class AppConfigUrl {
  static const HOST = DEV;

  //* HOST_NAME
  static const HOST_NAME = HOST == DEV
      ? "DEV - $VERSION"
      : HOST == QAT
          ? "QAT - $VERSION"
          : HOST == UAT
              ? "UAT - $VERSION"
              : "";

  //* BASE URL
  static const BASE_URL = "$HOST/";
  //* ENV
  static const DEV = 'https://api.spotify.com/v1/';
  static const QAT = 'https://code_base_qat';
  static const UAT = 'https://code_base_uat';
  static const PROD = 'https://code_base_prod';

  // * ===== VERSION =====
  static const VERSION = "0.1.0";

  //? LIST URL API

  // * ===== REGISTER | LOGIN =====
  static const TOKEN = "https://accounts.spotify.com/api/token";

  // * API
  static const CURRENT_USER = "me";
  static const NEW_RELEASES = "browse/new-releases?limit=10&offset=2";
  static const ARTISTS = "artists?ids=";
  static const ARTISTS_DETAIL = "artists/"; // *artists/{id}/albums
  static const SHOW = "shows?ids=";
  static const SHOW_DETAIL = "";
  static const POPULAR_TRACKS = "artists/"; // * {id}/top-tracks
  static const RELATED_ARTISTS = "artists/"; // * {id} from related artists
}
