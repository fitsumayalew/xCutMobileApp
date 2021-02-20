import 'package:equatable/equatable.dart';
import 'package:xcut_frontend/src/models/user.dart';

class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserLoading extends UserState {}

class UserLoadSuccess extends UserState {
  final User user;

  UserLoadSuccess(this.user);

  @override
  List<Object> get props => [User];
}

class UserOperationFailure extends UserState {}
