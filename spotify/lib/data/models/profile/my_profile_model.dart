import 'dart:convert';

import 'package:spotify/data/data.dart';

MyProfileModel myProfileModelFromJson(String str) =>
    MyProfileModel.fromJson(json.decode(str));

String myProfileModelToJson(MyProfileModel data) => json.encode(data.toJson());

class MyProfileModel {
  String displayName;
  ExternalUrls externalUrls;
  String href;
  String id;
  List<ImageSpotify> images;
  String type;
  String uri;
  Followers followers;
  String country;
  String product;
  ExplicitContent explicitContent;
  String email;

  MyProfileModel({
    required this.displayName,
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.images,
    required this.type,
    required this.uri,
    required this.followers,
    required this.country,
    required this.product,
    required this.explicitContent,
    required this.email,
  });

  factory MyProfileModel.fromJson(Map<String, dynamic> json) => MyProfileModel(
        displayName: json["display_name"],
        externalUrls: ExternalUrls.fromJson(json["external_urls"]),
        href: json["href"],
        id: json["id"],
        images: List<ImageSpotify>.from(
            json["images"].map((x) => ImageSpotify.fromJson(x))),
        type: json["type"],
        uri: json["uri"],
        followers: Followers.fromJson(json["followers"]),
        country: json["country"],
        product: json["product"],
        explicitContent: ExplicitContent.fromJson(json["explicit_content"]),
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "display_name": displayName,
        "external_urls": externalUrls.toJson(),
        "href": href,
        "id": id,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "type": type,
        "uri": uri,
        "followers": followers.toJson(),
        "country": country,
        "product": product,
        "explicit_content": explicitContent.toJson(),
        "email": email,
      };
}

class ExplicitContent {
  bool filterEnabled;
  bool filterLocked;

  ExplicitContent({
    required this.filterEnabled,
    required this.filterLocked,
  });

  factory ExplicitContent.fromJson(Map<String, dynamic> json) =>
      ExplicitContent(
        filterEnabled: json["filter_enabled"],
        filterLocked: json["filter_locked"],
      );

  Map<String, dynamic> toJson() => {
        "filter_enabled": filterEnabled,
        "filter_locked": filterLocked,
      };
}
