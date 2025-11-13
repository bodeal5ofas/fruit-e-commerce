


import 'package:fruit_ecommerce/core/entity/review_entity.dart';

class ReviewModel {
  final String image;
  final String name;
  final String date;
  final String description;
  final num rating;

  ReviewModel({required this.image, required this.name, required this.date, required this.description, required this.rating});


  factory ReviewModel.fromEntity(ReviewEntity reviewEntity) => ReviewModel(image: reviewEntity.image, name: reviewEntity.name, date: reviewEntity.date, description: reviewEntity.description, rating: reviewEntity.rating);
  
  factory ReviewModel.fromMap(Map<String, dynamic> map) => ReviewModel(image: map['image'], name: map['name'], date: map['date'], description: map['description'], rating: map['rating']);
  toMap(){
    return {
      'image': image,
      'name': name,
      'date': date,
      'description': description,
      'rating': rating,
    };
  }
 ReviewEntity toReviewEntity(){
    return ReviewEntity(image: image, name: name, date: date, description: description, rating: rating);
  }
}