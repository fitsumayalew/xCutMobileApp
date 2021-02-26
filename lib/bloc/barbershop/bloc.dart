import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:xcut_frontend/src/bloc/barbershop/barbershop_event.dart';
import 'package:xcut_frontend/src/bloc/barbershop/barbershop_state.dart';
import 'package:xcut_frontend/src/repository/barberShop/barberShop_repository.dart';

class BarberShopBloc extends Bloc<BarberShopEvent, BarberShopState> {
    final BarberShopRepository barberShopRepository;

    BarberShopBloc({@required this.barberShopRepository}) : assert(barberShopRepository != null), super(BarbershopLoading());

    Stream<BarberShopState> mapEventToState(BarberShopEvent event) async* {
      if(event is BarberShopLoad) {
        try {
          final barberShops = await barberShopRepository.getAllBarberShops();
          yield BarbershopLoadSuccess(barberShops);
        } catch (error) {
          yield BarberShopOperationFailure();
        }
      }

      if(event is BarberShopSearch) {
        try {
          final barberShops = await barberShopRepository.searchBarberShop(event.searchValue);
          yield BarbershopLoadSuccess(barberShops);
        } catch (error) {
          yield BarberShopOperationFailure();
        }
      }
    }
}