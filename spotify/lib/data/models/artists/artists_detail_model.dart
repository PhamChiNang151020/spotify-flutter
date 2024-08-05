import 'dart:convert';

import 'package:spotify/data/data.dart';

ArtistsDetailModel artistsDetailModelFromJson(String str) =>
    ArtistsDetailModel.fromJson(json.decode(str));

String artistsDetailModelToJson(ArtistsDetailModel data) =>
    json.encode(data.toJson());

class ArtistsDetailModel {
  String href;
  int limit;
  int total;
  List<ArtistsAlbums> items;

  ArtistsDetailModel({
    required this.href,
    required this.limit,
    required this.total,
    required this.items,
  });

  factory ArtistsDetailModel.fromJson(Map<String, dynamic> json) =>
      ArtistsDetailModel(
        href: json["href"],
        limit: json["limit"],
        total: json["total"],
        items: List<ArtistsAlbums>.from(
            json["items"].map((x) => ArtistsAlbums.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "limit": limit,
        "total": total,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class ArtistsAlbums {
  String albumType;
  int totalTracks;
  ExternalUrls externalUrls;
  String href;
  String id;
  List<ImageSpotify> images;
  String name;
  String releaseDate;
  String releaseDatePrecision;
  String type;
  String uri;
  List<Artist> artists;
  String albumGroup;

  ArtistsAlbums({
    required this.albumType,
    required this.totalTracks,
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.images,
    required this.name,
    required this.releaseDate,
    required this.releaseDatePrecision,
    required this.type,
    required this.uri,
    required this.artists,
    required this.albumGroup,
  });

  factory ArtistsAlbums.fromJson(Map<String, dynamic> json) => ArtistsAlbums(
        albumType: json["album_type"],
        totalTracks: json["total_tracks"],
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        images: List<ImageSpotify>.from(
            json["images"].map((x) => ImageSpotify.fromJson(x))),
        name: json["name"],
        releaseDate: json["release_date"],
        releaseDatePrecision: json["release_date_precision"],
        type: json["type"],
        uri: json["uri"],
        artists:
            List<Artist>.from(json["artists"].map((x) => Artist.fromJson(x))),
        albumGroup: json["album_group"],
      );

  Map<String, dynamic> toJson() => {
        "album_type": albumType,
        "total_tracks": totalTracks,
        "external_urls": externalUrls.toJson(),
        "href": href,
        "id": id,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "name": name,
        "release_date": releaseDate,
        "release_date_precision": releaseDatePrecision,
        "type": type,
        "uri": uri,
        "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
        "album_group": albumGroup,
      };
}
