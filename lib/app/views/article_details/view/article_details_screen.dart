import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_bloc/app/api/model/articles.dart';
import 'package:news_app_bloc/app/utils/navigator_services.dart';
import 'package:news_app_bloc/app/utils/theme/app_colors.dart';

import '../../../bloc/theme_bloc/theme_cubit.dart';
import '../../../widgets/common_network_image_widget.dart';
import '../../../utils/functions.dart';

class ArticleDetailsScreen extends StatelessWidget {
  ArticleDetailsScreen({super.key, required this.anArticle});

  Articles anArticle;

  @override
  Widget build(BuildContext context) {
    ThemeCubit  themeCubit = context.watch<ThemeCubit>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeCubit.state.isDarkMode? AppColors.color0D2238 : AppColors.appBackground,
        elevation: 0.0,
        leading: InkWell(
          onTap: () {
            NavigatorServices().pop(context: context);
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            height: 30,
            width: 30,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 2,
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black54,
                size: 16,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: CommonNetworkImageWidget(
                      imageLink: anArticle.urlToImage!,
                    ),
                    // child: Image.asset("assets/images/example_seven.png"),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(anArticle.title!, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color:themeCubit.state.isDarkMode? AppColors.white: Colors.black87)),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: CommonNetworkImageWidget(
                              imageLink: anArticle.urlToImage!,
                            ),
                            // child: Image.asset("assets/images/example_seven.png"),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(anArticle.author!, style: const TextStyle(fontSize: 12, color: Color(0xff8a8989))),
                        const Spacer(),
                        Text(formatDate(anArticle.publishedAt!, "dd MMM yyyy"), style: const TextStyle(fontSize: 12, color: Color(0xff8a8989))),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(anArticle.description!, textAlign: TextAlign.justify, style: TextStyle(fontSize: 14, color:themeCubit.state.isDarkMode? AppColors.white: Colors.black87)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
