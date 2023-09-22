import 'package:flutter/material.dart';
import 'package:my_widgets/widgets/webview_container.dart';

class WebviewScreen extends StatefulWidget {
  const WebviewScreen({super.key});

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WebViewContainer(
        url: 'https://codehimalaya.com/',
      ),
    );
  }
}
