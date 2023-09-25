import 'package:flutter/material.dart';
import 'package:nikeshop/data/datasoruce/auth_dataSorce.dart';
import 'package:nikeshop/data/repositroy/product_repositroy.dart';
import 'package:nikeshop/model/auth_info.dart';

final authRepositroy = AuthRepositry(AuthRemoteDataSorce(httpClient));

abstract class IAuthRepositry {
  Future<void> login(String userName, String password);
}

class AuthRepositry implements IAuthRepositry {
  final IAuthDataSorce dataSorce;

  AuthRepositry(this.dataSorce);
  @override
  Future<void> login(String userName, String password) async {
    final AuthInfo authInfo = await dataSorce.login(userName, password);
    debugPrint('accses token    ///// ${authInfo.accsesToken}');
  }
}
