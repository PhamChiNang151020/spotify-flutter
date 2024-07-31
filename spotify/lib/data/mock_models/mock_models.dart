import 'dart:convert';

import 'package:spotify/utils/utils.dart';

class MockModel {
  String id;
  String name;

  MockModel({
    required this.id,
    required this.name,
  });

  MockModel copyWith({
    String? id,
    String? name,
  }) =>
      MockModel(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory MockModel.fromJson(Map<String, dynamic> json) => MockModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

Future<List<MockModel>> loadMockModel(String pathJson) async {
  var jsonList = await loadJson(pathJson);
  if (jsonList is List) {
    return jsonList.map((json) => MockModel.fromJson(json)).toList();
  } else {
    throw Exception('JSON data is not a list');
  }
}
