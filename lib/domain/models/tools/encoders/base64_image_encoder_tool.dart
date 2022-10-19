import 'package:devtoys/domain/helpers/encoders/base_64_image_encoder.dart';
import 'package:devtoys/domain/models/groups/group.dart';
import 'package:devtoys/domain/models/groups/encoders_group.dart';
import 'package:devtoys/domain/models/tools/encoders/encoder_tool.dart';
import 'package:devtoys/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../tool.dart';

class Base64ImageEncoderTool extends EncoderTool implements Tool {
  Base64ImageEncoderTool(this.encoder) : super(encoder);

  @override
  IconData get icon => Icons.image;

  @override
  String get homeTitle => "base64_image_encoder".tr;

  @override
  String get route => Routes.base64ImageEncoder;

  @override
  String get description => "base64_image_encoder_description".tr;

  @override
  Group get group => EncodersGroup();

  @override
  String get name => "base64image";

  @override
  String get menuTitle => "base64_image_encoder_menu_name".tr;

  @override
  final Base64ImageEncoder encoder;
}
