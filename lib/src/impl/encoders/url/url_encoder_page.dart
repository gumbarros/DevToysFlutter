import 'package:dev_widgets/src/impl/encoders/encode_conversion_mode.dart';
import 'package:dev_widgets/src/impl/encoders/url/url_encoder_providers.dart';
import 'package:dev_widgets/src/impl/helpers.dart';
import 'package:dev_widgets/src/impl/widgets/io_editor/io_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class UrlEncoderPage extends ConsumerWidget {
  const UrlEncoderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return SizedBox(
          height: MediaQuery.of(context).size.height - kToolbarHeight,
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.all(8.0),
                child: YaruSection(headline: "configuration".tr(), children: [
                  YaruRow(
                    enabled: true,
                    leadingWidget: const Icon(Icons.compare_arrows_sharp),
                    trailingWidget: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: ListTile(
                          title:
                              Text(StringTranslateExtension("conversion").tr()),
                          subtitle: Text(
                              StringTranslateExtension("conversion_mode")
                                  .tr())),
                    ),
                    actionWidget: DropdownButton<ConversionMode>(
                        value: ref.watch(conversionModeProvider),
                        items: getDropdownMenuItems<ConversionMode>(
                            ConversionMode.values),
                        onChanged: (selected) {
                          ref.read(conversionModeProvider.notifier).state =
                              selected!;
                        }),
                  ),
                ]),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height / 1.2,
                  child: IOEditor(
                    inputController: ref.watch(inputControllerProvider),
                    usesCodeControllers: false,
                    outputController: TextEditingController(
                        text: ref.watch(outputTextProvider)),
                    isVerticalLayout: true,
                  )),
            ],
          ),
        );
  }
}
