import 'package:flutter/material.dart';
import 'package:nikeshop/data/repositroy/auth_repositroy.dart';
import 'package:nikeshop/model/auth_info.dart';
import 'package:nikeshop/screens/Auth/Auth_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('سبد خرید'),
          centerTitle: true,
        ),
        body: ValueListenableBuilder<AuthInfo?>(
          valueListenable: AuthRepositry.authCahngeNotifire,
          builder: (context, authstate, child) {
            bool isAuthenticated =
                authstate != null && authstate.accsesToken.isNotEmpty;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(isAuthenticated ? 'خوش امدید' : 'لطفا وارد شوید'),
                  (isAuthenticated)
                      ? ElevatedButton(
                          onPressed: () {
                            authRepositroy.clearToken();
                          },
                          child: const Text('خروج'),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true)
                                .push(MaterialPageRoute(
                              builder: (context) => const AuthScreens(),
                            ));
                          },
                          child: const Text('ورود'),
                        )
                ],
              ),
            );
          },
        ));
  }
}
