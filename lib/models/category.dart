import 'dart:convert';

class Category {
  String? name;
  String? image;
  int? categoryNumber;

  Category({
    this.name,
    this.image,
    this.categoryNumber,
  });

  Category copyWith({
    String? name,
    String? image,
    int? categoryNumber,
  }) {
    return Category(
      name: name ?? this.name,
      image: image ?? this.image,
      categoryNumber: categoryNumber ?? this.categoryNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      name: map['name'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source));

  @override
  String toString() =>
      'Category(name: $name, image: $image, categoryNumber: $categoryNumber)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Category &&
        other.name == name &&
        other.image == image &&
        other.categoryNumber == categoryNumber;
  }

  @override
  int get hashCode => name.hashCode ^ image.hashCode ^ categoryNumber.hashCode;
}
