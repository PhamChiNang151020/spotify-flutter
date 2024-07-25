class ItemNavbar {
  String iconActive;
  String iconInActive;
  String name;

  ItemNavbar({
    required this.iconActive,
    required this.iconInActive,
    required this.name,
  });

  ItemNavbar copyWith({
    String? iconActive,
    String? iconInActive,
    String? name,
  }) =>
      ItemNavbar(
        iconActive: iconActive ?? this.iconActive,
        iconInActive: iconInActive ?? this.iconInActive,
        name: name ?? this.name,
      );

  factory ItemNavbar.fromJson(Map<String, dynamic> json) => ItemNavbar(
        iconActive: json["iconActive"],
        iconInActive: json["iconInActive"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "iconActive": iconActive,
        "iconInActive": iconInActive,
        "name": name,
      };
}
