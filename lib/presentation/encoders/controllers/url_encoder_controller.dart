import 'package:devtoys/domain/models/tools/encoders/encode_conversion_mode.dart';
import 'package:devtoys/domain/models/tools/encoders/url_encoder_tool.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class URLEncoderController extends GetxController {
  final URLEncoderTool tool;
  late TextEditingController inputController;
  late TextEditingController outputController;

  Rx<EncodeConversionMode?> conversionMode = EncodeConversionMode.encode.obs;

  String? result;

  URLEncoderController(this.tool);

  @override
  void onInit() {
    inputController = TextEditingController();

    outputController = TextEditingController();

    inputController.addListener(() {
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
    });

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
