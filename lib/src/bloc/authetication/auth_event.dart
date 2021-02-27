import 'package:equatable/equatable.dart';
import '../../models/user.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class AuthCreate extends AuthEvent {
  final User user;

  const AuthCreate(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'Auth Created';
}

class AuthLogin extends AuthEvent {
  final User user;

  const AuthLogin(this.user);

  @override
  List<Object> get props => [user];
}

class AuthUpdate extends AuthEvent {
  final String oldPassword;
  final String password;

  const AuthUpdate(this.oldPassword, this.password);

  @override
  List<Object> get props => [oldPassword, password];

  @override
  String toString() => 'User Updated';
}
