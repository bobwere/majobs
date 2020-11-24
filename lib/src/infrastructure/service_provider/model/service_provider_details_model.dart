// To parse this JSON data, do
//
//     final serviceProviderDetailModel = serviceProviderDetailModelFromJson(jsonString);

import 'dart:convert';

ServiceProviderDetailModel serviceProviderDetailModelFromJson(String str) =>
    ServiceProviderDetailModel.fromJson(json.decode(str));

String serviceProviderDetailModelToJson(ServiceProviderDetailModel data) =>
    json.encode(data.toJson());

class ServiceProviderDetailModel {
  ServiceProviderDetailModel({
    this.data,
  });

  ServiceProviderDetail data;

  ServiceProviderDetailModel copyWith({
    ServiceProviderDetail data,
  }) =>
      ServiceProviderDetailModel(
        data: data ?? this.data,
      );

  factory ServiceProviderDetailModel.fromJson(Map<String, dynamic> json) =>
      ServiceProviderDetailModel(
        data: json["data"] == null
            ? null
            : ServiceProviderDetail.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? null : data.toJson(),
      };
}

class ServiceProviderDetail {
  ServiceProviderDetail({
    this.type,
    this.workDetails,
    this.id,
    this.name,
    this.username,
    this.msisdn,
    this.bio,
    this.skills,
    this.purpose,
    this.userTypeId,
    this.email,
    this.photo,
    this.images,
    this.location,
    this.city,
    this.clientRating,
    this.workerRating,
    this.verifiedPhone,
    this.verifiedEmail,
    this.accessToken,
    this.createdAt,
    this.updatedAt,
    this.relationships,
  });

  String type;
  List<WorkDetail> workDetails;
  String id;
  dynamic name;
  String username;
  String msisdn;
  String bio;
  String skills;
  dynamic purpose;
  String userTypeId;
  String email;
  String photo;
  String images;
  String location;
  dynamic city;
  String clientRating;
  String workerRating;
  String verifiedPhone;
  String verifiedEmail;
  dynamic accessToken;
  AtedAt createdAt;
  AtedAt updatedAt;
  Relationships relationships;

  ServiceProviderDetail copyWith({
    String type,
    List<WorkDetail> workDetails,
    String id,
    dynamic name,
    String username,
    String msisdn,
    String bio,
    String skills,
    dynamic purpose,
    String userTypeId,
    String email,
    String photo,
    String images,
    String location,
    dynamic city,
    String clientRating,
    String workerRating,
    String verifiedPhone,
    String verifiedEmail,
    dynamic accessToken,
    AtedAt createdAt,
    AtedAt updatedAt,
    Relationships relationships,
  }) =>
      ServiceProviderDetail(
        type: type ?? this.type,
        workDetails: workDetails ?? this.workDetails,
        id: id ?? this.id,
        name: name ?? this.name,
        username: username ?? this.username,
        msisdn: msisdn ?? this.msisdn,
        bio: bio ?? this.bio,
        skills: skills ?? this.skills,
        purpose: purpose ?? this.purpose,
        userTypeId: userTypeId ?? this.userTypeId,
        email: email ?? this.email,
        photo: photo ?? this.photo,
        images: images ?? this.images,
        location: location ?? this.location,
        city: city ?? this.city,
        clientRating: clientRating ?? this.clientRating,
        workerRating: workerRating ?? this.workerRating,
        verifiedPhone: verifiedPhone ?? this.verifiedPhone,
        verifiedEmail: verifiedEmail ?? this.verifiedEmail,
        accessToken: accessToken ?? this.accessToken,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        relationships: relationships ?? this.relationships,
      );

