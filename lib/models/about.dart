import 'dart:convert';

import 'package:flutter/foundation.dart';

class About {
  String? name;
  String? description;
  List<String>? images;

  About({
    this.name,
    this.description,
    this.images,
  });

  About copyWith({
    String? name,
    String? description,
    List<String>? images,
  }) {
    return About(
      name: name ?? this.name,
      description: description ?? this.description,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'images': images,
    };
  }

  factory About.fromMap(Map<String, dynamic> map) {
    return About(
      name: map['name'],
      description: map['description'],
      images: List<String>.from(map['images']),
    );
  }

  String toJson() => json.encode(toMap());

  factory About.fromJson(String source) => About.fromMap(json.decode(source));

  @override
  String toString() =>
      'About(name: $name, description: $description, images: $images)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is About &&
        other.name == name &&
        other.description == description &&
        listEquals(other.images, images);
  }

  @override
  int get hashCode => name.hashCode ^ description.hashCode ^ images.hashCode;
}
