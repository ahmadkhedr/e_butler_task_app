// ignore_for_file: prefer_if_null_operators

class DbModel {
  String? mail;
  DbModel({this.mail});

  factory DbModel.fromJson(Map<String, dynamic> json) => DbModel(
        mail: json["mail"] == null ? "" : json["mail"],
      );

  Map<String, dynamic> toJson() => {
        "mail": mail == null ? "" : mail,
      };
}
