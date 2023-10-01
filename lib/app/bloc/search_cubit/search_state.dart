part of 'search_cubit.dart';

class SearchArticleListState extends Equatable {
  bool isLoading;
  List<Articles>? articleList;
  List<Articles>? tempArticleList;

  SearchArticleListState({
    required this.isLoading,
    required this.articleList,
    required this.tempArticleList,
  });

  @override
  List<Object> get props => [
        isLoading,
        articleList.hashCode,
        articleList!.length,
        tempArticleList!.length,
        tempArticleList!.hashCode,
      ];
}

class SearchArticleListInitial extends SearchArticleListState {
  SearchArticleListInitial({required super.isLoading, required super.articleList, required super.tempArticleList});
}

class SearchArticleListSuccessful extends SearchArticleListState {
  SearchArticleListSuccessful({
    required this.toastMessage,
    required super.isLoading,
    required super.articleList,
    required super.tempArticleList,
  });

  String toastMessage;
}

class SearchArticleListFailed extends SearchArticleListState {
  SearchArticleListFailed({
    required super.isLoading,
    required this.errorMessage,
    required super.articleList,
    required super.tempArticleList,
  });

  String errorMessage;
}
