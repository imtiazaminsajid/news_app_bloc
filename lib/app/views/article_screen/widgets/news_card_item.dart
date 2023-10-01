import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_bloc/app/utils/theme/app_colors.dart';

import '../../../api/model/articles.dart';
import '../../../bloc/theme_bloc/theme_cubit.dart';
import '../../../utils/navigator_services.dart';
import '../../../widgets/common_network_image_widget.dart';
import '../../../utils/functions.dart';
import '../../article_details/view/article_details_screen.dart';

class NewsCardView extends StatelessWidget {
  Articles anArticle;

  NewsCardView({Key? key, required this.anArticle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeCubit  themeCubit = context.watch<ThemeCubit>();
    return GestureDetector(
      onTap: () {
        NavigatorServices().to(context: context, widget: ArticleDetailsScreen(anArticle: anArticle));

      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 60,
              width: 70,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CommonNetworkImageWidget(imageLink: anArticle.urlToImage!,),
                // child: Image.asset("assets/images/example_seven.png"),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(anArticle.title!,
                        textAlign: TextAlign.justify,  maxLines: 2,   overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: themeCubit.state.isDarkMode? AppColors.white: Colors.black87)),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_month,
                          size: 12,
                          color: Color(0xff8a8989),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(formatDateDDMMMMYYYY(anArticle.publishedAt!), style: const TextStyle(fontSize: 12, color: Color(0xff8a8989))),
                        const SizedBox(
                          width: 15,
                        ),
                        const Icon(
                          Icons.access_time,
                          size: 12,
                          color: Color(0xff8a8989),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(formatDate(anArticle.publishedAt!, "hh:mm"), style: const TextStyle(fontSize: 12, color: Color(0xff8a8989))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
