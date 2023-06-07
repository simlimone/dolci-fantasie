import 'dart:convert';

class Links {
  String? whatsapp;
  String? facebook;
  String? instagram;
  String? website;
  String? email;
  String? phoneNumber;
  String? privacy;
  String? terms;

  Links({
    this.whatsapp,
    this.facebook,
    this.instagram,
    this.website,
    this.email,
    this.phoneNumber,
    this.privacy,
    this.terms,
  });

  Links copyWith({
    String? whatsapp,
    String? facebook,
    String? instagram,
    String? website,
    String? email,
    String? phoneNumber,
    String? privacy,
    String? terms,
  }) {
    return Links(
      whatsapp: whatsapp ?? this.whatsapp,
      facebook: facebook ?? this.facebook,
      instagram: instagram ?? this.instagram,
      website: website ?? this.website,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      privacy: privacy ?? this.privacy,
      terms: terms ?? this.terms,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'whatsapp': whatsapp,
      'facebook': facebook,
      'instagram': instagram,
      'website': website,
      'email': email,
      'phoneNumber': phoneNumber,
      'privacy': privacy,
      'terms': terms,
    };
  }

  factory Links.fromMap(Map<String, dynamic> map) {
    return Links(
      whatsapp: map['whatsapp'],
      facebook: map['facebook'],
      instagram: map['instagram'],
      website: map['website'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      privacy: map['privacy'],
      terms: map['terms'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Links.fromJson(String source) => Links.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Links(whatsapp: $whatsapp, facebook: $facebook, instagram: $instagram, website: $website, email: $email, phoneNumber: $phoneNumber, privacy: $privacy, terms: $terms)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Links &&
        other.whatsapp == whatsapp &&
        other.facebook == facebook &&
        other.instagram == instagram &&
        other.website == website &&
        other.email == email &&
        other.phoneNumber == phoneNumber &&
        other.privacy == privacy &&
        other.terms == terms;
  }

  @override
  int get hashCode {
    return whatsapp.hashCode ^
        facebook.hashCode ^
        instagram.hashCode ^
        website.hashCode ^
        email.hashCode ^
        phoneNumber.hashCode ^
        privacy.hashCode ^
        terms.hashCode;
  }
}
