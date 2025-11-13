import 'package:fruit_ecommerce/core/entity/review_entity.dart';

num getAvrgRating({required List<dynamic> reviews}){
  var totalRating = 0.0;
  for(var review in reviews){
    totalRating += review.rating;
  }
  return totalRating/reviews.length;
}