import 'package:equatable/equatable.dart';

class User extends Equatable {
  User({this.email, this.password, this.favorites, this.createdAt});

  final String email;
  final String password;
  final List<Object> favorites;
  final DateTime createdAt;

  factory User.fromJSON(Map<String, dynamic> json) {
    return User(
        email: json['email'],
        password: null,
        favorites: json['favorites'],
        createdAt: DateTime.parse(json['createdAt']));
  }

  @override
  List<Object> get props => [email, favorites, createdAt];

  // factory User.updatePassword([]) {

  // }

}
