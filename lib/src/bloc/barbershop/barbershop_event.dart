import 'package:equatable/equatable.dart';
import 'package:xcut_frontend/src/models/barberShop.dart';

abstract class BarberShopEvent extends Equatable {
  const BarberShopEvent();
}

class BarberShopLoad extends BarberShopEvent {
  const BarberShopLoad();

  @override
  List<Object> get props => [];
}

class BarberShopSearch extends BarberShopEvent {
  final String searchValue;

  const BarberShopSearch(this.searchValue);

  @override
  List<Object> get props => [searchValue];
}
