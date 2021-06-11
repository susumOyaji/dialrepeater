import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'mail and phone sample',
        ),
      ),
      body: Column(
        children: [
          RaisedButton(
            child: Text(
              'open phone app',
            ),
            onPressed: _openPhoneApp,
          ),
          RaisedButton(
            child: Text(
              'open mail app',
            ),
            onPressed: _openMailApp,
          ),
        ],
      ),
    );
  }

  void _openPhoneApp() {
    const tel = '06012345678';
    _launchURL(
      'tel:' + tel,
    );
  }

  void _openMailApp() async {
    final title = Uri.encodeComponent('タイトル');
    final body = Uri.encodeComponent('本文');
    const mailAddress = 'test@example.com';

    return _launchURL(
      'mailto:$mailAddress?subject=$title&body=$body',
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      final Error error = ArgumentError('Could not launch $url');
      throw error;
    }
  }
}
