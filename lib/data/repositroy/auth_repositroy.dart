import 'package:flutter/material.dart';
import 'package:nikeshop/data/datasoruce/auth_dataSorce.dart';
import 'package:nikeshop/data/repositroy/product_repositroy.dart';
import 'package:nikeshop/model/auth_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authRepositroy = AuthRepositry(AuthRemoteDataSorce(httpClient));

abstract class IAuthRepositry {
  Future<void> login(String userName, String password);
  Future<void> signUp(String userName, String password);
  Future<void> refreshToken();
  Future<void> clearToken();
}

class AuthRepositry implements IAuthRepositry {
  static final ValueNotifier<AuthInfo?> authCahngeNotifire =
      ValueNotifier(null);
  final IAuthDataSorce dataSorce;

  AuthRepositry(this.dataSorce);
  @override
  Future<void> login(String userName, String password) async {
    final AuthInfo authInfo = await dataSorce.login(userName, password);
    saveToken(authInfo);
    debugPrint('accses token    ///// ${authInfo.accsesToken}');
  }

  @override
  Future<void> signUp(String userName, String password) async {
    final AuthInfo authInfo = await dataSorce.register(userName, password);
    saveToken(authInfo);
    debugPrint('accses token    ///// ${authInfo.accsesToken}');
  }

  /// get refresh token
  @override
  Future<void> refreshToken() async {
    try {
      final AuthInfo authInfo = await dataSorce.refreshToken(
          "def50200ad39472b96f712a260bce9e37d1993af62713fc8ffa66719485a0ea0e31bb0051b7db7810aca10e83b1750114cdad8141b5a34cadeabb9e897b50d31d32485157965042c8a3590237e0ed30d048a87e2aaf3ca949cb6d9950e9cd5bc4606a862b7f0c84f3f29cb22133b03f82f592a4b004152b6779376ed614969396859376e3aaa13bbec0d0b01cf65e3e6b6cc82820fa5caa45f2b159de3b430310a2497b31506911f5ec0806b80294c34792f74e0bd2acb8efa8f1d6015f0bc162febd462249f6cec00555a24b700015b70472dca00258351fa8685a0a960e2549cfc600c57bec642e3592f6531f2a1efccc4aff2ca56248ff359881ef475e9f760c2bc8ec1387f6a0e340d73472eedaf709fbc79b21f917f1cd4cbfe1a6c30e4970e89195f324d9d2873542a4ccfef44dd7c41feea635c6c1ef95968c9fa7d967eabf0c05173152564e87e73b468e7a326e318818848c884ac40523e549fe055");

      saveToken(authInfo);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  ///get acces token and refresh token

  Future<void> saveToken(AuthInfo authInfo) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString('access_token', authInfo.accsesToken);
    sharedPreferences.setString('refresh_token', authInfo.refreshToken);
    loadAuthInfo();
  }

  /// save to RAM
  Future<void> loadAuthInfo() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    final String accessToken =
        sharedPreferences.getString('access_token') ?? '';
    final String refreshToken =
        sharedPreferences.getString('refresh_token') ?? '';

    try {
      if (accessToken.isNotEmpty && refreshToken.isNotEmpty) {
        authCahngeNotifire.value = AuthInfo(accessToken, refreshToken);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<void> clearToken() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    sharedPreferences.clear();
    authCahngeNotifire.value = null;
  }
}
