import 'models/models.dart';

class UserRepository {
  User _user;

  User getUser() {
    return _user;
  }

  void setUser(Map json) {
    _user = User(json['id'],
        coinCount: json['coinCount'],
        email: json['email'],
        nickname: json['nickname'],
        password: json['password']);
  }
}
