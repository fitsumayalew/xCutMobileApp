import 'package:meta/meta.dart';
import 'package:xcut_frontend/src/data_provider/barbershop/barberShop_data.dart';
import 'package:xcut_frontend/src/models/barberShop.dart';

class BarberShopRepository {
  final BarberShopDataProvider barberShopDataProvider;

  BarberShopRepository({@required this.barberShopDataProvider}) : assert(barberShopDataProvider != null);
  
  Future<List<BarberShop>> getAllBarberShops() async {
    return await barberShopDataProvider.getAllBarberShops();
  }

  Future<List<BarberShop>> searchBarberShop(searchValue) async {
    return await barberShopDataProvider.searchBarberShop(searchValue);
  }
}