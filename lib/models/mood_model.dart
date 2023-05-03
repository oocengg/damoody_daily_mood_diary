import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:damodi_daily_mood_diary/utils/state/mood_state.dart';

class MoodModel {
  String? id;
  final MoodState mood;
  final String moodLabel;
  final String title;
  final String description;
  final String imageUrl;
  final String userId;
  final DateTime createdAt;

  MoodModel({
    required this.mood,
    required this.moodLabel,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.userId,
    required this.createdAt,
  });

  factory MoodModel.fromJson(Map<String, dynamic> json) {
    return MoodModel(
      mood: MoodState.values.firstWhere(
          (element) => element.name.toString() == json['mood'].toString()),
      moodLabel: json['label'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['image_url'],
      userId: json['user_id'],
      createdAt: (json['created_at'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mood': mood,
      'label': moodLabel,
      'title': title,
      'description': description,
      'image_url': imageUrl,
      'user_id': userId,
      'created_at': createdAt,
    };
  }

  MoodModel copyWith({
    MoodState? mood,
    String? moodLabel,
    DateTime? createdAt,
    String? title,
    String? description,
    String? imageUrl,
    String? userId,
    String? id,
  }) {
    return MoodModel(
      mood: mood ?? this.mood,
      moodLabel: moodLabel ?? this.moodLabel,
      createdAt: createdAt ?? this.createdAt,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      userId: userId ?? this.userId,
    );
  }

  factory MoodModel.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    return MoodModel.fromJson(doc.data()!).copyWith(id: doc.id);
  }
}
