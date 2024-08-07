import 'dart:convert';

List<SettingModel> settingModelFromJson(String str) => List<SettingModel>.from(
    jsonDecode(str).map((x) => SettingModel.fromJson(x)));

String settingModelToJson(List<SettingModel> data) =>
    jsonEncode(List<dynamic>.from(data.map((x) => x.toJson())));

class SettingModel {
  String id;
  String name;

  SettingModel({
    required this.id,
    required this.name,
  });

  factory SettingModel.fromJson(Map<String, dynamic> json) => SettingModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
