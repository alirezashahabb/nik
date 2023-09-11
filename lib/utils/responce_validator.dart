import 'package:dio/dio.dart';
import 'package:nikeshop/utils/exaption.dart';

mixin HttpResponceValidator {
  valiadateResponce(Response response) {
    if (response.statusCode != 200) {
      throw AppExption();
    }
  }
}
