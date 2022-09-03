import 'package:dio/dio.dart';

const apiUrl = 'http://192.168.56.1/laravel9/e-commerce/public/api';
const apikey = 'p@ssword123';

final dio = Dio(
  BaseOptions(
    baseUrl: apiUrl,
    queryParameters: {'Api_Password': apikey},
  ),
);
