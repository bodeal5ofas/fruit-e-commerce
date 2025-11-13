import 'dart:io';

import 'package:fruit_ecommerce/core/entity/product_entity.dart';
import 'package:fruit_ecommerce/core/entity/review_entity.dart';
import 'package:fruit_ecommerce/core/helper/get_avg_rating.dart';
// import 'package:fruit_ecommerce/core/entity/review_entity.dart';
// import 'package:fruit_ecommerce/core/models/review_model.dart';



class ProductModel {
  final String name;
  final String description;
  final num price;
   String? imageUrl;
  final File? image;
  final bool isFeatured;
  final String code;
  final bool isOrganic;
  final int expierationMonths;
  final int numofCallories;
  final num ratingCount;
  final num avgRating;
  final int unitAmount;
  final List<dynamic> reviews;
  final num? sellingCount;
  
         factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
          avgRating: getAvrgRating(reviews:json['reviews']), 
           name: json['name'],
           description: json['description'],
           price: json['price'],
           imageUrl: json['imageUrl'],
         //  image: json['image'],
           isFeatured: json['isFeatured'],
           code: json['code'],
           isOrganic: json['isOrganic'],
           expierationMonths: json['expierationMonths'],
           numofCallories: json['numofCallories'],
           unitAmount: json['unitAmount'],
           reviews: json['reviews'] ,
           sellingCount: json['sellingCount'],
         );

  ProductModel({
    this.imageUrl,
    required this.name,
     required this.description,
      required this.price,
        this.image,
        required this.isFeatured,
         required this.code, 
         required this.isOrganic,
          required this.expierationMonths,
           required this.numofCallories,
            required this.unitAmount,
             required this.reviews,
               this.sellingCount=0,
               this.avgRating=0,
               this.ratingCount=0,
               });
         toJson(){
          return {
            'name':name,
            'description':description,
            'price':price,
            'isFeatured':isFeatured,
            'code':code,
            'imageUrl':imageUrl,
            'isOrganic':isOrganic,
            'expierationMonths':expierationMonths,
            'numofCallories':numofCallories,
            'unitAmount':unitAmount,
            'reviews':reviews as List<ReviewEntity>,
            'sellingCount':sellingCount,

          };
         }
      ProductEntity   toProductEntity(){
          return ProductEntity(
            name: name,
            description: description,
            price: price,
            isFeatured: isFeatured,
            code: code,
            imageUrl: imageUrl,
            isOrganic: isOrganic,
            expierationMonths: expierationMonths,
            numofCallories: numofCallories,
            unitAmount: unitAmount,
          //  image:image ,
            reviews: reviews.map((e) => e.toReviewEntity()).toList() ,
           // sellingCount: sellingCount,
          );
         }
}