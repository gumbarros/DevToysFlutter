import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../group.dart';

class FormattersGroup implements Group {
  static const FormattersGroup _singleton = FormattersGroup._internal();

  factory FormattersGroup() {
    return _singleton;
  }

  const FormattersGroup._internal();

  @override
  IconData get icon => Icons.notes;

  @override
  String get name => "formatters".tr();
}
