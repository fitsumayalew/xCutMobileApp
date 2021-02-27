import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xcut_frontend/src/bloc/barbershop/barbershop_event.dart';
import 'package:xcut_frontend/src/bloc/barbershop/barbershop_state.dart';
import 'package:xcut_frontend/src/bloc/barbershop/bloc.dart';
import 'package:xcut_frontend/src/models/models.dart';
import 'package:xcut_frontend/src/widgets/loading_widget.dart';

import '../utils/token_handler.dart';
import '../utils/token_handler.dart';

class Appointment extends StatefulWidget {
  @override
  _AppointmentState createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: TokenHandler.getToken(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text('Login to see your appointments.',
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          letterSpacing: 1.5,
                          color: Theme.of(context).primaryColor)),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 2,
                        child: RaisedButton(
                            child: Text(
                              'Login',
                              style: GoogleFonts.poppins(
                                  fontSize: 20.0, fontWeight: FontWeight.w600),
                            ),
                            color: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                side: BorderSide(color: Colors.grey.shade700)),
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            })))
              ],
            );
          } else {}

          return BlocBuilder<BarberShopBloc, BarberShopState>(
              builder: (context, state) {
            if (state is BarberShopOperationFailure) {
              return Text('You have no appointments');
            }
            if (state is BarbershopLoading) {
              BlocProvider.of<BarberShopBloc>(context).add(BarberShopLoad());
            }
            if (state is BarbershopLoadSuccess) {
              List<String> barberShopNames = [];
              state.barberShops.forEach((e) => {
                    e.appointments.forEach((e) {
                      if (e == snapshot.data) {
                        barberShopNames.add(e);
                      }
                    })
                  });
              return ListView.builder(
                itemCount: barberShopNames.length,
                itemBuilder: (context, index) {
                  return tile(barberShopNames[index]);
                },
              );
            }
            return Loading();
          });
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

getUserId() async {
  return await TokenHandler.getUserId();
}
