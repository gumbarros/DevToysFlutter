import 'package:devtoys/domain/models/tools/text/escape_conversion_mode.dart';
import 'package:devtoys/presentation/text/controllers/text_escape_controller.dart';
import 'package:devtoys/presentation/widgets/default_app_bar.dart';
import 'package:devtoys/presentation/helpers.dart';
import 'package:devtoys/presentation/widgets/io_editor/io_editor.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class TextEscapeView extends GetView<TextEscapeController> {
  const TextEscapeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar(title: controller.tool.homeTitle),
        body: Container(
          height: Get.height - kToolbarHeight,
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.all(8.0),
                child: YaruSection(headline: "configuration".tr, children: [
                  YaruRow(
                    enabled: true,
                    leadingWidget: Icon(Icons.compare_arrows_sharp),
                    trailingWidget: Padding(
                      child: ListTile(
                          title: Text("conversion".tr),
                          subtitle: Text("conversion_description".tr)),
                      padding: const EdgeInsets.only(left: 8.0),
                    ),
                    actionWidget: Obx(
                      () => DropdownButton<EscapeConversionMode>(
                          value: controller.conversionMode.value,
                          items: getDropdownMenuItems<EscapeConversionMode>(
                              EscapeConversionMode.values),
                          onChanged: (selected) {
                            controller.conversionMode.value = selected;
                            controller.update();
                          }),
                    ),
                  )
                ]),
              ),
              Container(
                  height: Get.height / 1.2,
                  child: IOEditor(
                    usesCodeControllers: false,
                    inputController: controller.inputController,
                    outputController: controller.outputController,
                    isVerticalLayout: true,
                  )),
            ],
          ),
        ));
  }
}
