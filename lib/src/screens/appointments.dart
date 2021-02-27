import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xcut_frontend/src/bloc/barbershop/barbershop_event.dart';
import 'package:xcut_frontend/src/bloc/barbershop/barbershop_state.dart';
import 'package:xcut_frontend/src/bloc/barbershop/bloc.dart';
import 'package:xcut_frontend/src/models/models.dart';
import 'package:xcut_frontend/src/widgets/loading_widget.dart';

class Appointment extends StatefulWidget {
  @override
  _AppointmentState createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BarberShopBloc, BarberShopState>(
        builder: (context, state) {
      if (state is BarberShopOperationFailure) {
        return Text('You have no appointments');
      }
      if(state is BarbershopLoading) {
        BlocProvider.of<BarberShopBloc>(context).add(BarberShopLoad());
      }
      if (state is BarbershopLoadSuccess) {
        return ListView(
          children: [tile(state), tile(state)],
        );
      }
      return Loading();
    });
  }
}

Widget appointments() {
  return ListView.builder(itemCount: 3, itemBuilder: (builder, index) {});
}

Widget tile(barberShop) {
  return ListTile(
    trailing: IconButton(
        icon: Icon(
          Icons.delete,
          color: Colors.grey.shade700,
        ),
        onPressed: () {}),
    title: Text(
      'BArber shop name',
      style:
          GoogleFonts.poppins(color: Colors.grey, fontWeight: FontWeight.w600),
    ),
    subtitle:
        Text('2013-34-34', style: GoogleFonts.poppins(color: Colors.grey)),
  );
}