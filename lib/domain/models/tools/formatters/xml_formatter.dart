import 'package:devtoys/domain/helpers/formatters/xml_formatter.dart';
import 'package:devtoys/domain/models/groups/group.dart';
import 'package:devtoys/domain/models/groups/formatters_group.dart';
import 'package:devtoys/domain/models/tools/formatters/formatter_tool.dart';
import 'package:devtoys/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../tool.dart';

class XmlFormatterTool extends FormatterTool implements Tool {
  XmlFormatterTool(this.formatter) : super(formatter);

  @override
  IconData get icon => FontAwesomeIcons.code;

  @override
  String get homeTitle => "xml_formatter".tr;

  @override
  String get route => Routes.xmlFormatter;

  @override
  String get description => "xml_formatter_description".tr;

  @override
  Group get group => FormattersGroup();

  @override
  String get name => "xmlformat";

  @override
  final XMLFormatter formatter;

  @override
  String get menuName => "xml_formatter_menu_name".tr;
}
