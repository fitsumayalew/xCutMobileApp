import 'package:equatable/equatable.dart';
import 'package:xcut_frontend/src/models/barberShop.dart';

class BarberShopState extends Equatable {
  const BarberShopState();

  @override
  List<Object> get props => [];
}

class BarbershopLoading extends BarberShopState {}

class BarbershopLoadSuccess extends BarberShopState {
  final List<BarberShop> barberShops;

  BarbershopLoadSuccess([this.barberShops = const []]);

  @override
  List<Object> get props => [barberShops];
}

class BarberShopOperationFailure extends BarberShopState {}
