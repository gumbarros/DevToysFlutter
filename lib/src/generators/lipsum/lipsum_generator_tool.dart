import 'package:dev_widgets/src/generators/generators_group.dart';
import 'package:dev_widgets/src/models/group.dart';
import 'package:dev_widgets/src/models/tool.dart';
import 'package:dev_widgets/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

class LipsumGeneratorTool implements Tool {
  const LipsumGeneratorTool() : super();

  @override
  IconData get icon => Icons.text_snippet_rounded;

  @override
  String get homeTitle => "lipsum_generator".tr();

  @override
  String get route => Routes.lipsumGenerator;

  @override
  String get description => "lipsum_generator_description".tr();

  @override
  Group get group => GeneratorsGroup();

  @override
  String get name => "lipsum";

  @override
  String get menuTitle => "lipsum".tr();
}
