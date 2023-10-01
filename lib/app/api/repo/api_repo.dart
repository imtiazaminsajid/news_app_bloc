import 'dart:convert';

import '../model/articles.dart';
import '../service/api_constants.dart';
import '../service/api_service.dart';

class ApiRepo {
  final ApiService _apiService = ApiService();

  Future<List<Articles>?> getArticlesList() async {
    // try {

    try {
      final apiResponse = await _apiService.getGetResponse(ApiConstants.top_headlines) as Map<String, dynamic>;
      List<Articles> articlesList = [];
      apiResponse["articles"].forEach((v) {
        articlesList.add(Articles.fromJson(v));
      });
      return articlesList;
    } catch (e) {
      return [];
    }
  }
}
