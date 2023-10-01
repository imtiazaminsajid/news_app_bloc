import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_assets.dart';
import '../utils/theme/app_colors.dart';

class CommonNetworkImageWidget extends StatelessWidget {
  const CommonNetworkImageWidget({
    required this.imageLink,
    this.boxFit = BoxFit.cover,
    super.key,
  });

  final String imageLink;
  final BoxFit boxFit;

  @override
  Widget build(BuildContext context) {
    return builtItemImageContainer(imageLink);
  }

  Widget builtItemImageContainer(String? imageName) {
    var imageUrl = '';
    if (imageName != null && imageName.isNotEmpty) {
      imageUrl = imageName;
    }
    final validURL = Uri.parse(imageUrl).isAbsolute;

    try {
      return DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.zero,
        ),
        child: DecoratedBox(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: (validURL && imageUrl.isNotEmpty)
              ? CachedNetworkImage(
                  imageUrl: imageUrl,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      // borderRadius: const BorderRadius.all(
                      //   Radius.circular(5),
                      // ),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: boxFit,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => const Center(
                    child: CupertinoActivityIndicator(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  errorWidget: (context, url, error) => Center(
                    child: const SizedBox(
                      height: 25,
                      width: 25,
                      child: Icon(
                        Icons.broken_image_outlined,
                        color: AppColors.colorBBBBBB,
                      ),
                    ),
                  ),
                )
              : Container(
                  margin: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(2),
                    ),
                    image: DecorationImage(
                      image: AssetImage(AppAssets.splashLogo),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
        ),
      );
    } catch (error) {
      log('error : $error');
      return Container(
        margin: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(2),
          ),
          image: DecorationImage(
            image: AssetImage(AppAssets.splashLogo),
            fit: BoxFit.cover,
          ),
        ),
      );
    }
  }
}
