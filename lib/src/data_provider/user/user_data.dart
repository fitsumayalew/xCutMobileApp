import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:xcut_frontend/src/models/barberShop.dart';
import 'package:xcut_frontend/src/models/user.dart';
import 'package:xcut_frontend/src/utils/token_handler.dart';

class UserDataProvider {
  final _baseUrlAuth = 'http://localhost:5000/api/auth';
  final _baseUrlUser = 'http://localhost:5000/api/user';
  final http.Client httpClient;

  UserDataProvider({@required this.httpClient}) : assert(httpClient != null);

  createUser(User user) async {
    final response = await httpClient.post(
      '$_baseUrlAuth/signup',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'email': user.email,
        'password': user.password,
      }),
    );

    final body = json.decode(response.body);
    if (body['status']) {
      await TokenHandler.setToken(body['jwt']);
      await TokenHandler.setUserRole(body['role']);
      await TokenHandler.setUserId(body['data']['_id']);
      print(body['jwt']);
    } else {
      throw Exception('Failed to create course.');
    }
  }

  loginUser(User user) async {
    final response = await httpClient.post(
      '$_baseUrlAuth/login',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'email': user.email,
        'password': user.password,
      }),
    );

    final body = json.decode(response.body);
    if (body['status']) {
      await TokenHandler.setToken(body['jwt']);
      await TokenHandler.setUserRole(body['role']);
      await TokenHandler.setUserId(body['data']['_id']);
      print(body['jwt']);
    } else {
      throw Exception('Failed to create course.');
    }
  }

  deleteProfile() async {
    final response = await httpClient.delete(
      '$_baseUrlUser/deleteProfile',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${TokenHandler.getToken()}'
      },
    );
    final body = json.decode(response.body);
    if (body['status']) {
      TokenHandler.removeToken();
    } else {
      throw Exception('Failed to create course.');
    }
  }

  Future<User> getProfile() async {
    final token = await TokenHandler.getToken();
    final response = await httpClient.get(
      '$_baseUrlUser/getProfile',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
    );

    final body = json.decode(response.body);
    final data = body['data'];
    if (body['status']) {
      return User.fromJSON(data);
    } else {
      throw Exception('Failed to create course.');
    }
  }

  // reset password
  Future<User> updateProfile(String oldPassword, String password) async {
    final response = await httpClient.put('$_baseUrlUser/getProfile',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${TokenHandler.getToken()}'
        },
        body: jsonEncode(<String, dynamic>{
          'oldPassword': oldPassword,
          'password': password,
        }));

    final body = json.decode(response.body);
    if (body['status']) {
      return User.fromJSON(body['data']);
    } else {
      throw Exception('Failed to create course.');
    }
  }

  addFavorite(barberShopId) async {
    final response = await httpClient.post(
      '$_baseUrlUser/addFavorite/$barberShopId',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${TokenHandler.getToken()}'
      },
    );

    final body = json.decode(response.body);
    if (body['status']) {
      return User.fromJSON(body['data']);
    } else {
      throw Exception('Failed to create course.');
    }
  }

  removeFavorite(barberShopId) async {
    final response = await httpClient.delete(
      '$_baseUrlUser/removeFavorite/$barberShopId',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${TokenHandler.getToken()}'
      },
    );

    final body = json.decode(response.body);
    if (body['status']) {
      return User.fromJSON(body['data']);
    } else {
      throw Exception('Failed to create course.');
    }
  }

  setAppointment(barberShopId) async {
    final response = await httpClient.post(
      '$_baseUrlUser/setAppointment/$barberShopId',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${TokenHandler.getToken()}'
      },
    );

    final body = json.decode(response.body);
    if (body['status']) {
      return User.fromJSON(body['data']);
    } else {
      throw Exception('Failed to create course.');
    }
  }

  deleteAppointment(barberShopId) async {
    final response = await httpClient.delete(
      '$_baseUrlUser/deleteAppointment/$barberShopId',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${TokenHandler.getToken()}'
      },
    );

    final body = json.decode(response.body);
    if (body['status']) {
      return User.fromJSON(body['data']);
    } else {
      throw Exception('Failed to create course.');
    }
  }

  Future<List<BarberShop>> addReview(
      barberShopId, String message, int rating) async {
    final response = await httpClient.post(
      '$_baseUrlUser/addReview/$barberShopId',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${TokenHandler.getToken()}'
      },
      body: jsonEncode(<String, dynamic>{'message': message, 'rating': rating}),
    );

    final body = json.decode(response.body);
    if (body['status']) {
      List<BarberShop> barberShops = [];
      body['data'].forEach((BarberShop barbershop, index) =>
          {barberShops.add(BarberShop.fromJSON(body['data']))});
      return barberShops;
    } else {
      throw Exception('Failed to create course.');
    }
  }

  Future<List<BarberShop>> deleteReview(barberShopId) async {
    final response = await httpClient.post(
      '$_baseUrlUser/deleteReview/$barberShopId',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${TokenHandler.getToken()}'
      },
    );

    final body = json.decode(response.body);
    if (body['status']) {
      List<BarberShop> barberShops = [];
      body['data'].forEach((BarberShop barbershop, index) =>
          {barberShops.add(BarberShop.fromJSON(body['data']))});
      return barberShops;
    } else {
      throw Exception('Failed to create course.');
    }
  }
}
