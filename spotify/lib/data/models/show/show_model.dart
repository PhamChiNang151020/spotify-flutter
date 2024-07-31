import 'dart:convert';

import '../../data.dart';

SeveralShowModel showModelFromJson(String str) =>
    SeveralShowModel.fromJson(json.decode(str));

String showModelToJson(SeveralShowModel data) => jsonEncode(data.toJson());

class SeveralShowModel {
  List<Show> shows;

  SeveralShowModel({
    required this.shows,
  });

  factory SeveralShowModel.fromJson(Map<String, dynamic> json) =>
      SeveralShowModel(
        shows: List<Show>.from(json["shows"].map((x) => Show.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "shows": List<dynamic>.from(shows.map((x) => x.toJson())),
      };
}

class Show {
  String description;
  bool explicit;
  ExternalUrls externalUrls;
  String href;
  String htmlDescription;
  String id;
  List<ImageSpotify> images;
  bool isExternallyHosted;
  List<String> languages;
  String mediaType;
  String name;
  String publisher;
  int totalEpisodes;
  String type;
  String uri;

  Show({
    required this.description,
    required this.explicit,
    required this.externalUrls,
    required this.href,
    required this.htmlDescription,
    required this.id,
    required this.images,
    required this.isExternallyHosted,
    required this.languages,
    required this.mediaType,
    required this.name,
    required this.publisher,
    required this.totalEpisodes,
    required this.type,
    required this.uri,
  });

  factory Show.fromJson(Map<String, dynamic> json) => Show(
        description: json["description"],
        explicit: json["explicit"],
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        htmlDescription: json["html_description"],
        id: json["id"],
        images: List<ImageSpotify>.from(
            json["images"].map((x) => ImageSpotify.fromJson(x))),
        isExternallyHosted: json["is_externally_hosted"],
        languages: List<String>.from(json["languages"].map((x) => x)),
        mediaType: json["media_type"],
        name: json["name"],
        publisher: json["publisher"],
        totalEpisodes: json["total_episodes"],
        type: json["type"],
        uri: json["uri"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "explicit": explicit,
        "external_urls": externalUrls.toJson(),
        "href": href,
        "html_description": htmlDescription,
        "id": id,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "is_externally_hosted": isExternallyHosted,
        "languages": List<dynamic>.from(languages.map((x) => x)),
        "media_type": mediaType,
        "name": name,
        "publisher": publisher,
        "total_episodes": totalEpisodes,
        "type": type,
        "uri": uri,
      };
}
