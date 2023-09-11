import 'package:dio/dio.dart';
import 'package:nikeshop/data/datasoruce/products_dataSource.dart';
import 'package:nikeshop/model/products.dart';

final Dio httpClient =
    Dio(BaseOptions(baseUrl: 'http://expertdevelopers.ir/api/v1/'));

final productRepostroy = ProductRepositroy(ProductRemoteDataSource(httpClient));

abstract class IproductRepositroy {
  Future<List<ProductsList>> getProductsRepository(int sort);
  Future<List<ProductsList>> getSearchProductsRepository(String searchTerm);
}

class ProductRepositroy implements IproductRepositroy {
  final IProductsDataSource dataSource;

  ProductRepositroy(this.dataSource);
  @override
  Future<List<ProductsList>> getProductsRepository(int sort) =>
      dataSource.getProducts(sort);

  @override
  Future<List<ProductsList>> getSearchProductsRepository(String searchTerm) =>
      dataSource.getSearch(searchTerm);
}
