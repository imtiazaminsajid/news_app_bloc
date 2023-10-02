import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app_bloc/app/bloc/theme_bloc/theme_cubit.dart';
import '../../../bloc/search_cubit/search_cubit.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/size_config.dart';
import '../../../utils/theme/app_colors.dart';
import '../../../widgets/no_data_found_widget.dart';
import '../../article_screen/widgets/news_card_item.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchArticleListCubit(),
      child: const _SearchScreen(),
    );
  }
}

class _SearchScreen extends StatefulWidget {
  const _SearchScreen();

  @override
  State<_SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<_SearchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<SearchArticleListCubit>().getArticleList(context);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    ThemeCubit  themeCubit = context.watch<ThemeCubit>();
    return SafeArea(
      child: Scaffold(
        // backgroundColor: themeCubit.state.isDarkMode? AppColors.color0D2238 : AppColors.appBackground,
        body: BlocConsumer<SearchArticleListCubit, SearchArticleListState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
              children: [

                Container(
                  // color: themeCubit.state.isDarkMode?AppColors.color0D2238: AppColors.white ,
                  height: kToolbarHeight + 20,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: themeCubit.state.isDarkMode? AppColors.white: AppColors.black,
                          size: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.appBackground,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          height: 45,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Container(
                                height: 15,
                                width: 15,
                                child: SvgPicture.asset(
                                  AppAssets.search,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: TextFormField(
                                    //focusNode: focus,
                                    onChanged: (searchText) {
                                      if (searchText.length > 2) {
                                        context.read<SearchArticleListCubit>().getSearchedArticleList(context, searchText.trim().toString().toLowerCase());
                                      } else {
                                        context.read<SearchArticleListCubit>().refreshData(context);
                                      }
                                    },
                                    keyboardType: TextInputType.text,
                                    textAlignVertical: TextAlignVertical.center,
                                    // controller: doctorSearchController,
                                    // style: interTextStyle,
                                    maxLines: 1,
                                    cursorColor: AppColors.primaryColor,
                                    enabled: true,
                                    decoration: InputDecoration(
                                      hintText: "Search News",
                                      hintStyle: const TextStyle(
                                        color: AppColors.colorBBBBBB,
                                      ),
                                      contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        // vertical: vPadding,
                                      ),
                                      filled: true,
                                      fillColor: Colors.transparent,
                                      border: OutlineInputBorder(
                                        borderSide: Divider.createBorderSide(
                                          context,
                                          color: Colors.transparent,
                                          width: 0,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: Divider.createBorderSide(context, color: Colors.transparent, width: 10),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: Divider.createBorderSide(
                                          context,
                                          color: Colors.transparent,
                                          width: 0,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
                state.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : state.tempArticleList!.isNotEmpty
                        ? Expanded(
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: state.tempArticleList!.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: const EdgeInsets.only(bottom: 5),
                                      child: NewsCardView(
                                        anArticle: state.tempArticleList![index],
                                      ),
                                    );
                                  }),
                            ),
                          )
                        : Center(
                            child: NoDataFoundWidget(
                              title: "No news found",
                            ),
                          ),
              ],
            );
          },
        ),
      ),
    );
  }
}
