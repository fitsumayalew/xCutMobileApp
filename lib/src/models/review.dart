import 'package:equatable/equatable.dart';

class Review extends Equatable {
  Review({this.userId, this.email, this.review, this.rating, this.dateTime});

  final String userId;
  final String email;
  final String review;
  final int rating;
  final String dateTime;

  factory Review.fromJSON(Map<String, dynamic> json) {
    return Review(
        userId: json['user'],
        email: json['email'],
        review: json['review'],
        rating: json['rating'],
        dateTime: json['dateTime']);
  }

  List<Object> get props => [userId, email, review, rating];
}
