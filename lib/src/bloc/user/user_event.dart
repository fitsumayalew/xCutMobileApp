import 'package:equatable/equatable.dart';
import 'package:xcut_frontend/src/models/user.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class UserCreate extends UserEvent {
  final User user;

  const UserCreate(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'User Created {User: $user}';
}

class UserLogin extends UserEvent {
  final User user;

  const UserLogin(this.user);

  @override
  List<Object> get props => [user];
}

// get userProfile
class UserLoad extends UserEvent {
  const UserLoad();

  @override
  List<Object> get props => [];
}

class UserUpdate extends UserEvent {
  final String oldPassword;
  final String password;

  const UserUpdate(this.oldPassword, this.password);

  @override
  List<Object> get props => [oldPassword, password];

  @override
  String toString() => 'User Updated';
}

class UserDelete extends UserEvent {
  final String token;

  const UserDelete(this.token);

  @override
  List<Object> get props => [token];

  @override
  toString() => 'User Deleted';
}

class UserAddFavorite extends UserEvent {
  final String barberShopId;

  @override
  List<Object> get props => [];

  const UserAddFavorite(this.barberShopId);
}

class UserGetFavorite extends UserEvent {
  @override
  List<Object> get props => [];

  const UserGetFavorite();
}

class UserRemoveFavorite extends UserEvent {
  final String barberShopId;

  @override
  List<Object> get props => [];

  const UserRemoveFavorite(this.barberShopId);
}

class UserSetAppointment extends UserEvent {
  final String barberShopId;

  @override
  List<Object> get props => [];

  const UserSetAppointment(this.barberShopId);
}

class UserDeleteAppointment extends UserEvent {
  final String barberShopId;

  @override
  List<Object> get props => [];

  const UserDeleteAppointment(this.barberShopId);
}

class UserAddReview extends UserEvent {
  final String barberShopId;

  @override
  List<Object> get props => [];

  const UserAddReview(this.barberShopId);
}

class UserGetReview extends UserEvent {
  @override
  List<Object> get props => [];

  const UserGetReview();
}

class UserDeleteReview extends UserEvent {
  final String barberShopId;

  @override
  List<Object> get props => [];

  const UserDeleteReview(this.barberShopId);
}
