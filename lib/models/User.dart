import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int? coinCount;
  final String? email;
  final String? nickname;
  final String? password;

  const User({
    this.coinCount,
    this.email,
    this.nickname,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        coinCount: json['coinCount'] as int,
        email: json['email'] as String,
        nickname: json['nickname'] as String,
        password: json['password'] as String,
      );

  Map<String, dynamic> toJson() => {
        'coinCount': coinCount,
        'email': email,
        'nickname': nickname,
        'password': password,
      };

  User copyWith({
    int? coinCount,
    String? email,
    String? nickname,
    String? password,
  }) {
    return User(
      coinCount: coinCount ?? this.coinCount,
      email: email ?? this.email,
      nickname: nickname ?? this.nickname,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props {
    return [
      coinCount ?? "",
      email ?? "",
      nickname ?? "",
      password ?? "",
    ];
  }
}
