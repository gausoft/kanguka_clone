import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(24.0, 8.0, 0.0, 8.0),
                  child: Text("KANGUKA BRUXELLES 2017"),
                ),
                Image.network(
                    "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.ytimg.com%2Fvi%2FO_CWbUgNRc4%2Fmaxresdefault.jpg")
              ],
            ),
          ),
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(24.0, 8.0, 0.0, 8.0),
                  child: Text("KANGUKA BRUXELLES 2017"),
                ),
                Image.network(
                    "https://firebasestorage.googleapis.com/v0/b/kanguka-8c482.appspot.com/o/1568795617130.jpg?alt=media&token=a9de4aba-bd4b-41d2-803a-ab6b7825721e")
              ],
            ),
          ),
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(24.0, 8.0, 0.0, 8.0),
                  child: Text("KANGUKA BRUXELLES 2017"),
                ),
                Image.network(
                    "https://firebasestorage.googleapis.com/v0/b/kanguka-8c482.appspot.com/o/1568795659516.jpg?alt=media&token=6e90d677-a5a8-4f01-a4dd-43e5c75621e1")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
