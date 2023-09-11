import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nikeshop/data/repositroy/baneers_repositroy.dart';
import 'package:nikeshop/data/repositroy/product_repositroy.dart';
import 'package:nikeshop/model/banners.dart';
import 'package:nikeshop/model/products.dart';
import 'package:nikeshop/utils/exaption.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IBannersRepositroy bannersRepositroy;
  final IproductRepositroy productsRepositroy;

  HomeBloc({required this.bannersRepositroy, required this.productsRepositroy})
      : super(HomeLoadingState()) {
    on<HomeEvent>(
      (event, emit) async {
        if (event is HomeStartedEvent || event is HomeRefreshEvent) {
          try {
            emit(HomeLoadingState());
            final banners = await bannersRepositroy.getBannersRepositroy();
            final latesProducts = await productsRepositroy
                .getProductsRepository(ProductSort.latest);

            final popularProducts = await productsRepositroy
                .getProductsRepository(ProductSort.popular);
            emit(HomeSuccusesState(banners, latesProducts, popularProducts));
          } catch (e) {
            emit(
              HomeErorrState(
                e is AppExption ? e : AppExption(),
              ),
            );
          }
        }
      },
    );
  }
}
