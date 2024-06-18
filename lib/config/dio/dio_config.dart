import 'package:dio/dio.dart';

class DioConfig {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.binance.com/api/v3/',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );
}