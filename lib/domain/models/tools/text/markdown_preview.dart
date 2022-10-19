import 'package:devtoys/domain/models/groups/group.dart';
import 'package:devtoys/domain/models/groups/text_group.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:devtoys/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MarkdownPreviewTool implements Tool {
  @override
  IconData get icon => Icons.insert_drive_file_sharp;

  @override
  String get homeTitle => "markdown_preview".tr;

  @override
  String get route => Routes.markdownPreview;

  @override
  String get description => "markdown_preview_description".tr;

  @override
  Group get group => TextGroup();

  @override
  String get name => "markdown";

  @override
  String get menuTitle => "markdown_preview_menu_name".tr;
}
