import 'package:xml2json/xml2json.dart';
import 'package:uuid/uuid.dart';
import 'package:html2md/html2md.dart' as html2md;
import 'dart:convert';

String createUUID() {
  var uuid = new Uuid();
  // Generate a v4 (random) id
  return uuid.v4(); // -> '110ec58a-a0f2-4ac4-8393-c866d813b8d1'
}

String xmlToJson(String xml) {
  // Create a client transformer
  final Xml2Json myTransformer = Xml2Json();
  // Parse a simple XML string
  myTransformer.parse(xml);
  // Transform to JSON using Badgerfish
  String json = myTransformer.toBadgerfish();
  return json;
}

String html2Markdown(String html) {
  return html2md.convert(html);
}

dynamic handle_UUID_XML2JSON_HTML2MK(String xml, String html) {
  dynamic xmlJsonResult;
  try {
    xmlJsonResult = xmlToJson(xml);
    xmlJsonResult = jsonDecode(xmlJsonResult);
  } catch (e) {
    print(e);
  }
  String htmlMarkdownResult;
  try {
    htmlMarkdownResult = html2Markdown(html);
  } catch (e) {
    print(e);
  }
  var result = {
    "uuid": createUUID(),
    "xml2Json": xmlJsonResult,
    "html2Markdown": htmlMarkdownResult,
  };
  return json.encode(result);
}
