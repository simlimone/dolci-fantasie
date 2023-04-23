import 'dart:convert';

import 'package:flutter/foundation.dart';

class Candy {
  String? id;
  String? name;
  List<String>? images;
  String? description;
  int? categoryNumber;

  Candy({
    this.id,
    this.name,
    this.images,
    this.description,
    this.categoryNumber,
  });

  Candy copyWith({
    String? id,
    String? name,
    List<String>? images,
    String? description,
    int? categoryNumber,
  }) {
    return Candy(
      id: id ?? this.id,
      name: name ?? this.name,
      images: images ?? this.images,
      description: description ?? this.description,
      categoryNumber: categoryNumber ?? this.categoryNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'images': images,
      'description': description,
      'categoryNumber': categoryNumber,
    };
  }

  factory Candy.fromMap(Map<String, dynamic> map) {
    return Candy(
      id: map['id'],
      name: map['name'],
      images: List<String>.from(map['images']),
      description: map['description'],
      categoryNumber: map['categoryNumber']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Candy.fromJson(String source) => Candy.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Candy(id: $id, name: $name, images: $images, description: $description, categoryNumber: $categoryNumber)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Candy &&
        other.id == id &&
        other.name == name &&
        listEquals(other.images, images) &&
        other.description == description &&
        other.categoryNumber == categoryNumber;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        images.hashCode ^
        description.hashCode ^
        categoryNumber.hashCode;
  }
}
