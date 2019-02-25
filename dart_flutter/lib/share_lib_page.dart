import 'package:flutter/material.dart';
import 'lib-dart-share/server_flutter_angular_web_share.dart' as share;

class ShareLibPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dart Share Lib Useage",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage("Dart Share Lib Useage"),
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;

  HomePage(this.title, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomePageState(title);
  }
}

class HomePageState extends State<HomePage> {
  TextEditingController rawXmlController;
  TextEditingController rawHtmlController;
  String xmlResult;
  String htmlResult;
  String uuidResult;
  final String title;

  HomePageState(this.title) {
    rawXmlController = TextEditingController(text: '''
      <dart>
        <i>flutter</i>
        <i>angular</i>
        <i>server</i>
      </dart>
    ''');
    rawHtmlController = TextEditingController(text: '''
      <h3>Head 3</h3>
      <li>list 1</li>
      <li>list 2</li>
      <li>list 3</li>
    ''');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Row(
              children: <Widget>[Text("UUID:"), Text("$uuidResult")],
            ),
            Divider(),
            TextField(
              decoration: InputDecoration(hintText: "your xml"),
              controller: rawXmlController,
              keyboardType: TextInputType.emailAddress,
              maxLines: 6,
              onChanged: (value) {
                setState(() {
                  //change xml parse
                  try {
                    xmlResult = share.xmlToJson(value);
                  } catch (e) {
                    xmlResult = e.toString();
                  }
                  uuidResult = share.createUUID();
                });
              },
            ),
            Text("Xml To Json Result:"),
            Text("$xmlResult"),
            Divider(),
            TextField(
              controller: rawHtmlController,
              decoration: InputDecoration(hintText: "your html"),
              keyboardType: TextInputType.emailAddress,
              maxLines: 6,
              onChanged: (value) {
                setState(() {
                  //htmlRaw = value;
                  //change html parse
                  try {
                    htmlResult = share.html2Markdown(value);
                  } catch (e) {
                    htmlResult = e.toString();
                  }
                  uuidResult = share.createUUID();
                });
              },
            ),
            Text("Html To Markdown Result"),
            Text("$htmlResult"),
          ],
        ),
      ),
    );
  }
}
