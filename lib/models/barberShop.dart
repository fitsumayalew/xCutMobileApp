import 'dart:wasm';

import 'package:xcut_frontend/src/models/review.dart';

class BarberShop {
  final String id;
  final String name;
  final String address;
  final String image;
  final List<Review> review;
  final List<String> appointments;
  final Map location;
  final DateTime createdAt;

  BarberShop({
    this.id,
    this.name,
    this.address,
    this.image,
    this.review,
    this.appointments,
    this.location,
    this.createdAt,
  });

  factory BarberShop.fromJSON(Map<String, dynamic> json) {
    return BarberShop(
      id: json['_id'],
      name: json['name'],
      address: json['address'],
      image: json['image'],
      review: json['review'] != null
          ? json['review'].map<Review>((e) => Review.fromJSON(e)).toList()
          : null,
      appointments: json['appointments'] != null
          ? List<String>.from(json['appointments'] ?? [])
          : null,
      location: json['location'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
    );
  }
}
