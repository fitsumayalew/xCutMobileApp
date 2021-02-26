import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xcut_frontend/src/bloc/barbershop/barbershop_event.dart';
import 'package:xcut_frontend/src/bloc/barbershop/barbershop_state.dart';
import 'package:xcut_frontend/src/bloc/barbershop/bloc.dart';
import 'package:xcut_frontend/src/bloc/user/bloc.dart';
import 'package:xcut_frontend/src/bloc/user/user_event.dart';
import 'package:xcut_frontend/src/bloc/user/user_state.dart';
import 'package:xcut_frontend/src/widgets/loading_widget.dart';

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserOperationFailure) {
          return Text('You have no favorites');
        }
        if (state is UserLoading) {
          BlocProvider.of<UserBloc>(context).add(UserLoad());
        }
        if (state is UserLoadSuccess) {
          return ListView.builder(
            itemCount: state.user.favorites.length,
            itemBuilder: (context, index) {
              return tile(state.user.favorites[index]);
            },
          );
        }
        return Loading();
      },
    );
  }
}

Widget tile(name) {
  return ListTile(
    trailing: IconButton(
        icon: Icon(
          Icons.delete,
          color: Colors.grey.shade700,
        ),
        onPressed: () {}),
    title: Text(
      name,
      style:
          GoogleFonts.poppins(color: Colors.grey, fontWeight: FontWeight.w600),
    ),
  );
}
