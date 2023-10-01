import 'package:flutter/material.dart';

import '../utils/theme/app_colors.dart';
import 'inter_text.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  CommonAppBar({
    this.height = kToolbarHeight,
    required this.elevation,
    required this.title,
    required this.context,
    required this.finishScreen,
    required this.isTitleCenter,
    required this.icon,
    super.key,
  });
  String title;
  final double height;
  final double elevation;
  final bool finishScreen;
  final bool isTitleCenter;
  final IconData icon;
  BuildContext context;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return _appbar();
  }

  Widget _appbar() {
    return AppBar(
      centerTitle: isTitleCenter,
      title: InterText(
        title: title,
      ),
      elevation: elevation,
      backgroundColor: AppColors.white,
      leading: IconButton(
        onPressed: () {
          if (finishScreen != null) {
            if (finishScreen) {
              Navigator.pop(context);
            }
          } else {
            Navigator.pop(context);
          }
        },
        icon: const Icon(
          Icons.arrow_back,
          color: AppColors.black,
          size: 20,
        ),
      ),
    );
  }
}
