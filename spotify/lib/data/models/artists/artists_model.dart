// To parse this JSON data, do
//
//     final artistsModel = artistsModelFromJson(jsonString);

import 'dart:convert';

import 'package:spotify/data/data.dart';

SeveralArtistsModel artistsModelFromJson(String str) =>
    SeveralArtistsModel.fromJson(json.decode(str));

String artistsModelToJson(SeveralArtistsModel data) =>
    json.encode(data.toJson());

class SeveralArtistsModel {
  List<Artist> artists;

  SeveralArtistsModel({
    required this.artists,
  });

  factory SeveralArtistsModel.fromJson(Map<String, dynamic> json) =>
      SeveralArtistsModel(
        artists:
            List<Artist>.from(json["artists"].map((x) => Artist.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "artists": List<dynamic>.from(artists.map((x) => x.toJson())),
      };
}

class Artist {
  ExternalUrls? externalUrls;
  Followers? followers;
  List<String>? genres;
  String? href;
  String? id;
  List<ImageSpotify>? images;
  String? name;
  int? popularity;
  String? type;
  String? uri;

  Artist({
    this.externalUrls,
    this.followers,
    this.genres,
    this.href,
    this.id,
    this.images,
    this.name,
    this.popularity,
    this.type,
    this.uri,
  });

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
        externalUrls: json["external_urls"] != null
            ? ExternalUrls.fromJson(json["external_urls"])
            : null,
        followers: json["followers"] != null
            ? Followers.fromJson(json["followers"])
            : null,
        genres: json["genres"] != null
            ? List<String>.from(json["genres"].map((x) => x))
            : [],
        href: json["href"],
        id: json["id"],
        images: json["images"] != null
            ? List<ImageSpotify>.from(
                json["images"].map((x) => ImageSpotify.fromJson(x)))
            : [],
        name: json["name"],
        popularity: json["popularity"],
        type: json["type"],
        uri: json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "external_urls": externalUrls?.toJson(),
        "followers": followers?.toJson(),
        "genres":
            genres != null ? List<dynamic>.from(genres!.map((x) => x)) : [],
        "href": href,
        "id": id,
        "images": images != null
            ? List<dynamic>.from(images!.map((x) => x.toJson()))
            : [],
        "name": name,
        "popularity": popularity,
        "type": type,
        "uri": uri,
      };
}

class Followers {
  dynamic href;
  int total;

  Followers({
    required this.href,
    required this.total,
  });

  factory Followers.fromJson(Map<String, dynamic> json) => Followers(
        href: json["href"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "total": total,
      };
}
