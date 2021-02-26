import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xcut_frontend/src/bloc/barbershop/barbershop_state.dart';
import 'package:xcut_frontend/src/bloc/barbershop/bloc.dart';
import 'package:xcut_frontend/src/models/models.dart';
import 'package:xcut_frontend/src/widgets/barbershop_card.dart';
import 'package:xcut_frontend/src/widgets/error_widgets.dart';
import 'package:xcut_frontend/src/widgets/loading_widget.dart';
import 'package:xcut_frontend/src/widgets/searchBar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 35),
          SafeArea(child: SearchBar()),
          BlocBuilder<BarberShopBloc, BarberShopState>(
              builder: (context, state) {
            if (state is BarberShopOperationFailure) {
              return barberShopError(context);
            }
            if (state is BarbershopLoadSuccess) {
              final barberShops = state.barberShops;
              print(barberShops);
              return renderBarberShops(barberShops, context);
            }
            return Loading();
          }),
        ],
      ),
      backgroundColor: Theme.of(context).primaryColorDark,
    );
  }
}

Widget renderBarberShops(List<BarberShop> barberShop, context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
    child: Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: barberShop.length,
        itemBuilder: (context, index) {
          return BarberShopCard(barberShop[index].image, barberShop[index].name,
              {}, barberShop[index].createdAt, barberShop[index].address);
        },
      ),
    ),
  );
}

Widget barberShopError(BuildContext context) {
  return ErrorWidgets.errorMessage(context);
}
