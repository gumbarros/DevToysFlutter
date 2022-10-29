import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../group.dart';

class EncodersGroup implements Group {
  static const EncodersGroup _singleton = EncodersGroup._internal();

  factory EncodersGroup() {
    return _singleton;
  }

  const EncodersGroup._internal();

  @override
  IconData get icon => Icons.percent;

  @override
  String get name => "encoders_decoders".tr();
}
