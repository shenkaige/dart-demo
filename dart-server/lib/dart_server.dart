import 'package:jaguar/jaguar.dart';
import './lib-dart-share/server_flutter_angular_web_share.dart' as share;

void startServer(List<String> arguments) async {
  const int port = 8085;
  print("server starting ...");
  final server = Jaguar(port: port);
  print("server run on port $port");
  server.get('/query', (Context ctx) {
    final String xml = ctx.query.get("xml", "");
    final String html = ctx.query.get("html", "");
    print("raw xml:$xml");
    print("raw html:$html");
    return share.handle_UUID_XML2JSON_HTML2MK(xml, html);
  });
  await server.serve();
}
