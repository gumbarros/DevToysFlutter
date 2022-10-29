import 'package:dev_widgets/src/described_enum.dart';

enum UuidType implements DescribedEnum {
  v1("v1"),
  v4("v4");

  @override
  final String description;
  const UuidType(this.description);
}
