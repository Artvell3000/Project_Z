import 'package:project_z/core/domain/entity/product/product.dart';

final mockProducts = ProductList(
  count: 12,
  next: null,
  previous: null,
  results: [
// Game Toy (categoryId: 43)
    _createProduct(
        id: 1,
        name: 'Dilfuza vzlom Product 1',
        subcategory: 42,
        imageUrl: 'https://i.ibb.co/35Ft4ThP/photo.png',
        price: '100.00',
        discount: '10',
        status: 'mahsus_taklif'),
    _createProduct(
        id: 2,
        name: 'Dilfuza vzlom Product 2',
        subcategory: 42,
        imageUrl: 'https://i.ibb.co/1fK1q90Q/photo-1.png',
        price: '150.00',
        discount: '15',
        status: 'mahsus_taklif'),

// Discord (subcategory: 38)
    _createProduct(
        id: 3,
        name: 'Discord Product 1',
        subcategory: 38,
        imageUrl: 'https://i.ibb.co/tw7Qn7yn/photo.png',
        price: '50.00',
        discount: '5',
        status: 'mahsus_taklif'),
    _createProduct(
        id: 4,
        name: 'Discord Product 2',
        subcategory: 38,
        imageUrl: 'https://i.ibb.co/jv65QCLY/photo-1.png',
        price: '75.00',
        discount: '0',
        status: 'yangilik'),

// Furniture1 (subcategory: 46)
    _createProduct(
      id: 5,
      name: 'Furniture1 Product 1',
      subcategory: 46,
      imageUrl: 'https://i.ibb.co/k6XHJ9Wg/photo-1.png',
      price: '200.00',
      discount: '20',
    ),
    _createProduct(
      id: 6,
      name: 'Furniture1 Product 2',
      subcategory: 46,
      imageUrl: 'https://i.ibb.co/8Gt5k2h/photo.png',
      price: '250.00',
      discount: '25',
    ),

// Furniture2 (subcategory: 47)
    _createProduct(
      id: 7,
      name: 'Furniture2 Product 1',
      subcategory: 47,
      imageUrl: 'https://i.ibb.co/q3yqHqMp/photo-1.png',
      price: '300.00',
      discount: '10',
    ),
    _createProduct(
      id: 8,
      name: 'Furniture2 Product 2',
      subcategory: 47,
      imageUrl: 'https://i.ibb.co/gLvnzFw4/photo.png',
      price: '350.00',
      discount: '15',
    ),

// Dota2 (subcategory: 37)
    _createProduct(
        id: 9,
        name: 'Dota2 Product 1',
        subcategory: 37,
        imageUrl: 'https://i.ibb.co/DDckXB8R/photo-1.png',
        price: '40.00',
        discount: '5',
        status: 'yangilik'),
    _createProduct(
        id: 10,
        name: 'Dota2 Product 2',
        subcategory: 37,
        imageUrl: 'https://i.ibb.co/3yy69QwJ/photo.png',
        price: '60.00',
        discount: '10',
        status: 'yangilik'),

// Ofis mebellari (subcategory: 2)
    _createProduct(
        id: 11,
        name: 'Office Furniture 1',
        subcategory: 8,
        imageUrl: 'https://i.ibb.co/MLh17hm/photo.png',
        price: '180.00',
        discount: '15',
        status: 'yangilik'),
    _createProduct(
        id: 12,
        name: 'Office Furniture 2',
        subcategory: 9,
        imageUrl: 'https://i.ibb.co/5WhKPW8n/photo-1.png',
        price: '220.00',
        discount: '20',
        status: 'mahsus_taklif'),
  ],
);

Product _createProduct({
  required int id,
  required String name,
  required int? subcategory,
  required String imageUrl,
  required String price,
  required String discount,
  String? status,
}) {
  return Product(
    id: id,
    images: List.generate(
        4,
        (index) => ProductImage(
              id: index + 1,
              image: imageUrl, // 4 одинаковых изображения
              product: id,
            )),
    name: name,
    description: {
      'en': 'Description for $name in English',
      'ru': 'Описание для $name на русском',
      'uz': '$name uchun tavsif o\'zbek tilida',
    },
    characteristics: {
      'material': 'Premium quality',
      'color': 'Black',
      'weight': '1.5 kg',
    },
    price: price,
    discount: discount,
    quantity: 100,
    productCode: 1000 + id,
    status: status ?? 'none',
    slug: 'product-$id',
    createdAt: DateTime.now().subtract(Duration(days: id)),
    updatedAt: DateTime.now(),
    subcategory: subcategory,
  );
}
