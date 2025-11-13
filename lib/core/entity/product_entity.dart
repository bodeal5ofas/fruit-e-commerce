import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:fruit_ecommerce/core/entity/review_entity.dart';



class ProductEntity extends Equatable{
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
  final num ratingCount=0;
  final num avgRating=0;
  final int unitAmount;
  final List<dynamic> reviews;

  

  ProductEntity(  {
     required this.reviews,
     this.isOrganic =false,
     required this.expierationMonths,
     required this.numofCallories,
     required this.unitAmount
     ,required this.name, 
     required this.description,
      required this.price,  
      this.imageUrl,
        this.image,
        required this.isFeatured, 
        required this.code});
        
          @override
          // TODO: implement props
          List<Object?> get props => [code];
}