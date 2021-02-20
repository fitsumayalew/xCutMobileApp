import 'package:meta/meta.dart';
import 'package:xcut_frontend/src/data_provider/data_provider.dart';
import 'package:xcut_frontend/src/models/barberShop.dart';
import 'package:xcut_frontend/src/models/user.dart';

class UserRepository {
  UserDataProvider userDataProvider;

  UserRepository({@required this.userDataProvider})
      : assert(userDataProvider != null);

  createUser(User user) async {
    await userDataProvider.createUser(user);
  }

  loginUser(User user) async {
    await userDataProvider.loginUser(user);
  }

  deleteProfile() async {
    await userDataProvider.deleteProfile();
  }

  Future<User> getProfile() async {
    return await userDataProvider.getProfile();
  }

  Future<User> updateProfile(oldPassword, password) async {
    return await userDataProvider.updateProfile(oldPassword, password);
  }

  addFavorite(barberShopId) async {
    await userDataProvider.addFavorite(barberShopId);
  }

  removeFavorite(barberShopId) async {
    await userDataProvider.removeFavorite(barberShopId);
  }

  setAppointment(barberShopId) async {
    await userDataProvider.setAppointment(barberShopId);
  }

  deleteAppointment(barberShopId) async {
    await userDataProvider.deleteAppointment(barberShopId);
  }

  Future<List<BarberShop>> addReview(
      barberShopId, String message, int rating) async {
    return await userDataProvider.addReview(barberShopId, message, rating);
  }

  Future<List<BarberShop>> deleteReview(barberShopId) async {
    return await userDataProvider.deleteReview(barberShopId);
  }
}
