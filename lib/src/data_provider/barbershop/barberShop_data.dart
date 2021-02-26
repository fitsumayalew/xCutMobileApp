import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:xcut_frontend/src/models/barberShop.dart';
import 'package:xcut_frontend/src/utils/token_handler.dart';

class BarberShopDataProvider {
  final _baseUrlBarberShop = 'http://localhost:5000/api/barberShop';
  final http.Client httpClient;

  BarberShopDataProvider({@required this.httpClient})
      : assert(httpClient != null);

  Future<List<BarberShop>> getAllBarberShops() async {
    try {
      final response =
          await httpClient.get('$_baseUrlBarberShop/getAllBarberShops');
      final body = json.decode(response.body);
      if (body['status']) {
        return body['data']
            .map<BarberShop>((e) => BarberShop.fromJSON(e))
            .toList();
      } else {
        throw Exception('Failed to create course.');
      }
    } catch (e) {
      print(e);
    }

    return null;
  }

  Future<List<BarberShop>> searchBarberShop(searchValue) async {
    final response = await httpClient
        .get(Uri.http(_baseUrlBarberShop, '/searchBarberShop/$searchValue'));
    if (json.decode(response.body).status == true) {
      List<BarberShop> barberShops = [];
      json.decode(response.body).data.forEach((BarberShop barbershop, index) =>
          {
            barberShops
                .add(BarberShop.fromJSON(json.decode(response.body).data))
          });
      return barberShops;
    } else {
      throw Exception('Failed to create course.');
    }
  }
}
