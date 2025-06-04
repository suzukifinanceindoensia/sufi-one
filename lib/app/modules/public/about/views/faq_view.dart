import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWObutton.dart';

class FaqWebView extends StatefulWidget {
  const FaqWebView({super.key});

  @override
  State<FaqWebView> createState() => _FaqWebViewState();
}

class _FaqWebViewState extends State<FaqWebView> {
  InAppWebViewController? webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SuzukiFinanceAppBarWObutton(),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri('https://sufismart.sfi.co.id/sufismart/api/faq.php'),
        ),
        onWebViewCreated: (controller) {
          webViewController = controller;
        },
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            javaScriptEnabled: true,
            useOnDownloadStart: true,
          ),
          android: AndroidInAppWebViewOptions(useHybridComposition: true),
        ),
      ),
    );
  }
}
