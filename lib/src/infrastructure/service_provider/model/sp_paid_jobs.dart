// To parse this JSON data, do
//
//     final spPaidJobs = spPaidJobsFromJson(jsonString);

import 'dart:convert';

SpPaidJobs spPaidJobsFromJson(String str) =>
    SpPaidJobs.fromJson(json.decode(str));

String spPaidJobsToJson(SpPaidJobs data) => json.encode(data.toJson());

class SpPaidJobs {
  SpPaidJobs({
    this.paidJobs,
  });

  List<PaidJob> paidJobs;

  SpPaidJobs copyWith({
    List<PaidJob> paidJobs,
  }) =>
      SpPaidJobs(
        paidJobs: paidJobs ?? this.paidJobs,
      );

  factory SpPaidJobs.fromJson(Map<String, dynamic> json) => SpPaidJobs(
        paidJobs: json["paidJobs"] == null
            ? null
            : List<PaidJob>.from(
                json["paidJobs"].map((x) => PaidJob.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "paidJobs": paidJobs == null
            ? null
            : List<dynamic>.from(paidJobs.map((x) => x.toJson())),
      };
}

class PaidJob {
  PaidJob({
    this.id,
    this.workTitle,
    this.description,
    this.placeDescription,
    this.location,
    this.comments,
    this.bookingDate,
    this.bookingTime,
    this.workDuration,
    this.status,
    this.declineReason,
    this.agreedPrice,
    this.workTodoImages,
    this.workDoneImages,
    this.clientId,
    this.workerId,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String workTitle;
  String description;
  dynamic placeDescription;
  String location;
  dynamic comments;
  DateTime bookingDate;
  String bookingTime;
  dynamic workDuration;
  String status;
  dynamic declineReason;
  dynamic agreedPrice;
  dynamic workTodoImages;
  dynamic workDoneImages;
  String clientId;
  String workerId;
  DateTime createdAt;
  DateTime updatedAt;

  PaidJob copyWith({
    int id,
    String workTitle,
    String description,
    dynamic placeDescription,
    String location,
    dynamic comments,
    DateTime bookingDate,
    String bookingTime,
    dynamic workDuration,
    String status,
    dynamic declineReason,
    dynamic agreedPrice,
    dynamic workTodoImages,
    dynamic workDoneImages,
    String clientId,
    String workerId,
    DateTime createdAt,
    DateTime updatedAt,
  }) =>
      PaidJob(
        id: id ?? this.id,
        workTitle: workTitle ?? this.workTitle,
        description: description ?? this.description,
        placeDescription: placeDescription ?? this.placeDescription,
        location: location ?? this.location,
        comments: comments ?? this.comments,
        bookingDate: bookingDate ?? this.bookingDate,
        bookingTime: bookingTime ?? this.bookingTime,
        workDuration: workDuration ?? this.workDuration,
        status: status ?? this.status,
        declineReason: declineReason ?? this.declineReason,
        agreedPrice: agreedPrice ?? this.agreedPrice,
        workTodoImages: workTodoImages ?? this.workTodoImages,
        workDoneImages: workDoneImages ?? this.workDoneImages,
        clientId: clientId ?? this.clientId,
        workerId: workerId ?? this.workerId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory PaidJob.fromJson(Map<String, dynamic> json) => PaidJob(
        id: json["id"] == null ? null : json["id"],
        workTitle: json["work_title"] == null ? null : json["work_title"],
        description: json["description"] == null ? null : json["description"],
        placeDescription: json["place_description"],
        location: json["location"] == null ? null : json["location"],
        comments: json["comments"],
        bookingDate: json["booking_date"] == null
            ? null
            : DateTime.parse(json["booking_date"]),
        bookingTime: json["booking_time"] == null ? null : json["booking_time"],
        workDuration: json["work_duration"],
        status: json["status"] == null ? null : json["status"],
        declineReason: json["decline_reason"],
        agreedPrice: json["agreed_price"],
        workTodoImages: json["work_todo_images"],
        workDoneImages: json["work_done_images"],
        clientId: json["client_id"] == null ? null : json["client_id"],
        workerId: json["worker_id"] == null ? null : json["worker_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "work_title": workTitle == null ? null : workTitle,
        "description": description == null ? null : description,
        "place_description": placeDescription,
        "location": location == null ? null : location,
        "comments": comments,
        "booking_date": bookingDate == null
            ? null
            : "${bookingDate.year.toString().padLeft(4, '0')}-${bookingDate.month.toString().padLeft(2, '0')}-${bookingDate.day.toString().padLeft(2, '0')}",
        "booking_time": bookingTime == null ? null : bookingTime,
        "work_duration": workDuration,
        "status": status == null ? null : status,
        "decline_reason": declineReason,
        "agreed_price": agreedPrice,
        "work_todo_images": workTodoImages,
        "work_done_images": workDoneImages,
        "client_id": clientId == null ? null : clientId,
        "worker_id": workerId == null ? null : workerId,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}
