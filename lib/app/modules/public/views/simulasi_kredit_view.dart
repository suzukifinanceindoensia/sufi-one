import 'package:flutter/material.dart';
import 'package:sufi_one/app/theme/color_constant.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWObutton.dart';

class SimulasiKreditView extends StatefulWidget {
  const SimulasiKreditView({Key? key}) : super(key: key);

  @override
  State<SimulasiKreditView> createState() => _SimulasiKreditViewState();
}

class _SimulasiKreditViewState extends State<SimulasiKreditView> {
  late final WebViewController _controller;
  bool isLoading = true;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController();
    _controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    _controller.setNavigationDelegate(
      NavigationDelegate(
        onPageStarted: (String url) {
          setState(() {
            isLoading = true;
            hasError = false;
          });
        },
        onPageFinished: (String url) {
          setState(() {
            isLoading = false;
          });
        },
        onWebResourceError: (WebResourceError error) {
          setState(() {
            isLoading = false;
            hasError = true;
          });
        },
      ),
    );

    _clearCacheAndLoadPage();
  }

  Future<void> _clearCacheAndLoadPage() async {
    try {
      await _controller.clearCache();
      _controller.loadRequest(
        Uri.parse(
          "https://sufismart.sfi.co.id/sufismart/api/simulasi_page_sufismart.php",
        ),
      );
    } catch (e) {
      print("Error clearing cache: $e");
      setState(() {
        hasError = true;
      });
    }
  }

  Future<void> _goBack() async {
    if (await _controller.canGoBack()) {
      _controller.goBack();
    } else {
      Navigator.pop(context);
    }
  }

  Future<void> _reloadPage() async {
    setState(() {
      isLoading = true;
      hasError = false;
    });
    _clearCacheAndLoadPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: _goBack,
        ),
        title: const Text("Simulasi Kredit"),
        backgroundColor: AppColors.splashEnd,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: Stack(
        children: [
          if (!hasError) WebViewWidget(controller: _controller),
          if (isLoading) const Center(child: CircularProgressIndicator()),
          if (hasError)
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.error, color: Colors.red, size: 80),
                  const SizedBox(height: 16),
                  const Text(
                    "Gagal memuat halaman",
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: _reloadPage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.splashEnd,
                    ),
                    child: const Text("Coba Lagi"),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
