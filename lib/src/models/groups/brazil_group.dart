import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'group.dart';

class BrazilGroup implements Group {
  static final BrazilGroup _singleton = BrazilGroup._internal();

  factory BrazilGroup() {
    return _singleton;
  }

  BrazilGroup._internal();

  @override
  IconData get icon => Icons.public;

  @override
  String get name => "brazil".tr;
}
