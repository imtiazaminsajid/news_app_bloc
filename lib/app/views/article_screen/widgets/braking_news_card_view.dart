import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_bloc/app/utils/navigator_services.dart';
import 'package:news_app_bloc/app/utils/theme/app_colors.dart';
import 'package:news_app_bloc/app/views/article_details/view/article_details_screen.dart';

import '../../../api/model/articles.dart';
import '../../../bloc/theme_bloc/theme_cubit.dart';
import '../../../widgets/common_network_image_widget.dart';
import '../../../utils/functions.dart';

class BrakingNewsCardView extends StatelessWidget {
  Articles anArticle;

  BrakingNewsCardView({Key? key, required this.anArticle}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ThemeCubit  themeCubit = context.watch<ThemeCubit>();


    return GestureDetector(
      onTap: () {
        NavigatorServices().to(context: context, widget: ArticleDetailsScreen(anArticle: anArticle));
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Card(
          margin: const EdgeInsets.all(0.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          elevation: 2,
          // color: themeCubit.state.isDarkMode? AppColors.color030330: AppColors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: CommonNetworkImageWidget( imageLink: anArticle.urlToImage!,),
                  // child: Image.asset("assets/images/example_seven.png"),
                ),
              ),

              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),

                    Text(anArticle.title!, textAlign: TextAlign.justify, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: themeCubit.state.isDarkMode? AppColors.colorF5F5F5: AppColors.color0D2238)),

                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: CommonNetworkImageWidget(imageLink: anArticle.urlToImage!,),
                            // child: Image.asset("assets/images/example_seven.png"),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(anArticle.author!, style: const TextStyle( fontSize: 12, color: Color(0xff8a8989))),
                        const Spacer(),
                        Text(formatDateDDMMMMYYYY(anArticle.publishedAt!), style: const TextStyle(fontSize: 12, color: Color(0xff8a8989))),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
