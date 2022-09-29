// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Info {
  String fname;
  String email;
  
  Info({
    required this.fname,
    required this.email,
  });

  Info copyWith({
    String? fname,
    String? email,
  }) {
    return Info(
      fname: fname ?? this.fname,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fname': fname,
      'email': email,
    };
  }

  factory Info.fromMap(Map<String, dynamic> map) {
    return Info(
      fname: map['fname'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Info.fromJson(String source) =>
      Info.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Info(fname: $fname, email: $email)';

  @override
  bool operator ==(covariant Info other) {
    if (identical(this, other)) return true;

    return other.fname == fname && other.email == email;
  }

  @override
  int get hashCode => fname.hashCode ^ email.hashCode;
}
