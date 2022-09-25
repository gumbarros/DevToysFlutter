import 'package:devtoys/domain/models/groups/category.dart';
import 'package:devtoys/domain/models/groups/converters_group.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:devtoys/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class NumberBaseConverterTool implements Tool {
  @override
  IconData get icon => FontAwesomeIcons.box;

  @override
  String get name => "number_base".tr;

  @override
  String get route => Routes.numberBase;

  @override
  String get description => "number_base_description".tr;

  @override
  Group get group => ConvertersGroup();
}
