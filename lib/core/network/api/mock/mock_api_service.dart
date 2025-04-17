import 'package:injectable/injectable.dart';
import 'package:mocktail/mocktail.dart';
import 'package:project_z/core/domain/entity/basket/basket.dart';
import 'package:project_z/core/domain/entity/entity.dart';
import 'package:project_z/core/network/api/request_models/request_models.dart';
import 'package:project_z/core/network/api/service/api_service.dart';
import 'package:project_z/core/network/api/mock/const/const.dart';

@injectable
class MockApiService extends Mock implements ApiService {
  MockApiService() : super();

  final _products = mockProducts;

  final _news = mockNews;

  final _categories = mockCategories;

  var _user = mockUser;

  final _basket = mockPaginatedBasketItems;

  final _orders = paginatedOrderItems;

  @override
  Future<PaginatedOrderItems> getOrder({required String token}) async {
    return _orders;
  }

  @override
  Future<PaginatedBasketItems> getMyBasketItems({required String token, String? search, int? page}) async {
    return _basket;
  }

  @override
  Future<void> deleteBasketItem(String token, int basketItemId) async {
    for(int i=0;i<_basket.results.length;i++){
      if(_basket.results[i].id == basketItemId){
        _basket.results[i] = _basket.results[i].copyWith(amount: _basket.results[i].amount-1);
        if(_basket.results[i].amount == 0)_basket.results.removeAt(i);
        return;
      }
    }
  }

  @override
  Future<BasketItem> createBasketItem(String token, BasketItemRequest request) {
    // TODO: implement createBasketItem
    throw UnimplementedError();
  }

  @override
  Future<PaginatedBasketItems> getBasketList({required String token, String? search, int? page}) async {
    return _basket;
  }



  @override
  Future<Product> getProductById(int productId) async =>
      _products.results
          .where((p) {
        return p.id == productId;
      })
          .toList()
          .first;

  @override
  Future<ProductList> searchProducts(
      {String? name, String? subcategory, String? status, String? minPrice, String? maxPrice, String? searchTerm, String? ordering, int? page}) async {
    final resultProducts = _products.results.where((el) {
      bool matchName, matchSubcategory, matchStatus, matchMinPrice, matchMaxPrice;
      matchName = (name == null) ? true : el.name == name;
      matchSubcategory = (subcategory == null) ? true : el.subcategory.toString() == subcategory;
      matchStatus = (status == null) ? true : el.status == status;
      matchMinPrice = (minPrice == null) ? true : el.finalPrice >= double.parse(minPrice);
      matchMaxPrice = (maxPrice == null) ? true : el.finalPrice <= double.parse(maxPrice);

      return matchName && matchSubcategory && matchStatus && matchMinPrice && matchMaxPrice;
    }).toList();

    return ProductList(
        count: resultProducts.length,
        next: null,
        previous: null,
        results: resultProducts
    );
  }

  @override
  Future<CustomUser> getCurrentUser(String token) async {
    if(token != 'Bearer accessToken') throw Exception('not mock token');
    return _user.copyWith();
  }

  @override
  Future<CustomUser> updateCurrentUser(String token, CustomUserCompanion user) async {
    if(token != 'Bearer accessToken') throw Exception('not mock token');
    if (user.username != null) _user = _user.copyWith(username: user.username!);
    if (user.fullName != null) _user = _user.copyWith(fullName: user.fullName);
    if (user.town != null) _user = _user.copyWith(town: user.town);
    if (user.district != null) _user = _user.copyWith(district: user.district);
    return _user.copyWith();
  }

  @override
  Future<SendCodeResponse> sendVerificationCode(SendCodeRequest request) async {
    return const SendCodeResponse(message: "mock user", code: "111111");
  }

  @override
  Future<VerifyCodeResponse> verifyCode(VerifyCodeRequest request) async {
    return const VerifyCodeResponse(message: "mock user",
        userCreated: true,
        username: '',
        accessToken: 'accessToken',
        refreshToken: 'refreshToken'
    );
  }


  @override
  Future<CategoryList> getCategories() async {
    return _categories;
  }

  @override
  Future<Category> getCategoryById(int id) async {
    return mockCategories.results.where((el){
      return el.id == id;
    }).first;
  }

  @override
  Future<CategoryList> getSubcategoriesByParentId(int id) async {
    final categoriesByParentId =  mockCategories.results.where((el){
      return el.subcategoryId == id;
    }).toList();

    return CategoryList(
      count: categoriesByParentId.length,
      next: null,
      previous: null,
      results: categoriesByParentId,
    );
  }

  @override
  Future<NewsList> getNews() async {
    return _news;
  }

  @override
  Future<ProductList> getProducts() async {
    return _products;
  }
}
