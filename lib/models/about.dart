import 'dart:convert';

import 'package:flutter/foundation.dart';

class About {
  String? title;
  String? description;
  List<String>? images;

  About({
    this.title,
    this.description,
    this.images,
  });

  About copyWith({
    String? title,
    String? description,
    List<String>? images,
  }) {
    return About(
      title: title ?? this.title,
      description: description ?? this.description,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'images': images,
    };
  }

  factory About.fromMap(Map<String, dynamic> map) {
    return About(
      title: map['title'],
      description: map['description'],
      images: List<String>.from(map['images']),
    );
  }

  String toJson() => json.encode(toMap());

  factory About.fromJson(String source) => About.fromMap(json.decode(source));

  @override
  String toString() =>
      'About(title: $title, description: $description, images: $images)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is About &&
        other.title == title &&
        other.description == description &&
        listEquals(other.images, images);
  }

  @override
  int get hashCode => title.hashCode ^ description.hashCode ^ images.hashCode;
}
