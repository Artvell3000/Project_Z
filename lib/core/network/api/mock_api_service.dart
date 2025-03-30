import 'package:injectable/injectable.dart';
import 'package:mocktail/mocktail.dart';
import 'package:project_z/core/domain/entity/entity.dart';
import 'package:project_z/core/network/api/api_service.dart';

@injectable
class MockApiService extends Mock implements ApiService {
  @override
  Future<CategoryList> getCategories() async {
    return _mockCategoryList();
  }

  // Другие методы API можно замокать аналогично
  @override
  Future<NewsList> getNews() async {
    return _mockNewsList();
  }

  @override
  Future<ProductList> getProducts() async {
    return _mockProductList();
  }


  NewsList _mockNewsList() {
    return NewsList(
      count: 2,
      next: null,
      previous: null,
      results: [
        News(
          id: 1,
          image: 'https://example.com/news1.jpg', // Основное изображение
          mobileImage: 'https://i.ibb.co/bRKnNfzB/1-2.png', // Мобильное изображение
          createdAt: DateTime.parse('2025-03-01T10:00:00Z'),
          updatedAt: DateTime.parse('2025-03-01T10:00:00Z'),
        ),
        News(
          id: 2,
          image: 'https://example.com/news2.jpg', // Основное изображение
          mobileImage: 'https://i.ibb.co/bRKnNfzB/1-2.png', // Мобильное изображение
          createdAt: DateTime.parse('2025-03-02T12:30:00Z'),
          updatedAt: DateTime.parse('2025-03-02T14:45:00Z'),
        ),
      ],
    );
  }

  CategoryList _mockCategoryList() {
    return CategoryList(
      count: 13,
      next: 'https://online-shop.milliybiz.uz/categories/?page=2',
      previous: null,
      results: [
        Category(
          id: 2,
          name: 'Ofis mebellari',
          description: 'Производства Турция',
          image: 'https://online-shop.milliybiz.uz/media/category_images/%D0%A1%D0%BB%D0%BE%D0%B8_1_1_V1T0JsP.png',
          mobileImage: 'https://i.ibb.co/h1y8sJS6/office.png',
          slug: 'ofis-mebellari',
          createdAt: DateTime.parse('2025-03-06T17:41:32.580565Z'),
          updatedAt: DateTime.parse('2025-03-06T17:41:32.580624Z'),
          subcategoryId: null,
        ),
        Category(
          id: 8,
          name: 'Подкатегория 4',
          description: 'Производства Турция',
          image: 'https://online-shop.milliybiz.uz/media/category_images/%D0%A1%D0%BB%D0%BE%D0%B8_1_1_09oK1dQ.png',
          mobileImage: null,
          slug: 'podkategoriya-4',
          createdAt: DateTime.parse('2025-03-06T17:45:53.235633Z'),
          updatedAt: DateTime.parse('2025-03-06T17:45:53.235693Z'),
          subcategoryId: 2,
        ),
        Category(
          id: 9,
          name: 'Подкатегория 5',
          description: 'Производства Турция',
          image: 'https://online-shop.milliybiz.uz/media/category_images/%D0%A1%D0%BB%D0%BE%D0%B8_1_1_NYeGNb7.png',
          mobileImage: null,
          slug: 'podkategoriya-5',
          createdAt: DateTime.parse('2025-03-06T17:46:02.963288Z'),
          updatedAt: DateTime.parse('2025-03-06T17:46:02.963343Z'),
          subcategoryId: 2,
        ),
        Category(
          id: 10,
          name: 'Подкатегория 6',
          description: 'Производства Турция',
          image: 'https://online-shop.milliybiz.uz/media/category_images/%D0%A1%D0%BB%D0%BE%D0%B8_2_1_ETGYnHm.png',
          mobileImage: null,
          slug: 'podkategoriya-6',
          createdAt: DateTime.parse('2025-03-06T17:46:21.338399Z'),
          updatedAt: DateTime.parse('2025-03-06T17:46:21.338457Z'),
          subcategoryId: 2,
        ),
        Category(
          id: 37,
          name: 'Dota 2',
          description: 'Bleeba!',
          image: 'https://online-shop.milliybiz.uz/media/category_images/3fafd7595531ba3bab800adf4369a19b43e1038f_URHf46T.gif',
          mobileImage: 'https://i.ibb.co/N2QKfTP1/dota2.png',
          slug: 'svo',
          createdAt: DateTime.parse('2025-03-07T15:52:43.549287Z'),
          updatedAt: DateTime.parse('2025-03-07T15:52:43.549354Z'),
          subcategoryId: null,
        ),
        Category(
          id: 38,
          name: 'Discord Druga',
          description: 'DS',
          image: 'https://online-shop.milliybiz.uz/media/category_images/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA_%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0_2025-03-07_205307.png',
          mobileImage: 'https://i.ibb.co/84gyQMjT/discord.png',
          slug: 'game-toysss',
          createdAt: DateTime.parse('2025-03-07T15:53:47.043168Z'),
          updatedAt: DateTime.parse('2025-03-07T15:53:47.043238Z'),
          subcategoryId: null,
        ),
        Category(
          id: 42,
          name: 'Dilfuza vzlom',
          description: 'Dilfuza zdes',
          image: 'https://online-shop.milliybiz.uz/media/category_images/Screenshot_2025-02-21_205920_Syrm2ZN.png',
          mobileImage: 'https://i.ibb.co/zTSwX378/game-toy.png',
          slug: 'dilfuza-vzlom',
          createdAt: DateTime.parse('2025-03-27T18:23:09.001841Z'),
          updatedAt: DateTime.parse('2025-03-27T18:23:09.001942Z'),
          subcategoryId: null,
        ),
        Category(
          id: 43,
          name: 'Game Toy',
          description: 'Shop',
          image: 'https://online-shop.milliybiz.uz/media/category_images/REGULAR%D0%9D%D0%9E%D0%92%D0%AB%D0%99_%D0%A0%D0%90%D0%91_%D0%A1%D0%A2%D0%9E%D0%9B_VgNne64.jpg',
          mobileImage: 'https://i.ibb.co/zTSwX378/game-toy.png',
          slug: 'game-toy',
          createdAt: DateTime.parse('2025-03-28T14:49:01.467165Z'),
          updatedAt: DateTime.parse('2025-03-28T14:49:01.467253Z'),
          subcategoryId: 42,
        ),
        Category(
          id: 46,
          name: 'Furniture1',
          description: 'Made in Italy',
          image: 'https://online-shop.milliybiz.uz/media/category_images/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA_%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0_2025-02-26_230316_l0fCmQR.png',
          mobileImage: 'https://i.ibb.co/qF7N2Vdq/furniture1.png',
          slug: 'furniture1',
          createdAt: DateTime.parse('2025-03-28T15:25:56.354152Z'),
          updatedAt: DateTime.parse('2025-03-28T15:25:56.354228Z'),
          subcategoryId: null,
        ),
        Category(
          id: 47,
          name: 'Furniture2',
          description: 'Made in Italy',
          image: 'https://online-shop.milliybiz.uz/media/category_images/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA_%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0_2025-02-26_230316_JZqNPVs.png',
          mobileImage: 'https://i.ibb.co/qF7N2Vdq/furniture2.png',
          slug: 'furniture2',
          createdAt: DateTime.parse('2025-03-28T15:33:01.489695Z'),
          updatedAt: DateTime.parse('2025-03-28T15:33:01.489778Z'),
          subcategoryId: null,
        ),
      ],
    );
  }

