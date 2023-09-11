import 'package:dio/dio.dart';
import 'package:nikeshop/model/banners.dart';
import 'package:nikeshop/utils/responce_validator.dart';

abstract class IbannersDataSource {
  Future<List<BannersList>> getBanners();
}

class BannersRemoteDataSorce
    with HttpResponceValidator
    implements IbannersDataSource {
  final Dio httpClient;

  BannersRemoteDataSorce(this.httpClient);
  @override
  Future<List<BannersList>> getBanners() async {
    Response response = await httpClient.get('/banner/slider');
    valiadateResponce(response);
    List<BannersList> bannerListItems = [];

    for (var element in (response.data as List)) {
      bannerListItems.add(BannersList.fromJson(element));
    }
    return bannerListItems;
  }
}
