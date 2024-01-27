import 'dart:convert';
import 'package:cbn_tv_usa/app/utils/appConstant.dart';
import 'package:dio/dio.dart';

class ApiService {
  static var client = Dio();

  //
  // Future<List<PostModel>> fetchPostbyCategory(String categoryid) async {
  //   print("current category: " + categoryid);
  //   final res = await http.get(Uri.parse(
  //       Config.apiUrl + Config.postUrl + categoryid + Config.perPage));
  //   if (res.statusCode == 200) {
  //     final parsed = json.decode(res.body).cast<Map<String, dynamic>>();
  //     return parsed.map<PostModel>((json) => PostModel.fromJson(json)).toList();
  //   } else {
  //     throw Exception('Something went wrong');
  //   }
  // }
  //
  // Future<List<SearchModel>> fetchPostBySearch(String searchterm) async {
  //   final res = await http
  //       .get(Uri.parse(Config.apiUrl + Config.searchUrl + searchterm));
  //   if (res.statusCode == 200) {
  //     final parsed = json.decode(res.body).cast<Map<String, dynamic>>();
  //     return parsed
  //         .map<SearchModel>((json) => SearchModel.fromJson(json))
  //         .toList();
  //   } else {
  //     throw Exception('Something went wrong');
  //   }
  // }
  //
  // Future<List<CommentModel>> fetchCommentsByPosts(String postid) async {
  //   final res =
  //       await http.get(Uri.parse(Config.apiUrl + Config.commentUrl + postid));
  //   if (res.statusCode == 200) {
  //     final parsed = json.decode(res.body).cast<Map<String, dynamic>>();
  //     return parsed
  //         .map<CommentModel>((json) => CommentModel.fromJson(json))
  //         .toList();
  //   } else {
  //     throw Exception('Something went wrong');
  //   }
  // }
  //
  // Future<List<SearchPostModel>> fetchpostbyId(String id) async {
  //   final respon =
  //       await http.get(Uri.parse(Config.apiUrl + Config.specificPost + id));
  //   if (respon.statusCode == 200) {
  //     final parsed = jsonDecode(respon.body).cast<Map<String, dynamic>>();
  //     return parsed
  //         .map<SearchPostModel>((json) => SearchPostModel.fromJson(json))
  //         .toList();
  //   } else {
  //     throw Exception('Something went wrong');
  //   }
  // }
  //
  // Future<List<RecentPostModel>> fetchRecentPost() async {
  //   final res = await http.get(Uri.parse(Config.apiUrl + Config.recentpost));
  //   if (res.statusCode == 200) {
  //     final parsed = json.decode(res.body).cast<Map<String, dynamic>>();
  //     return parsed
  //         .map<RecentPostModel>((json) => RecentPostModel.fromJson(json))
  //         .toList();
  //   } else {
  //     throw Exception('Something went wrong');
  //   }
  // }
}
