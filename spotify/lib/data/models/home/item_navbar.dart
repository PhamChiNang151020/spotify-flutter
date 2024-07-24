class ItemNavbar {
  String icon;
  String name;

  ItemNavbar({
    required this.icon,
    required this.name,
  });

  ItemNavbar copyWith({
    String? icon,
    String? name,
  }) =>
      ItemNavbar(
        icon: icon ?? this.icon,
        name: name ?? this.name,
      );

  factory ItemNavbar.fromJson(Map<String, dynamic> json) => ItemNavbar(
        icon: json["icon"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "name": name,
      };
}
