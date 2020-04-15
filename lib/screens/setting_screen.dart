import 'package:flutter/material.dart';
import 'package:kanguka/widgets/appBar.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Téléchargements'),
      body: Center(
        child: Container(
          child: Text('Page Téléchargements'),
        ),
      ),
    );
  }
}
