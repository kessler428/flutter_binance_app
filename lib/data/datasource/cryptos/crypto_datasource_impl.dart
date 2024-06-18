import 'package:binance_implementation/config/get_it/service_locator.dart';
import 'package:binance_implementation/data/models/criptos/response/criptos_response_model.dart';
import 'package:binance_implementation/domain/datasource/cryptos/crypto_datasource.dart';
import 'package:binance_implementation/helpers/emuns/type_requests.dart';
import 'package:binance_implementation/helpers/http/http_client_helper.dart';
import 'package:dio/dio.dart';

class CryptoDatasourceImpl  extends CryptoDataSource {
  
  late Dio dio = serviceLocator<Dio>();
  
  /// This is the constructor where we validate the dio instance that will be used
  CryptoDatasourceImpl([Dio? dio]) {
    this.dio = dio ?? this.dio;
  }

  @override
  Future<CriptosResponseModel> getCrypto({required String symbol}) async {
    try {

      final Response<dynamic> response = await HttpClientHelper(dio).requestHelper(
        endpoint: 'ticker/price?symbol=$symbol',
        typeOfRequests: TypeRequests.get,
      );

      final responseModel = CriptosResponseModel.fromJson(response.data);

      return responseModel;
       
    } catch (e) {
      rethrow;
    }
  }

  
}