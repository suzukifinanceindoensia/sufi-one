import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class GenericWebView extends StatefulWidget {
  const GenericWebView({super.key});

  @override
  State<GenericWebView> createState() => _GenericWebViewState();
}

class _GenericWebViewState extends State<GenericWebView> {
  InAppWebViewController? webViewController;
  bool isLoading = true;

  Future<void> handleBackNavigation() async {
    if (webViewController != null) {
      bool canGoBack = await webViewController!.canGoBack();
      if (canGoBack) {
        await webViewController!.goBack();
        return;
      }
    }
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments;
    if (args == null || args is! Map<String, dynamic>) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('No arguments found')),
      );
    }

    final String? title = args['title'] as String?;
    final String? url = args['url'] as String?;

    if (title == null || url == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Invalid arguments')),
      );
    }

    return WillPopScope(
      onWillPop: () async {
        await handleBackNavigation();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: handleBackNavigation,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                webViewController?.reload();
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            InAppWebView(
              initialUrlRequest: URLRequest(url: WebUri(url)),
              onWebViewCreated: (controller) {
                webViewController = controller;
              },
              onLoadStart: (controller, url) {
                setState(() {
                  isLoading = true;
                });
              },
              onLoadStop: (controller, url) async {
                setState(() {
                  isLoading = false;
                });
              },
              onLoadError: (controller, url, code, message) {
                setState(() {
                  isLoading = false;
                });
              },
              initialOptions: InAppWebViewGroupOptions(
                crossPlatform: InAppWebViewOptions(
                  javaScriptEnabled: true,
                  useOnDownloadStart: true,
                ),
                android: AndroidInAppWebViewOptions(useHybridComposition: true),
              ),
            ),
            if (isLoading) const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
