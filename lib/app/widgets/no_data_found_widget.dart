
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../utils/app_assets.dart';
import 'common_size_box.dart';
import 'inter_text.dart';

class NoDataFoundWidget extends StatelessWidget {
  String? title;
  NoDataFoundWidget({super.key, this.title = "No data found"});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 100,
            child: Align(
              child: LottieBuilder.asset(
                AppAssets.searchEmpty,
              ),
            ),
          ),
          CommonSizeBox(
            height: 20,
          ),
          InterText(
            title: "${title}",
            textColor: Colors.grey,
            fontSize: 12,
          ),
        ],
      ),
    );
  }
}
