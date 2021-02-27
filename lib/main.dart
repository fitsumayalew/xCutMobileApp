import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:xcut_frontend/src/bloc/authetication/bloc.dart';
import 'package:xcut_frontend/src/bloc/barbershop/barbershop_event.dart';
import 'package:xcut_frontend/src/bloc/barbershop/bloc.dart';
import 'package:xcut_frontend/src/bloc/user/bloc.dart';
import 'package:xcut_frontend/src/bloc_observer.dart';
import 'package:xcut_frontend/src/data_provider/data_provider.dart';
import 'package:xcut_frontend/src/repository/barberShop/barberShop_repository.dart';
import 'package:xcut_frontend/src/repository/user/user_repository.dart';
import 'package:xcut_frontend/src/router.dart';
import 'package:xcut_frontend/src/style/HexColor.dart';

void main() {
  Bloc.observer = BlocObserverClass();

  final UserRepository userRepository = UserRepository(
      userDataProvider: UserDataProvider(httpClient: http.Client()));

  final BarberShopRepository barberShopRepository = BarberShopRepository(
      barberShopDataProvider:
          BarberShopDataProvider(httpClient: http.Client()));

  runApp(MyApp(
      userRepository: userRepository,
      barberShopRepository: barberShopRepository));
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;
  final BarberShopRepository barberShopRepository;

  MyApp({@required this.userRepository, @required this.barberShopRepository})
      : assert(userRepository != null);

  @override
  Widget build(BuildContext context) {
    final dark = HexColor('#191414');
    final light = HexColor('#fff');
    final green = HexColor('#1DB954');
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>(
            create: (context) => this.userRepository),
        RepositoryProvider<BarberShopRepository>(
            create: (context) => this.barberShopRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(userRepository: this.userRepository),
          ),
          BlocProvider(
            create: (context) => UserBloc(userRepository: this.userRepository),
          ),
          BlocProvider(
            create: (context) =>
                BarberShopBloc(barberShopRepository: this.barberShopRepository)
                  ..add(BarberShopLoad()),
          )
        ],
        child: MaterialApp(
          title: 'xcut',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: green,
            primaryColorDark: Colors.grey.shade900,
            primaryColorLight: light,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: '/',
          onGenerateRoute: RouterManager.handleRouting,
        ),
      ),
    );
  }
}

//
