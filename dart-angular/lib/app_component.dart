import 'package:angular/angular.dart';

import 'package:angular_forms/angular_forms.dart';
import 'package:angular/core.dart';
import './lib-dart-share/server_flutter_angular_web_share.dart' as share;

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [formDirectives, coreDirectives],
)
class AppComponent {
  String xmlRawStr;
  String htmlRawStr;
  String xmlToJsonResult;
  String htmlToMarkdownResult;
  String uuid = share.createUUID();

  @Input()
  void set xmlRaw(String value) {
    uuid = share.createUUID();
    xmlRawStr = value;
    try {
      xmlToJsonResult = share.xmlToJson(value);
    } catch (e) {
      xmlToJsonResult = e.toString();
    }
  }

  String get xmlRaw => xmlRawStr;

  @Input()
  void set htmlRaw(String value) {
    uuid = share.createUUID();
    htmlRawStr = value;
    try {
      htmlToMarkdownResult = share.html2Markdown(value);
    } catch (e) {
      htmlToMarkdownResult = e.toString();
    }
  }

  String get htmlRaw => htmlRawStr;
}
