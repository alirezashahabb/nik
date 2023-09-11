part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeLoadingState extends HomeState {}

class HomeErorrState extends HomeState {
  final AppExption exption;

  const HomeErorrState(this.exption);
}

class HomeSuccusesState extends HomeState {
  final List<BannersList> banners;
  final List<ProductsList> laeatestProducts;
  final List<ProductsList> popularProducts;

  const HomeSuccusesState(
      this.banners, this.laeatestProducts, this.popularProducts);
}
