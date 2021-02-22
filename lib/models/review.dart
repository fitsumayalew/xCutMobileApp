import 'package:equatable/equatable.dart';

class Review extends Equatable {
  Review({this.userId, this.email, this.review, this.rating});

  final String userId;
  final String email;
  final String review;
  final int rating;

  factory Review.fromJSON(Map<String, dynamic> json) {
    return Review(
        userId: json['user'],
        email: json['email'],
        review: json['review'],
        rating: json['rating']);
  }

  List<Object> get props => [userId, email, review, rating];
}
