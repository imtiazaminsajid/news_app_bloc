part of 'article_cubit.dart';

class ArticleListState extends Equatable {
  bool isLoading;
  List<Articles>? articleList;
  var newsCategoryList = ["All", "Sports", "Technology", "Politics", "Business & Finance", "Economics"];
  ArticleListState({
    required this.isLoading,
    required this.articleList,
  });

  @override
  List<Object> get props => [
        isLoading,
      ];
}

class ArticleListInitial extends ArticleListState {
  ArticleListInitial({required super.isLoading, required super.articleList});
}

class ArticleListSuccessful extends ArticleListState {
  ArticleListSuccessful({
    required this.toastMessage,
    required super.isLoading,
    required super.articleList,
  });

  String toastMessage;
}

class ArticleListFailed extends ArticleListState {
  ArticleListFailed({
    required super.isLoading,
    required this.errorMessage,
    required super.articleList,
  });

  String errorMessage;
}
