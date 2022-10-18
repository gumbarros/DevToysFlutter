import 'package:devtoys/domain/models/groups/group.dart';
import 'package:devtoys/domain/models/groups/converters_group.dart';
import 'package:devtoys/domain/models/tools/tool.dart';
import 'package:devtoys/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class TimestampConverterTool implements Tool {
  @override
  IconData get icon => FontAwesomeIcons.clock;

  @override
  String get homeTitle => "timestamp_converter".tr;

  @override
  String get route => Routes.timestampConverter;

  @override
  String get description => "timestamp_converter_description".tr;

  @override
  Group get group => ConvertersGroup();

  @override
  String get name => "timestamp";

  @override
  String get menuName => throw UnimplementedError();
}
