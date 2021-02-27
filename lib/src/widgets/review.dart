import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xcut_frontend/src/widgets/rating_star.dart';

class ReviewCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('amexabiy@gmail.com', style: GoogleFonts.poppins(color: Colors.grey.shade600)),
                IconButton(icon: Icon(Icons.more_vert, color: Colors.grey.shade600), onPressed: null)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ratingStar(),
                Text('22 Jan, 2021', style: GoogleFonts.poppins(color: Colors.grey.shade600))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Text('I hardly ever have to wait for my appointment, I show up at the time I schedule and you are ready. A quality haircut with a friendly guy who likes to laugh and chit chat. Keep it up, I pass your name to whomever I can', style: GoogleFonts.poppins(color: Colors.grey.shade400),),
            )
          ],
        ),
      ),
    );
  }
}

Widget ratingStar() {
  return Row(
    children: [
      RatingStar(),
      RatingStar(),
      RatingStar()
    ],
  );
}