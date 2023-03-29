import 'dart:convert';

UsersModel usersModelFromJson(String str) =>
    UsersModel.fromJson(json.decode(str));

String usersModelToJson(UsersModel data) => json.encode(data.toJson());

class UsersModel {
  UsersModel({
    this.uid,
    this.fullName,
    this.email,
    this.creationTime,
    this.lastSignInTime,
    this.photoUrl,
    this.chats,
    this.adresse,
    this.phoneNumber,
    this.isApproved
  });

  String? uid;
  String? fullName;
  String? email;
  String? creationTime;
  String? lastSignInTime;
  String? photoUrl;
  List<ChatUser>? chats;
  String? adresse;
  String? phoneNumber;
  bool? isApproved;

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
    uid: json["uid"],
    fullName: json["fullName"],
    email: json["email"],
    creationTime: json["creationTime"],
    lastSignInTime: json["lastSignInTime"],
    photoUrl: json["photoUrl"],
    adresse: json["adresse"],
    phoneNumber: json["phoneNumber"],
    isApproved: json["isApproved"],
  );

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "fullName": fullName,
    "email": email,
    "creationTime": creationTime,
    "lastSignInTime": lastSignInTime,
    "photoUrl": photoUrl,
    "adresse": adresse,
    "phoneNumber": phoneNumber,
    "isApproved": isApproved,
  };
}

class ChatUser {
  ChatUser({
    this.connection,
    this.chatId,
    this.lastTime,
    this.total_unread,
  });

  String? connection;
  String? chatId;
  String? lastTime;
  int? total_unread;

  factory ChatUser.fromJson(Map<String, dynamic> json) => ChatUser(
    connection: json["connection"],
    chatId: json["chat_id"],
    lastTime: json["lastTime"],
    total_unread: json["total_unread"],
  );

  Map<String, dynamic> toJson() => {
    "connection": connection,
    "chat_id": chatId,
    "lastTime": lastTime,
    "total_unread": total_unread,
  };
}
