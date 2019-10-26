import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: "https://accounts.spotify.com/en/authorize?client_id=4459e8653aa84ff1b7a455d15c7b1701&response_type=code&redirect_uri=http:%2F%2F192.168.43.112%2Fcallback&scope=user-read-private%20user-read-email&state=34fFs29kd09",
    );
  }
}