import 'package:cbn_tv_usa/app/module/category/model/category_model.dart';
import 'package:cbn_tv_usa/app/module/category/repo/category_repo.dart';
import 'package:cbn_tv_usa/app/remote/response/api_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CategoryController with ChangeNotifier {
  final CategoryRepository categoryRepository;

  CategoryController({required this.categoryRepository});

  List<CategoryModel> categoryList = [];

  var isLoading = false;

  getAllCategories() async {
    ApiResponse response;
    categoryList.clear();
    isLoading = true;
    notifyListeners();
    response = await categoryRepository.getAllCategories();
    isLoading = false;
    notifyListeners();
    if (response.response.statusCode == 200) {
      response.response.data.forEach((element) {
        categoryList.add(CategoryModel.fromJson(element));
      });
    } else {
      Fluttertoast.showToast(msg: response.response.statusMessage!);
    }
  }
}
