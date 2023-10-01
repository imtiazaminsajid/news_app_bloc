import 'dart:convert';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_bloc/app/api/model/articles.dart';
import 'package:news_app_bloc/app/bloc/article_cubit/article_cubit.dart';
part 'search_state.dart';

class SearchArticleListCubit extends Cubit<SearchArticleListState> {
  SearchArticleListCubit()
      : super(
          SearchArticleListState(
            isLoading: false,
            articleList: [],
            tempArticleList: [],
          ),
        );

  void resetState() {
    emit(
      SearchArticleListState(
        isLoading: false,
        articleList: state.articleList,
        tempArticleList: [],
      ),
    );
  }

  Future<void> refreshData(BuildContext context) async {
    log('refreshing data...');
    getArticleList(context);
  }


  Future<void> getSearchedArticleList(BuildContext context, String searchKey) async {
    emit(SearchArticleListState(isLoading: true, articleList: state.articleList, tempArticleList: state.tempArticleList));

    List<Articles> tempList = [];
    for(var anArticle in state.articleList!){
      if(anArticle.description!.toLowerCase().contains(searchKey)|| anArticle.title!.toLowerCase().contains(searchKey)){
        tempList.add(anArticle);
      }
    }
    emit(SearchArticleListState(isLoading: false, articleList: state.articleList, tempArticleList: tempList));

  }

  Future<void> getArticleList(BuildContext context) async {
    emit(SearchArticleListState(isLoading: true, articleList: [], tempArticleList: []));

    try {
      emit(SearchArticleListState(
          isLoading: false, articleList: context.read<ArticleListCubit>().state.articleList, tempArticleList: context.read<ArticleListCubit>().state.articleList));
    } catch (e) {
      log(e.toString());
      emit(SearchArticleListState(isLoading: true, articleList: state.articleList, tempArticleList: state.tempArticleList));
    }
  }
}
