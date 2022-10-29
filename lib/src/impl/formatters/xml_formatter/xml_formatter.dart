import 'package:dev_widgets/src/impl/formatters/indentation.dart';
import 'package:dev_widgets/src/impl/helpers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:xml/xml.dart';

String formatXml(String input,
    {Indentation indentation = Indentation.fourSpaces}) {
  XmlDocument? xml;

  try {
    input = applyWebSpaceFix(input);
    xml = XmlDocument.parse(input);
  } on FormatException catch (_) {
    return "invalid_xml_data".tr();
  }

  return xml.toXmlString(
      pretty: indentation != Indentation.compact,
      indent: indentation.toString());
}
