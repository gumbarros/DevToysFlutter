import 'package:dev_widgets/src/models/group.dart';
import 'package:dev_widgets/src/home/home_group.dart';
import 'package:dev_widgets/src/models/tool.dart';
import 'package:dev_widgets/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

class HomeTool implements Tool {
  const HomeTool() : super();

  @override
  IconData get icon => Icons.home;

  @override
  String get homeTitle => "all_tools".tr();

  @override
  String get route => Routes.home;

  @override
  Group get group => HomeGroup();

  @override
  String get description => "all_tools".tr();

  @override
  String get name => "home";

  @override
  String get menuTitle => "all_tools".tr();
}
