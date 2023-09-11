import 'package:dio/dio.dart';
import 'package:nikeshop/model/products.dart';
import 'package:nikeshop/utils/responce_validator.dart';

abstract class IProductsDataSource {
  Future<List<ProductsList>> getProducts(int sort);
  Future<List<ProductsList>> getSearch(String searchTerm);
}

class ProductRemoteDataSource
    with HttpResponceValidator
    implements IProductsDataSource {
  final Dio httpClient;

  ProductRemoteDataSource(this.httpClient);
  @override
  Future<List<ProductsList>> getProducts(int sort) async {
    Response response = await httpClient.get('product/list?sort=$sort');
    valiadateResponce(response);
    // Convert To List
    final prdouctList = <ProductsList>[];
    for (var element in (response.data as List)) {
      prdouctList.add(ProductsList.fromJson(element));
    }

    return prdouctList;
  }

  @override
  Future<List<ProductsList>> getSearch(String searchTerm) async {
    Response response = await httpClient.get('/product/search?q=$searchTerm');
    valiadateResponce(response);
    // Convert To List
    final prdouctList = <ProductsList>[];
    for (var element in (response.data as List)) {
      prdouctList.add(ProductsList.fromJson(element));
    }

    return prdouctList;
  }
}
