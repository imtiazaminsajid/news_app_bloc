import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/theme/app_colors.dart';

class ThemeState extends Equatable {
  bool isLoading;
  bool isDarkMode;

  ThemeState({
    required this.isLoading,
    required this.isDarkMode,
  });

  @override
  List<Object> get props => [
    isLoading,
    isDarkMode,
  ];
}

class ThemeInitial extends ThemeState {
  ThemeInitial({required super.isLoading, required super.isDarkMode});
}

class ThemeSuccessful extends ThemeState {
  ThemeSuccessful({
    required this.toastMessage,
    required super.isLoading, required super.isDarkMode,
  });

  String toastMessage;
}

class ThemeFailed extends ThemeState {
  ThemeFailed({
    required super.isLoading,
    required this.errorMessage, required super.isDarkMode,
  });

  String errorMessage;
}