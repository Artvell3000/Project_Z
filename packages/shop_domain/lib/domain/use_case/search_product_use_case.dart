import 'package:fpdart/fpdart.dart';
import 'package:shop_domain/domain/entity/product/product.dart';
import 'package:shop_domain/domain/entity/search_filter/search_filter.dart';
import 'package:shop_domain/domain/repositories/local_lang_repository.dart';
import 'package:shop_domain/domain/repositories/product_repository.dart';
import 'package:shop_domain/error/entity/domain_exception.dart';

class SearchProductUseCase{
    SearchProductUseCase(this._langRepository, this._productRepository);
    final ILocalLangRepository _langRepository;
    final IProductRepository _productRepository;

    Future<Either<DomainError, ProductPage>> call(SearchFilter filter, {int? page}) async {
      try{
        final lang = (await _langRepository.find()).getOrElse((e) => throw(e));

        final result = (await _productRepository.getByFilter(filter, lang: lang, page: page)).getOrElse((e) => throw(e));

        return Right(result);
      } on Exception catch(e){
        return Left(DomainError.unknown(message: 'SearchProductUseCase: $e'));
      }
    }
}