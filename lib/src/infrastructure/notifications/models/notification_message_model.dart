// To parse this JSON data, do
//
//     final notificationMessageModel = notificationMessageModelFromJson(jsonString);

import 'dart:convert';

NotificationMessageModel notificationMessageModelFromJson(String str) =>
    NotificationMessageModel.fromJson(json.decode(str));

String notificationMessageModelToJson(NotificationMessageModel data) =>
    json.encode(data.toJson());

class NotificationMessageModel {
  NotificationMessageModel({
    this.message,
    this.body,
    this.time,
  });

  String message;
  String body;
  String time;

  NotificationMessageModel copyWith({
    String message,
    String body,
    String time,
  }) =>
      NotificationMessageModel(
        message: message ?? this.message,
        body: body ?? this.body,
        time: time ?? this.time,
      );

  factory NotificationMessageModel.fromJson(Map<String, dynamic> json) =>
      NotificationMessageModel(
        message: json["message"] == null ? null : json["message"],
        body: json["body"] == null ? null : json["body"],
        time: json["time"] == null ? null : json["time"],
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "body": body == null ? null : body,
        "time": time == null ? null : time,
      };
}
