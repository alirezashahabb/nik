import 'package:dio/dio.dart';

/// this File for Dio Options
final Dio httpClient = Dio(
  BaseOptions(baseUrl: 'http://expertdevelopers.ir/api/v1/'),
);
