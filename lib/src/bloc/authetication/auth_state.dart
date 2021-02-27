import 'package:equatable/equatable.dart';
import 'package:xcut_frontend/src/models/user.dart';

class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {}

class AuthLoadSuccess extends AuthState {
  final User user;

  AuthLoadSuccess(this.user);

  @override
  List<Object> get props => [user];
}

class AuthOperationFailure extends AuthState {}
