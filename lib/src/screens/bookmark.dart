import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xcut_frontend/src/screens/appointments.dart';
import 'package:xcut_frontend/src/screens/favorites.dart';

class BookMark extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: SafeArea(
            child: TabBar(
              indicatorColor: Theme.of(context).primaryColor,
              tabs: [
                Tab(
                  child: Text(
                    'Appointments',
                    style: GoogleFonts.poppins(
                        color: Theme.of(context).primaryColor),
                  ),
                ),
                Tab(
                    child: Text(
                  'Favorites',
                  style: GoogleFonts.poppins(
                      color: Theme.of(context).primaryColor),
                )),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [Appointment(), Favorite()],
        ),
        backgroundColor: Theme.of(context).primaryColorDark,
      ),
    );
  }
}
