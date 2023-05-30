import 'dart:convert';

MyChatlistModel myChatlistModelFromJson(String str) =>
    MyChatlistModel.fromJson(json.decode(str));

// String myChatlistModelToJson(MyChatlistModel data) =>
//     json.encode(data.toJson());

class MyChatlistModel {
  List<ChatlistModel>? data;

  MyChatlistModel({
    this.data,
  });

  factory MyChatlistModel.fromJson(Map<String, dynamic> json) =>
      MyChatlistModel(
        data: json["data"] == null
            ? []
            : List<ChatlistModel>.from(
                json["data"]!.map((x) => ChatlistModel.fromJson(x))),
      );

  // Map<String, dynamic> toJson() => {
  //       "data": data == null
  //           ? []
  //           : List<dynamic>.from(data!.map((x) => x.toJson())),
  //     };
}

class ChatlistModel {
  int? id;
  int? senderId;
  int? recipientId;
  Sender? sender;
  Recipient? recipient;
  DateTime? updatedAt;

  ChatlistModel({
    this.id,
    this.senderId,
    this.recipientId,
    this.sender,
    this.recipient,
    this.updatedAt,
  });

  factory ChatlistModel.fromJson(Map<String, dynamic> json) {
    return ChatlistModel(
      id: json["id"],
      senderId: json["senderId"],
      recipientId: json["recipientId"],
      sender: (json["sender"] != null) ? Sender.fromJson(json["sender"]) : null,
      recipient: (json["recipient"] != null)
          ? Recipient.fromJson(json["recipient"])
          : null,
      updatedAt:
          json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );
  }
}

class Sender {
  int? id;
  String? name;
  String? email;

  Sender({this.id, this.name, this.email});

  factory Sender.fromJson(Map<String, dynamic> json) {
    return Sender(id: json["id"], name: json["name"], email: json["email"]);
  }
}

class Recipient {
  int? id;
  String? name;
  String? email;

  Recipient({this.id, this.name, this.email});

  factory Recipient.fromJson(Map<String, dynamic> json) {
    return Recipient(id: json["id"], name: json["name"], email: json["email"]);
  }
}
