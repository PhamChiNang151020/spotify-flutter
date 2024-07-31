class ImageSpotify {
  int height;
  String url;
  int width;

  ImageSpotify({
    required this.height,
    required this.url,
    required this.width,
  });

  factory ImageSpotify.fromJson(Map<String, dynamic> json) => ImageSpotify(
        height: json["height"],
        url: json["url"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "url": url,
        "width": width,
      };
}
