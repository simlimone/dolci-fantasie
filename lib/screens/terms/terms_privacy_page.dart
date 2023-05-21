import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasticceria/constants/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TermsAndPrivacyPage extends StatefulWidget {
  const TermsAndPrivacyPage({super.key});

  @override
  State<TermsAndPrivacyPage> createState() => _TermsAndPrivacyPageState();
}

class _TermsAndPrivacyPageState extends State<TermsAndPrivacyPage> {
  late WebViewController webViewController;
  String? intent;

  @override
  void initState() {
    super.initState();
    webViewController = WebViewController();

    if (Get.arguments == null) Get.back();

    intent = Get.arguments;
    initialize();
  }

  initialize() async {
    var links = await getLinks();

    webViewController
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(intent == 'terms' ? links[0] : links[1]));

    setState(() {});
  }

  Future<List<String>> getLinks() async {
    var doc = await Strings.linksDocument.get();

    String terms = doc.data()?['terms'];
    String privacy = doc.data()?['privacy'];

    return [terms, privacy];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/logo/fantasie-256.png',
          color: Colors.white,
          height: 100,
        ),
      ),
      body: WebViewWidget(controller: webViewController),
    );
  }
}
