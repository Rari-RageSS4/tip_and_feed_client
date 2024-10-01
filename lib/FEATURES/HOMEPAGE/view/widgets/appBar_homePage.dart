import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tip_and_feed_client/common/routes/routes.dart';

import '../../../../common/styles/colors.dart';
import '../../../../common/utils/icons/icons.dart';
import '../../../../common/utils/icons/png_icons.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double appBarHeight;

  CustomAppBar({this.appBarHeight = kToolbarHeight});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(onPressed: (){
        Get.toNamed(AppRoutes.login);
      }, icon: AppIcons.person,),// Leading icon in the AppBar
      title: Center(
        child: AppImages.appLogo
      ),
      actions: [
        Container(
          width: 48, // Spacer to keep the logo centered
        ),
      ],
      backgroundColor:AppColors.backgroundAppBarColor, // AppBar background color
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
