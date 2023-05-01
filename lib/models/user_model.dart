import 'dart:convert';

class UserModel {
  String? id;
  String? username;
  String? email;
  bool? isAdmin;
  DateTime? created;

  UserModel({
    this.id,
    this.username,
    this.email,
    this.isAdmin,
    this.created,
  });

  UserModel copyWith({
    String? id,
    String? username,
    String? email,
    bool? isAdmin,
    DateTime? created,
  }) {
    return UserModel(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      isAdmin: isAdmin ?? this.isAdmin,
      created: created ?? this.created,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'isAdmin': isAdmin,
      'created': created?.millisecondsSinceEpoch,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      username: map['username'],
      email: map['email'],
      isAdmin: map['isAdmin'],
      created: map['created'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['created'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, username: $username, email: $email, isAdmin: $isAdmin, created: $created)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.username == username &&
        other.email == email &&
        other.isAdmin == isAdmin &&
        other.created == created;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
        email.hashCode ^
        isAdmin.hashCode ^
        created.hashCode;
  }
}
