import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:kanguka/models/chat.dart';
import 'package:kanguka/screens/about_screen.dart';
import 'package:kanguka/screens/archives_screen.dart';
import 'package:kanguka/screens/gallery_screen.dart';
import 'package:kanguka/screens/setting_screen.dart';
import 'package:kanguka/utils/styles.dart';
import 'package:kanguka/widgets/appBar.dart';
import 'package:url_launcher/url_launcher.dart';

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
  String currentProfilePic =
      "https://lh3.googleusercontent.com/-CDfv6S7MvHaGgHvZqx6wQqYYcJ5LjhJftMYIxNC_XRfbbDNAxf7Q_SpnYTkRzoDP8U_=s180-rw";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Emissions'),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text(
                  "Réveillez-vous en priant et en louant \nle Seigneur tous les jours."),
              accountName: Text(
                "Kanguka",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/kanguka_logo.png"),
                ),
                onTap: () => print("This is Kanguka logo."),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/header_image.jpg'),
                    fit: BoxFit.fill),
              ),
            ),
            ListTile(
              title: Text("Emissions"),
              leading: Icon(Icons.mic),
              onTap: () => Navigator.of(context).pop(),
            ),
            ListTile(
              title: Text("Galerie"),
              leading: Icon(Icons.image),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => GalleryScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text("Archives"),
              leading: Icon(Icons.archive),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => ArchivesScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text("Témoigner"),
              leading: Icon(Icons.people),
              onTap: () {
                Navigator.of(context).pop();
                _neverSatisfied();
              },
            ),
            ListTile(
              title: Text("A propos"),
              leading: Icon(Icons.info),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => AboutScreen(),
                  ),
                );
              },
            ),
            Divider(),
            ListTile(
              title: Text("Téléchargements"),
              leading: Icon(Icons.get_app),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => SettingScreen(),
                  ),
                );
              },            ),
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
                  index != 0 ? Divider(height: 12.0) : Container(),
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
                              Icons.get_app,
                              color: AppTheme.secondaryColor,
                              size: 14,
                            ),
                            Text(
                              "Téléchargé",
                              style: TextStyle(
                                  color: AppTheme.secondaryColor, fontSize: 12),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          onRefresh: _onRefresh,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: _neverSatisfied,
        child: Icon(Icons.perm_phone_msg),
        tooltip: 'Témoigner',
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

  Future<void> _neverSatisfied() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Témoigner'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Voulez-vous partager votre témoignage?'),
                Text(
                  'Vous nous enverrez un audio sur whatsapp!',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              textColor: Theme.of(context).primaryColor,
              child: Text('Annuler'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              textColor: Theme.of(context).primaryColor,
              child: Text('Oui'),
              onPressed: () {
                Navigator.of(context).pop();
                _launchURL();
              },
            ),
          ],
        );
      },
    );
  }

  _launchURL() async {
    const url = 'https://wa.me/25776801327';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
