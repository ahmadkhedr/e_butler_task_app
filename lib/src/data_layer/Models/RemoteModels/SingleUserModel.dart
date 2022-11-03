// To parse this JSON data, do
//
//     final singleUserModel = singleUserModelFromJson(jsonString);

import 'dart:convert';

SingleUserModel singleUserModelFromJson(String str) =>
    SingleUserModel.fromJson(json.decode(str));

String? singleUserModelToJson(SingleUserModel data) =>
    json.encode(data.toJson());

class SingleUserModel {
  SingleUserModel({
    this.name,
    this.avatar,
    this.id,
  });

  String? name;
  String? avatar;
  String? id;

  factory SingleUserModel.fromJson(Map<String, dynamic> json) =>
      SingleUserModel(
        name: json["name"] == null ? '' : json["name"],
        avatar: json["avatar"] == null ? '' : json["avatar"],
        id: json["id"] == null ? '' : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "avatar": avatar == null ? null : avatar,
        "id": id == null ? null : id,
      };
}
