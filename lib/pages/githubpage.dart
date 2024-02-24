import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_route_transition/page_route_transition.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart';

class GithubPage extends StatefulWidget {
  const GithubPage({super.key});

  @override
  State<GithubPage> createState() => _GithubPage();
}

class _GithubPage extends State<GithubPage> {

  WebViewController? _controller;

  bool isRefreshing = false;

  @override

  void initState() {
    super.initState();

    //Webview
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0xFF090E30))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {

          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.google.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://github.com/asamarsal'));

  }

  //Fungsi reload page
  Future<void> _onRefresh() async {
    setState(() {
      isRefreshing = true;
    });

    // Delay 1 Detik
    await Future.delayed(Duration(seconds: 1));

    await _controller?.reload();

    setState(() {
      isRefreshing = false;
    });

    showTopSnackBar(
      Overlay.of(context),
      const CustomSnackBar.success(
        message: "Refresh Success",
      ),
    );


  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: WebViewWidget(controller: _controller!),
        ),
      ),
    );
  }
}