  factory ServiceProviderDetail.fromJson(Map<String, dynamic> json) =>
      ServiceProviderDetail(
        type: json["type"] == null ? null : json["type"],
        workDetails: json["work_details"] == null
            ? null
            : List<WorkDetail>.from(
                json["work_details"].map((x) => WorkDetail.fromJson(x))),
        id: json["id"] == null ? null : json["id"],
        name: json["name"],
        username: json["username"] == null ? null : json["username"],
        msisdn: json["msisdn"] == null ? null : json["msisdn"],
        bio: json["bio"] == null ? null : json["bio"],
        skills: json["skills"] == null ? null : json["skills"],
        purpose: json["purpose"],
        userTypeId: json["user_type_id"] == null ? null : json["user_type_id"],
        email: json["email"] == null ? null : json["email"],
        photo: json["photo"] == null ? null : json["photo"],
        images: json["images"] == null ? null : json["images"],
        location: json["location"] == null ? null : json["location"],
        city: json["city"],
        clientRating:
            json["client_rating"] == null ? null : json["client_rating"],
        workerRating:
            json["worker_rating"] == null ? null : json["worker_rating"],
        verifiedPhone:
            json["verified_phone"] == null ? null : json["verified_phone"],
        verifiedEmail:
            json["verified_email"] == null ? null : json["verified_email"],
        accessToken: json["access_token"],
        createdAt: json["created_at"] == null
            ? null
            : AtedAt.fromJson(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : AtedAt.fromJson(json["updated_at"]),
        relationships: json["relationships"] == null
            ? null
            : Relationships.fromJson(json["relationships"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
        "work_details": workDetails == null
            ? null
            : List<dynamic>.from(workDetails.map((x) => x.toJson())),
        "id": id == null ? null : id,
        "name": name,
        "username": username == null ? null : username,
        "msisdn": msisdn == null ? null : msisdn,
        "bio": bio == null ? null : bio,
        "skills": skills == null ? null : skills,
        "purpose": purpose,
        "user_type_id": userTypeId == null ? null : userTypeId,
        "email": email == null ? null : email,
        "photo": photo == null ? null : photo,
        "images": images == null ? null : images,
        "location": location == null ? null : location,
        "city": city,
        "client_rating": clientRating == null ? null : clientRating,
        "worker_rating": workerRating == null ? null : workerRating,
        "verified_phone": verifiedPhone == null ? null : verifiedPhone,
        "verified_email": verifiedEmail == null ? null : verifiedEmail,
        "access_token": accessToken,
        "created_at": createdAt == null ? null : createdAt.toJson(),
        "updated_at": updatedAt == null ? null : updatedAt.toJson(),
        "relationships": relationships == null ? null : relationships.toJson(),
      };
}

class AtedAt {
  AtedAt({
    this.date,
    this.timezoneType,
    this.timezone,
  });

  DateTime date;
  int timezoneType;
  String timezone;

  AtedAt copyWith({
    DateTime date,
    int timezoneType,
    String timezone,
  }) =>
      AtedAt(
        date: date ?? this.date,
        timezoneType: timezoneType ?? this.timezoneType,
        timezone: timezone ?? this.timezone,
      );

  factory AtedAt.fromJson(Map<String, dynamic> json) => AtedAt(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        timezoneType:
            json["timezone_type"] == null ? null : json["timezone_type"],
        timezone: json["timezone"] == null ? null : json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "date": date == null ? null : date.toIso8601String(),
        "timezone_type": timezoneType == null ? null : timezoneType,
        "timezone": timezone == null ? null : timezone,
      };
}

class Relationships {
  Relationships({
    this.userType,
    this.posts,
    this.gender,
    this.messages,
  });

  Gender userType;
  Gender posts;
  Gender gender;
  Gender messages;

  Relationships copyWith({
    Gender userType,
    Gender posts,
    Gender gender,
    Gender messages,
  }) =>
      Relationships(
        userType: userType ?? this.userType,
        posts: posts ?? this.posts,
        gender: gender ?? this.gender,
        messages: messages ?? this.messages,
      );

  factory Relationships.fromJson(Map<String, dynamic> json) => Relationships(
        userType:
            json["userType"] == null ? null : Gender.fromJson(json["userType"]),
        posts: json["posts"] == null ? null : Gender.fromJson(json["posts"]),
        gender: json["gender"] == null ? null : Gender.fromJson(json["gender"]),
        messages:
            json["messages"] == null ? null : Gender.fromJson(json["messages"]),
      );

  Map<String, dynamic> toJson() => {
        "userType": userType == null ? null : userType.toJson(),
        "posts": posts == null ? null : posts.toJson(),
        "gender": gender == null ? null : gender.toJson(),
        "messages": messages == null ? null : messages.toJson(),
      };
}

class Gender {
  Gender({
    this.data,
  });

  GenderData data;

  Gender copyWith({
    GenderData data,
  }) =>
      Gender(
        data: data ?? this.data,
      );

  factory Gender.fromJson(Map<String, dynamic> json) => Gender(
        data: json["data"] == null ? null : GenderData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? null : data.toJson(),
      };
}

class GenderData {
  GenderData({
    this.type,
    this.attributes,
  });

  String type;
  dynamic attributes;

  GenderData copyWith({
    String type,
    dynamic attributes,
  }) =>
      GenderData(
        type: type ?? this.type,
        attributes: attributes ?? this.attributes,
      );

  factory GenderData.fromJson(Map<String, dynamic> json) => GenderData(
        type: json["type"] == null ? null : json["type"],
        attributes: json["attributes"],
      );

  Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
        "attributes": attributes,
      };
}

class AttributesClass {
  AttributesClass({
    this.id,
    this.name,
    this.active,
  });

  int id;
  String name;
  String active;

  AttributesClass copyWith({
    int id,
    String name,
    String active,
  }) =>
      AttributesClass(
        id: id ?? this.id,
        name: name ?? this.name,
        active: active ?? this.active,
      );

  factory AttributesClass.fromJson(Map<String, dynamic> json) =>
      AttributesClass(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        active: json["active"] == null ? null : json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "active": active == null ? null : active,
      };
}

class WorkDetail {
  WorkDetail({
    this.id,
    this.workTitle,
    this.description,
    this.clientComments,
    this.workerComments,
    this.workTodoImages,
    this.workDoneImages,
    this.rating,
  });

  int id;
  String workTitle;
  String description;
  String clientComments;
  String workerComments;
  dynamic workTodoImages;
  dynamic workDoneImages;
  String rating;

  WorkDetail copyWith({
    int id,
    String workTitle,
    String description,
    String clientComments,
    String workerComments,
    dynamic workTodoImages,
    dynamic workDoneImages,
    String rating,
  }) =>
      WorkDetail(
        id: id ?? this.id,
        workTitle: workTitle ?? this.workTitle,
        description: description ?? this.description,
        clientComments: clientComments ?? this.clientComments,
        workerComments: workerComments ?? this.workerComments,
        workTodoImages: workTodoImages ?? this.workTodoImages,
        workDoneImages: workDoneImages ?? this.workDoneImages,
        rating: rating ?? this.rating,
      );

  factory WorkDetail.fromJson(Map<String, dynamic> json) => WorkDetail(
        id: json["id"] == null ? null : json["id"],
        workTitle: json["work_title"] == null ? null : json["work_title"],
        description: json["description"] == null ? null : json["description"],
        clientComments:
            json["client_comments"] == null ? null : json["client_comments"],
        workerComments:
            json["worker_comments"] == null ? null : json["worker_comments"],
        workTodoImages: json["work_todo_images"],
        workDoneImages: json["work_done_images"],
        rating: json["rating"] == null ? null : json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "work_title": workTitle == null ? null : workTitle,
        "description": description == null ? null : description,
        "client_comments": clientComments == null ? null : clientComments,
        "worker_comments": workerComments == null ? null : workerComments,
        "work_todo_images": workTodoImages,
        "work_done_images": workDoneImages,
        "rating": rating == null ? null : rating,
      };
}
