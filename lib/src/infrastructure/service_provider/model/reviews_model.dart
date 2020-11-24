// To parse this JSON data, do
//
//     final reviewModel = reviewModelFromJson(jsonString);

import 'dart:convert';

ReviewModel reviewModelFromJson(String str) =>
    ReviewModel.fromJson(json.decode(str));

String reviewModelToJson(ReviewModel data) => json.encode(data.toJson());

class ReviewModel {
  ReviewModel({
    this.reviews,
  });

  List<Review> reviews;

  ReviewModel copyWith({
    List<Review> reviews,
  }) =>
      ReviewModel(
        reviews: reviews ?? this.reviews,
      );

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        reviews: json["reviews"] == null
            ? null
            : List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "reviews": reviews == null
            ? null
            : List<dynamic>.from(reviews.map((x) => x.toJson())),
      };
}

class Review {
  Review({
    this.id,
    this.workTitle,
    this.description,
    this.clientcomments,
    this.workercomments,
    this.workTodoImages,
    this.workDoneImages,
    this.clientrating,
    this.workerrating,
    this.username,
  });

  int id;
  String workTitle;
  String description;

  String clientcomments;
  String workercomments;
  dynamic workTodoImages;
  dynamic workDoneImages;
  String clientrating;
  String workerrating;
  String username;

  Review copyWith({
    int id,
    String workTitle,
    String description,
    String clientcomments,
    String workercomments,
    dynamic workTodoImages,
    dynamic workDoneImages,
    String clientrating,
    String workerrating,
    String username,
  }) =>
      Review(
        id: id ?? this.id,
        workTitle: workTitle ?? this.workTitle,
        description: description ?? this.description,
        clientcomments: clientcomments ?? this.clientcomments,
        workercomments: workercomments ?? this.workercomments,
        workTodoImages: workTodoImages ?? this.workTodoImages,
        workDoneImages: workDoneImages ?? this.workDoneImages,
        clientrating: clientrating ?? this.clientrating,
        workerrating: workerrating ?? this.workerrating,
        username: username ?? this.username,
      );

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"] == null ? null : json["id"],
        workTitle: json["work_title"] == null ? null : json["work_title"],
        description: json["description"] == null ? null : json["description"],
        clientcomments:
            json["client_comments"] == null ? null : json["client_comments"],
        workercomments:
            json["worker_comments"] == null ? null : json["worker_comments"],
        workTodoImages: json["work_todo_images"],
        workDoneImages: json["work_done_images"],
        clientrating:
            json["client_rating"] == null ? null : json["client_rating"],
        workerrating:
            json["worker_rating"] == null ? null : json["worker_rating"],
        username: json["username"] == null ? null : json["username"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "work_title": workTitle == null ? null : workTitle,
        "description": description == null ? null : description,
        "client_comments": clientcomments == null ? null : clientcomments,
        "worker_comments": workercomments == null ? null : workercomments,
        "work_todo_images": workTodoImages,
        "work_done_images": workDoneImages,
        "client_rating": clientrating == null ? null : clientrating,
        "worker_rating": workerrating == null ? null : workerrating,
        "username": username == null ? null : username,
      };
}
