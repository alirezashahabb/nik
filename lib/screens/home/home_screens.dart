import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nikeshop/data/repositroy/baneers_repositroy.dart';
import 'package:nikeshop/data/repositroy/product_repositroy.dart';
import 'package:nikeshop/screens/home/bloc/home_bloc.dart';
import 'package:nikeshop/widgets/slider.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.exption.message),
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<HomeBloc>(context)
                            .add(HomeRefreshEvent());
                      },
                      child: const Text('تلاش مجدد'),
                    )
                  ],
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
