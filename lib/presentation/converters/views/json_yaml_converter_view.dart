import 'package:dev_widgets/src/models/tools/converters/json_yaml_conversion_type.dart';
import 'package:dev_widgets/src/models/tools/formatters/indentation.dart';
import 'package:dev_widgets/presentation/converters/controllers/json_yaml_converter_controller.dart';
import 'package:dev_widgets/presentation/helpers.dart';
import 'package:dev_widgets/src/impl/widgets/default_app_bar.dart';
import 'package:dev_widgets/src/impl/widgets/io_editor/io_editor.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class JsonYamlConverterView extends GetView<JsonYamlConverterController> {
  const JsonYamlConverterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar(title: controller.tool.homeTitle),
        body: SizedBox(
          height: MediaQuery.of(context).size.height - kToolbarHeight,
          child: Obx(
            () => ListView(
              children: [
                Container(
                  margin: const EdgeInsets.all(8.0),
                  child: YaruSection(
                      headline: StringTranslateExtension("configuration").tr(),
                      children: [
                        YaruRow(
                          enabled: true,
                          leadingWidget: const Icon(
                            Icons.compare_arrows_sharp,
                            size: 25,
                          ),
                          trailingWidget: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              StringTranslateExtension("conversion_type").tr(),
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                          actionWidget: DropdownButton<JsonYamlConversionType>(
                              value: controller.conversionType.value,
                              items:
                                  getDropdownMenuItems<JsonYamlConversionType>(
                                      JsonYamlConversionType.values),
                              onChanged: (selected) =>
                                  controller.conversionType.value = selected!),
                        ),
                        Visibility(
                            visible: controller.conversionType.value ==
                                JsonYamlConversionType.yamlToJson,
                            child: Column(children: [
                              YaruRow(
                                  enabled: true,
                                  leadingWidget:
                                      const Icon(Icons.arrow_right_alt),
                                  trailingWidget: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      StringTranslateExtension("indentation")
                                          .tr(),
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  actionWidget: Obx(
                                    () => DropdownButton<Indentation>(
                                        value: controller.indentation.value,
                                        items:
                                            getDropdownMenuItems<Indentation>(
                                                Indentation.values),
                                        onChanged: (selected) => controller
                                            .indentation.value = selected),
                                  )),
                              YaruRow(
                                enabled: true,
                                leadingWidget: const Icon(Icons.sort_by_alpha),
                                trailingWidget: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    StringTranslateExtension(
                                            "sort_json_properties_alphabetically")
                                        .tr(),
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ),
                                actionWidget: Obx(
                                  () => Switch(
                                    onChanged: (value) => controller
                                        .sortAlphabetically.value = value,
                                    value: controller.sortAlphabetically.value,
                                  ),
                                ),
                              )
                            ]))
                      ]),
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height / 1.2,
                    child: controller.conversionType.value ==
                            JsonYamlConversionType.yamlToJson
                        ? IOEditor(
                            inputController:
                                controller.yamlToJsonInputController,
                            outputController:
                                controller.yamlToJsonOutputController,
                          )
                        // ignore: avoid_unnecessary_containers
                        : Container(
                            //I don't know why this needs a Container to work, maybe I need to open a issue at GetX.
                            child: IOEditor(
                              inputController:
                                  controller.jsonToYamlInputController,
                              outputController:
                                  controller.jsonToYamlOutputController,
                            ),
                          )),
              ],
            ),
          ),
        ));
  }
}
