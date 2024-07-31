import 'dart:convert';

import '../data.dart';

NewReleaseModel newReleaseModelFromJson(String str) =>
    NewReleaseModel.fromJson(json.decode(str));

String newReleaseModelToJson(NewReleaseModel data) =>
    json.encode(data.toJson());

class NewReleaseModel {
  Albums albums;

  NewReleaseModel({
    required this.albums,
  });

  factory NewReleaseModel.fromJson(Map<String, dynamic> json) =>
      NewReleaseModel(
        albums: Albums.fromJson(json["albums"]),
      );

  Map<String, dynamic> toJson() => {
        "albums": albums.toJson(),
      };
}

class Albums {
  String href;
  List<ItemSpotify> items;
  int limit;
  String next;
  int offset;
  String previous;
  int total;

  Albums({
    required this.href,
    required this.items,
    required this.limit,
    required this.next,
    required this.offset,
    required this.previous,
    required this.total,
  });

  factory Albums.fromJson(Map<String, dynamic> json) => Albums(
        href: json["href"],
        items: List<ItemSpotify>.from(
            json["items"].map((x) => ItemSpotify.fromJson(x))),
        limit: json["limit"],
        next: json["next"],
        offset: json["offset"],
        previous: json["previous"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "limit": limit,
        "next": next,
        "offset": offset,
        "previous": previous,
        "total": total,
      };
}

class ItemSpotify {
  String albumType;
  List<ArtistAlbums> artists;
  List<dynamic> availableMarkets;
  ExternalUrls externalUrls;
  String href;
  String id;
  List<ImageSpotify> images;
  String name;
  DateTime releaseDate;
  String releaseDatePrecision;
  int totalTracks;
  String type;
  String uri;

  ItemSpotify({
    required this.albumType,
    required this.artists,
    required this.availableMarkets,
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.images,
    required this.name,
    required this.releaseDate,
    required this.releaseDatePrecision,
    required this.totalTracks,
    required this.type,
    required this.uri,
  });

  factory ItemSpotify.fromJson(Map<String, dynamic> json) => ItemSpotify(
        albumType: json["album_type"],
        artists: List<ArtistAlbums>.from(
            json["artists"].map((x) => ArtistAlbums.fromJson(x))),
        availableMarkets:
            List<dynamic>.from(json["available_markets"].map((x) => x)),
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        images: List<ImageSpotify>.from(
            json["images"].map((x) => ImageSpotify.fromJson(x))),
        name: json["name"],
        releaseDate: DateTime.parse(json["release_date"]),
        releaseDatePrecision: json["release_date_precision"],
        totalTracks: json["total_tracks"],
        type: json["type"],
        uri: json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "album_type": albumType,
        "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
        "available_markets": List<dynamic>.from(availableMarkets.map((x) => x)),
        "external_urls": externalUrls.toJson(),
        "href": href,
        "id": id,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "name": name,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "release_date_precision": releaseDatePrecision,
        "total_tracks": totalTracks,
        "type": type,
        "uri": uri,
      };
}

class ArtistAlbums {
  ExternalUrls externalUrls;
  String href;
  String id;
  String name;
  Type type;
  String uri;

  ArtistAlbums({
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.name,
    required this.type,
    required this.uri,
  });

  factory ArtistAlbums.fromJson(Map<String, dynamic> json) => ArtistAlbums(
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        name: json["name"],
        type: typeValues.map[json["type"]]!,
        uri: json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "external_urls": externalUrls.toJson(),
        "href": href,
        "id": id,
        "name": name,
        "type": typeValues.reverse[type],
        "uri": uri,
      };
}

enum Type { ARTIST }

final typeValues = EnumValues({"artist": Type.ARTIST});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
