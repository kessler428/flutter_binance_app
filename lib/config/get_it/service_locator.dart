import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:binance_implementation/config/dio/dio_config.dart';

final serviceLocator = GetIt.instance;

void setUpServiceLocator() {

  serviceLocator.registerSingleton<Dio>(DioConfig.dio);

}