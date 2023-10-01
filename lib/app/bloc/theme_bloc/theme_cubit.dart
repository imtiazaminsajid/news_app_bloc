import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_bloc/app/bloc/theme_bloc/theme_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/shared_pref_keys.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
      : super(
          ThemeState(
            isLoading: false,
            isDarkMode: false,
          ),
        );

  Future<void> fetchTheme() async {
    log('refreshing data...');
    SharedPreferences preferences = await SharedPreferences.getInstance();

    bool? darkMode = await preferences.getBool(isDarkModeKey) ??false;
    emit(ThemeState(isLoading: false, isDarkMode: darkMode));


  }

  Future<void> changeTheme(BuildContext context) async {
    log('refreshing data...');
    SharedPreferences preferences = await SharedPreferences.getInstance();

    bool? darkMode = await preferences.getBool(isDarkModeKey) ?? state.isDarkMode;
    log('refreshing data...35 ${darkMode}');
    if (darkMode) {
      await preferences.setBool(isDarkModeKey, !darkMode);
      emit(ThemeState(isLoading: false, isDarkMode: !darkMode));

    } else {
      await preferences.setBool(isDarkModeKey, !darkMode);
      emit(ThemeState(isLoading: false, isDarkMode: !darkMode));

    }
    log('refreshing data...43 ${state.isDarkMode}');
  }
}
