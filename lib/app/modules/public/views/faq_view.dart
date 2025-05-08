import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWObutton.dart';

class FaqWebView extends StatefulWidget {
  const FaqWebView({super.key});

  @override
  State<FaqWebView> createState() => _FaqWebViewState();
}

class _FaqWebViewState extends State<FaqWebView> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController();
    _controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    _controller.loadRequest(
      Uri.parse('https://sufismart.sfi.co.id/sufismart/api/faq.php'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SuzukiFinanceAppBarWObutton(),
      body: WebViewWidget(controller: _controller),
    );
  }
}
