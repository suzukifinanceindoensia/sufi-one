import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWObutton.dart';

class FasilitasWebView extends StatefulWidget {
  const FasilitasWebView({super.key});

  @override
  State<FasilitasWebView> createState() => _FasilitasWebViewState();
}

class _FasilitasWebViewState extends State<FasilitasWebView> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController();
    _controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    _controller.loadRequest(
      Uri.parse(
        'https://sufismart.sfi.co.id/sufismart/api/ic_product_sufismart.php?EMAIL=',
      ),
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
