import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_bloc/app/bloc/article_cubit/article_cubit.dart';
import 'package:news_app_bloc/app/utils/navigator_services.dart';

import '../../../bloc/theme_bloc/theme_cubit.dart';
import '../../../utils/size_config.dart';
import '../../../utils/theme/app_colors.dart';
import '../../../utils/functions.dart';
import '../../../widgets/no_data_found_widget.dart';
import '../../search_screen/view/search_screen.dart';
import '../widgets/braking_news_card_view.dart';
import '../widgets/news_card_item.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _ArticleScreen();
  }
}

class _ArticleScreen extends StatefulWidget {
  const _ArticleScreen();

  @override
  State<_ArticleScreen> createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<_ArticleScreen> {
  TextEditingController promoCodeController = TextEditingController(text: '');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<ArticleListCubit>().getArticleList();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    ThemeCubit  themeCubit = context.watch<ThemeCubit>();

    return Scaffold(
      // backgroundColor: themeCubit.state.isDarkMode? AppColors.color0D2238 : AppColors.appBackground,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Row(
          children: [
            Container(
              height: 30,
              width: 30,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(imageUrl: "https://cdn-icons-png.flaticon.com/512/3135/3135715.png",),
                // child: Image.asset("assets/images/example_seven.png"),
              ),
            ),

            SizedBox(
              width: 10,
            ),
            Text(formatDate(DateTime.now().toString(), "dd MMM yyyy"), style: const TextStyle(fontSize: 12, color: Color(0xff8a8989))),
          ],
        ),
        actions: [

          GestureDetector(
            onTap: (){
              context.read<ThemeCubit>().changeTheme(context);
            },
            child: Container(
                width: 50,
                height: 50,
                child: Icon(Icons.dark_mode,
                  color: themeCubit.state.isDarkMode? AppColors.white: AppColors.black,
                )),
          ),

          GestureDetector(
            onTap: (){
              NavigatorServices().to(context: context, widget: SearchScreen());
            },
            child: Container(
              width: 60,
                margin: const EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.search,
                  size: 22,
                  color: themeCubit.state.isDarkMode? AppColors.white: AppColors.black,
                )),
          )
        ],
      ),
      body: BlocConsumer<ArticleListCubit, ArticleListState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: context
                .read<ArticleListCubit>()
                .refreshData,
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: state.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : state.articleList!.isNotEmpty
                    ? SizedBox(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.articleList!.length+1,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  margin: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                                  child: Text("Breaking News", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: themeCubit.state.isDarkMode? AppColors.white: Colors.black87))),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                child: BrakingNewsCardView(
                                  anArticle: state.articleList![0],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          );
                        } else if (index == 1) {
                          return Container(
                            height: 25,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: const ScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: state.newsCategoryList.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                      padding: const EdgeInsets.only(right: 15, top: 5, bottom: 5),
                                      child: Text(state.newsCategoryList[index], style: const TextStyle(fontSize: 14, color: Color(0xff8a8989))));
                                }),
                          );
                        } else {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            child: NewsCardView(
                              anArticle: state.articleList![index-1],
                            ),
                          );
                        }
                      }),
                )
                    : Center(
                  child: NoDataFoundWidget(title: "No news found",),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}