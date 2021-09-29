import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User(this.id, {this.coinCount, this.email, this.nickname, this.password});

  final int id;
  final int coinCount;
  final String email;
  final String nickname;
  final String password;

  @override
  List<Object> get props => [id, coinCount, email, nickname, password];

  static const empty = User(0);
}
