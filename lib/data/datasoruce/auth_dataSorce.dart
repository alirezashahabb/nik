import 'package:dio/dio.dart';
import 'package:nikeshop/model/auth_info.dart';
import 'package:nikeshop/utils/constant.dart';
import 'package:nikeshop/utils/responce_validator.dart';

abstract class IAuthDataSorce {
  Future<AuthInfo> login(String userName, String password);
  Future<AuthInfo> register(String userName, String password);
  Future<AuthInfo> refreshToken(String token);
}

class AuthRemoteDataSorce with HttpResponceValidator implements IAuthDataSorce {
  final Dio httClient;

  AuthRemoteDataSorce(this.httClient);
  @override
  Future<AuthInfo> login(String userName, String password) async {
    final response = await httClient.post("auth/token", data: {
      'grant_type': 'password',
      'client_id': 2,
      'client_secret': Constant.clientSecret,
      'username': userName,
      'password': password,
    });

    valiadateResponce(response);

    return AuthInfo(
        response.data['access_token'], response.data['refresh_token']);
  }

  ///=========================================================================================>>>>> refreshToken
  @override
  Future<AuthInfo> refreshToken(String token) async {
    final response = await httClient.post("auth/token", data: {
      'grant_type': 'refresh_token',
      'refresh_token': token,
      'client_id': 2,
      'client_secret': Constant.clientSecret,
    });
    valiadateResponce(response);
    return AuthInfo(
        response.data['access_token'], response.data['refresh_token']);
  }

  @override
  Future<AuthInfo> register(String userName, String password) async {
    Response response = await httClient.post('user/register', data: {
      "email": userName,
      "password": password,
    });
    valiadateResponce(response);
    return login(userName, password);
  }
}
