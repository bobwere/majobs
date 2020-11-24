import 'dart:convert';

Message messageFromJson(String str) => Message.fromJson(json.decode(str));

String messageToJson(Message data) => json.encode(data.toJson());

class Message {
  Message({
    this.id,
    this.sender,
    this.to,
    this.idFrom,
    this.time,
    this.text,
    this.workID,
    this.clientPhone,
    this.workerPhone,
    this.lat,
    this.lng,
    this.spRated,
    this.agreedPrice,
    this.workDuration,
    this.workDurationChanged,
    this.serverMessageType,
    this.serverMessageStatus,
    this.reasonForDeclinedJob,
    this.reasonForClientDeclinedJob,
    this.imageUrl,
    this.showActionButton,
    this.showActionApprovalButton,
    this.bookingText,
    this.bookingDate,
    this.bookingTime,
    this.bookingDescription,
    this.bookingImage,
  });

  String id;
  String sender;
  String spRated;
  double lat;
  double lng;
  String to;
  String idFrom;
  String workDuration;
  String workDurationChanged;
  String time;
  String text;
  String clientPhone;
  String reasonForDeclinedJob;
  String reasonForClientDeclinedJob;
  String workerPhone;
  String agreedPrice;
  String serverMessageType;
  String serverMessageStatus;
  String imageUrl;
  String bookingText;
  String bookingDate;
  String bookingTime;
  String showActionButton;
  String showActionApprovalButton;
  String workID;
  String bookingDescription;
  List<String> bookingImage;

  Message copyWith({
    String id,
    String sender,
    String to,
    double lat,
    double lng,
    String spRated,
    String idFrom,
    String time,
    String text,
    String workID,
    String workDuration,
    String workDurationChanged,
    String clientPhone,
    String workerPhone,
    String reasonForDeclinedJob,
    String reasonForClientDeclinedJob,
    String showActionButton,
    String showActionApprovalButton,
    String agreedPrice,
    String serverMessageType,
    String serverMessageStatus,
    String imageUrl,
    String bookingText,
    String bookingDate,
    String bookingTime,
    String bookingDescription,
    List<String> bookingImage,
  }) =>
      Message(
        id: id ?? this.id,
        to: to ?? this.to,
        lat: lat ?? this.lat,
        lng: lng ?? this.lng,
        spRated: spRated ?? this.spRated,
        idFrom: idFrom ?? this.idFrom,
        workDuration: workDuration ?? this.workDuration,
        workDurationChanged: workDurationChanged ?? this.workDurationChanged,
        clientPhone: clientPhone ?? this.clientPhone,
        workerPhone: workerPhone ?? this.workerPhone,
        reasonForDeclinedJob: reasonForDeclinedJob ?? this.reasonForDeclinedJob,
        reasonForClientDeclinedJob:
            reasonForClientDeclinedJob ?? this.reasonForClientDeclinedJob,
        showActionButton: showActionButton ?? this.showActionButton,
        showActionApprovalButton:
            showActionApprovalButton ?? this.showActionApprovalButton,
        agreedPrice: agreedPrice ?? this.agreedPrice,
        sender: sender ?? this.sender,
        time: time ?? this.time,
        text: text ?? this.text,
        workID: workID ?? this.workID,
        serverMessageType: serverMessageType ?? this.serverMessageType,
        serverMessageStatus: serverMessageStatus ?? this.serverMessageStatus,
        imageUrl: imageUrl ?? this.imageUrl,
        bookingText: bookingText ?? this.bookingText,
        bookingDate: bookingDate ?? this.bookingDate,
        bookingTime: bookingTime ?? this.bookingTime,
        bookingDescription: bookingDescription ?? this.bookingDescription,
        bookingImage: bookingImage ?? this.bookingImage,
      );

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["id"] == null ? null : json["id"],
        to: json["to"] == null ? null : json["to"],
        spRated: json["spRated"] == null ? null : json["spRated"],
        lat: json["lat"] == null ? null : json["lat"],
        lng: json["lng"] == null ? null : json["lng"],
        workDuration:
            json["workDuration"] == null ? null : json["workDuration"],
        workDurationChanged: json["workDurationChanged"] == null
            ? null
            : json["workDurationChanged"],
        showActionButton:
            json["showActionButton"] == null ? null : json["showActionButton"],
        showActionApprovalButton: json["showActionApprovalButton"] == null
            ? null
            : json["showActionApprovalButton"],
        agreedPrice: json["agreedPrice"] == null ? null : json["agreedPrice"],
        reasonForDeclinedJob: json["reasonForDeclinedJob"] == null
            ? null
            : json["reasonForDeclinedJob"],
        reasonForClientDeclinedJob: json["reasonForClientDeclinedJob"] == null
            ? null
            : json["reasonForClientDeclinedJob"],
        clientPhone: json["clientPhone"] == null ? null : json["clientPhone"],
        workerPhone: json["workerPhone"] == null ? null : json["workerPhone"],
        idFrom: json["idFrom"] == null ? null : json["idFrom"],
        sender: json["sender"] == null ? null : json["sender"],
        time: json["time"] == null ? null : json["time"],
        text: json["text"] == null ? null : json["text"],
        workID: json["workID"] == null ? null : json["workID"],
        serverMessageType: json["serverMessageType"] == null
            ? null
            : json["serverMessageType"],
        serverMessageStatus: json["serverMessageStatus"] == null
            ? null
            : json["serverMessageStatus"],
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
        bookingText: json["bookingText"] == null ? null : json["bookingText"],
        bookingDate: json["bookingDate"] == null ? null : json["bookingDate"],
        bookingTime: json["bookingTime"] == null ? null : json["bookingTime"],
        bookingDescription: json["bookingDescription"] == null
            ? null
            : json["bookingDescription"],
        bookingImage: json["bookingImage"] == null
            ? null
            : List<String>.from(json["bookingImage"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "workDuration": workDuration == null ? null : workDuration,
        "workDurationChanged":
            workDurationChanged == null ? null : workDurationChanged,
        "to": to == null ? null : to,
        "spRated": spRated == null ? null : spRated,
        "lat": lat == null ? null : lat,
        "lng": lng == null ? null : lng,
        "reasonForDeclinedJob":
            reasonForDeclinedJob == null ? null : reasonForDeclinedJob,
        "reasonForClientDeclinedJob": reasonForClientDeclinedJob == null
            ? null
            : reasonForClientDeclinedJob,
        "showActionButton": showActionButton == null ? null : showActionButton,
        "showActionApprovalButton":
            showActionApprovalButton == null ? null : showActionApprovalButton,
        "idFrom": idFrom == null ? null : idFrom,
        "clientPhone": clientPhone == null ? null : clientPhone,
        "workerPhone": workerPhone == null ? null : workerPhone,
        "agreedPrice": agreedPrice == null ? null : agreedPrice,
        "sender": sender == null ? null : sender,
        "time": time == null ? null : time,
        "workID": workID == null ? null : workID,
        "text": text == null ? null : text,
        "serverMessageType":
            serverMessageType == null ? null : serverMessageType,
        "serverMessageStatus":
            serverMessageStatus == null ? null : serverMessageStatus,
        "imageUrl": imageUrl == null ? null : imageUrl,
        "bookingText": bookingText == null ? null : bookingText,
        "bookingDate": bookingDate == null ? null : bookingDate,
        "bookingTime": bookingTime == null ? null : bookingTime,
        "bookingDescription":
            bookingDescription == null ? null : bookingDescription,
        "bookingImage": bookingImage == null
            ? null
            : List<dynamic>.from(bookingImage.map((x) => x)),
      };
}
