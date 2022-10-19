import 'package:devtoys/infrastructure/navigation/routes.dart';
import 'package:devtoys/infrastructure/global_settings.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart' as responsive;
import 'package:responsive_framework/responsive_framework.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const DefaultAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: responsive.ResponsiveVisibility(
          hiddenWhen: [responsive.Condition.smallerThan(name: MOBILE)],
          child: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              GlobalSettings.compactMode.value =
                  !GlobalSettings.compactMode.value;
            },
          ),
        ),
        actions: [
          IconButton(
              onPressed: () => Get.toNamed(Routes.settings),
              icon: Icon(Icons.settings))
        ],
        title: Text(title));
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
