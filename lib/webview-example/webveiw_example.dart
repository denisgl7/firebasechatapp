import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(WebViewExample());
}

class WebViewExample extends StatefulWidget {
  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewExample> {
  late WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('WebView'),
          actions: [
            IconButton(
                onPressed: () async {
                  _webViewController.goBack();
                },
                icon: const Icon(Icons.arrow_back_ios)),
            IconButton(
                onPressed: () {
                  _webViewController.goForward();
                },
                icon: const Icon(Icons.arrow_forward_ios))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            _webViewController.loadUrl('https://www.youtube.com');
          },
          child: const Icon(Icons.tv),
        ),
        body: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: 'https://otus.ru',
          onWebViewCreated: (controller) {
            _webViewController = controller;
          },
        ),
      ),
    );
  }
}
