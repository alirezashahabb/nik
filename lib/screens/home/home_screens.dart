import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nikeshop/data/repositroy/baneers_repositroy.dart';
import 'package:nikeshop/data/repositroy/product_repositroy.dart';
import 'package:nikeshop/model/products.dart';
import 'package:nikeshop/screens/home/bloc/home_bloc.dart';
import 'package:nikeshop/screens/products/products_items.dart';
import 'package:nikeshop/utils/commome.dart';
import 'package:nikeshop/widgets/slider.dart';

import '../../utils/error.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final textThem = Theme.of(context);
    return BlocProvider<HomeBloc>(
      create: (context) {
        final homebloc = HomeBloc(
          bannersRepositroy: bannersRepository,
          productsRepositroy: productRepostroy,
        );
        homebloc.add(HomeStartedEvent());
        return homebloc;
      },
      child: Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeSuccusesState) {
              return SafeArea(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    switch (index) {
                      case 0:
                        return Container(
                          height: 56,
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/img/nike_logo.png',
                            height: 32,
                            fit: BoxFit.fitHeight,
                          ),
                        );

                      case 2:
                        return SliderBanners(
                          banners: state.banners,
                        );
                      case 3:
                        return _HorizantalProductsList(
                          textThem: textThem,
                          onTap: () {},
                          products: state.laeatestProducts,
                          title: 'جدید ترین ها',
                        );
                      case 4:
                        return _HorizantalProductsList(
                          textThem: textThem,
                          onTap: () {},
                          products: state.popularProducts,
                          title: 'پر بازدید ترین ها',
                        );

                      default:
                        return Container();
                    }
                  },
                ),
              );
            } else if (state is HomeLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeErorrState) {
              return Center(
                child: ErorrButtom(
                  exption: state.exption,
                  onTap: () {
                    BlocProvider.of<HomeBloc>(context).add(HomeRefreshEvent());
                  },
                ),
              );
            } else {
              throw Exception('the state not support ');
            }
          },
        ),
      ),
    );
  }
}

/// tihs class for Products Items
class _HorizantalProductsList extends StatelessWidget {
  final String title;
  final GestureTapCallback onTap;
  final List<ProductsList> products;
  const _HorizantalProductsList({
    required this.textThem,
    required this.title,
    required this.onTap,
    required this.products,
  });

  final ThemeData textThem;

  @override
  Widget build(BuildContext context) {
    final them = Theme.of(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: textThem.textTheme.titleMedium,
              ),
              TextButton(
                onPressed: onTap,
                child: const Text('مشاهده همه'),
              )
            ],
          ),
        ),
        SizedBox(
          height: 290,
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: ListView.builder(
              physics: defultScroll,
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Products(
                  product: product,
                  them: them,
                  borderRadius: BorderRadius.circular(12),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
