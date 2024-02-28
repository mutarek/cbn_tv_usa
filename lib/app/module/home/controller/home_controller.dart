import 'package:cbn_tv_usa/app/module/auth/components/custom_popup.dart';
import 'package:cbn_tv_usa/app/module/home/model/PageModel.dart';
import 'package:cbn_tv_usa/app/module/home/model/PostModel.dart';
import 'package:cbn_tv_usa/app/module/home/model/search_model.dart';
import 'package:cbn_tv_usa/app/module/home/repo/home_repo.dart';
import 'package:cbn_tv_usa/app/remote/response/api_response.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../category/model/category_model.dart';

class HomeController with ChangeNotifier {
  final HomeRepository homeRepository;

  HomeController({required this.homeRepository});

  bool isFromSearch = false;
  var postIndex = -1;
  var searchPostIndex = -1;
  var pageIndex = 0;
  bool isLoading = false;
  var currentIndex = 0;
  int page = 0;
  int pageNumber = 1;
  var isBottomLoading = false;
  final GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

  List<PostModel> postModelList = [];

  getAllPosts(bool isForAllPost, {int categoryCode = 113}) async {
    //CustomPopUp.showLoadingDialog(context: Get.context!);
    ApiResponse response;
    isLoading = true;
    notifyListeners();
    if (isForAllPost) {
      response = await homeRepository.getAllPosts(pageNumber);
    } else {
      postModelList.clear();
      response = await homeRepository.getAllPostsByCategory(categoryCode);
    }
    //Get.back();
    //CustomPopUp.hideLoadingDialog(context: Get.context!);
    isLoading = false;
    isBottomLoading = false;
    notifyListeners();
    if (response.response.statusCode == 200) {
      response.response.data.forEach((element) {
        postModelList.add(PostModel.fromJson(element));
      });
    } else {
      Fluttertoast.showToast(msg: response.response.statusMessage!);
    }
  }

  int selectedIndex = 0;

  updateCurrentIndex(int index) {
    page = index;
    notifyListeners();
  }

  updatePostIndex(int index) {
    postIndex = index;
    notifyListeners();
  }

  updateSearchIndex(int index) {
    searchPostIndex = index;
    notifyListeners();
  }

  String enMonthtoBdMonth(int month) {
    if (month >= 1 && month <= 12) {
      List<String> bdMonths = [
        "January",
        "February",
        "March",
        "April",
        "May",
        "June",
        "July",
        "August",
        "September",
        "October",
        "November",
        "December",
      ];

      return bdMonths[month];
    } else {
      return "";
    }
  }

  String enDaytoBdDay(int day) {
    if (day >= 1 && day <= 31) {
      List<String> bdNumerals = [
        "১",
        "২",
        "৩",
        "৪",
        "৫",
        "৬",
        "৭",
        "৮",
        "৯",
        "১০",
        "১১",
        "১২",
        "১৩",
        "১৪",
        "১৫",
        "১৬",
        "১৭",
        "১৮",
        "১৯",
        "২০",
        "২১",
        "২২",
        "২৩",
        "২৪",
        "২৫",
        "২৬",
        "২৭",
        "২৮",
        "২৯",
        "৩০",
        "৩১"
      ];
      String bdDay = day
          .toString()
          .split('')
          .map((digit) => bdNumerals[int.parse(digit)])
          .join();
      return bdNumerals[day - 1];
    } else {
      return "";
    }
  }

  String enNumberToBdNumber(int number) {
    if (number >= 0 && number <= 9) {
      List<String> bdNumerals = [
        "০",
        "১",
        "২",
        "৩",
        "৪",
        "৫",
        "৬",
        "৭",
        "৮",
        "৯"
      ];
      return bdNumerals[number];
    } else {
      return "";
    }
  }

  List<CategoryModel> categoryList = [];

  getAllCategories() async {
    ApiResponse response;
    categoryList.clear();
    isLoading = true;
    notifyListeners();
    response = await homeRepository.getAllCategories();
    isLoading = false;
    notifyListeners();
    if (response.response.statusCode == 200) {
      response.response.data.forEach((element) {
        var single = CategoryModel.fromJson(element);
        if (single.name == "Uncategorized") {
        } else {
          categoryList.add(CategoryModel.fromJson(element));
        }
      });
    } else {
      Fluttertoast.showToast(msg: response.response.statusMessage!);
    }
  }

  void updateCategoriesWisePost(int id) {
    updateCurrentIndex(1);
    currentIndex = 1;
    notifyListeners();
    getAllPosts(false, categoryCode: id);
    notifyListeners();
  }

  void updatePageIndex(int position) {
    pageIndex = position;
    notifyListeners();
  }

  List<PageModel> pageList = [];

  getAllPages() async {
    ApiResponse response;
    pageList.clear();
    isLoading = true;
    notifyListeners();
    response = await homeRepository.getAllPage();
    isLoading = false;
    notifyListeners();
    if (response.response.statusCode == 200) {
      response.response.data.forEach((element) {
        pageList.add(PageModel.fromJson(element));
      });
    } else {
      Fluttertoast.showToast(msg: response.response.statusMessage!);
    }
  }

  List<SearchModel> searchModelList = [];

  void searchFromList(String value) async{
    searchModelList.clear();
    isLoading = true;
    notifyListeners();
    ApiResponse response;
    response = await homeRepository.getSearchResult(value);
    isLoading = false;
    notifyListeners();
    if (response.response.statusCode == 200) {
      searchModelList.clear();
      response.response.data.forEach((element) {
        searchModelList.add(SearchModel.fromJson(element));
        print("<<<<<<<<<<<<<<<<<<<<<<<<${element}>>>>>>>>>>>>>>>>>>>");
      });
    } else {
      Fluttertoast.showToast(msg: response.response.statusMessage!);
    }

  }

  void getNextPage() {
    pageNumber++;
    isBottomLoading = true;
    getAllPosts(true);
    notifyListeners();
  }

// List<CategoryModel> categoryList = [];
//
// getAllCategories() async {
//   categoryList.clear();
//   isLoading = true;
//   notifyListeners();
//
//   ApiResponse response = await homeRepository.getAllCategories();
//   isLoading = false;
//   notifyListeners();
//   if (response.response.statusCode == 200) {
//     response.response.data.forEach((element) {
//       categoryList.add(CategoryModel.fromJson(element));
//     });
//   } else {
//     Fluttertoast.showToast(msg: response.response.statusMessage!);
//   }
// }
}
