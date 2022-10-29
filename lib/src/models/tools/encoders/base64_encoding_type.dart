import 'package:dev_widgets/src/described_enum.dart';

enum Base64EncodingType implements DescribedEnum {
  utf8("UTF-8"),
  ascii("ASCII");

  @override
  final String description;

  const Base64EncodingType(this.description);
}
