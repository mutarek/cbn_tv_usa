import 'package:cbn_tv_usa/app/remote/dio/dio_client.dart';
import 'package:cbn_tv_usa/app/remote/exception/api_error_handler.dart';
import 'package:cbn_tv_usa/app/remote/response/api_response.dart';
import 'package:cbn_tv_usa/app/utils/appConstant.dart';
import 'package:dio/dio.dart';

class HomeRepository {
  final DioClient dioClient;

  HomeRepository({required this.dioClient});

  Future<ApiResponse> getAllPosts() async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.get(AppConstant.baseUrl + AppConstant.postsUrl);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

  Future<ApiResponse> getAllPostsByCategory(int category) async {
    Response response = Response(requestOptions: RequestOptions(path: '22222'));
    try {
      response = await dioClient.get("${AppConstant.baseUrl}${AppConstant.postsUrl}?categories=$category");
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e), response);
    }
  }

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
