import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:xcut_frontend/src/bloc/authetication/auth_event.dart';
import 'package:xcut_frontend/src/bloc/authetication/auth_state.dart';

import '../../repository/user/user_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository userRepository;

  AuthBloc({@required this.userRepository})
      : assert(userRepository != null),
        super(AuthLoading());

  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AuthCreate) {
      try {
        final user = await userRepository.getProfile();
        yield AuthLoadSuccess(user);
      } catch (error) {
        yield AuthOperationFailure();
      }
    }

    if (event is AuthLogin) {
      try {
        final user = await userRepository.loginUser(event.user);
        yield AuthLoadSuccess(user);
      } catch (error) {
        yield AuthOperationFailure();
      }
    }

    if (event is AuthUpdate) {
      try {
        await userRepository.updateProfile(event.oldPassword, event.password);
        final user = await userRepository.getProfile();
        yield AuthLoadSuccess(user);
      } catch (error) {
        yield AuthOperationFailure();
      }
    }
  }
}
