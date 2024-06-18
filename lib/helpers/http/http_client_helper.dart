import 'package:dio/dio.dart';
import 'package:binance_implementation/helpers/emuns/type_requests.dart';
import 'package:binance_implementation/helpers/exceptions/exceptions_helper.dart';

class HttpClientHelper {

  // Get the dio instance from the authentication datasource
  final Dio dio;

  HttpClientHelper(this.dio);

  /// Method used to make HTTP requests without token.
  Future<Response<dynamic>> requestHelper({
    required String endpoint,
    String? token,
    required TypeRequests typeOfRequests,
    Map<String, dynamic>? data,
    ResponseType? responseType,
    List<Map<String, dynamic>>? dataArray
  }) async {

    try {
      switch (typeOfRequests) {

        // ============ Get Request =========== //

        case TypeRequests.get:
          final Response<dynamic> response = await dio.get(
            endpoint,
            options: Options(
              responseType: responseType,
              followRedirects: false,
              validateStatus: (status) {
                return true;
              },
              headers: {
                if(token != null)
                  'Authorization': 'Bearer $token',
              }

            )
          );

          if(response.statusCode != 200){
            ExceptionsHelper.validateApiException(response);
          }

          return response;

        // ===================================== //

        // ============ Post Request =========== //

        case TypeRequests.post:
          final Response<dynamic> response = await dio.post(
            endpoint,
            data: data,
            options: Options(
              followRedirects: false,
              validateStatus: (status) {
                return true;
              },
              headers: {
                if(token != null)
                  'Authorization': 'Bearer $token',
              }
            )
          );

          if(response.statusCode != 200 && response.statusCode != 201 && response.statusCode != 204){
            ExceptionsHelper.validateApiException(response);
          }

          return response;

        // ===================================== //

        // ============ Put Request =========== //

        case TypeRequests.put:
          final Response<dynamic> response = await dio.put(
            endpoint,
            data: data,
            options: Options(
              followRedirects: false,
              validateStatus: (status) {
                return true;
              },
              headers: {
                if(token != null)
                  'Authorization': 'Bearer $token',
              }
            )
          );

          if(!(response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 204)){
            ExceptionsHelper.validateApiException(response);
          }

          return response;

        // ===================================== //

        // ============ Delete Request =========== //

        case TypeRequests.delete:
          final Response<dynamic> response = await dio.delete(
            endpoint,
            options: Options(
              followRedirects: false,
              validateStatus: (status) {
                return true;
              },
              headers: {
                if(token != null)
                  'Authorization': 'Bearer $token',
              }
            )
          );

          if(response.statusCode != 200){
            ExceptionsHelper.validateApiException(response);
          }

          return response;

        // ===================================== //

        case TypeRequests.patch:
          final Response<dynamic> response = await dio.patch(
            endpoint,
            data: data,
            options: Options(
              followRedirects: false,
              validateStatus: (status) {
                return true;
              },
              headers: {
                if(token != null)
                  'Authorization': 'Bearer $token',
              }
            )
          );

          if (response.statusCode != 204 && response.statusCode != 201) {
            ExceptionsHelper.validateApiException(response);
          }

          return response;

        // ===================================== //

        default:
          throw ApiException(null, null, 500);
      }
    } catch (e) {
      rethrow;
    }


  }
}
