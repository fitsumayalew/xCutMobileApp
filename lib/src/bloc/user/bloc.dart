import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:xcut_frontend/src/bloc/user/user_event.dart';
import 'package:xcut_frontend/src/bloc/user/user_state.dart';
import 'package:xcut_frontend/src/models/user.dart';
import 'package:xcut_frontend/src/repository/user/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserRepository userRepository;

  UserBloc({@required this.userRepository})
      : assert(userRepository != null),
        super(UserLoading());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is UserCreate) {
      try {
        // await userRepository.createUser(event.user);
        final user = await userRepository.getProfile();
        yield UserLoadSuccess(user);
      } catch (_) {
        yield UserOperationFailure();
      }
    }

    if (event is UserLogin) {
      try {
        await userRepository.loginUser(event.user);
        final user = await userRepository.getProfile();
        yield UserLoadSuccess(user);
      } catch (error) {
        yield UserOperationFailure();
      }
    }

    if (event is UserLoad) {
      try {
        final user = await userRepository.getProfile();
        yield UserLoadSuccess(user);
      } catch (error) {
        yield UserOperationFailure();
      }
    }

    if (event is UserUpdate) {
      try {
        await userRepository.updateProfile(event.oldPassword, event.password);
        final user = await userRepository.getProfile();
        yield UserLoadSuccess(user);
      } catch (error) {
        yield UserOperationFailure();
      }
    }

    if (event is UserDelete) {
      try {
        await userRepository.deleteProfile();
        yield UserLoadSuccess(null);
      } catch (error) {
        yield UserOperationFailure();
      }
    }

    if (event is UserAddFavorite) {
      try {
        await userRepository.addFavorite(event.barberShopId);
        final user = await userRepository.getProfile();
        yield UserLoadSuccess(user);
      } catch (error) {
        yield UserOperationFailure();
      }
    }
//
    if (event is UserRemoveFavorite) {
      try {
        await userRepository.removeFavorite(event.barberShopId);
        final user = await userRepository.getProfile();
        yield UserLoadSuccess(user);
      } catch (error) {
        yield UserOperationFailure();
      }
    }

    // if (event is UserAddReview) {
    //   try {
    //     await userRepository.addReview();
    //     final user = await userRepository.getProfile();
    //     yield UserLoadSuccess(user);
    //   } catch (error) {
    //     yield UserOperationFailure();
    //   }
    // }

    // if (event is UserGetReview) {
    //   try {
    //     await userRepository.get();
    //     final user = await userRepository.getProfile();
    //     yield UserLoadSuccess(user);
    //   } catch (error) {
    //     yield UserOperationFailure();
    //   }
    // }

    if (event is UserDeleteReview) {
      try {
        await userRepository.deleteReview(event.barberShopId);
        final user = await userRepository.getProfile();
        yield UserLoadSuccess(user);
      } catch (error) {
        yield UserOperationFailure();
      }
    }
  }
}
