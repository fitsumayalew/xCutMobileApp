import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xcut_frontend/src/models/barberShop.dart';
import 'package:xcut_frontend/src/models/review.dart';
import 'package:xcut_frontend/src/widgets/rating_star.dart';

class BarberShopCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  // review contains ratings and reviews in a single object
  final List<Review> review;
  final DateTime createdAt;
  final String address;

  BarberShopCard(
      this.imageUrl, this.name, this.review, this.createdAt, this.address);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.pushNamed(context, '/barbershopDetails',
            arguments: BarberShop(
                image: imageUrl,
                name: name,
                review: review,
                createdAt: createdAt,
                address: address))
      },
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade800, width: 0.5),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 5,
                spreadRadius: 5,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Column(children: [
            ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                child: Image(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.fill,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(children: [
                Container(
                  height: 40,
                  child: Text(
                    name,
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor),
                  ),
                ),
                Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('Rating: ',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                color: Colors.grey),
                            overflow: TextOverflow.clip),
                        ratingStar(review)
                      ],
                    ),
                    Text('Joined: ${createdAt.toString().split(' ')[0]}',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey),
                        overflow: TextOverflow.clip),
                  ],
                )),
                Container(
                    height: 40,
                    child: Row(
                      children: [
                        Icon(Icons.location_pin, color: Colors.grey.shade500),
                        Text(address,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                color: Colors.grey),
                            overflow: TextOverflow.clip),
                      ],
                    ))
              ]),
            ),
          ])),
    );
  }
}

Widget ratingStar(review) {
  return Row(
    children: [RatingStar(), RatingStar(), RatingStar()],
  );
}
