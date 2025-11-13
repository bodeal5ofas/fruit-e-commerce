import 'package:fruit_ecommerce/core/entity/product_entity.dart';

ProductEntity getDummyFruit() {
  return ProductEntity(
    name: 'Apple',
    description: 'A delicious fruit',
    price: 2.99,
    isFeatured: true,
    code: 'ABC123',
    imageUrl: 'https://mvawtfuomsevodxvaixe.supabase.co/storage/v1/object/public/product_imges/images/IMG-20250625-WA0062.jpg..jpg',
    isOrganic: true,
    expierationMonths: 6,
    numofCallories: 100,
    unitAmount: 1,
    reviews: [],
  );
}
List<ProductEntity> getDummyFruits() {
  return [
    getDummyFruit(),
    getDummyFruit(),
    getDummyFruit(),
        getDummyFruit(),
    getDummyFruit(),
    getDummyFruit(),
        getDummyFruit(),
    getDummyFruit(),
    getDummyFruit(),
  ];
}