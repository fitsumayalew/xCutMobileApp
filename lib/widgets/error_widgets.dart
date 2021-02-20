import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }

  static Widget errorMessage(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    child: Center(
      child: Text('Unable to get BarberShops',
        style: GoogleFonts.poppins(
          fontSize: 25,
          letterSpacing: 1.5,
          color: Theme.of(context).primaryColor
        )
      ),
    )
  );
}
}