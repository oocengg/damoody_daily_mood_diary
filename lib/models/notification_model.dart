import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  String? id;
  DateTime createdAt;
  String description;
  String title;
  bool isActive;
  String userId;

  NotificationModel({
    required this.createdAt,
    required this.description,
    required this.title,
    required this.isActive,
    required this.userId,
    this.id,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        createdAt: (json['created_at'] as Timestamp).toDate(),
        description: json["description"],
        title: json["title"],
        isActive: json["is_active"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt,
        "description": description,
        "title": title,
        "is_active": isActive,
        "user_id": userId,
      };

  NotificationModel copyWith({
    DateTime? createdAt,
    String? description,
    String? title,
    bool? isActive,
    String? userId,
    String? id,
  }) =>
      NotificationModel(
        createdAt: createdAt ?? this.createdAt,
        description: description ?? this.description,
        title: title ?? this.title,
        userId: userId ?? this.userId,
        isActive: isActive ?? this.isActive,
        id: id ?? this.id,
      );

  factory NotificationModel.fromDocument(
      DocumentSnapshot<Map<String, dynamic>> doc) {
    return NotificationModel.fromJson(doc.data()!).copyWith(id: doc.id);
  }
}
