import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:kanguka/utils/styles.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppTheme.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        // leading: IconButton(
        //   icon: Icon(Icons.refresh),
        //   onPressed: () {},
        // ),
        title: Text('Emissions', style: TextStyle(color: Colors.white)),
        actions: <Widget>[
          Container(
              width: 45.0,
              child: Center(
                child: GestureDetector(
                  child: Text("KI"),
                ),
              )),
          Container(
            width: 45.0,
            child: Center(
              child: GestureDetector(child: Text("FR")),
            ),
          ),
          Container(
            width: 45.0,
            child: Center(
              child: GestureDetector(child: Text("EN")),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Container(
        child: RefreshIndicator(
          color: Colors.black87,
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: ChatModel.dummyData.length,
            itemBuilder: (context, index) {
              ChatModel _model = ChatModel.dummyData[index];
              return Column(
                children: <Widget>[
                  index != 0
                      ? Divider(
                          height: 12.0,
                        )
                      : Container(),
                  ListTile(
                      leading: CircleAvatar(
                        radius: 24.0,
                        backgroundImage: NetworkImage(_model.avatarUrl),
                      ),
                      title: Text(_model.name),
                      subtitle: Row(
                        children: [
                          Text(
                            _model.datetime,
                            style: TextStyle(fontSize: 12.0),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.cloud_download,
                                color: AppTheme.secondaryColor,
                                size: 14,
                              ),
                              Text("Téléchargé",
                                  style: TextStyle(
                                      color: AppTheme.secondaryColor, fontSize: 12))
                            ],
                          )
                        ],
                      )),
                ],
              );
            },
          ),
          onRefresh: _onRefresh,
        ),
      ),
    );
  }

  Future<Null> _onRefresh() {
    Completer<Null> completer = Completer<Null>();
    Timer(Duration(seconds: 3), () {
      completer.complete();
    });
    return completer.future;
  }
}

class ChatModel {
  final String avatarUrl;
  final String name;
  final String datetime;
  final String message;

  ChatModel({this.avatarUrl, this.name, this.datetime, this.message});

  static final List<ChatModel> dummyData = [
    ChatModel(
      avatarUrl: "https://randomuser.me/api/portraits/men/83.jpg",
      name: "Communiqué concernant youtube pour les francophones".toUpperCase(),
      datetime: "2018-12-19 20:18",
      message: "How about meeting tomorrow?",
    ),
    ChatModel(
      avatarUrl: "https://randomuser.me/api/portraits/men/83.jpg",
      name: "Prière du réseau easter 12/.4/2020 (4:00)".toUpperCase(),
      datetime: "2018-12-19 19:22",
      message: "I love that idea, it's great!",
    ),
    ChatModel(
      avatarUrl: "https://p9.storage.canalblog.com/96/34/1660541/125180306.jpg",
      name: "Kanguka de Mardi le 14/04/2020 (4:00)",
      datetime: "2020-04-14 04:00",
      message: "I wasn't aware of that. Let me check",
    ),
    ChatModel(
      avatarUrl: "https://randomuser.me/api/portraits/men/83.jpg",
      name: "Joe",
      datetime: "2018-12-19 11:05",
      message: "Flutter just release 1.0 officially. Should I go for it?",
    ),
    ChatModel(
      avatarUrl: "https://p9.storage.canalblog.com/96/34/1660541/125180306.jpg",
      name: "Mark",
      datetime: "2018-12-19 09:46",
      message: "It totally makes sense to get some extra day-off.",
    ),
    ChatModel(
      avatarUrl: "https://randomuser.me/api/portraits/men/83.jpg",
      name: "Williams",
      datetime: "2018-12-19 08:15",
      message: "It has been re-scheduled to next Saturday 7.30pm",
    ),
  ];
}
