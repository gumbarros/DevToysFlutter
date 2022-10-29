import 'package:dev_widgets/src/group.dart';
import 'package:dev_widgets/src/impl/text/text_escape/text_escape_page.dart';
import 'package:dev_widgets/src/impl/text/text_group.dart';
import 'package:dev_widgets/src/tool.dart';
import 'package:dev_widgets/src/routes.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class TextEscapeTool implements Tool {
  const TextEscapeTool() : super();

  @override
  IconData get icon => Icons.text_format;

  @override
  String get homeTitle => "text_escape".tr();

  @override
  String get route => Routes.textEscape;

  @override
  String get description => "text_escape_description".tr();

  @override
  Group get group => TextGroup();

  @override
  String get name => "escape";

  @override
  String get menuTitle => "text_escape_menu_name".tr();

  @override
  Widget get page => const TextEscapePage();
}
