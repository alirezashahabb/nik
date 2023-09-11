import 'package:nikeshop/data/datasoruce/banners.dataSource.dart';
import 'package:nikeshop/data/repositroy/product_repositroy.dart';
import 'package:nikeshop/model/banners.dart';

final bannersRepository = BannersRepositroy(
  BannersRemoteDataSorce(httpClient),
);

abstract class IBannersRepositroy {
  Future<List<BannersList>> getBannersRepositroy();
}

class BannersRepositroy implements IBannersRepositroy {
  final IbannersDataSource bannersDataSource;

  BannersRepositroy(this.bannersDataSource);
  @override
  Future<List<BannersList>> getBannersRepositroy() =>
      bannersDataSource.getBanners();
}