  ProductList _mockProductList() {
    return ProductList(
      count: 12, // 6 категорий × 2 продукта
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
          status: 'mahsus_taklif'
        ),
        _createProduct(
          id: 2,
          name: 'Dilfuza vzlom Product 2',
          subcategory: 42,
          imageUrl: 'https://i.ibb.co/1fK1q90Q/photo-1.png',
          price: '150.00',
          discount: '15',
          status: 'mahsus_taklif'
        ),

        // Discord (subcategory: 38)
        _createProduct(
          id: 3,
          name: 'Discord Product 1',
          subcategory: 38,
          imageUrl: 'https://i.ibb.co/tw7Qn7yn/photo.png',
          price: '50.00',
          discount: '5',
          status: 'mahsus_taklif'
        ),
        _createProduct(
          id: 4,
          name: 'Discord Product 2',
          subcategory: 38,
          imageUrl: 'https://i.ibb.co/jv65QCLY/photo-1.png',
          price: '75.00',
          discount: '0',
          status: 'yangilik'
        ),

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
          status: 'yangilik'
        ),
        _createProduct(
          id: 10,
          name: 'Dota2 Product 2',
          subcategory: 37,
          imageUrl: 'https://i.ibb.co/3yy69QwJ/photo.png',
          price: '60.00',
          discount: '10',
          status: 'yangilik'
        ),

        // Ofis mebellari (subcategory: 2)
        _createProduct(
          id: 11,
          name: 'Office Furniture 1',
          subcategory: 8,
          imageUrl: 'https://i.ibb.co/MLh17hm/photo.png',
          price: '180.00',
          discount: '15',
          status: 'yangilik'
        ),
        _createProduct(
          id: 12,
          name: 'Office Furniture 2',
          subcategory: 9,
          imageUrl: 'https://i.ibb.co/5WhKPW8n/photo-1.png',
          price: '220.00',
          discount: '20',
          status: 'mahsus_taklif'
        ),
      ],
    );
  }

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
      images: List.generate(4, (index) => ProductImage(
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
}