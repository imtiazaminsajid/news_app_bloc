import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_bloc/app/utils/theme/theme.dart';
import 'package:news_app_bloc/app/views/splash/splash_screen.dart';

import '../app_routes/app_router.dart';
import 'bloc/article_cubit/article_cubit.dart';
import 'bloc/splash_cubit/splash_cubit.dart';
import 'bloc/theme_bloc/theme_cubit.dart';
import 'bloc/theme_bloc/theme_state.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({
    super.key,
    required this.appRouter,
  });

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => SplashCubit(),
        ),
        BlocProvider(
          create: (context) => ArticleListCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          context.read<ThemeCubit>().fetchTheme();
          return MaterialApp(
            theme: state.isDarkMode ? CustomTheme.darkTheme : CustomTheme.lightTheme,
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
            onGenerateRoute: appRouter.onGeneratedRoute,
            builder: (context, router) => router!,
          );
        },
      ),
    );
  }
}
