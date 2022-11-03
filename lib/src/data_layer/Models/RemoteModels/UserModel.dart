// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String? userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
    UserModel({
        this.name,
        this.avatar,
        this.id,
        this.email,
        this.password,
        this.description,
        this.location,
        this.descriptionn,
        this.token,
        this.data,
        this.notification,
    });

    String? name;
    String? avatar;
    String? id;
    String? email;
    String? password;
    String? description;
    List<String>? location;
    String? descriptionn;
    String? token;
    Data? data;
    Notification? notification;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"] == null ? null : json["name"],
        avatar: json["avatar"] == null ? "" : json["avatar"],
        id: json["id"] == null ? null : json["id"],
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
        description: json["description"] == null ? "description For the user To be Displayed here " : json["description"],
        location: json["location"] == null ? [] : List<String>.from(json["location"].map((x) => x)),
        descriptionn: json["descriptionn"] == null ? "" : json["descriptionn"],
        token: json["token"] == null ? null : json["token"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        notification: json["notification"] == null ? null : Notification.fromJson(json["notification"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "avatar": avatar == null ? null : avatar,
        "id": id == null ? null : id,
        "email": email == null ? null : email,
        "password": password == null ? null : password,
        "description": description == null ? null : description,
        "location": location == null ? [] : List<dynamic>.from(location!.map((x) => x)),
        "descriptionn": descriptionn == null ? null : descriptionn,
        "token": token == null ? null : token,
        "data": data == null ? null : data!.toJson(),
        "notification": notification == null ? null : notification!.toJson(),
    };
}

class Data {
    Data({
        this.via,
        this.count,
    });

    String? via;
    String? count;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        via: json["via"] == null ? null : json["via"],
        count: json["count"] == null ? null : json["count"],
    );

    Map<String, dynamic> toJson() => {
        "via": via == null ? null : via,
        "count": count == null ? null : count,
    };
}

class Notification {
    Notification({
        this.title,
        this.body,
    });

    String? title;
    String? body;

    factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        title: json["title"] == null ? null : json["title"],
        body: json["body"] == null ? null : json["body"],
    );

    Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "body": body == null ? null : body,
    };
}
