import 'package:devtoys/domain/models/tools/generators/lipsum_type.dart';
import 'package:devtoys/presentation/generators/controllers/lipsum_generator_controller.dart';
import 'package:devtoys/presentation/widgets/default_app_bar.dart';
import 'package:devtoys/presentation/helpers.dart';
import 'package:devtoys/presentation/widgets/io_editor/output_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class LipsumGeneratorView extends GetView<LipsumGeneratorController> {
  const LipsumGeneratorView({Key? key}) : super(key: key);

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
                      leadingWidget: Icon(Icons.width_normal),
                      trailingWidget: Padding(
                        child: ListTile(
                            title: Text("lipsum_generator_mode".tr),
                            subtitle:
                                Text("lipsum_generator_mode_description".tr)),
                        padding: const EdgeInsets.only(left: 8.0),
                      ),
                      actionWidget: Obx(
                        () => DropdownButton<LipsumType>(
                            value: controller.lipsumType.value,
                            items: getDropdownMenuItems<LipsumType>(
                                LipsumType.values),
                            onChanged: (selected) =>
                                controller.lipsumType.value = selected),
                      )),
                  YaruRow(
                    enabled: true,
                    leadingWidget: Icon(Icons.fork_right),
                    trailingWidget: Padding(
                      child: ListTile(
                        title: Text("lipsum_start_with".tr),
                      ),
                      padding: const EdgeInsets.only(left: 8.0),
                    ),
                    actionWidget: Obx(
                      () => Switch(
                        onChanged: (value) =>
                            controller.startWithLorem.value = value,
                        value: controller.startWithLorem.value,
                      ),
                    ),
                  ),
                  YaruRow(
                    enabled: true,
                    leadingWidget: Icon(Icons.tag),
                    trailingWidget: Padding(
                      child: ListTile(
                        title: Text("amount".tr),
                        subtitle: Text("lipsum_amount_description".tr),
                      ),
                      padding: const EdgeInsets.only(left: 8.0),
                    ),
                    actionWidget: Obx(
                      () => Flexible(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          textAlign: TextAlign.end,
                          initialValue: controller.count.value.toString(),
                          onChanged: (value) {
                            controller.count.value =
                                int.tryParse(value) ?? 0; // e.g. if empty -> 0
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
              Container(
                  height: Get.height / 1.2,
                  child: OutputEditor(
                    outputController: controller.outputController,
                  )),
            ],
          ),
        ));
  }
}
