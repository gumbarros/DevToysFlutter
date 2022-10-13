import 'package:devtoys/domain/models/tools/encoders/base64_text_encoder_tool.dart';
import 'package:devtoys/domain/models/tools/encoders/encode_conversion_mode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Base64TextEncoderController extends GetxController {
  final Base64TextEncoderTool tool;
  late TextEditingController inputController;
  late TextEditingController outputController;

  Rx<EncodeConversionMode?> conversionMode = EncodeConversionMode.encode.obs;

  String? result;

  Base64TextEncoderController(this.tool);

  @override
  void onInit() {
    inputController = TextEditingController();

    outputController = TextEditingController();

    inputController.addListener(regenerateOutput);

    ever(conversionMode, (_) {
      String input = inputController.text;
      String output = outputController.text;
      inputController.text = output;
      outputController.text = input;

      regenerateOutput();
    });

    super.onInit();
  }

  void regenerateOutput() {
    String result;

    if (conversionMode.value == EncodeConversionMode.encode) {
      result = tool.encoder.encode(inputController.text);
    } else {
      result = tool.encoder.decode(inputController.text);
    }

    try {
      outputController.text = result;
    } catch (_) {
      //Bug on code_text_field package.
    }
  }
}
