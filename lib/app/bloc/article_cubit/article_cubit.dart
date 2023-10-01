import 'dart:convert';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_bloc/app/api/model/articles.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/repo/api_repo.dart';
import '../../utils/shared_pref_keys.dart';

part 'article_state.dart';

class ArticleListCubit extends Cubit<ArticleListState> {
  ArticleListCubit()
      : super(
          ArticleListState(
            isLoading: false,
            articleList: [],
          ),
        );

  void resetState() {
    emit(
      ArticleListState(
        isLoading: false,
        articleList: state.articleList,
      ),
    );
  }

  Future<void> refreshData() async {
    log('refreshing data...');
    getArticleList();
  }

  Future<void> getArticleList() async {
    emit(ArticleListState(isLoading: true, articleList: state.articleList));

    SharedPreferences preferences = await SharedPreferences.getInstance();

    String? articleListString = await preferences.getString(getArticle);

    if (articleListString != null) {
      try {
        List<Articles> articleResponseModel = Articles.decode(articleListString);
        emit(
          ArticleListSuccessful(
            isLoading: false,
            toastMessage: "Success",
            articleList: articleResponseModel,
          ),
        );
      } catch (e) {}
    }

    List<Articles>? articleList = await ApiRepo().getArticlesList();
    if (articleList!.isNotEmpty) {
      preferences.setString(getArticle, Articles.encode(articleList!));
      emit(
        ArticleListSuccessful(
          isLoading: false,
          toastMessage: "Success",
          articleList: articleList,
        ),
      );
    }
  }
}
