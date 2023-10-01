import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/size_config.dart';

class CommonSizeBox extends StatelessWidget implements PreferredSizeWidget {
  const CommonSizeBox({
    this.height = 0,
    this.width = 0,
    super.key,
  });

  final double height;
  final double width;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(height),
      width: getProportionateScreenWidth(width),
    );
  }
}
