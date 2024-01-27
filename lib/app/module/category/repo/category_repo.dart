import 'package:cbn_tv_usa/app/remote/dio/dio_client.dart';
import 'package:cbn_tv_usa/app/remote/exception/api_error_handler.dart';
import 'package:cbn_tv_usa/app/remote/response/api_response.dart';
import 'package:cbn_tv_usa/app/utils/appConstant.dart';
import 'package:dio/dio.dart';

class CategoryRepository{
  final DioClient dioClient;
  CategoryRepository({required this.dioClient});

  Future<ApiResponse> getAllCategories() async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.get(AppConstant.baseUrl + AppConstant.categoriesUrl);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }
}