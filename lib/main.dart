import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app/news_app.dart';
import 'app_routes/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(
      NewsApp(
        appRouter: AppRouter(),
      ),
    );
  });
}
