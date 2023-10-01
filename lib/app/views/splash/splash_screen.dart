import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/splash_cubit/splash_cubit.dart';
import '../../utils/app_assets.dart';
import '../../utils/dimentions.dart';
import '../../utils/navigator_services.dart';
import '../../utils/theme/app_colors.dart';
import '../../widgets/inter_text.dart';
import '../article_screen/view/article_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _SplashView();
  }
}

class _SplashView extends StatelessWidget {
  const _SplashView();

  @override
  Widget build(BuildContext context) {
    context.read<SplashCubit>().triggerSplash();
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashCompleted) {
          NavigatorServices().toReplacement(
            context: context,
            widget: ArticleScreen(),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.color80C2A0,
        body: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          height: getHeight(context: context),
          width: getWidth(context: context),
          child: Column(
            children: [
              Expanded(
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset(
                    AppAssets.splashLogo,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(
                height: kToolbarHeight * 1.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 14,
                      width: 14,
                      child: CircularProgressIndicator(
                        color: AppColors.colorFFFFFF,
                        strokeWidth: 1.5,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    InterText(
                      title: "Loading...",
                      textColor: AppColors.colorFFFFFF,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
