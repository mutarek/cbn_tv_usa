class AppConstant {
  static const String baseUrl = 'https://cbntvusa.net/wp-json/wp/v2/';
  static const String postsUrl = '${baseUrl}posts?page=';
  static const String categoriesUrl = '${baseUrl}categories';
  static const String pages = '${baseUrl}pages';
  static const String search = '${baseUrl}posts?search=';
  static const String searchEndPoint = '&per_page=10&page=1';
}
