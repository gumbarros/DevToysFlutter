import 'package:dev_widgets/src/models/tools/formatters/json_formatter_tool.dart';
import 'package:dev_widgets/infrastructure/bindings/controllers/get_tool.dart';
import 'package:dev_widgets/presentation/formatters/controllers/json_formatter_controller.dart';
import 'package:get/get.dart';

class JsonFormatterControllerBinding extends Bindings {
  @override
  void dependencies() {
    final tool = getTool<JsonFormatterTool>();

    Get.lazyPut<JsonFormatterController>(() => JsonFormatterController(tool));
  }
}
